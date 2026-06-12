package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JobSelectServlet")
public class JobSelectServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // JobSelect.jsp を表示
        request.getRequestDispatcher("/WEB-INF/jsp/JobSelect.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String job = request.getParameter("job");

        // ★ セッションに保存（後続ページで使用）
        request.getSession().setAttribute("job", job);

        // ★ 業種ごとに遷移先を変更
        String nextPage;

        switch (job) {

            case "出張洗車":
                // ★ 現在の OptionSelect.jsp は「洗車専用」
                nextPage = "/WEB-INF/jsp/OptionSelect.jsp";
                break;

            case "出張廃品回収":
                nextPage = "/WEB-INF/jsp/RecycleOptionSelect.jsp";
                break;

            case "出張クリーニング":
                nextPage = "/WEB-INF/jsp/CleaningOptionSelect.jsp";
                break;

            case "出張修理":
                nextPage = "/WEB-INF/jsp/RepairOptionSelect.jsp";
                break;

            default:
                // 万が一 job が null の場合は洗車ページへ
                nextPage = "/WEB-INF/jsp/OptionSelect.jsp";
                break;
        }

        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}
