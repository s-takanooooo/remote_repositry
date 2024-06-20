package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.SearchResultBean;

/**
 * Servlet implementation class SalesDelete
 */
@WebServlet("/S0026")
public class SalesDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SalesDelete() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		SearchResultBean srb = (SearchResultBean) session.getAttribute("sale");
		int subtotal = srb.getUnit_price() * srb.getSale_number();
		request.setAttribute("subtotal", subtotal);
		this.getServletContext().getRequestDispatcher("/salesDeleteConfirm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf8");

		String sale_id = request.getParameter("sale_id");

		int sale = Integer.parseInt(sale_id);

		request.setAttribute("sale", sale);

		this.getServletContext().getRequestDispatcher("/SalesDeleteConfirm.jsp").forward(request, response);
	}

}
