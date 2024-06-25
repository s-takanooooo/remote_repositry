package services;

import java.io.PrintWriter;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;

import beans.AccountsBean;
import beans.SearchResultBean;
import util.CommonUtil;

public class CsvServices {
	public void createCsv(PrintWriter writer, ArrayList<SearchResultBean> searchResult) {
		writer.println("No,販売日,担当,商品カテゴリー,商品名,単価,個数,小計,備考");
		for (SearchResultBean srb : searchResult) {
			int sale_id = srb.getSale_id();
			Date date = srb.getSale_date();
			String staff = srb.getName();
			String sale_category = srb.getCategory_name();
			String trade_name = srb.getTrade_name();
			int unit_price = srb.getUnit_price();
			int sale_num = srb.getSale_number();
			BigInteger subtotal = srb.getSubtotal();
			String note = srb.getNote();
			writer.println(sale_id + ","+date+","+staff+","+sale_category+","+trade_name
					+","+unit_price+","+sale_num+","+subtotal+","+note);
		}
	}
	public void createAccountCsv(PrintWriter writer, ArrayList<AccountsBean> accountSearchResult) {
		writer.println("No,氏名,メールアドレス,権限");
		CommonUtil cu = new CommonUtil();
		
		for (AccountsBean ab : accountSearchResult) {
			int account_id = ab.getAccount_id();
			String name = ab.getName();
			String mail = ab.getMail();
			String authority = String.valueOf(ab.getAuthority());
			String authorityString  = cu.convAuthority(authority);
			writer.println(account_id + ","+ name +","+ mail +","+authorityString);
		}
	}
}
