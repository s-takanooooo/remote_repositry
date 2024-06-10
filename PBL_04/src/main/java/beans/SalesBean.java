package beans;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data @AllArgsConstructor
public class SalesBean {
	int sale_id;
	Date sale_date;
	int account_id;
	int category_id;
	String trade_name;
	int unit_prace;
	int sale_number;
	String note;
}
