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

import beans.SearchResultBean;
import services.CsvServices;

/**
 * Servlet implementation class SaleSearchCsv
 */
@WebServlet("/SaleSearchCsv")
public class SalesSearchCsv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesSearchCsv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fileName = "sale_search_result.csv";
		response.setContentType("text/CSV; charset=Shift-JIS");
		response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
		CsvServices cs = new CsvServices();
		HttpSession session = request.getSession();
		
		
		try(PrintWriter writer = response.getWriter()){
			cs.createCsv(writer, (ArrayList<SearchResultBean>)session.getAttribute("sales"));
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
