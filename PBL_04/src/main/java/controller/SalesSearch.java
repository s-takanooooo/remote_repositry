package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.SalesServices;

/**
 * Servlet implementation class SalesSearch
 */
@WebServlet("/SalesSearch")
public class SalesSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SalesSearch() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		SalesServices ss = new SalesServices();
		//ss.getCatgoryName()を呼んだらcategory_nameが入った配列がvlaueにセットされる
		request.setAttribute("category", ss.getCatgoryName());
		request.setAttribute("staff", ss.getStaffName());
		this.getServletContext().getRequestDispatcher("/salesSeach.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf8");

		String min_day = request.getParameter("startDate");
		String max_day = request.getParameter("endDate");
		String name = request.getParameter("staff");
		String sale_category = request.getParameter("category");
		String trade_name = request.getParameter("mail");
		String sale_note = request.getParameter("note");

		SalesServices si = new SalesServices();
		request.setAttribute("sales", si.SearchSales(min_day, max_day, name, sale_category, trade_name, sale_note));

		this.getServletContext().getRequestDispatcher("/salesSearchAll.jsp").forward(request, response);
	}

}
