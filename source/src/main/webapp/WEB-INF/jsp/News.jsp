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

		<div class="news_list">
		
		<c:forEach var="item" items="${notifications}">
			<!-- 予約完了 -->
            <c:if test="${item.getClass().simpleName == 'Request'}">
                <details class="news_request">
                    <summary class="news_text">
                        <span class="news_meta">
                            <span class="This_day">${item.thisdate}</span>
                            <span class="news_title">${item.category} 予約完了</span>
                       </span>
                    </summary>
                    <div class="accordion">
	                    <div class="details">
	                    <!-- <c:if test="${not empty item.image}">
		                            <div class="image">
									   <img src="${pageContext.request.contextPath}/NewsServlet?id=${item.id_reservation}" alt="画像">
									</div>
		                    </c:if> -->
		                   
							<c:if test="${not empty item.image}">
							    <div class="image">
							        <img src="${pageContext.request.contextPath}/upload/${item.image}?t=<%= System.currentTimeMillis() %>" alt="画像">
							    </div>
							</c:if>
													
	                        <div>
	                        	<p class="day">依頼実行日時:<br>${item.date} <br> ${item.time}</p><br>
	                        	<p class="address">住所:<br>${item.address} </p><br>
	                        </div>
	                   </div> 
                        <div class="price">
                            <c:if test="${not empty item.option1}"><p>・${item.option1}&nbsp;${item.cost1}</p></c:if>
                            <c:if test="${not empty item.option2}"><p>・${item.option2}&nbsp;${item.cost2}</p></c:if>
                            <c:if test="${not empty item.option3}"><p>・${item.option3}&nbsp;${item.cost3}</p></c:if>
                            <c:if test="${not empty item.option4}"><p>・${item.option4}&nbsp;${item.cost4}</p></c:if>
                            <p class="total_price">合計金額 : ${item.total_amount}円</p>  
                        </div>
                    
                        
                        
                    </div>
                    <p class="news_body">以上の内容でご予約が確定いたしました。</p>
                </details>
            </c:if>
            
            <!-- 依頼完了 -->
            <c:if test="${item.getClass().simpleName == 'Finish'}">
                <details class="news_finish">
                    <summary class="news_text">
                        <span class="news_meta">
                            <span class="This_day">${item.date_finish}</span>
                            <span class="news_title">${item.category}依頼完了いたしました。</span>
                          	
                       </span>
                    </summary>
                    <div class="accordion">
                    	<p>${item.category}のご依頼が完了いたしましたのでご連絡させていただきます。</p>
                        <p class="news_body"></p> </div>
                </details>
            </c:if>

			<!-- お知らせ -->
            <c:if test="${item.getClass().simpleName == 'Info'}">
                <details class="news_news">
                    <summary class="news_text">
                        <span class="news_meta">
                            <span class="This_day">${item.date_info}</span>
                            <span class="news_title">${item.title_info}</span>
						</span>
                    </summary>
                    <div class="accordion">
                        <p class="news_body">${item.message_info}</p> </div>
                </details>
            </c:if>
			
			<!-- メンテナンス -->
            <c:if test="${item.getClass().simpleName == 'Maintenance'}">
                <details class="news_maintenance">
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
		
		</div>
        
    </main>
    <script src="${pageContext.request.contextPath}/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/js/News.js"></script>
</body>
</html>