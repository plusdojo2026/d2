<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>新着情報・お知らせ</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <main>
        <div class="index">
            <div><a href="home.html">戻る</a></div>
            <h1>新着情報・お知らせ</h1>
        </div>

        <c:forEach var="item" items="${notifications}">
            
            <details class="news_${item.type}">
                <summary class="news_text">
                    <div class="news_meta">
                        <p class="list_day">${item.formattedDate}</p>
                        <p class="news_title">${item.title}</p>
                    </div>
                </summary>
                
                <div class="accordion">
                    <div class="image">
                        <img src="${pageContext.request.contextPath}/${item.imagePath}" alt="${item.title}">
                    </div>
                    
                    <c:if test="${not empty item.body}">
                        <p class="news_body">${item.body}</p>
                    </c:if>
                    
                    <c:if test="${item.type == 'request'}">
                        <div class="price">
                            <c:forEach var="option" items="${item.options}">
                                <p>${option}</p>
                            </c:forEach>
                            <p class="total_price">合計金額:${item.totalPrice}</p>  
                        </div>
                    </c:if>
                </div>
            </details>
            
        </c:forEach>
    </main>
</body>
</html>