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
 * Servlet implementation class SalesRegisterConfirmServlet
 */
@WebServlet("/S0011")
public class SalesRegisterConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesRegisterConfirmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect("S0010");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf8");
		HttpSession session = request.getSession();
		
		String day = request.getParameter("sale_date");
		String staff = request.getParameter("staff");
		String sales_category = request.getParameter("sales_category");
		String trade_name = request.getParameter("trade_name");
		String unit_price = request.getParameter("unit_price");
		String sales_num = request.getParameter("sale_number");
		String sales_note = request.getParameter("note");
		String registerCompleteFlag = "true";
		SalesServices si = new SalesServices();
		si.salesInsert(day, staff, sales_category, trade_name, unit_price, sales_num, sales_note);
		session.setAttribute("registerCompleteFlag", registerCompleteFlag);
		response.sendRedirect("S0010");
	}

}
