package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DbUtil;

public class AccountsServices {

	public boolean Login(String account_name, String mail) throws Exception{
		
		
		String sql = "SELECT * FROM accounts WHERE account_name = ? AND mail = ?";

		try (
				Connection conn = DbUtil.open();
				PreparedStatement ps = conn.prepareStatement(sql);) {

			ps.setString(1, account_name);
			ps.setString(2, mail);

			ResultSet rs = ps.executeQuery();

			if(rs != null) {
				return true;  
			}else {
				return false;
			}
			
		} 
	}
}
