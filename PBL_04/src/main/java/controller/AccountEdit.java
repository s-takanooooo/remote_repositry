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
		
		request.setAttribute("editAccountId", ab.getAccount_id());
		request.setAttribute("editName", ab.getName());
		request.setAttribute("editMail", ab.getMail());
		request.setAttribute("editPass", ab.getPassword());
		request.setAttribute("editAuth", ab.getAuthority());
		int num = 0;
		
		request.setAttribute("getSession", num);
		 String current = "active5";
	     request.setAttribute("current", current);
		this.getServletContext().getRequestDispatcher("/accountEdit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("postへ遷移");
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name") ;
		String mail = request.getParameter("mail");
		String pass = request.getParameter("pass");
		String passConfirm = request.getParameter("passConfirm");
		String accountsPermission = request.getParameter("accountsPermission");
		String salesPermission = request.getParameter("salesPermission");
		String permission = CommonUtil.setAutority(accountsPermission, salesPermission);
		String accountId = request.getParameter("accountId");
		
		boolean f = true;
		if(name == "") {
			f = false;
			request.setAttribute("fillAccountName", f);
		}
		if(mail == "") {
			f = false;
			request.setAttribute("fillAccountMail", f);
		}
		if(pass == "") {
			f = false;
			request.setAttribute("fillAcountPass", f);
		}
		if(passConfirm == "") {
			f = false;
			request.setAttribute("fillAccountPassConfirm", f);
		}
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
			session.setAttribute("editAccountIdSession", accountId);
			session.setAttribute("editNameSession", name);
			session.setAttribute("editMailSession", mail);
			session.setAttribute("editPassSession", pass);
			session.setAttribute("editPassConfirmSession", passConfirm);
			session.setAttribute("editPermissionSession", permission);
			 String current = "active5";
		     request.setAttribute("current", current);
			this.getServletContext().getRequestDispatcher("/accountEditConfirm.jsp").forward(request, response);
		}
		
		
	}

}
