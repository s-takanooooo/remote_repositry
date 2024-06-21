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
 * Servlet implementation class SalesRegisterSession
 */
@WebServlet("/S0012")
public class SalesRegisterSession extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesRegisterSession() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SalesServices ss = new SalesServices();
		HttpSession session = request.getSession();
		String day = (String)session.getAttribute("day");
		String responsible = (String)session.getAttribute("responsible");
		String sales_category = (String)session.getAttribute("sales_category");
		String trade_name = (String)session.getAttribute("trade_name");
		String unit_price = (String)session.getAttribute("unit_price");
		String sales_num = (String)session.getAttribute("sales_num");
		String sales_note = (String)session.getAttribute("sales_note");
		request.setAttribute("day", day);
		request.setAttribute("responsible", responsible);
		request.setAttribute("sales_category", sales_category);
		request.setAttribute("trade_name", trade_name);
		request.setAttribute("unit_price", unit_price);
		request.setAttribute("sales_num", sales_num);
		request.setAttribute("sales_note", sales_note);
		//selectの中身を取得してset
		request.setAttribute("categories", ss.getCatgoryName());
		request.setAttribute("name", ss.getStaffName());
		
		String current = "active2";
        request.setAttribute("current", current);
        int getSession = 1;
        request.setAttribute("getSession", getSession);
		this.getServletContext().getRequestDispatcher("/salesRegister.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
