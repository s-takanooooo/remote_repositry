package services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.CategoriesBean;
import util.DbUtil;

public class SalesServices {
	public int getCategoryId(String catrgory_name) {
		String sql ="SELECT * from categories WHERE category_name=?";
		CategoriesBean cb =null;
		try(
				Connection con =DbUtil.open();
				PreparedStatement stmt=con.prepareStatement(sql);
				){
			stmt.setString(1,catrgory_name);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				cb = new CategoriesBean(
						rs.getInt("category_id"),
						rs.getString("category_name"),
						rs.getInt("active_flg"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return cb.getCategory_id();
	}
	
	public void salesInsert(String day, int account_id,String sales_category,
			String trade_name,String unit_price,String sales_num,
			String sales_note) {
		//sql文作成
		String sql ="INSERT INTO sales (sale_date,account_id,category_id,trade_name,unit_price,sale_number,note)VALUES (?,?,?,?,?,?,?)";
		try(
				//db接続
				Connection con =DbUtil.open();
				//sql文送信
				PreparedStatement stmt=con.prepareStatement(sql);
				){
			//1個目のに値をセット
			stmt.setDate(1,  Date.valueOf(day));
			//2個目のに値をセット
			stmt.setInt(2, account_id);
			//3個目のに値をセット
			stmt.setInt(3, this.getCategoryId(sales_category));
			//4個目のに値をセット
			stmt.setString(4, trade_name);
			//5個目のに値をセット
			stmt.setInt(5, Integer.parseInt(unit_price));
			//6個目のに値をセット
			stmt.setInt(6, Integer.parseInt(sales_num));
			//7個目のに値をセット
			stmt.setString(7,sales_note);
			//sql文実行
			int result = stmt.executeUpdate();
			System.out.println(result);
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
}