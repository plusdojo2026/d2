package servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.ReservationDAO;
import dto.ReservationDTO;

@WebServlet("/MustInfoServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 10
)
public class MustInfoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/jsp/MustInfo.jsp").forward(request, response);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // ★ JobSelect → OptionSelect のデータをセッションから取得
        String job = (String) request.getSession().getAttribute("job");
        String date = (String) request.getSession().getAttribute("date");
        String time = (String) request.getSession().getAttribute("time");
        String[] options = (String[]) request.getSession().getAttribute("options");

        // options を文字列に変換
        String optionsText = (options != null) ? String.join(",", options) : "";

        // ★ MustInfo の入力値
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String destination = request.getParameter("destination");
        String note = request.getParameter("note");

        // ★ 画像ファイル
        Part imagePart = request.getPart("image_file");
        String fileName = getFileName(imagePart);

        // 保存先（/upload）
        String uploadPath = getServletContext().getRealPath("/upload");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        if (fileName != null && !fileName.isEmpty()) {
            imagePart.write(uploadPath + File.separator + fileName);
        }

        // ★ ReservationDTO にまとめる
        ReservationDTO dto = new ReservationDTO(
                job,
                date,
                time,
                optionsText,
                phone,
                email,
                destination,
                note,
                fileName
        );

        // ★ DAO で reservations に INSERT
        ReservationDAO dao = new ReservationDAO();
        boolean result = dao.insert(dto);

        if (!result) {
            throw new ServletException("予約データの登録に失敗しました");
        }

        // ★ 完了画面へ
        request.getRequestDispatcher("/WEB-INF/jsp/ReservationComplete.jsp")
               .forward(request, response);
        return;
    }

    // ファイル名取得
    private String getFileName(Part part) {
        String header = part.getHeader("content-disposition");
        for (String cd : header.split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf("=") + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
