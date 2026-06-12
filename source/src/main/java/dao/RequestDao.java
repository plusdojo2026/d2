package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import dto.Request;

public class RequestDao {
	private static final String DB_URL = "jdbc:mysql://localhost:3306/d2";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "password";
	// 引数req指定された項目で検索して、取得されたデータのリストを返す
	//予約成功
	public Request selectSuccess(int id) {
		Connection conn = null;
		Request result = null;

		try {
			// JDBCドライバを読み込む
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/d2?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");

			// SQL文を準備する(要修正)
			String sql = "SELECT thisdate, date, time, category, option1, option2, option3, "
					+ "option4, total_amount, payment_method FROM Request "
					+ "WHERE id_reservation = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, id);
			
			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			if(rs.next()) {
				result = new Request();
				result.setThisdate(rs.getString("thisdate")); 
				result.setDate(rs.getString("date"));
				result.setTime(rs.getString("time"));
				result.setCategory(rs.getString("category"));
				result.setOption1(rs.getString("option1"));	
				result.setOption2(rs.getString("option2"));
				result.setOption3(rs.getString("option3"));
				result.setOption1(rs.getString("option4"));
				result.setTotal_amount(rs.getInt("total_amount"));
				result.setPayment_method(rs.getString("payment_method"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			result = null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			result = null;
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					result = null;
				}
			}
		}

		// 結果を返す
		return result;
	}
	
	//料金精算画面
	public List<Request> seletCost(Request req) {
		Connection conn = null;
		List<Request> reqList = new ArrayList<Request>();

		try {
			// JDBCドライバを読み込む
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/d2?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");

			// SQL文を準備する(要修正)
			String sql = "SELECT option1, option2, option3, "
					+ "option4, total_amount FROM Request "
					+ "WHERE id_reservation ? AND id_chara ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, req.getId_reservation());
			pStmt.setInt(2, req.getId_chara());
			
			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Request reque = new Request(
						rs.getString("option1"),
						rs.getString("option2"),
						rs.getString("option3"),
						rs.getString("option4"),
						rs.getInt("total_amount"));
				reqList.add(reque);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			reqList = null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			reqList = null;
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					reqList = null;
				}
			}
		}

		// 結果を返す
		return reqList;
	}
	
	//金額との内部結合
		public List<Request> seletOption(Request req) {
			Connection conn = null;
			List<Request> reqList = new ArrayList<Request>();

			try {
				// JDBCドライバを読み込む
				Class.forName("com.mysql.cj.jdbc.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/d2?"
						+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
						"root", "password");

				// SQL文を準備する(要修正)
				String sql = "SELECT r.option1, c1.optionCost AS Cost1, r.option2, c2.optionCost AS Cost2, "
						+ "r.option3, c3.optionCost AS Cost3, r.option4, c4.optionCost AS Cost4 FROM Request "
						+ "LEFT JOIN Cost c1 ON r.option1 = c1.optionNAME "
						+ "LEFT JOIN Cost c2 ON r.option2 = c2.optionNAME "
						+ "LEFT JOIN Cost c3 ON r.option3 = c3.optionNAME "
						+ "LEFT JOIN Cost c4 ON r.option4 = c4.optionNAME ";
				PreparedStatement pStmt = conn.prepareStatement(sql);

				// SQL文を完成させる
				pStmt.setInt(1, req.getId_reservation());
				pStmt.setInt(2, req.getId_chara());
				
				// SQL文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();

				// 結果表をコレクションにコピーする
				while (rs.next()) {
					Request reque = new Request(
							rs.getInt("Cost1"),
							rs.getInt("Cost2"),
							rs.getInt("Cost3"),
							rs.getInt("Cost4"));
					reqList.add(reque);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				reqList = null;
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				reqList = null;
			} finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
						reqList = null;
					}
				}
			}

			// 結果を返す
			return reqList;
		}
		
		//通知用
		public List<Request> getNotifications(String userId) {
			Connection conn = null;
			List<Request> reqList = new ArrayList<Request>();

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

				// SQLに WHERE 句を追加
				String sql = "SELECT thisdate, date, category, option1, option2, option3, "
						+ "option4, total_amount, payment_method FROM request WHERE id_chara = ?";
				
				PreparedStatement pStmt = conn.prepareStatement(sql);
				
				// プレースホルダーに値をセット
				pStmt.setString(1, userId);

				ResultSet rs = pStmt.executeQuery();

				while (rs.next()) {
					Request reque = new Request(
							rs.getString("thisdate"), 
							rs.getString("date"),
							rs.getString("category"),
							rs.getString("option1"),
							rs.getString("option2"),
							rs.getString("option3"),
							rs.getString("option4"),
							rs.getInt("total_amount"),
							rs.getString("payment_method")
							);
					reqList.add(reque);
				}
				System.out.println(reqList);
			} catch (SQLException e) {
				e.printStackTrace();
				reqList = null;
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				reqList = null;
			} finally {
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
						reqList = null;
					}
				}
			}

			return reqList;
		}
		
	public boolean insert(Request req) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BCard?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");

			// SQL文を準備する
			String sql = "INSERT INTO Request VALUES (0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (req.getId_chara() != 0) {
				pStmt.setInt(1, req.getId_chara());
			} else {
				pStmt.setString(1, "");
			}
			if (req.getCategory() != null) {
				pStmt.setString(2, req.getCategory());
			} else {
				pStmt.setString(2, "");
			}
			
			LocalDate today = LocalDate.now();
			String todayStr = today.toString();  // "2026-05-01" のような形式
			pStmt.setString(3, todayStr);
			
			if (req.getOption1() != null) {
				pStmt.setString(4, req.getOption1());
			} else {
				pStmt.setString(4, "");
			}
			if (req.getOption2() != null) {
				pStmt.setString(5, req.getOption2());
			} else {
				pStmt.setString(5, "");
			}
			if (req.getOption3() != null) {
				pStmt.setString(6, req.getOption3());
			} else {
				pStmt.setString(6, "");
			}
			if (req.getOption4() != null) {
				pStmt.setString(7, req.getOption4());
			} else {
				pStmt.setString(7, "");
			}
			if (req.getDate() != null) {
				pStmt.setString(8, req.getDate());
			} else {
				pStmt.setString(8, "");
			}
			if (req.getTime() != null) {
				pStmt.setString(9, req.getTime());
			} else {
				pStmt.setString(9, "");
			}
			if (req.getTell() != null) {
				pStmt.setString(10, req.getTell());
			} else {
				pStmt.setString(10, "");
			}
			if(req.getMailaddress() != null) {
				pStmt.setString(11, req.getMailaddress());
			} else {
				pStmt.setString(11, "");
			}
			if (req.getAddress() != null) {
				pStmt.setString(12, req.getAddress());
			} else {
				pStmt.setString(12, "");
			}
			if (req.getMemo() != null) {
				pStmt.setString(13, req.getMemo());
			} else {
				pStmt.setString(13, "");
			}
			if (req.getImage() != null) {
				pStmt.setString(14, req.getImage());
			} else {
				pStmt.setString(14, "");
			}
			if (req.getPayment_method() != null) {
				pStmt.setString(15, req.getPayment_method());
			} else {
				pStmt.setString(15, "");
			}
			if (req.getTotal_amount() != 0) {
				pStmt.setInt(16, req.getTotal_amount());
			} else {
				pStmt.setString(16, "");
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