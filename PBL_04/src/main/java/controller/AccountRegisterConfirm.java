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
@WebServlet("/S0031")
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
		response.sendRedirect("S0030");
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
		String strPermission = request.getParameter("permission");
		int permission = Integer.parseInt(strPermission);
		
		boolean f = true;
		
		if(as.mailFormatCheck(mail) == false) {
			boolean format = false;
			f = false;
			request.setAttribute("format", format);	
		}
		if(as.validateByMail(mail) == false) {
			boolean already = false;
			f = false;
			request.setAttribute("already", already);
		}
		if(f == false) {
			String current = "active4";
			request.setAttribute("current", current);
			request.getRequestDispatcher("accountRegisterConfirm.jsp").forward(request, response);
		}else {
			as.registerAccount(name, mail, pass, permission);
			
			String accountRegisterComplete = "completed";
			int getSession = 0;
			request.setAttribute("getSession", getSession);
			request.setAttribute("accountRegisterComplete", accountRegisterComplete);
			String current = "active4";
			request.setAttribute("current", current);
			request.getRequestDispatcher("accountRegister.jsp").forward(request, response);			
		}
		
	}

}
