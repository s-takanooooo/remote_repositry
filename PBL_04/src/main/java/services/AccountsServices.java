package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	
}