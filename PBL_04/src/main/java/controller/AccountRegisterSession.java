package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AccountRegisterSession
 */
@WebServlet("/S0032")
public class AccountRegisterSession extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountRegisterSession() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("registerName");
		String mail = (String) session.getAttribute("registerMail");
		String authority = (String) session.getAttribute("registerAuthority");
		String pass = (String) session.getAttribute("registerPass");
		String passConfirm = (String) session.getAttribute("registerPassConfirm");
		int getSession = 1;
		request.setAttribute("getSession", getSession);
		request.setAttribute("registerName", name);
		request.setAttribute("registerMail", mail);
		request.setAttribute("registerPass", pass);
		request.setAttribute("registerPassConfirm", passConfirm);
		request.setAttribute("registerAuthority", authority);
		
		String current = "active4";
		request.setAttribute("current", current);
		this.getServletContext().getRequestDispatcher("/accountRegister.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
