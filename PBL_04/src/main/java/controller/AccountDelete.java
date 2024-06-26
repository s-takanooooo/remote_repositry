package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.AccountsBean;
import services.AccountsServices;

/**
 * Servlet implementation class AccountDelete
 */
@WebServlet("/S0044")
public class AccountDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       AccountsServices as = new AccountsServices();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		String accountId = request.getParameter("accountId");
		AccountsBean ab = as.selectById(accountId);
		String headerName = request.getHeader("REFERER");
		
		if(headerName != null){
			if(ab != null) {
				request.setAttribute("deleteAccountId", ab.getAccount_id());
				request.setAttribute("deleteName", ab.getName());
				request.setAttribute("deleteMail", ab.getMail());
				request.setAttribute("deletePass", ab.getPassword());
				request.setAttribute("authority", ab.getAuthority());
				String current = "active5";
				request.setAttribute("current", current);
		
				this.getServletContext().getRequestDispatcher("/accountDelete.jsp").forward(request, response);
			}else {
			response.sendRedirect("S0040");
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
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("deleteName");
		String mail = request.getParameter("deleteMail");
		String pass = request.getParameter("deletePass");
		int authority = Integer.parseInt(request.getParameter("authority"));
		String accountId = request.getParameter("deleteAccountId");
		if(as.deleteAccount(accountId) == false) {
			boolean deletable = false;
			AccountsBean ab = as.selectById(accountId);
			
			request.setAttribute("deleteAccountId", ab.getAccount_id());
			request.setAttribute("deleteName", ab.getName());
			request.setAttribute("deleteMail", ab.getMail());
			request.setAttribute("deletePass", ab.getPassword());
			request.setAttribute("authority", ab.getAuthority());
			request.setAttribute("deletable", deletable);
			request.getRequestDispatcher("accountDelete.jsp").forward(request, response);
		}else {
			response.sendRedirect("S0046");
		}
	}

}
