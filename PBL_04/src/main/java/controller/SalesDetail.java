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

/**
 * Servlet implementation class SalesDetail
 */
@WebServlet("/S0022")
public class SalesDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SalesDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//検索結果配列の詳細を表示するbeanが入っている要素番号を取得
		String s_sale_num = request.getParameter("id");
		//session取得
		HttpSession session = request.getSession();
		String headerName = request.getHeader("REFERER");
		ArrayList<SearchResultBean> sales = new ArrayList<>();
		if (headerName != null) {
			int sale_num = Integer.parseInt(s_sale_num);
			sales = new ArrayList<>(
					(ArrayList<SearchResultBean>) session.getAttribute("sales"));
			if (sale_num <= sales.size()) {
				session.setAttribute("sale_num",sale_num);
				//表示するbeanを代入
				SearchResultBean srb = sales.get(sale_num);
				session.setAttribute("sale",srb);
				String current = "active3";request.setAttribute("current",current);
				this.getServletContext().getRequestDispatcher("/salesDetails.jsp").forward(request,response);
			}
			else {
				response.sendRedirect("S0020");
			}
		}else {
			response.sendRedirect("S0020");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
