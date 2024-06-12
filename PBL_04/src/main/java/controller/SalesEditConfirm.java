package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.SalesServices;

/**
 * Servlet implementation class SalesEditConfirm
 */
@WebServlet("/SalesEditConfirm")
public class SalesEditConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SalesEditConfirm() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf8");

		String day = request.getParameter("day");
		String name = request.getParameter("staff");
		String sale_category = request.getParameter("category");
		String trade_name = request.getParameter("product_name");
		String unit_price = request.getParameter("price");
		String sale_num = request.getParameter("product_name");
		String sale_note = request.getParameter("mail");

		SalesServices si = new SalesServices();
		si.salesEdit(day, name, sale_category, trade_name, unit_price, sale_num, sale_note, 1);
		response.sendRedirect("SalesEdit");

	}

}
