package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import beans.AccountsBean;
import util.DbUtil;

public class AccountsServices {

	public boolean Login(String mail, String password){
		boolean f = false;

		String sql = "SELECT * FROM accounts WHERE mail = ? AND password = ?";

		try (
				Connection conn = DbUtil.open();
				PreparedStatement ps = conn.prepareStatement(sql);) {

			ps.setString(1, mail);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			
			if (rs.next()){
				f =  true;
			} else {
				System.out.println("Query returned no results");
				f = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public AccountsBean selectOne(String mail, String password) {
		
		AccountsBean ab = null;
		String sql = "SELECT * FROM accounts WHERE mail = ? AND password = ?";
		
		try(
				Connection conn =DbUtil.open();
				PreparedStatement ps = conn.prepareStatement(sql);){
			
			ps.setString(1, mail);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int id = 0;
				String name = rs.getString("name");
				String email = rs.getString("mail");
				String pass = rs.getString("password");
				int authority = rs.getInt("authority");
				ab = new AccountsBean(id, name, email, pass, authority); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ab;
		
	}
	
	public void registerAccount(String name, String mail, String password, int authority) {
		
		String sql = "INSERT INTO accounts (name, mail, password, authority) VALUES (?,?,?,?)";
		
		try(
				Connection conn = DbUtil.open();
				PreparedStatement ps = conn.prepareStatement(sql);){
		
			ps.setString(1, name);
			ps.setString(2, mail);
			ps.setString(3, password);
			ps.setInt(4, authority);
			
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}