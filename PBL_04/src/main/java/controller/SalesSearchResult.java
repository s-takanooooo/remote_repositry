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
 * Servlet implementation class SalesSearchAll
 */
@WebServlet("/S0021")
public class SalesSearchResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SalesSearchResult() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		SalesServices ss = new SalesServices();
		HttpSession session = request.getSession();
		String min_day = (String) session.getAttribute("min_day");
		String max_day = (String) session.getAttribute("max_day");
		String name = (String) session.getAttribute("name");
		String sale_category = (String) session.getAttribute("sale_category");
		String trade_name = (String) session.getAttribute("trade_name");
		String sale_note = (String) session.getAttribute("sale_note");
		String headerName = request.getHeader("REFERER");
		String notCompleted = request.getParameter("notCompleted");
		
		if(headerName != null && notCompleted==null) {
			if(headerName.contains("S0025")) {
				request.setAttribute("deleteCompleted", headerName.substring(29,34));
			}
			else {
				request.setAttribute("editCompleted", headerName.substring(29,34));
			}
		}
		session.setAttribute("sales", ss.searchSales(min_day, max_day, name, sale_category, trade_name, sale_note));
		
		String current = "active3";
        request.setAttribute("current", current);

		this.getServletContext().getRequestDispatcher("/salesSearchResult.jsp").forward(request, response);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
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
		HttpSession session = request.getSession();
		session.setAttribute("min_day", min_day);
		session.setAttribute("max_day", max_day);
		session.setAttribute("name", name);
		session.setAttribute("sale_category", sale_category);
		session.setAttribute("trade_name", trade_name);
		session.setAttribute("sale_note", sale_note);
		session.setAttribute("sales", si.searchSales(min_day, max_day, name, sale_category, trade_name, sale_note));
		String current = "active3";
        request.setAttribute("current", current);
		this.getServletContext().getRequestDispatcher("/salesSearchResult.jsp").forward(request, response);
	}

}
