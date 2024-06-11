package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class salseRegisterServlet
 */
@WebServlet("/SalesRegister")
public class SalesRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.getServletContext().getRequestDispatcher("/salesRegister.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf8");
		
		String day = request.getParameter("sale");
		String responsible = request.getParameter("responsible");
		String sales_category = request.getParameter("category");
		String trade_name = request.getParameter("trade_name");
		String unit_price = request.getParameter("unit_prace");
		String sales_num = request.getParameter("sale_number");
		String sales_note = request.getParameter("note");
		
		System.out.println(sales_note);
		
		int price = Integer.parseInt(unit_price);
		int num = Integer.parseInt(sales_num);
		
		int subtotal = price * num;
		
		request.setAttribute("day", day);
		request.setAttribute("responsible", responsible);
		request.setAttribute("sales_category", sales_category);
		request.setAttribute("trade_name", trade_name);
		request.setAttribute("unit_price", unit_price);
		request.setAttribute("sales_num", sales_num);
		request.setAttribute("sales_note", sales_note);
		request.setAttribute("subtotal", subtotal);

		
		this.getServletContext().getRequestDispatcher("/salesRegisterConfirm.jsp").forward(request, response);
	}

}
