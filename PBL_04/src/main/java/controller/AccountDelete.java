package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.AccountsBean;
import services.AccountsServices;
import services.ChartServices;
import services.ChartServices.ChartData;

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
		
		request.setAttribute("deleteAccountId", ab.getAccount_id());
		request.setAttribute("deleteName", ab.getName());
		request.setAttribute("deleteMail", ab.getMail());
		request.setAttribute("deletePass", ab.getPassword());
		request.setAttribute("permission", ab.getAuthority());
		
		this.getServletContext().getRequestDispatcher("/accountDelete.jsp").forward(request, response);
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
		int permission = Integer.parseInt(request.getParameter("permission"));
		String accountId = request.getParameter("deleteAccountId");
		if(as.deleteAccount(accountId) == false) {
			boolean deletable = false;
			AccountsBean ab = as.selectById(accountId);
			
			request.setAttribute("deleteAccountId", ab.getAccount_id());
			request.setAttribute("deleteName", ab.getName());
			request.setAttribute("deleteMail", ab.getMail());
			request.setAttribute("deletePass", ab.getPassword());
			request.setAttribute("permission", ab.getAuthority());
			request.setAttribute("deletable", deletable);
			request.getRequestDispatcher("accountDelete.jsp").forward(request, response);
		}else {
		String accountDeleteComplete = "completed";
		ChartServices cs = new ChartServices();
		ChartData chartData = cs.ChartData();
		 // JSON文字列をリクエスト属性に設定
        request.setAttribute("categories", chartData.getCategories().toString());
        request.setAttribute("values", chartData.getValues().toString());
		request.setAttribute("accountDeleteComplete", accountDeleteComplete);
		 String current = "active1";
	     request.setAttribute("current", current);
		request.getRequestDispatcher("dashboard.jsp").forward(request, response);
		}
	}

}
