package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Finish;

public class FinishDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/d2";
    private static final String DB_USER = "d2";
    private static final String DB_PASS = "YVw2aAvYdfh4Kdmp";

    public void insert(Finish dto){

        String sql = "INSERT INTO finish(id_chara, date_finish, time_finish, category) VALUES(?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement ps = conn.prepareStatement(sql)){
                ps.setInt(1, dto.getId_chara());
                ps.setString(2, dto.getDate_finish());
                ps.setString(3, dto.getTime_finish());
                ps.setString(4, dto.getCategory());

                ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Finish> getNotifications(String userId) {
		Connection conn = null;
		List<Finish> finList = new ArrayList<Finish>();

		try {conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

			// SQLに WHERE 句を追加
			String sql = "SELECT date_finish, category FROM finish WHERE id_chara = ?";
			
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			// プレースホルダーに値をセット
			pStmt.setString(1, userId);

			ResultSet rs = pStmt.executeQuery();

			while (rs.next()) {
				Finish fin = new Finish(
						rs.getString("date_finish"), 
						rs.getString("category")
						);
				finList.add(fin);
			}
			
			// デバッグコード
			System.out.println("===== finList Debug =====");
			System.out.println("Size: " + finList.size());
			for (Finish fin : finList) {
			    System.out.println(fin);
			}
			System.out.println("========================");
		} catch (SQLException e) {
			e.printStackTrace();
			finList = null;
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					finList = null;
				}
			}
		}

		return finList;
	}
}

    
