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
		String authority = (String) session.getAttribute("authoritySearch");
		String current = "active5";
		String headerName = request.getHeader("REFERER");
		String notCompleted = request.getParameter("notCompleted");
		
		boolean t = true;
		
		if(notCompleted != null) {
			t = true;
		}else if(headerName != null) {
				String linkName = headerName.substring(29, 34);
				t = true;
				if(linkName.equals("S0044") || linkName.equals("S0042")) {
					request.setAttribute("completed", linkName);
					t = true;
				}
				if(linkName.equals("S0040")){				
					t = true;
				}
			}else {
				t = false;
			}
		if(t == true) {
			request.setAttribute("current", current);
			if(name == null || mail == null || authority == null) {
				response.sendRedirect("S0040");
			}else {
			request.setAttribute("search", as.searchByNameAndMailAndAuthority(name, mail, authority));
			this.getServletContext().getRequestDispatcher("/accountSearchResult.jsp").forward(request, response);
			}
		}else {
			response.sendRedirect("S0040");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
