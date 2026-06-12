package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.IdPwDao;
import dto.IdPw;
import dto.LoginResult;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ログインページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/Login.jsp");
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
		//Integer id = Integer.parseInt(request.getParameter("id"));
		String user_id = request.getParameter("user_id");
		String pw = request.getParameter("password");

		// ログイン処理を行う
		IdPwDao iDao = new IdPwDao();
		//ID/PWの格納インスタンス作成
		IdPw login = new IdPw(user_id, pw);
		
		// 修正: getLoginUser() を使用　isLoginOk()は廃止
	    // loginUserはIdPwの構成でユーザ情報を塊で取得
		IdPw loginUser = iDao.getLoginUser(login);
		
		if (loginUser != null) { // ログイン成功
			// セッションスコープにIDを格納する
			HttpSession session = request.getSession();
			//ユーザ情報の塊からid部分を取り出す。
			session.setAttribute("id", loginUser.getId());
			 //成功の場合は以下に転送して値はリクエストスコープで渡しJSPでは"id"で受け取る。
			response.sendRedirect("/d2/NewsServlet");
		} else { // ログイン失敗
			// リクエストスコープに、タイトル、メッセージ、戻り先を格納する
			request.setAttribute("result", new LoginResult("ログイン失敗！", "IDまたはPWに間違いがあります。", "/d2/LoginServlet"));

			// 結果ページにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/RegistResult.jsp");
			dispatcher.forward(request, response);
		}
	}
}
