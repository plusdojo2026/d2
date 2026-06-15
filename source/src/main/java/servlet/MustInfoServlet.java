package servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.RequestDao;
import dto.Request;

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
        String option1 = (String) request.getSession().getAttribute("option1");
        String option2 = (String) request.getSession().getAttribute("option2");
        String option3 = (String) request.getSession().getAttribute("option3");
        String option4 = (String) request.getSession().getAttribute("option4");

        /* options を文字列に変換
        String optionsText = (options != null) ? String.join(",", options) : "";
*/
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
        Request dto = new Request(
                job,
                date,
                time,
                option1,
                option2,
                option3,
                option4,
                phone,
                email,
                destination,
                note,
                fileName
        );
        
        HttpSession session = request.getSession();
		Integer id = (Integer)session.getAttribute("id");
		if (id == null) {
	        response.sendRedirect("/d2/LoginServlet");
	        return;
	    }
		String idstr = String.valueOf(id);
		//String id = "1";
		System.out.println("ID:" + idstr);

        // ★ DAO で reservations に INSERT
        RequestDao dao = new RequestDao();
        String generatedId = dao.insert(dto, idstr);

        /*if (reservationId == -1) {
            throw new ServletException("予約データの登録に失敗しました");
        }*/

        // 完了画面へ ID を渡す
        session.setAttribute("reservationId", generatedId);
        
        // ★ 完了画面へ
        response.sendRedirect("/d2/ResultCostServlet");
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
