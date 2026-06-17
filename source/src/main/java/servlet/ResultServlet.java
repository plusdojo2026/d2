package servlet;

import java.io.IOException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FinishDao;
import dao.RequestDao;
import dto.Finish;
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

	private static final ScheduledExecutorService scheduler =
        Executors.newScheduledThreadPool(1);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
            try{
                //URLから依頼ID取得
				String id_reservation = request.getParameter("id_reservation");
				HttpSession session = request.getSession();
				String reservationId = (String) session.getAttribute("reservationId");
				//テスト環境ではエラーが出るためコメントアウト
				//int id = Integer.parseInt(id_reservation);
				
				System.out.println("result" + reservationId);

				//データ取得
				RequestDao dao = new RequestDao();
				//Request data = dao.findById(id_reservation);
				Request data = dao.selectSuccess(reservationId);

				//失敗(データが見つからない)
				if(data == null){
					request.setAttribute("errormsg","ご入力いただいたデータが見つかりません。");
					RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/Miss.jsp");
					dispatcher.forward(request, response);
					return;
				}
				
				//成功
				
				request.setAttribute("result", data);

				final Request dataFinal = data;

				scheduler.schedule(new Runnable(){
					@Override
					public void run(){
						Finish fDto = new Finish();
						//必要なデータを入れる
						fDto.setId_chara(dataFinal.getId_chara());
						fDto.setDate_finish(dataFinal.getDate());
						fDto.setTime_finish(dataFinal.getTime());
						fDto.setCategory(dataFinal.getCategory());

						FinishDao fDao = new FinishDao();
						fDao.insert(fDto);
					}

				}, 30, TimeUnit.SECONDS);			
				
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