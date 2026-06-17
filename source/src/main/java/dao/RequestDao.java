package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
	public Request selectSuccess(String id) {
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
			String sql = "SELECT id_chara, thisdate, date, category, time, option1, option2, option3, "
					+ "option4, total_amount, payment_method FROM Request "
					+ "WHERE id_reservation = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setString(1, id);
			
			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			if(rs.next()) {
				result = new Request();
				result.setId_chara(rs.getInt("id_chara"));
				result.setThisdate(rs.getString("thisdate")); 
				result.setDate(rs.getString("date"));
				result.setTime(rs.getString("time"));
				result.setCategory(rs.getString("category"));
				result.setOption1(rs.getString("option1"));
				result.setOption2(rs.getString("option2"));
				result.setOption3(rs.getString("option3"));
				result.setOption4(rs.getString("option4"));
				result.setTotal_amount(rs.getInt("total_amount"));
				result.setPayment_method(rs.getString("payment_method"));
			}
			System.out.println(result);
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
	/*public List<Request> seletCost(Request req) {
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
	}*/
	
	//金額との内部結合
		public Request seletOption(String id) {
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
				String sql = "SELECT r.category, cst.optionCost AS CostSt, r.option1, c1.optionCost AS Cost1, r.option2, c2.optionCost AS Cost2, "
						+ "r.option3, c3.optionCost AS Cost3, r.option4, c4.optionCost AS Cost4 FROM Request r "
						+ "LEFT JOIN Cost cst ON r.category = cst.optionNAME "
						+ "LEFT JOIN Cost c1 ON r.option1 = c1.optionNAME "
						+ "LEFT JOIN Cost c2 ON r.option2 = c2.optionNAME "
						+ "LEFT JOIN Cost c3 ON r.option3 = c3.optionNAME "
						+ "LEFT JOIN Cost c4 ON r.option4 = c4.optionNAME "
						+ "WHERE id_reservation = ?";
				PreparedStatement pStmt = conn.prepareStatement(sql);
				System.out.println("option:"+id);
				// SQL文を完成させる
				pStmt.setString(1, id);
				
				// SQL文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();

				// 結果表をコレクションにコピーする
				if(rs.next()) {
					result = new Request();
					result.setCategory(rs.getString("r.category"));
					result.setOption1(rs.getString("r.option1")); 
					result.setOption2(rs.getString("r.option2")); 
					result.setOption3(rs.getString("r.option3")); 
					result.setOption4(rs.getString("r.option4")); 
					result.setCostst(rs.getInt("CostSt"));
					result.setCost1(rs.getInt("Cost1"));
					result.setCost2(rs.getInt("Cost2"));
					result.setCost3(rs.getInt("Cost3"));
					result.setCost4(rs.getInt("Cost4"));
					//下 total_amountに入れるため
					int costSt = rs.getInt("CostSt");
					int cost1 = rs.getInt("Cost1");
					int cost2 = rs.getInt("Cost2");
					int cost3 = rs.getInt("Cost3");
					int cost4 = rs.getInt("Cost4");
					int total = costSt + cost1 + cost2 + cost3 + cost4;
					result.setTotal_amount(total);
				}
				System.out.println(result);
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
		
		public boolean update(String payment, int total, String reqId) {
			Connection conn = null;
			boolean result = false;

			try {
				// JDBCドライバを読み込む
				Class.forName("com.mysql.cj.jdbc.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/d2?"
						+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
						"root", "password");

				// SQL文を準備する
				String sql = "UPDATE Request SET payment_method=?, total_amount=?, success=true WHERE id_reservation=?";
				PreparedStatement pStmt = conn.prepareStatement(sql);

				// SQL文を完成させる
				pStmt.setString(1, payment);
				pStmt.setInt(2, total);
				pStmt.setString(3, reqId);
				
				System.out.println("update:"+sql);
				
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
		
		//通知用
		public List<Request> getNotifications(String userId) {
			Connection conn = null;
			List<Request> reqList = new ArrayList<Request>();

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

				// SQLに WHERE 句を追加
				String sql = "SELECT r.thisdate, r.date, r.time, r.address, r.category, "
						+ "r.category, cst.optionCost AS CostSt, r.option1, c1.optionCost AS Cost1, r.option2, c2.optionCost AS Cost2, "
						+ "r.option3, c3.optionCost AS Cost3, r.option4, c4.optionCost AS Cost4, "
						+ "r.total_amount, r.payment_method, r.image FROM Request r " 
						+ "LEFT JOIN Cost cst ON r.category = cst.optionNAME "
						+ "LEFT JOIN Cost c1 ON r.option1 = c1.optionNAME "
						+ "LEFT JOIN Cost c2 ON r.option2 = c2.optionNAME "
						+ "LEFT JOIN Cost c3 ON r.option3 = c3.optionNAME "
						+ "LEFT JOIN Cost c4 ON r.option4 = c4.optionNAME "
						+"WHERE id_chara = ? AND success = 1";
				
				PreparedStatement pStmt = conn.prepareStatement(sql);
				
				// プレースホルダーに値をセット
				pStmt.setString(1, userId);

				ResultSet rs = pStmt.executeQuery();

				while (rs.next()) {
					Request reque = new Request(
							rs.getString("r.thisdate"), 
							rs.getString("r.date"),
							rs.getString("r.time"),
							rs.getString("r.address"), 
							rs.getString("r.category"),
							rs.getString("r.option1"),
							rs.getString("r.option2"),
							rs.getString("r.option3"),
							rs.getString("r.option4"),
							rs.getInt("CostSt"),
							rs.getInt("cost1"),
							rs.getInt("cost2"),
							rs.getInt("cost3"),
							rs.getInt("cost4"),
							rs.getInt("r.total_amount"),
							rs.getString("r.payment_method"),
							rs.getString("r.image")
							);
					reqList.add(reque);
				}
				
				// デバッグコード
				System.out.println("===== reqList Debug =====");
				System.out.println("Size: " + reqList.size());
				for (Request req : reqList) {
				    System.out.println(req);
				}
				System.out.println("========================");
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
		
	public String insert(Request req, String userId) {
		Connection conn = null;
		String result = null;

		try {
			// JDBCドライバを読み込む
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/d2?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");

			// SQL文を準備する
			String sql = "INSERT INTO Request (id_reservation, id_chara, category, date, time, option1, option2, option3, option4, tell, mailaddress, address, memo, image, thisdate) " +
			        "VALUES (0, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ?, ?, ?)";

			PreparedStatement pStmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

	        pStmt.setString(1, userId);
	        pStmt.setString(2, req.getCategory());
	        pStmt.setString(3, req.getDate());
	        pStmt.setString(4, req.getTime());
	        pStmt.setString(5, req.getOption1() != null ? req.getOption1() : "");
	        pStmt.setString(6, req.getOption2() != null ? req.getOption2() : "");
	        pStmt.setString(7, req.getOption3() != null ? req.getOption3() : "");
	        pStmt.setString(8, req.getOption4() != null ? req.getOption4() : "");
	        pStmt.setString(9, req.getTell() != null ? req.getTell() : "");
	        pStmt.setString(10, req.getMailaddress() != null ? req.getMailaddress() : "");
	        pStmt.setString(11, req.getAddress() != null ? req.getAddress() : "");
	        pStmt.setString(12, req.getMemo() != null ? req.getMemo() : "");
	        pStmt.setString(13, req.getImage() != null ? req.getImage() : "");
	        
	        LocalDate today = LocalDate.now();
	        int year = today.getYear();
	        int month = today.getMonthValue();
	        int day = today.getDayOfMonth();
	        
	        pStmt.setString(14, year + "年" + month + "月" + day + "日");
			
			System.out.println(pStmt);
			
			// SQL文を実行する
			if (pStmt.executeUpdate() == 1 ) {
				ResultSet rs = pStmt.getGeneratedKeys();
	            if (rs.next()) {
	                result = String.valueOf(rs.getLong(1));
	            }
			}
			System.out.println("reqDao:"+result);
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
	
	//予約されてる時間の取得
	public List<Request> selectDate(String category) {
		Connection conn = null;
		List<Request> reqList = new ArrayList<Request>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

			// SQLに WHERE 句を追加
			String sql = "SELECT date, time FROM request WHERE category = ? AND success = 1";
			
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			// プレースホルダーに値をセット
			pStmt.setString(1, category);

			ResultSet rs = pStmt.executeQuery();

			while (rs.next()) {
				Request reque = new Request( 
						rs.getString("date"),
						rs.getString("time")
						);
				reqList.add(reque);
			}
			
			// デバッグコード
			System.out.println("===== reqList Debug =====");
			System.out.println("Size: " + reqList.size());
			for (Request req : reqList) {
			    System.out.println(req);
			}
			System.out.println("========================");
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
	
	
}