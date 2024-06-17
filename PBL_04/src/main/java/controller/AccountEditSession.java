package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AccountEditSession
 */
@WebServlet("/AccountEditSession")
public class AccountEditSession extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountEditSession() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("editNameSession");
		String mail = (String) session.getAttribute("editMailSession");
		String permission = (String) session.getAttribute("editPermissionSession");
		String pass = (String) session.getAttribute("editPassSession");
		String passConfirm = (String) session.getAttribute("editPassConfirmSession");
		int num = 1;
		request.setAttribute("getSession", num);
		request.setAttribute("editNameSession", name);
		request.setAttribute("editMailSession", mail);
		request.setAttribute("editPassSession", pass);
		request.setAttribute("editPassConfirmSession", passConfirm);
		request.setAttribute("editPermissionSession", permission);
		
		
		this.getServletContext().getRequestDispatcher("/accountEdit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
