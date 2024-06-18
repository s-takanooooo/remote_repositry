package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import services.AccountsServices;
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
			request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
		}
		int num = 0;
		
		request.setAttribute("getSession", num);
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
		
		
		boolean f = true;
		if(as.checkAccountName(name) == false) {
			f = false;
			request.setAttribute("accountNameError", f);
		}
		if(as.checkAccountMail(mail) == false) {
			f = false;
			request.setAttribute("accountMailError", f);
		}
		if(as.checkAccountPass(pass) == false) {
			f = false;
			request.setAttribute("accountPassError", f);	
		}
		if(!passConfirm.equals(pass)) {
			f = false;
			request.setAttribute("same", f);
		}
		if(f == false) {
			doGet(request,response);
		}else{
			HttpSession session = request.getSession();
			session.setAttribute("registerName", name);
			session.setAttribute("registerMail", mail);
			session.setAttribute("registerPass", pass);
			session.setAttribute("registerPassConfirm", passConfirm);
			session.setAttribute("registerPermission", permission);
			this.getServletContext().getRequestDispatcher("/accountRegisterConfirm.jsp").forward(request, response);
		}
	}
}
