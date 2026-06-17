package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FinishDao;
import dao.InfoDao;
import dao.MaintenanceDao;
import dao.RequestDao;
import dto.Finish;
import dto.Info;
import dto.Maintenance;
import dto.Request;

@WebServlet("/NewsServlet")
public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		// セッションからログイン中のユーザーIDを取得
		HttpSession session = request.getSession();
		Integer id = (Integer)session.getAttribute("id");
		if (id == null) {
	        response.sendRedirect("/d2/LoginServlet");
	        return;
	    }
		String idstr = String.valueOf(id);
		//String id = "1";
		System.out.println("ID:" + idstr);
		//String userId = (loginUser != null) ? loginUser.getId() : "";

		RequestDao requestDao = new RequestDao();
		FinishDao finishDao = new FinishDao();
		InfoDao infoDao = new InfoDao();
		MaintenanceDao maintenanceDao = new MaintenanceDao();

		List<Object> allNewsList = new ArrayList<>();

		// 取得した userId を引数に渡して絞り込む
		allNewsList.addAll(requestDao.getNotifications(idstr));
		allNewsList.addAll(finishDao.getNotifications(idstr));
		allNewsList.addAll(infoDao.getNotifications());
		allNewsList.addAll(maintenanceDao.getNotifications());

		Collections.sort(allNewsList, new Comparator<Object>() {
			@Override
			public int compare(Object o1, Object o2) {
				String date1 = getDateFromModel(o1);
				String date2 = getDateFromModel(o2);
				
				if (date1 == null || date2 == null) {
					return 0;
				}
				return date2.compareTo(date1);
			}

			private String getDateFromModel(Object obj) {
				if (obj instanceof Request) { 
					return ((Request) obj).getThisdate(); 
				} else if (obj instanceof Finish) { 
					return ((Finish) obj).getDate_finish();
				} else if (obj instanceof Info) { 
					return ((Info) obj).getDate_info();
				} else if (obj instanceof Maintenance) { 
					return ((Maintenance) obj).getDate_maintenance();
				}
				return "";
			}
		});
		
		request.setAttribute("notifications", allNewsList);
		request.getRequestDispatcher("/WEB-INF/jsp/News.jsp").forward(request, response);
	}
}