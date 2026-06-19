package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Info;

public class InfoDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/d2";
    private static final String DB_USER = "d2";
    private static final String DB_PASS = "YVw2aAvYdfh4Kdmp";

    public List<Info> getNotifications() {
        List<Info> list = new ArrayList<>();

        String sql = "SELECT date_info, title_info, message_info FROM info";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                //クラスをインスタンス化
                Info model = new Info();
                
                model.setDate_info(rs.getString("date_info"));
                model.setTitle_info(rs.getString("title_info"));
                model.setMessage_info(rs.getString("message_info"));

                list.add(model);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}