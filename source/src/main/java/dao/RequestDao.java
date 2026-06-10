package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Request;

public class RequestDao {
	// 引数card指定された項目で検索して、取得されたデータのリストを返す
	//予約成功
	public List<Request> selectSuccess(Request req) {
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
			String sql = "SELECT thisdate, date, category, option1, option2, option3, "
					+ "option4, total_amount, payment_method FROM Request "
					+ "WHERE id_reservation LIKE ? AND id_chara LIKE ? AND category LIKE ? "
					+ "AND thisdate LIKE ? AND option1 LIKE ? AND option2 LIKE ? AND option3 LIKE ? "
					+ "AND option4 LIKE ? AND date LIKE ? AND time LIKE ?  AND tell LIKE ? "
					+ "AND mailaddress LIKE ? AND address LIKE ? AND memo LIKE ?  AND image LIKE ? "
					+ "AND payment_method LIKE ? AND total_amount LIKE ? ";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, req.getId_reservation());
			pStmt.setInt(2, req.getId_chara());
			
			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
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
}