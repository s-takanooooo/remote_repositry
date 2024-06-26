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

import services.ChartServices;
import services.ChartServices.ChartData;

/**
 * Servlet implementation class Dashboard
 */
@WebServlet("/C0020")
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dashboard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ChartServices cs = new ChartServices();
		ChartData chartData = cs.ChartData();
		 // JSON文字列をリクエスト属性に設定
        request.setAttribute("categories", chartData.getCategories().toString());
        request.setAttribute("values", chartData.getValues().toString());
        request.setAttribute("currentLink", request.getRequestURI().toString());
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
        
		this.getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
