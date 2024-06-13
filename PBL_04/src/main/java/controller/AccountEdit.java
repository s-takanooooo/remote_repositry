package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.AccountsBean;
import services.AccountsServices;
import util.CommonUtil;

/**
 * Servlet implementation class AccountEdit
 */
@WebServlet("/AccountEdit")
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
		
		request.setAttribute("accountId", accountId);
		request.setAttribute("name", name);
		request.setAttribute("mail", mail);
		request.setAttribute("pass", pass);
		request.setAttribute("permission", permission);
		request.setAttribute("passConfirm", passConfirm);
		
		if(!passConfirm.equals(pass)) {
			boolean f = false;
			request.setAttribute("same", f);
			request.getRequestDispatcher("/accountEdit.jsp").forward(request, response);
		} else {
			this.getServletContext().getRequestDispatcher("/accountEditConfirm.jsp").forward(request, response);
		}
		
		
	}

}
