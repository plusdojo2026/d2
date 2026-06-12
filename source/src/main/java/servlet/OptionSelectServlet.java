package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OptionSelectServlet")
public class OptionSelectServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // OptionSelect.jsp を表示
        req.getRequestDispatcher("/WEB-INF/jsp/OptionSelect.jsp")
           .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        // ★ JSP から job を受け取る（hidden）
        String job = req.getParameter("job");

        // ★ JSP からの値
        String date = req.getParameter("date");
        String time = req.getParameter("selectedTime");
        String[] options = req.getParameterValues("option");

        // ★ セッションに保存（MustInfoServlet で使用）
        req.getSession().setAttribute("job", job);
        req.getSession().setAttribute("date", date);
        req.getSession().setAttribute("time", time);
        req.getSession().setAttribute("options", options);

        // ★ MustInfo 画面へ遷移
        req.getRequestDispatcher("/WEB-INF/jsp/MustInfo.jsp")
           .forward(req, resp);
    }
}
