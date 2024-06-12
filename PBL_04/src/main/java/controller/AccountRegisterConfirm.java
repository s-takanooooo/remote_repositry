package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.AccountsServices;

/**
 * Servlet implementation class AccountRegisterConfirm
 */
@WebServlet("/AccountRegisterConfirm")
public class AccountRegisterConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AccountsServices as = new AccountsServices();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountRegisterConfirm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name") ;
		System.out.println(name);
		String mail = request.getParameter("mail");
		String pass = request.getParameter("pass");
		String strPermission = request.getParameter("permission");
		System.out.println(strPermission);
		
		int permission = Integer.parseInt(strPermission);
		
		as.registerAccount(name, mail, pass, permission);
		
		response.sendRedirect("Dashboard");
	}

}
