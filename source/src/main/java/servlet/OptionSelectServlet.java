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

        // ★ MustInfo のキャンセルボタンから来た場合もここに入る
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
        String option1 = req.getParameter("option1");
        String option2 = req.getParameter("option2");
        String option3 = req.getParameter("option3");
        String option4 = req.getParameter("option4");

        // ★ セッションに保存（MustInfoServlet で使用）
        req.getSession().setAttribute("job", job);
        req.getSession().setAttribute("date", date);
        req.getSession().setAttribute("time", time);
        req.getSession().setAttribute("option1", option1);
        req.getSession().setAttribute("option2", option2);
        req.getSession().setAttribute("option3", option3);
        req.getSession().setAttribute("option4", option4);

        // ★ MustInfo 画面へ遷移
        req.getRequestDispatcher("/WEB-INF/jsp/MustInfo.jsp")
           .forward(req, resp);
    }
}
