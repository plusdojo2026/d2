package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RequestDao;
import dto.Request;
/**
 * 料金精算画面（ResultCost.jsp）の表示用Servlet
 * 役割：DAOにDBアクセスを依頼し、取得したデータをJSPに渡して画面を表示する。
 */
@WebServlet("/ResultCostServlet")
public class ResultCostServlet extends HttpServlet {


    /**
     * 料金精算画面の初期表示。
     * 前の画面（オプション選択など）から遷移してきたときに呼ばれる。
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ----- 1. 前の画面から、対象の依頼を識別する値を受け取る -----
        //String requestId = request.getParameter("id_reservation");
    	HttpSession session = request.getSession();
    	String reservationId = (String) session.getAttribute("reservationId");

    	
		System.out.println("ID:" + reservationId);

        // ----- 2. DAOにDBアクセスを依頼し、データを受け取る -----
        RequestDao requestDao = new RequestDao();
        //Request dto = requestDao.find(requestId);
        Request dto = requestDao.seletOption(reservationId);

        // JSP側が ${dto.totalAmount} / ${dto.option} で読めるよう、"dto" という名前でセットする。
        // ※すり合わせ：Modelに getTotalAmount() / getOption() があるか（フィールド名の一致）を要確認
        request.setAttribute("dto", dto);
        int totalAmount = dto.getTotal_amount();
        session.setAttribute("totalAmount", totalAmount);
        // ----- 4. 料金精算画面（JSP）へ転送して表示 -----
        request.getRequestDispatcher("/WEB-INF/jsp/ResultCost.jsp")
               .forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	
    	request.setCharacterEncoding("UTF-8");
    	HttpSession session = request.getSession();
    	String reservationId = (String) session.getAttribute("reservationId");
		String payment = request.getParameter("payment");
		int totalAmount = (int) session.getAttribute("totalAmount");
		
		RequestDao rdao = new RequestDao();
		rdao.update(payment, totalAmount, reservationId);
		
		response.sendRedirect("/d2/ResultServlet");
		/*request.getRequestDispatcher("ResultServlet")
        .forward(request, response);*/
    }
    
}