package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.AccountsBean;
import services.AccountsServices;
import services.ChartServices;
import services.ChartServices.ChartData;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/C0010")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AccountsServices as = new AccountsServices();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();

		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		if (as.Login(email, pass) == true) {
			HttpSession session = request.getSession();
			AccountsBean ab = as.selectByMailAndPass(email, pass);
			session.setAttribute("accounts_id", ab.getAccount_id());
			session.setAttribute("accountName", ab.getName());
			session.setAttribute("accountMail", ab.getMail());
			session.setAttribute("password", ab.getPassword());
			session.setAttribute("authority", ab.getAuthority());
			ChartServices cs = new ChartServices();
			ChartData chartData = cs.ChartData();
			// JSON文字列をリクエスト属性に設定
			request.setAttribute("categories", chartData.getCategories().toString());
			request.setAttribute("values", chartData.getValues().toString());
			String current = "active1";
			request.setAttribute("current", current);

			String sales2023 = cs.annualSales("2023");
			String sales2024 = cs.annualSales("2024");
			BigDecimal bigDeci2023 = new BigDecimal(sales2023);
			BigDecimal bigDeci2024 = new BigDecimal(sales2024);
			BigDecimal bigDeciTimes = new BigDecimal("1.15");
			BigDecimal bigDeciOnehundred = new BigDecimal("100");			
			DecimalFormat df = new DecimalFormat("#,###.##");
			DecimalFormat df0 = new DecimalFormat("#,###");
			
			BigDecimal salesGoal = bigDeci2023.multiply(bigDeciTimes);
			BigDecimal salesPer = bigDeci2024.divide(salesGoal, 2, RoundingMode.HALF_UP).multiply(bigDeciOnehundred);
			
			String sales2023String = df0.format(bigDeci2023);
			String sales2024String = df0.format(bigDeci2024);
			String salesGoalString = df0.format(salesGoal);
			String salesPerString = df.format(salesPer);
			
			

			request.setAttribute("sales2023", sales2023String);
			request.setAttribute("sales2024", sales2024String);
			request.setAttribute("salesGoal", salesGoalString);
			request.setAttribute("salesPer", salesPerString);

			request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
		} else {
			request.setAttribute("login", false);
			this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

}
