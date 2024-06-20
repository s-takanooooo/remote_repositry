package controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.AccountsServices;

/**
 * Servlet implementation class AccountEditConfirm
 */
@WebServlet("/S0043")
public class AccountEditConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
    AccountsServices as = new AccountsServices();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountEditConfirm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("S0040");
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
		int permission = Integer.parseInt(request.getParameter("permission"));
		int accountId = Integer.parseInt(request.getParameter("accountId"));
		
		boolean f = true;
		if(as.updateAccount(name, mail, pass, permission, accountId) == false) {
			boolean already = false;
			f = false;
			request.setAttribute("already", already);
		}
		if(as.mailFormatCheck(mail) == false) {
			f = false;
			request.setAttribute("format", f);	
		}
		if(f == false) {
			 String current = "active5";
		     request.setAttribute("current", current);
			request.getRequestDispatcher("accountEditConfirm.jsp").forward(request, response);
		}else{
			response.sendRedirect("S0046");
		}
	}

}
