package beans;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data @AllArgsConstructor
public class AccountsBean {
	int account_id;
	String name;
	String mail;
	String password;
	int authority;
}
