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
        System.out.println(request.getRequestURI().toString());
        String current = "active";
        request.setAttribute("current", current);
		this.getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
