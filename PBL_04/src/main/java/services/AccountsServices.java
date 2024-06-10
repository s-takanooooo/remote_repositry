package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import beans.AccountsBean;
import util.DbUtil;

public class AccountsServices {
	
	public boolean Login(String account_name, String mail) {
		String sql = "SELECT * FROM accounts WHERE account_name = ? AND mail = ?";
		
		ArrayList<AccountsBean> abList = new ArrayList<>();
		
		try(
				Connection conn = DbUtil.open();
				PreparedStatement ps = conn.prepareStatement(sql);
				) {
			
			ps.setString(1, account_name);
			ps.setString(2, mail);
			
			ResultSet rs = ps.executeQuery();
			
			
			while (rs.next()) {
				AccountsBean ab = new AccountsBean();
				tb.setId(rs.getInt("id"));
				tb.setTitle(rs.getString("title"));
				tb.setPriority(rs.getString("priority"));
				tb.setDue_date(rs.getDate("due_date"));
				tb.setContent(rs.getString("content"));
				tb.setCompleted(rs.getInt("completed"));
				toDoList.add(tb);
			}

		} catch (Exception e) {
			System.out.println("レコードの取得に失敗しました");
		}
		return toDoList;
		}
	}
}
