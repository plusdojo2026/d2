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

import dao.InfoDao;
import dao.MaintenanceDao;
import dao.RequestDao;


@WebServlet("/news")
public class NewsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 3つのDAOをインスタンス化
        RequestDao requestDao = new RequestDao();
        InfoDao infoDao = new InfoDao();
        MaintenanceDao maintenanceDao = new MaintenanceDao();

        // 3つのModelをすべて混在させて管理するための汎用リスト
        List<Object> allNewsList = new ArrayList<>();

        // 各DAOから、メソッド書き直す
        allNewsList.addAll(requestDao.getNotifications());     // Request型が入る
        allNewsList.addAll(infoDao.getNotifications());        // Info型が入る
        allNewsList.addAll(maintenanceDao.getNotifications()); // Maintenance型が入る

        // 集まったデータを日付の新しい順にソート
        Collections.sort(allNewsList, new Comparator<Object>() {
            @Override
            public int compare(Object o1, Object o2) {
                String date1 = getDateFromModel(o1);
                String date2 = getDateFromModel(o2);
                
                if (date1 == null || date2 == null) {
                    return 0;
                }
                // 文字列の降順ソート（新しい日付が上に来る）
                return date2.compareTo(date1);
            }

            // それぞれのModelから日付文字列（varchar型データ）を抜き出すための補助メソッド
            private String getDateFromModel(Object obj) {
                if (obj instanceof javaModelRequest) { // 18番のModel
                 
                    return ((javaModelRequest) obj).getDate(); 
                } else if (obj instanceof javaModelInfo) { // 22番のModel
                    return ((javaModelInfo) obj).getDate_info();
                } else if (obj instanceof javaModelMaintenance) { // 23番のModel
                    return ((javaModelMaintenance) obj).getDate_maintenance();
                }
                return "";
            }
        });
        
        request.setAttribute("notifications", allNewsList);

       
        request.getRequestDispatcher("/WEB-INF/jsp/News.jsp").forward(request, response);
    }
}