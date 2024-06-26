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
@WebServlet("/S0040")
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
		
		//検索条件入力画面に遷移
		 String current = "active5";
	     request.setAttribute("current", current);
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
		String accountsAuthority = request.getParameter("accountsAuthority");
		String salesAuthority = request.getParameter("salesAuthority");
		String authority = CommonUtil.setAutority(accountsAuthority, salesAuthority);		
		String allAuthority = request.getParameter("allAuthority");
		
		if(allAuthority != null) {
			authority = allAuthority;
		}
		
		
		
		boolean f = true;
		if(as.checkAccountName(name) == false) {
			f = false;
			request.setAttribute("accountNameError", f);
		}
		if(as.checkAccountMail(mail) == false) {
			f = false;
			request.setAttribute("accountMailError", f);
		}
		if(f == false) {
			 String current = "active5";
		     request.setAttribute("current", current);
			this.getServletContext().getRequestDispatcher("/accountSearch.jsp").forward(request, response);
		}else {
		session.setAttribute("name", name);
		session.setAttribute("mail", mail);
		session.setAttribute("authoritySearch", authority);
		
		request.setAttribute("search", as.searchByNameAndMailAndAuthority(name, mail, authority));
		 String current = "active5";
	     request.setAttribute("current", current);
		this.getServletContext().getRequestDispatcher("/accountSearchResult.jsp").forward(request, response);
		}
	}

}
