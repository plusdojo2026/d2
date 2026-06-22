package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.IdPw;

public class IdPwDao {
	private static final String DB_URL = "jdbc:mysql://localhost:3306/d2";
	private static final String DB_USER = "d2";
    private static final String DB_PASS = "YVw2aAvYdfh4Kdmp";
	// 引数で指定されたidpwでログイン成功ならtrueを返す
		// isLoginOkは廃止。idを返す目的に変更
		public IdPw getLoginUser(IdPw idpw) {
		    Connection conn = null;
		    //Query結果で該当ユーザがなければNullが返る。
		    IdPw result = null;

		    try {
		        Class.forName("com.mysql.cj.jdbc.Driver");
		        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

		        String sql = "SELECT id, user_id, password FROM IdPw WHERE user_id=? AND password=?";
		        PreparedStatement pStmt = conn.prepareStatement(sql);
		        pStmt.setString(1, idpw.getUser_id());
		        pStmt.setString(2, idpw.getPassword());

		        ResultSet rs = pStmt.executeQuery();

		        if (rs.next()) {
		        	//DTOの構成でuser_id/passwordから特定マッチレコードを見つけDTO変数にレコード代入。
		            result = new IdPw(rs.getString("user_id"), rs.getString("password"));
		            //上の処理ではidの値がセットされていない状態なのでQueryの結果からidを取り出しDTO変数にセット
		            result.setId(rs.getInt("id"));
		        }
		    } catch (SQLException | ClassNotFoundException e) {
		        e.printStackTrace();
		    } finally {
		        if (conn != null) {
		            try {
		                conn.close();
		            } catch (SQLException e) {
		                e.printStackTrace();
		            }
		        }
		    }
		    //３つの変数がセットされた塊DTO　IdPw resultを返却。
		    return result;
		}
	// 引数で指定されたidpwでログイン成功ならtrueを返す
	/*public boolean isLoginOK(IdPw idpw) {
		Connection conn = null;
		boolean loginResult = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/d2?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");

			// SELECT文を準備する
			String sql = "SELECT count(*) FROM IdPw WHERE user_id=? AND password=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, idpw.getUser_id());
			pStmt.setString(2, idpw.getPassword());

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// ユーザーIDとパスワードが一致するユーザーがいれば結果をtrueにする
			rs.next();
			if (rs.getInt("count(*)") == 1) {
				loginResult = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			loginResult = false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			loginResult = false;
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					loginResult = false;
				}
			}
		}

		// 結果を返す
		return loginResult;
	}*/
	
	public boolean insert(IdPw idpw) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

			// SQL文を準備する
			String sql = "INSERT INTO IdPw VALUES (0, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (idpw.getUser_id() != null) {
				pStmt.setString(1, idpw.getUser_id());
			} else {
				pStmt.setString(1, "");
			}
			if (idpw.getPassword() != null) {
				pStmt.setString(2, idpw.getPassword());
			} else {
				pStmt.setString(2, "");
			}

			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		// 結果を返す
		return result;
	}
}
