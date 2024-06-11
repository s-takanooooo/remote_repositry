package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.AccountsServices;

/**
 * Servlet implementation class AccountRegister
 */
@WebServlet("/AccountRegister")
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
		int permission = Integer.parseInt(request.getParameter("permission"));
		request.setAttribute("name", name);
		request.setAttribute("mail", mail);
		request.setAttribute("pass", pass);
		request.setAttribute("permission", permission);
		request.setAttribute("passConfirm", passConfirm);
		
		if(passConfirm.equals(pass)) {
		this.getServletContext().getRequestDispatcher("/accountRegisterConfirm.jsp").forward(request, response);
		} else {
			boolean f = false;
			request.setAttribute("same", f);
			request.getRequestDispatcher("/accountRegister.jsp").forward(request, response);
		}
		
	}

}
