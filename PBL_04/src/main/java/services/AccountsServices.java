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
	
	public ArrayList<AccountsBean> searchByNameAndMailAndAuthority(String name, String mail, int authority) {
		
		ArrayList<AccountsBean> abList = new ArrayList<>();
		AccountsBean ab = null;
		String sql = "SELECT * FROM accounts WHERE name LIKE ? AND mail = ? AND authority = ?";
		
		try(
				Connection conn =DbUtil.open();
				PreparedStatement ps = conn.prepareStatement(sql);){
			
			ps.setString(1, "%"+name+"%");
			ps.setString(2, mail);
			ps.setInt(3, authority);
			
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
	public AccountsBean searchByName(String name) {
		
		AccountsBean ab = null;
		String sql = "SELECT * FROM accounts WHERE name LIKE '%?%'";
		
		try(
				Connection conn =DbUtil.open();
				PreparedStatement ps = conn.prepareStatement(sql);){
			
			ps.setString(1, name);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int id = 0;
				String accountName = rs.getString("name");
				String email = rs.getString("mail");
				String pass = rs.getString("password");
				int permission = rs.getInt("authority");
				ab = new AccountsBean(id, accountName, email, pass, permission); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ab;
		
	}
	public AccountsBean searchByMail(String mail) {
		
		AccountsBean ab = null;
		String sql = "SELECT * FROM accounts WHERE mail = ?";
		
		try(
				Connection conn =DbUtil.open();
				PreparedStatement ps = conn.prepareStatement(sql);){
			
			ps.setString(1, mail);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int id = 0;
				String accountName = rs.getString("name");
				String email = rs.getString("mail");
				String pass = rs.getString("password");
				int permission = rs.getInt("authority");
				ab = new AccountsBean(id, accountName, email, pass, permission); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ab;
		
	}
	public AccountsBean searchByAuthority(int authority) {
		
		AccountsBean ab = null;
		String sql = "SELECT * FROM accounts WHERE authority = ?";
		
		try(
				Connection conn =DbUtil.open();
				PreparedStatement ps = conn.prepareStatement(sql);){
			
			ps.setInt(1, authority);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int id = 0;
				String accountName = rs.getString("name");
				String email = rs.getString("mail");
				String pass = rs.getString("password");
				int permission = rs.getInt("authority");
				ab = new AccountsBean(id, accountName, email, pass, permission); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ab;
		
	}
	public AccountsBean searchByNameAndMail(String name, String mail) {
		
		AccountsBean ab = null;
		String sql = "SELECT * FROM accounts WHERE name LIKE'%?%' AND mail = ?";
		
		try(
				Connection conn =DbUtil.open();
				PreparedStatement ps = conn.prepareStatement(sql);){
			
			ps.setString(1, name);
			ps.setString(1, mail);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int id = 0;
				String accountName = rs.getString("name");
				String email = rs.getString("mail");
				String pass = rs.getString("password");
				int permission = rs.getInt("authority");
				ab = new AccountsBean(id, accountName, email, pass, permission); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ab;
		
	}
	public AccountsBean searchByNameAndAuthority(String name, int authority) {
		
		AccountsBean ab = null;
		String sql = "SELECT * FROM accounts WHERE name LIKE'%?%' AND authority = ?";
		
		try(
				Connection conn =DbUtil.open();
				PreparedStatement ps = conn.prepareStatement(sql);){
			
			ps.setString(1, name);
			ps.setInt(1, authority);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int id = 0;
				String accountName = rs.getString("name");
				String email = rs.getString("mail");
				String pass = rs.getString("password");
				int permission = rs.getInt("authority");
				ab = new AccountsBean(id, accountName, email, pass, permission); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ab;
		
	}
	public AccountsBean searchByMailAndAuthority(String mail, int authority) {
		
		AccountsBean ab = null;
		String sql = "SELECT * FROM accounts WHERE name LIKE'%?%' AND authority = ?";
		
		try(
				Connection conn =DbUtil.open();
				PreparedStatement ps = conn.prepareStatement(sql);){
			
			ps.setString(1, mail);
			ps.setInt(1, authority);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int id = 0;
				String accountName = rs.getString("name");
				String email = rs.getString("mail");
				String pass = rs.getString("password");
				int permission = rs.getInt("authority");
				ab = new AccountsBean(id, accountName, email, pass, permission); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ab;
		
	}
	
	
}