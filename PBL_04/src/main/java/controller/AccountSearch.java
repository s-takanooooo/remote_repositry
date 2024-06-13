package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import services.AccountsServices;
import util.CommonUtil;

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
		HttpSession session = request.getSession();
		String name =  request.getParameter("name");
		String mail = request.getParameter("mail");
		String accountsPermission = request.getParameter("accountsPermission");
		String salesPermission = request.getParameter("salesPermission");
		String permission = CommonUtil.setAutority(accountsPermission, salesPermission);		
		String allpermission = request.getParameter("allPermission");
		
		if(allpermission != null) {
			permission = null;
		}
		
		session.setAttribute("name", name);
		session.setAttribute("mail", mail);
		session.setAttribute("permission", permission);
		
		
		request.setAttribute("search", as.searchByNameAndMailAndAuthority(name, mail, permission));
		
		
		
		this.getServletContext().getRequestDispatcher("/accountSearchResult.jsp").forward(request, response);
	}

}
