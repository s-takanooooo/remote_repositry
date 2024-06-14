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
 * Servlet implementation class salseRegisterServlet
 */
@WebServlet("/SalesRegister")
public class SalesRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SalesServices ss = new SalesServices();
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int authority = (int)session.getAttribute("authority");
		if(authority != 1 && authority != 11) {
			boolean f = false;
			request.setAttribute("salesAuthError", f);
			request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
		}
		
		//ss.getCatgoryName()を呼んだらcategory_nameが入った配列がvlaueにセットされる
		request.setAttribute("categories", ss.getCatgoryName());
		request.setAttribute("name", ss.getStaffName());
		this.getServletContext().getRequestDispatcher("/salesRegister.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf8");

		String day = request.getParameter("sale");
		String responsible = request.getParameter("responsible");
		String sales_category = request.getParameter("category");
		String trade_name = request.getParameter("trade_name");
		String unit_price = request.getParameter("unit_price");
		String sales_num = request.getParameter("sale_number");
		String sales_note = request.getParameter("note");
		
		//バリデーション
		boolean f = true;
		//担当者未入力チェック
		if (ss.selectCheck(responsible) == false) {
			f = false;
			request.setAttribute("staffError", f);
		}
		//商品カテゴリー未入力チェック
		if (ss.selectCheck(sales_category) == false) {
			f = false;
			request.setAttribute("categoryNameError", f);
		}
		//商品名長さチェック
		if(ss.tradeNameCheck(trade_name)==false) {
			f=false;
			request.setAttribute("tradeNameError", f);
		}
		//単価長さチェック
		if (ss.salePriceCheck(unit_price) == 1) {
			f = false;
			request.setAttribute("unitPriceError", f);
		}
		if(ss.salePriceCheck(unit_price) == 2) {
			f = false;
			request.setAttribute("unitPriceFomartError", f);
		}
		//個数長さチェック
		if (ss.saleNumCheck(sales_num) == 1) {
			f = false;
			request.setAttribute("saleNumError", f);
		}
		if(ss.saleNumCheck(sales_num) == 2) {
			f = false;
			request.setAttribute("saleNumFomartError", f);
		}
		//備考長さチャック
		if (ss.noteCheck(sales_note) == false) {
			f = false;
			request.setAttribute("noteError", f);
		}
		if (f == false) {
			doGet(request, response);
		} else {
			request.setAttribute("day", day);
			request.setAttribute("responsible", responsible);
			request.setAttribute("sales_category", sales_category);
			request.setAttribute("trade_name", trade_name);
			request.setAttribute("unit_price", unit_price);
			request.setAttribute("sales_num", sales_num);
			request.setAttribute("sales_note", sales_note);
			request.setAttribute("subtotal", ss.subTotal(sales_num, unit_price));
			this.getServletContext().getRequestDispatcher("/salesRegisterConfirm.jsp").forward(request, response);
		}
	}

}
