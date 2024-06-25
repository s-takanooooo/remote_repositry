package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import services.SalesServices;

/**
 * Servlet implementation class SalesSearch
 */
@WebServlet("/S0020")
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
		//sessionを初期化
		HttpSession session = request.getSession();
		session.setAttribute("min_day", null);
		session.setAttribute("max_day", null);
		session.setAttribute("staff", null);
		session.setAttribute("sale_category", null);
		session.setAttribute("trade_name", null);
		session.setAttribute("sale_note", null);
		String current = "active3";
        request.setAttribute("current", current);
		this.getServletContext().getRequestDispatcher("/salesSeach.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
