package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.SearchResultBean;
import services.SalesServices;

/**
 * Servlet implementation class SalesDelete
 */
@WebServlet("/S0025")
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
		if (srb != null) {

			int subtotal = srb.getUnit_price() * srb.getSale_number();
			request.setAttribute("subtotal", subtotal);
			String current = "active3";
			request.setAttribute("current", current);
			this.getServletContext().getRequestDispatcher("/salesDeleteConfirm.jsp").forward(request, response);
		} else {
			response.sendRedirect("S0020");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		SearchResultBean srb = (SearchResultBean) session.getAttribute("sale");
		int sale_id = srb.getSale_id();
		SalesServices si = new SalesServices();
		si.salesDelete(sale_id);
		boolean deleteFlag = true;
		session.setAttribute("deleteFlag", deleteFlag);
		session.setAttribute("sale", null);
		session.setAttribute("sales", null);
		response.sendRedirect("S0021");
	}

}
