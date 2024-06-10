package beans;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data @AllArgsConstructor
public class CategoriesBean {
	int category_id;
	String category_name;
	int active_flg;
}
