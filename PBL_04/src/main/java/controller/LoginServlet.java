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

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       AccountsServices as = new AccountsServices();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		System.out.println(email +  "+" +  pass);
		if(as.Login(email, pass) == true) {
			HttpSession session = request.getSession();
			AccountsBean ab = as.selectOne(email, pass);
			session.setAttribute("accounts_id", ab.getAccount_id());
			session.setAttribute("accountName", ab.getName());
			session.setAttribute("mail", ab.getMail());
			session.setAttribute("password", ab.getPassword());
			session.setAttribute("authority", ab.getAuthority());
			request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
		}else {
			request.setAttribute("login", false);
			this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);			
		}
	}

}
