package util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DbUtil {
	public static Connection open() {
		//コネクション型のオブジェクト作成
		Connection con = null;
		try {
			//Contextのオブジェクトインスタンス化
			Context initContext = new InitialContext();
			// lookupメソッドで、"java:/comp/env"（アプリケーションの環境設定ファイル）を見て、
			// 必要な設定情報を取得することを決定している。
			// Servletでは、具体的にはcontext.xml内を検索する
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			// context.xmlのResource name="jdbc/mariadb"に定義された情報（URL、DB名、ユーザー名）を読み込む
			DataSource ds = (DataSource) envContext.lookup("jdbc/mariadb");
			//dsに入ってるdbとの接続
			con = ds.getConnection();
			// DriverManager.getConnection()だと、DB名まで含めたURL、ユーザー名、パスワードをすべてJavaのコード内に埋め込む必要がある
			// DataSourceを使うと、これらの情報をcontext.xmlに書いて、Javaソースコードから追い出せる
			System.out.println("接続成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
		//connection型の接続されたdbを返す
		return con;
	}

	public static void close(Connection con) {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
