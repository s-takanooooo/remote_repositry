package services;

public class AccountsServices {

	public void Login(String account_name, String mail) {
		String sql = "SELECT * FROM accounts WHERE account_name = ? AND mail = ?";

	}
}
