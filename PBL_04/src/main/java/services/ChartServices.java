package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.JSONArray;

import util.DbUtil;

public class ChartServices {
	
	public ChartData ChartData() {
		ArrayList<String> categories = new ArrayList<>();
        ArrayList<Integer> values = new ArrayList<>();
        String sql = "SELECT c.category_name, SUM(s.unit_price * s.sale_number) AS total_sales " +
                "FROM sales s " +
                "JOIN categories c ON s.category_id = c.category_id " +
                "WHERE c.active_flg = 1 " +
                "GROUP BY c.category_name " +
                "ORDER BY total_sales DESC";
		try (
				Connection conn = DbUtil.open();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();){ 
		while (rs.next()) {
	        categories.add(rs.getString("category_name"));
	        values.add(rs.getInt("total_sales"));}
		} catch (SQLException e) {
	        e.printStackTrace();
	    }
		 // JSON配列に変換
        JSONArray categoriesJson = new JSONArray(categories);
        JSONArray valuesJson = new JSONArray(values);
        // ChartDataオブジェクトを返す
        return new ChartData(categoriesJson, valuesJson);
		}
	
	public class ChartData {
	    private JSONArray categories;
	    private JSONArray values;

	    public ChartData(JSONArray categories, JSONArray values) {
	        this.categories = categories;
	        this.values = values;
	    }

	    public JSONArray getCategories() {
	        return categories;
	    }

	    public JSONArray getValues() {
	        return values;
	    }
	}
}
