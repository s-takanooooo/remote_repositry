package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
	
	public AccountsBean selectByMailAndPass(String mail, String password) {
		
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
	
	public ArrayList<AccountsBean> searchByNameAndMailAndAuthority(String name, String mail, String authority) {
		
		ArrayList<AccountsBean> abList = new ArrayList<>();
		AccountsBean ab = null;
		String sql = "SELECT * FROM accounts WHERE 1=1";
		
		if(name != null && !name.isEmpty()) {
			sql += " AND name LIKE ?";
		}
		if(mail != null && !mail.isEmpty()) {
			sql += " AND mail = ?";
		}
		if(authority != null && !authority.isEmpty()) {
			sql += " AND authority = ?";
		}
		
		try(
				Connection conn =DbUtil.open();
				PreparedStatement ps = conn.prepareStatement(sql);){
				
			int paramInt = 1;
			
			if(name != null && !name.isEmpty()) {
				ps.setString(paramInt++, "%"+name+"%");				
			}
			if(mail != null && !mail.isEmpty()) {
				ps.setString(paramInt++, mail);				
			}
			if(authority != null && !authority.isEmpty()) {
				ps.setString(paramInt++, authority);
			}
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("account_id");
				String accountName = rs.getString("name");
				String email = rs.getString("mail");
				String pass = rs.getString("password");
				int permission = rs.getInt("authority");
				ab = new AccountsBean(id, accountName, email, pass, permission); 
				abList.add(ab);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return abList;
		
	}
	
	public AccountsBean selectById(String accountId) {
		
		AccountsBean ab = null;
		String sql = "SELECT * FROM accounts WHERE account_id = ?";
		
		try(
				Connection conn =DbUtil.open();
				PreparedStatement ps = conn.prepareStatement(sql);){
			
			ps.setString(1, accountId);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("account_id");
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
	
	public void updateAccount(String name, String mail, String password, int authority, int accountId) {
		
		String sql = "UPDATE accounts SET name = ?, mail = ?, password = ?, authority = ? WHERE account_id = ?";
		
		try(
				Connection conn = DbUtil.open();
				PreparedStatement ps = conn.prepareStatement(sql);){
			
			ps.setString(1, name);
			ps.setString(2, mail);
			ps.setString(3, password);
			ps.setInt(4, authority);
			ps.setInt(5, accountId);
			
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteAccount(int accountId) {
		
		String sql = "DELETE FROM accounts WHERE account_id = ?";
		
		try(
				Connection conn = DbUtil.open();
				PreparedStatement ps = conn.prepareStatement(sql);){
			
			ps.setInt(1, accountId);			
			
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}