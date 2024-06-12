package util;

public class CommonUtil {
	public String convAuthority(String intAuthority) {
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
}
