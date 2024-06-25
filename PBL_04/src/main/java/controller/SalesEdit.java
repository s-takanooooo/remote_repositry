package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.SearchResultBean;
import services.SalesServices;

/**
 * Servlet implementation class SalesEdit
 */
@WebServlet("/S0023")
public class SalesEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SalesServices ss = new SalesServices();

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
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String str_sales_id = request.getParameter("id");
		String headerName = request.getHeader("REFERER");
		ArrayList<SearchResultBean> sales = new ArrayList<>();
		if (headerName != null) {
			int sales_id = Integer.parseInt(str_sales_id);
			sales = new ArrayList<>(
					(ArrayList<SearchResultBean>) session.getAttribute("sales"));
			if (sales_id <= sales.size() || headerName.contains("S0023")) {
				request.setAttribute("category", ss.getCatgoryName());
				request.setAttribute("staff", ss.getStaffName());
				int getSession = 0;
				request.setAttribute("getSession", getSession);
				String current = "active3";
				request.setAttribute("current", current);
				SearchResultBean srb =sales.get(sales_id);
				System.out.println(srb.getSale_date());
				this.getServletContext().getRequestDispatcher("/salesEdit.jsp").forward(request, response);

			} else {
				response.sendRedirect("S0020");
			}
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
		request.setCharacterEncoding("utf8");
		HttpSession session = request.getSession();
		String day = request.getParameter("day");
		String staff = request.getParameter("staff");
		String sale_category = request.getParameter("category");
		String trade_name = request.getParameter("product_name");
		String unit_price = SalesServices.convertString(request.getParameter("price"));
		String sale_num = SalesServices.convertString(request.getParameter("product_num"));

		String sale_note = request.getParameter("note");
		String sale_id = request.getParameter("id");

		//バリデーション
		boolean f = true;
		//販売日
		if(day==null)
			f=false;
		//担当者未入力チェック
		if (ss.selectCheck(staff) == false) {
			f = false;
			request.setAttribute("staffError", f);
		}
		//商品カテゴリー未入力チェック
		if (ss.selectCheck(sale_category) == false) {
			f = false;
			request.setAttribute("categoryNameError", f);
		}
		//商品名nullチェック
		if(trade_name==null)
			f=false;
		//商品名長さチェック
		if (ss.tradeNameCheck(trade_name) == false) {
			f = false;
			request.setAttribute("tradeNameError", f);
		}
		//単価nullチェック
		if(unit_price==null)
			f=false;
		//単価長さチェック
		if (ss.salePriceCheck(unit_price) == 1) {
			f = false;
			request.setAttribute("unitPriceError", f);
		}
		if (ss.salePriceCheck(unit_price) == 2) {
			f = false;
			request.setAttribute("unitPriceFomartError", f);
		}
		//個数nullチェック
		if(sale_num==null)
			f=false;
		//個数長さチェック
		if (ss.saleNumCheck(sale_num) == 1) {
			f = false;
			request.setAttribute("saleNumError", f);
		}
		if (ss.saleNumCheck(sale_num) == 2) {
			f = false;
			request.setAttribute("saleNumFomartError", f);
		}
		//備考長さチャック
		if (ss.noteCheck(sale_note) == false) {
			f = false;
			request.setAttribute("noteError", f);
		}
		if (f == false) {
			doGet(request, response);
		} else {
			session.setAttribute("edit_day", day);
			session.setAttribute("edit_staff", staff);
			session.setAttribute("edit_sale_category", sale_category);
			session.setAttribute("edit_trade_name", trade_name);
			session.setAttribute("edit_unit_price", unit_price);
			session.setAttribute("edit_sale_num", sale_num);
			session.setAttribute("edit_sale_note", sale_note);
			session.setAttribute("edit_sale_id", sale_id);
			String current = "active3";
			request.setAttribute("current", current);

			this.getServletContext().getRequestDispatcher("/salesEditConfirm.jsp").forward(request, response);
		}
	}
}
