package util;

public class CommonUtil {
	public static String convAuthority(String intAuthority) {
		String authority = null;
		if(intAuthority.equals("0")){
			authority = "権限無し";
		}else if(intAuthority.equals("1")) {
			authority = "売上登録";
		}else if(intAuthority.equals("10")) {
			authority = "アカウント登録";
		}else if(intAuthority.equals("11")) {
			authority = "売上登録/アカウント登録";
		}
		return authority;
	}
	
	public static String setAutority(String accountsAuthority,String salesAuthority) {
		String authority = null;
		if ("1".equals(accountsAuthority) && "1".equals(salesAuthority)) {
		    authority = "11";
		} else if ("1".equals(accountsAuthority) && salesAuthority == null) {
		    authority = "10";
		} else if (accountsAuthority == null && "1".equals(salesAuthority)) {
		    authority = "1";
		} else if (accountsAuthority == null && salesAuthority == null) {
		    authority = "0";
		}
		return authority;
	}
}
