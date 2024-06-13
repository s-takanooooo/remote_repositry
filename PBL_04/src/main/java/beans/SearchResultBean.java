package beans;

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
	int unit_prace;
	int sale_number;
	int subtotal;
}
