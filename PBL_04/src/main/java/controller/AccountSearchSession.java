package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import services.AccountsServices;

/**
 * Servlet implementation class SearchSession
 */
@WebServlet("/S0046")
public class AccountSearchSession extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AccountsServices as = new AccountsServices();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountSearchSession() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		String mail = (String) session.getAttribute("mail");
		String permission = (String) session.getAttribute("permission");
		String current = "active5";
		String headerName = request.getHeader("REFERER");
		String notCompleted = request.getParameter("notCompleted");
		if(headerName != null && notCompleted == null) {
		System.out.println(headerName.substring(29, 34));
		request.setAttribute("editCompleted", headerName.substring(29, 34));
		}
	    request.setAttribute("current", current);
		request.setAttribute("search", as.searchByNameAndMailAndAuthority(name, mail, permission));
		this.getServletContext().getRequestDispatcher("/accountSearchResult.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
