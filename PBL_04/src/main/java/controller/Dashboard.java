package controller;

import java.io.IOException;

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
		String salesGoal = String.valueOf((int)Math.floor(Integer.parseInt(sales2023)*1.15));
		String salesPer = String.valueOf((Double.parseDouble(sales2024)/Double.parseDouble(salesGoal))*100);

		request.setAttribute("sales2023", sales2023);
		request.setAttribute("sales2024", sales2024);
		request.setAttribute("salesGoal", salesGoal);
		request.setAttribute("salesPer", salesPer);
        
		this.getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
