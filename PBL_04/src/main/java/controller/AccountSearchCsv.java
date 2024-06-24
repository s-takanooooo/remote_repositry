package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.AccountsBean;
import services.AccountsServices;
import services.CsvServices;

/**
 * Servlet implementation class AccountSearchCsv
 */
@WebServlet("/AccountSearchCsv")
public class AccountSearchCsv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountSearchCsv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fileName = "account_search_result.csv";
		response.setContentType("text/CSV; charset=Shift-JIS");
		response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
		CsvServices cs = new CsvServices();
		HttpSession session = request.getSession();
		AccountsServices as = new AccountsServices();
		String name = (String)session.getAttribute("name");
		String mail = (String)session.getAttribute("mail");
		String permission = (String)session.getAttribute("permission");
		ArrayList<AccountsBean> abList = as.searchByNameAndMailAndAuthority(name, mail, permission);
		
		
		
		
		try(PrintWriter writer = response.getWriter()){
			cs.createAccountCsv(writer, abList);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
