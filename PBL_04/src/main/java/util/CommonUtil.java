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
	
	public static String setAutority(String accountsPermission,String salesPermission) {
		String permission = null;
		if ("1".equals(accountsPermission) && "1".equals(salesPermission)) {
		    permission = "11";
		} else if ("1".equals(accountsPermission) && salesPermission == null) {
		    permission = "10";
		} else if (accountsPermission == null && "1".equals(salesPermission)) {
		    permission = "1";
		} else if (accountsPermission == null && salesPermission == null) {
		    permission = "0";
		}
		return permission;
	}
}
