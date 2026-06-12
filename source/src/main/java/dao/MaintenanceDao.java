package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Maintenance;

public class MaintenanceDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/d2";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "password";

    public List<Maintenance> getNotifications() {
        List<Maintenance> list = new ArrayList<>();
      
        String sql = "SELECT date_maintenance, title_maintenance, message_maintenance FROM maintenance";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                // クラスをインスタンス化
                Maintenance model = new Maintenance();
                
                model.setDate_maintenance(rs.getString("date_maintenance"));
                model.setTitle_maintenance(rs.getString("title_maintenance"));
                model.setMessage_maintenance(rs.getString("message_maintenance"));

                list.add(model);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}