package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import dto.ReservationDTO;

public class ReservationDAO {

    private static final String URL = "jdbc:mysql://localhost:3306/test_db?useSSL=false&characterEncoding=UTF-8&serverTimezone=Asia/Tokyo";
    private static final String USER = "root";
    private static final String PASSWORD = "passwprd";

    private static final String INSERT_SQL =
        "INSERT INTO reservations (job, date, time, options_text, phone, email, destination, note, image_file) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String FIND_BY_ID_SQL =
        "SELECT * FROM reservations WHERE id = ?";

    // ★ 画像表示のために「ID を返す insert」に変更
    public int insert(ReservationDTO dto) {

        int generatedId = -1;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);

            // ★ 自動採番IDを取得するために RETURN_GENERATED_KEYS を指定
            PreparedStatement ps = conn.prepareStatement(INSERT_SQL, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, dto.getJob());
            ps.setString(2, dto.getDate());
            ps.setString(3, dto.getTime());
            ps.setString(4, dto.getOptionsText());
            ps.setString(5, dto.getPhone());
            ps.setString(6, dto.getEmail());
            ps.setString(7, dto.getDestination());
            ps.setString(8, dto.getNote());
            ps.setString(9, dto.getImageFile());

            ps.executeUpdate();

            // ★ 自動採番された ID を取得
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return generatedId;
    }

    // ★ 画像表示のための「ID で検索するメソッド」
    public ReservationDTO findById(int id) {

        ReservationDTO dto = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);

            PreparedStatement ps = conn.prepareStatement(FIND_BY_ID_SQL);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                dto = new ReservationDTO(
                    rs.getString("job"),
                    rs.getString("date"),
                    rs.getString("time"),
                    rs.getString("options_text"),
                    rs.getString("phone"),
                    rs.getString("email"),
                    rs.getString("destination"),
                    rs.getString("note"),
                    rs.getString("image_file")
                );
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }
}
