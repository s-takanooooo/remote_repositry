package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import services.AccountsServices;
import services.ChartServices;
import services.ChartServices.ChartData;
import util.CommonUtil;

/**
 * Servlet implementation class AccountRegister
 */
@WebServlet("/S0030")
public class AccountRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       AccountsServices as = new AccountsServices();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int authority = (int)session.getAttribute("authority");
		if(authority != 10 && authority != 11) {
			boolean f = false;
			request.setAttribute("accountAuthError", f);
			ChartServices cs = new ChartServices();
			ChartData chartData = cs.ChartData();
			 // JSON文字列をリクエスト属性に設定
	        request.setAttribute("categories", chartData.getCategories().toString());
	        request.setAttribute("values", chartData.getValues().toString());
	        String current = "active1";
	        request.setAttribute("current", current);
			request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
		}
		int num = 0;
		
		request.setAttribute("getSession", num);
		String current = "active4";
		request.setAttribute("current", current);
		request.getRequestDispatcher("/accountRegister.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name") ;
		String mail = request.getParameter("mail");
		String pass = request.getParameter("pass");
		String passConfirm = request.getParameter("passConfirm");
		String accountsPermission = request.getParameter("accountsPermission");
		String salesPermission = request.getParameter("salesPermission");
		String permission = CommonUtil.setAutority(accountsPermission, salesPermission);
		
		HttpSession session = request.getSession();
		
		boolean f = true;
		
		
		if(name == "") {
			f = false;
			request.setAttribute("fillAccountName", f);
		}else {
			session.setAttribute("registerName", name);			
		}
		if(mail == "") {
			f = false;
			request.setAttribute("fillAccountMail", f);
		}else {
			session.setAttribute("registerMail", mail);			
		}
		if(pass == "") {
			f = false;
			request.setAttribute("fillAcountPass", f);
		}else {
			session.setAttribute("registerPass", pass);			
		}
		if(passConfirm == "") {
			f = false;
			request.setAttribute("fillAccountPassConfirm", f);
		}else {
			session.setAttribute("registerPassConfirm", passConfirm);
		}
		
		if(as.checkAccountName(name) == false) {
			f = false;
			request.setAttribute("accountNameError", f);
			session.setAttribute("registerName", "");	
		}
		if(as.checkAccountMail(mail) == false) {
			f = false;
			request.setAttribute("accountMailError", f);
			session.setAttribute("registerMail", "");	
		}
		if(as.checkAccountPass(pass) == false) {
			f = false;
			request.setAttribute("accountPassError", f);
			session.setAttribute("registerPass", "");
		}
		if(!passConfirm.equals(pass)) {
			f = false;
			request.setAttribute("same", f);
		}
		if(f == false) {
			int getSession = 1;
			
			request.setAttribute("getSession", getSession);
			String current = "active4";
			request.setAttribute("current", current);
			request.getRequestDispatcher("/accountRegister.jsp").forward(request, response);
		}else{
			session.setAttribute("registerName", name);
			session.setAttribute("registerMail", mail);
			session.setAttribute("registerPass", pass);
			session.setAttribute("registerPassConfirm", passConfirm);
			session.setAttribute("registerPermission", permission);
			String current = "active4";
			request.setAttribute("current", current);
			this.getServletContext().getRequestDispatcher("/accountRegisterConfirm.jsp").forward(request, response);
		}
	}
}
