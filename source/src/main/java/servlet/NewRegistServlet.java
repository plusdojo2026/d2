package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IdPwDao;
import dto.IdPw;
import dto.LoginResult;

/**
 * Servlet implementation class RegistServlet
 */
@WebServlet("/NewRegistServlet")
public class NewRegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/NewRegist.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("user_id");
		String pw = request.getParameter("password");

		// ログイン処理を行う
		IdPwDao iDao = new IdPwDao();
		
		if (iDao.insert(new IdPw(id, pw))) { // 登録成功
			request.setAttribute("result", new LoginResult("登録成功！", "新規登録しました。", "/d2/LoginServlet"));
		} else { // 登録失敗
			request.setAttribute("result", new LoginResult("登録失敗！", "新規登録できませんでした。", "/d2/NewRegistServlet"));
		}

		// 結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/RegistResult.jsp");
		dispatcher.forward(request, response);
	}
}
