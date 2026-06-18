<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>通知画面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/News.css">
</head>
<body>
    <main>
        <div class="index">
            <div><a href="${pageContext.request.contextPath}/JobSelectServlet">戻る</a></div>
            <h1>新着情報・お知らせ</h1>
        </div>

        <c:forEach var="item" items="${notifications}">

            <c:if test="${item.getClass().simpleName == 'Request'}">
                <details class="news_request">
                    <summary class="news_text">
                        <span class="news_meta">
                            <span class="lhis_day">${item.thisdate}</span>
                            <span class="news_title">${item.category} 予約完了</span>
                       </span>
                    </summary>
                    <div class="accordion">
                        <c:if test="${not empty item.image}">
                            <div class="image">
							   <img src="${pageContext.request.contextPath}/ImageServlet?id=${item.id_reservation}" alt="画像">
							</div>
                        </c:if>
                        <div>
                        	<p class="day">依頼実行日時:${item.date} &nbsp; ${item.time}</p><br>
                        	<p class="news_body">以上の内容でご予約が確定いたしました。</p>
                        </div>
                        
                        <div class="price">
                            <c:if test="${not empty item.option1}"><p>・${item.option1}</p></c:if>
                            <c:if test="${not empty item.option2}"><p>・${item.option2}</p></c:if>
                            <c:if test="${not empty item.option3}"><p>・${item.option3}</p></c:if>
                            <c:if test="${not empty item.option4}"><p>・${item.option4}</p></c:if>
                            <p class="total_price">合計金額 : ${item.total_amount}円</p>  
                        </div>
                    </div>
                </details>
            </c:if>

            <c:if test="${item.getClass().simpleName == 'Info'}">
                <details class="news_news">
                    <summary class="news_text">
                        <span class="news_meta">
                            <span class="list_day">${item.date_info}</span>
                            <span class="news_title">${item.title_info}</span>
						</span>
                    </summary>
                    <div class="accordion">
                        <p class="news_body">${item.message_info}</p> </div>
                </details>
            </c:if>

            <c:if test="${item.getClass().simpleName == 'Maintenance'}">
                <details class="news_finish">
                    <summary class="news_text">
                        <span class="news_meta">
                            <span class="list_day">${item.date_maintenance}</span>
                            <span class="news_title">${item.title_maintenance}</span> 
                       </span>
                    </summary>
                    <div class="accordion">
                        <p class="news_body">${item.message_maintenance}</p> </div>
                </details>
            </c:if>

        </c:forEach>
    </main>
    <script src="${pageContext.request.contextPath}/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/js/News.js"></script>
</body>
</html>