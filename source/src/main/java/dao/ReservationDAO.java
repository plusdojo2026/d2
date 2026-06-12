package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import dto.ReservationDTO;

public class ReservationDAO {

    private static final String URL = "jdbc:mysql://localhost:3306/test_db?useSSL=false&characterEncoding=UTF-8&serverTimezone=Asia/Tokyo";
    private static final String USER = "root";
    private static final String PASSWORD = "passwprd";

    private static final String INSERT_SQL =
        "INSERT INTO reservations (job, date, time, options_text, phone, email, destination, note, image_file) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    public boolean insert(ReservationDTO dto) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);

            PreparedStatement ps = conn.prepareStatement(INSERT_SQL);
            ps.setString(1, dto.getJob());
            ps.setString(2, dto.getDate());
            ps.setString(3, dto.getTime());
            ps.setString(4, dto.getOptionsText());
            ps.setString(5, dto.getPhone());
            ps.setString(6, dto.getEmail());
            ps.setString(7, dto.getDestination());
            ps.setString(8, dto.getNote());
            ps.setString(9, dto.getImageFile());

            int result = ps.executeUpdate();

            ps.close();
            conn.close();

            return result == 1;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
