package services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.AccountsBean;
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
	
	public ArrayList<String> getCatgoryName(){
		String sql= "SELECT category_name FROM categories";
		ArrayList<String> categories = new ArrayList<>();
		try(
				Connection con =DbUtil.open();
				PreparedStatement stmt = con.prepareStatement(sql);
				){
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				String category =rs.getString("category_name");
				categories.add(category);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return categories;
	}
	
	public int getAccountId(String account_name) {
		String sql ="SELECT * from accounts WHERE name=?";
		AccountsBean ab =null;
		try(
				Connection con =DbUtil.open();
				PreparedStatement stmt=con.prepareStatement(sql);
				){
			stmt.setString(1,account_name);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				ab = new AccountsBean(
						rs.getInt("account_id"),
						rs.getString("name"),
						rs.getString("mail"),
						rs.getString("password"),
						rs.getInt("authority"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return ab.getAccount_id();
	}
	
	public ArrayList<String> getStaffName(){
		String sql= "SELECT name FROM accounts";
		ArrayList<String> staffs = new ArrayList<>();
		try(
				Connection con =DbUtil.open();
				PreparedStatement stmt = con.prepareStatement(sql);
				){
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				String staff =rs.getString("name");
				staffs.add(staff);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return staffs;
	}
	
	public void salesInsert(String day, String name,String sales_category,
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
			stmt.setInt(2, this.getAccountId(name));
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
	
	public void salesDelete(String sale_id) {
		String sql = "DELETE FROM sales WHERE sale_id=?";
		try(
				Connection con = DbUtil.open();
				PreparedStatement stmt = con.prepareStatement(sql);
				){
			stmt.setInt(1, Integer.parseInt(sale_id));
			int result = stmt.executeUpdate();
			System.out.println(result);
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void salesEdit(String day,String name,String sale_category,
			String trade_name,String unit_price,String sale_num,
			String sale_note, int sale_id) {
		String sql = "UPDATE sales SET sale_date=?,account_id=?,category_id=?,trade_name=?,unit_price=?,sale_number=?,note=? where sale_id=?";
		try(
				Connection con = DbUtil.open();
				PreparedStatement stmt = con.prepareStatement(sql);
				){
			stmt.setDate(1,Date.valueOf(day));
			stmt.setInt(2,this.getAccountId(name));
			stmt.setInt(3, this.getCategoryId(sale_category));
			stmt.setString(4,trade_name);
			stmt.setString(5, unit_price);
			stmt.setString(6, sale_num);
			stmt.setString(7, sale_note);
			stmt.setInt(8, sale_id);
			int result = stmt.executeUpdate();
			System.out.println(result);
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}