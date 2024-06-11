package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.AccountsServices;

/**
 * Servlet implementation class AccountSearch
 */
@WebServlet("/AccountSearch")
public class AccountSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       AccountsServices as = new AccountsServices();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.getServletContext().getRequestDispatcher("/accountSearch.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		String name =  request.getParameter("name");
		String mail = request.getParameter("mail");
		int permission = Integer.parseInt(request.getParameter("permission"));
		
		request.setAttribute("search", as.searchByNameAndMailAndAuthority(name, mail, permission));
		
		/*as.searchByName(name);
		as.searchByMail(mail);
		as.searchByAuthority(permission);
		as.searchByNameAndMail(name, mail);
		as.searchByNameAndAuthority(name, permission);
		as.searchByMailAndAuthority(mail, permission);*/
		
		
		this.getServletContext().getRequestDispatcher("/accountSearchResult.jsp").forward(request, response);
	}

}
