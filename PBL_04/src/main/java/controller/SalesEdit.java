package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SalesEdit
 */
@WebServlet("/SalesEdit")
public class SalesEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.getServletContext().getRequestDispatcher("/salesEdit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf8");
		
		String day = request.getParameter("day");
		String name = request.getParameter("staff");
		String sale_category = request.getParameter("category");
		String trade_name = request.getParameter("product_name");
		String unit_price = request.getParameter("price");
		String sale_num = request.getParameter("product_num");
		String sale_note = request.getParameter("mail");
		String sale_id = request.getParameter("mail");
		
		request.setAttribute("day", day);
		request.setAttribute("name", name);
		request.setAttribute("sale_category", sale_category);
		request.setAttribute("trade_name", trade_name);
		request.setAttribute("unit_price", unit_price);
		request.setAttribute("sale_num", sale_num);
		request.setAttribute("sale_note", sale_note);
		request.setAttribute("sale_id", sale_id);
		
		this.getServletContext().getRequestDispatcher("/salesEditConfirm.jsp").forward(request, response);
	}

}
