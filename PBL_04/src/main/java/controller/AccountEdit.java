package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.AccountsBean;
import services.AccountsServices;
import util.CommonUtil;

/**
 * Servlet implementation class AccountEdit
 */
@WebServlet("/S0042")
public class AccountEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       AccountsServices as = new AccountsServices();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		String accountId = request.getParameter("accountId");
		AccountsBean ab = as.selectById(accountId);
		String headerName = request.getHeader("REFERER");
		
		if(headerName != null) {
		if(ab != null) {
		request.setAttribute("editAccountId", ab.getAccount_id());
		request.setAttribute("editName", ab.getName());
		request.setAttribute("editMail", ab.getMail());
		request.setAttribute("editPass", ab.getPassword());
		request.setAttribute("editAuth", ab.getAuthority());
		int getSession = 0;
		
		request.setAttribute("getSession", getSession);
		 String current = "active5";
	     request.setAttribute("current", current);
		this.getServletContext().getRequestDispatcher("/accountEdit.jsp").forward(request, response);
		}else {
			response.sendRedirect("S0040");
		}}else {
			response.sendRedirect("S0040");
		}
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
		String accountsAuthority = request.getParameter("accountsAuthority");
		String salesAuthority = request.getParameter("salesAuthority");
		String authority = CommonUtil.setAutority(accountsAuthority, salesAuthority);
		String accountId = request.getParameter("accountId");
		
		AccountsBean ab = as.selectById(accountId);
		
		HttpSession session = request.getSession();
		
		boolean f = true;
		
		if(name == "") {
			f = false;
			request.setAttribute("fillAccountName", f);
		}else {
			session.setAttribute("editNameSession", name);			
		}
		if(mail == "") {
			f = false;
			request.setAttribute("fillAccountMail", f);
		}else {			
			session.setAttribute("editMailSession", mail);
		}
		if(pass == "") {
			f = false;
			request.setAttribute("fillAcountPass", f);
		}else {			
			session.setAttribute("editPassSession", pass);
		}
		if(passConfirm == "") {
			f = false;
			request.setAttribute("fillAccountPassConfirm", f);
		}else {			
			session.setAttribute("editPassConfirmSession", passConfirm);
		}
		
		if(as.checkAccountName(name) == false) {
			f = false;
			request.setAttribute("accountNameError", f);
			session.setAttribute("editNameSession", ab.getName());			
		}
		if(as.checkAccountMail(mail) == false) {
			f = false;
			request.setAttribute("accountMailError", f);
			session.setAttribute("editMailSession", ab.getMail());
		}
		if(as.checkAccountPass(pass) == false) {
			f = false;
			request.setAttribute("accountPassError", f);	
			session.setAttribute("editPassSession", ab.getPassword());
		}
		if(as.checkAccountPassConfirm(passConfirm) == false) {
			f = false;
			request.setAttribute("accountPassConfirmError", f);
			session.setAttribute("registerPassConfirm", "");
		}
		if(!passConfirm.equals(pass)) {
			f = false;
			request.setAttribute("same", f);
		}
		if(f == false) {
			session.setAttribute("editAccountIdSession", accountId);
			int getSession = 1;
			
			request.setAttribute("getSession", getSession);
			 String current = "active5";
		     request.setAttribute("current", current);
			this.getServletContext().getRequestDispatcher("/accountEdit.jsp").forward(request, response);
			
		}else{
			session.setAttribute("editAccountIdSession", accountId);
			session.setAttribute("editNameSession", name);			
			session.setAttribute("editMailSession", mail);
			session.setAttribute("editPassSession", pass);
			session.setAttribute("editPassConfirmSession", passConfirm);
			session.setAttribute("editAuthoritySession", authority);
			 String current = "active5";
		     request.setAttribute("current", current);
			this.getServletContext().getRequestDispatcher("/accountEditConfirm.jsp").forward(request, response);
		}
		
		
	}

}
