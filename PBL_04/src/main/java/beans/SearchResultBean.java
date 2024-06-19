package beans;

import java.math.BigInteger;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data @AllArgsConstructor
public class SearchResultBean {
	int sale_id;
	Date sale_date;
	String name;
	String category_name;
	String trade_name;
	int unit_price;
	int sale_number;
	BigInteger subtotal;
	String note;
}
