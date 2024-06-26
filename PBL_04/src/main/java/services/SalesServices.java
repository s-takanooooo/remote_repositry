package services;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.AccountsBean;
import beans.CategoriesBean;
import beans.SearchResultBean;
import util.DbUtil;

public class SalesServices {
	public int getCategoryId(String catrgory_name) {
		String sql = "SELECT * from categories WHERE category_name=?";
		CategoriesBean cb = null;
		try (
				Connection con = DbUtil.open();
				PreparedStatement stmt = con.prepareStatement(sql);) {
			stmt.setString(1, catrgory_name);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				cb = new CategoriesBean(
						rs.getInt("category_id"),
						rs.getString("category_name"),
						rs.getInt("active_flg"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cb.getCategory_id();
	}

	public ArrayList<String> getCatgoryName() {
		String sql = "SELECT category_name FROM categories";
		ArrayList<String> categories = new ArrayList<>();
		try (
				Connection con = DbUtil.open();
				PreparedStatement stmt = con.prepareStatement(sql);) {
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				String category = rs.getString("category_name");
				categories.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return categories;
	}

	public int getAccountId(String account_name) {
		String sql = "SELECT * from accounts WHERE name=?";
		AccountsBean ab = null;
		try (
				Connection con = DbUtil.open();
				PreparedStatement stmt = con.prepareStatement(sql);) {
			stmt.setString(1, account_name);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				ab = new AccountsBean(
						rs.getInt("account_id"),
						rs.getString("name"),
						rs.getString("mail"),
						rs.getString("password"),
						rs.getInt("authority"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ab.getAccount_id();
	}

	public ArrayList<String> getStaffName() {
		String sql = "SELECT name FROM accounts";
		ArrayList<String> staffs = new ArrayList<>();
		try (
				Connection con = DbUtil.open();
				PreparedStatement stmt = con.prepareStatement(sql);) {
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				String staff = rs.getString("name");
				staffs.add(staff);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return staffs;
	}

	public void salesInsert(String day, String name, String sales_category,
			String trade_name, String unit_price, String sales_num,
			String sales_note) {
		//sql文作成
		String sql = "INSERT INTO sales (sale_date,account_id,category_id,trade_name,unit_price,sale_number,note)VALUES (?,?,?,?,?,?,?)";
		try (
				//db接続
				Connection con = DbUtil.open();
				//sql文送信
				PreparedStatement stmt = con.prepareStatement(sql);) {
			//1個目のに値をセット
			stmt.setDate(1, Date.valueOf(day));
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
			stmt.setString(7, sales_note);
			//sql文実行
			int result = stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void salesDelete(int sale_id) {
		String sql = "DELETE FROM sales WHERE sale_id=?";
		try (
				Connection con = DbUtil.open();
				PreparedStatement stmt = con.prepareStatement(sql);) {
			stmt.setInt(1, sale_id);
			int result = stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void salesEdit(String day, String name, String sale_category,
			String trade_name, String unit_price, String sale_num,
			String sale_note, String sale_id) {
		String sql = "UPDATE sales SET sale_date=?,account_id=?,category_id=?,trade_name=?,unit_price=?,sale_number=?,note=? where sale_id=?";
		try (
				Connection con = DbUtil.open();
				PreparedStatement stmt = con.prepareStatement(sql);) {
			stmt.setDate(1, Date.valueOf(day));
			stmt.setInt(2, this.getAccountId(name));
			stmt.setInt(3, this.getCategoryId(sale_category));
			stmt.setString(4, trade_name);
			stmt.setString(5, unit_price);
			stmt.setString(6, sale_num);
			stmt.setString(7, sale_note);
			stmt.setInt(8, Integer.parseInt(sale_id));
			int result = stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<SearchResultBean> searchSales(String min_day, String max_day, String name, String sale_category,
			String trade_name, String sale_note) {
		ArrayList<SearchResultBean> sales = new ArrayList<>();
		String sql = "SELECT s.sale_id, s.sale_date, a.name, c.category_name, " +
				"s.trade_name AS trade_name, s.sale_number, s.unit_price, s.note " +
				"FROM sales s JOIN accounts a ON s.account_id = a.account_id " +
				"JOIN categories c ON s.category_id = c.category_id WHERE 1=1 ";

		// 条件に応じてSQL文を動的に追加
		if (min_day != null && !min_day.isEmpty() && max_day != null && !max_day.isEmpty()) {
			sql += "AND s.sale_date BETWEEN ? AND ? ";
		}
		if (min_day != null && !min_day.isEmpty()) {
			sql += "AND s.sale_date >= ? ";
		}
		if (max_day != null && !max_day.isEmpty()) {
			sql += "AND s.sale_date <= ? ";
		}
		if (!name.equals("0")) {
			sql += "AND a.name = ? ";
		}
		if (!sale_category.equals("0")) {
			sql += "AND c.category_name = ? ";
		}
		if (trade_name != null && !trade_name.isEmpty()) {
			sql += "AND s.trade_name LIKE ? ";
		}
		if (sale_note != null && !sale_note.isEmpty()) {
			sql += "AND s.note LIKE ? ";
		}

		try (
				Connection con = DbUtil.open();
				PreparedStatement stmt = con.prepareStatement(sql);) {
			// ?の位置の変数
			int paramIndex = 1;
			if (min_day != null && !min_day.isEmpty() && max_day != null && !max_day.isEmpty()) {
				stmt.setString(paramIndex++, min_day);
				stmt.setString(paramIndex++, max_day);
			}
			if (min_day != null && !min_day.isEmpty()) {
				stmt.setString(paramIndex++, min_day);
			}
			if (max_day != null && !max_day.isEmpty()) {
				stmt.setString(paramIndex++, max_day);
			}
			if (!name.equals("0")) {
				stmt.setString(paramIndex++, name);
			}
			if (!sale_category.equals("0")) {
				stmt.setString(paramIndex++, sale_category);
			}
			if (trade_name != null && !trade_name.isEmpty()) {
				stmt.setString(paramIndex++, "%" + trade_name + "%");
			}
			if (sale_note != null && !sale_note.isEmpty()) {
				stmt.setString(paramIndex++, "%" + sale_note + "%");
			}

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				int sale_id = rs.getInt("sale_id");
				Date sale_date = rs.getDate("sale_date");
				String staff = rs.getString("name");
				String c_name = rs.getString("category_name");
				String t_name = rs.getString("trade_name");
				int sale_num = rs.getInt("sale_number");
				int sale_price = rs.getInt("unit_price");
				BigInteger subtotal = BigInteger.valueOf(sale_num).multiply(BigInteger.valueOf(sale_price));
				String note = rs.getString("note");

				SearchResultBean srb = new SearchResultBean(sale_id, sale_date, staff, c_name, t_name, sale_num,
						sale_price, subtotal, note);
				sales.add(srb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return sales;
	}

	public BigInteger subTotal(String sale_num, String unit_price) {
		BigInteger num = new BigInteger(sale_num);
		BigInteger price = new BigInteger(unit_price);
		BigInteger subtotal = num.multiply(price);
		return subtotal;
	}

	public boolean selectCheck(String select) {
		boolean f = false;
		if (select.equals("0")) {
			f = false;
		} else {
			f = true;
		}
		return f;
	}

	public boolean tradeNameCheck(String trade_name) {
		boolean f = false;
		if (trade_name.length() > 100) {
			f = false;
		} else {
			f = true;
		}
		return f;
	}

	public boolean noteCheck(String note) {
		boolean f = false;
		if (note.length() > 400) {
			f = false;
		} else {
			f = true;
		}
		return f;
	}

	public int saleNumCheck(String num) {
		int f = 0;
		try {
			if (Integer.parseInt(num) > 2147483647) {
				f = 1;//１なら長さエラー
			} else {
				int sale_num = Integer.parseInt(num);
				f = 3;//３なら問題なし
			}
		} catch (Exception e) {
			f = 2;//２ならフォーマットエラー
		}
		return f;
	}

	public int salePriceCheck(String price) {
		int f = 0;
		try {
			if (Integer.parseInt(price) > 2147483647) {
				f = 1;//１なら長さエラー
			} else {
				int sale_price = Integer.parseInt(price);
				f = 3;//３なら問題なし
			}
		} catch (Exception e) {
			f = 2;//２ならフォーマットエラー
		}
		return f;
	}

	public static String convertString(String zenkaku) {
		if (zenkaku == null) {
			return null;
		}

		StringBuilder hankaku = new StringBuilder(zenkaku.length());
		for (int i = 0; i < zenkaku.length(); i++) {
			char c = zenkaku.charAt(i);

			// 全角アルファベット・数字・記号を対応する半角に変換
			if (c >= '！' && c <= '～') {
				c = (char) (c - '！' + '!');
			} else if (c == '　') {
				c = ' '; // 全角スペースを半角スペースに変換
			}

			hankaku.append(c);
		}

		return hankaku.toString();
	}

}