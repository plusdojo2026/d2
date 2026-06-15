package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RequestDao;
import dto.Request;

/**
 * Servlet implementation class MissServlet
 */
@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
            try{
            	request.setCharacterEncoding("UTF-8");
            	response.setContentType("text/html; charset=UTF-8");
                //URLから依頼ID取得
				//String id_reservation = request.getParameter("id_reservation");
				HttpSession session = request.getSession();
		    	String reservationId = (String) session.getAttribute("reservationId");
				//テスト環境ではエラーが出るためコメントアウト
				//int id = Integer.parseInt(id_reservation);
				

				//データ取得
				RequestDao dao = new RequestDao();
				//Request data = dao.findById(id_reservation);
				Request data = dao.selectSuccess(reservationId);

				//失敗(データが見つからない)
				if(data == null){
					request.setCharacterEncoding("UTF-8");
					request.setAttribute("errormsg","ご入力いただいたデータが見つかりません。");
					RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/Miss.jsp");
					dispatcher.forward(request, response);
					return;
				}
				
				//成功
				
				request.setAttribute("result", data);
				
		 // 予約成功画面にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/Success.jsp");
		dispatcher.forward(request, response);
            }catch (Exception e){
				request.setAttribute("errormsg","予期せぬエラーが発生しました");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/Miss.jsp");
					dispatcher.forward(request, response);
			}
			
}
}