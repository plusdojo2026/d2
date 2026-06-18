<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>予約成功</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Success.css">
</head>
<body>
    <main>
        <p class="headline">ご予約が確定しました。</p>
        <p class="imp">ご予約内容はお知らせ画面からご確認いただけます。</p>

        <p>ご予約確定日:${result.date}</p>
        <p>ご予約時間:${result.time}</p>
        <p>ご予約日:${result.thisdate}</p>

        <p class="subhead">依頼内容</p>
        <p>選択業種:${result.category}</p>
        <p>選択オプション:</p>
        <c:if test="${not empty result.option1}">
            <p>・${result.option1}</p>
        </c:if>
        <c:if test="${not empty result.option2}">
            <p>・${result.option2}</p>
        </c:if>
        <c:if test="${not empty result.option3}">
            <p>・${result.option3}</p>
        </c:if>
        <c:if test="${not empty result.option4}">
            <p>・${result.option4}</p>
        </c:if>

        <p class="total">合計金額:${result.total_amount}円</p>
        <p>お支払方法:
        <c:choose>
        <c:when test="${result.payment_method == 'credit'}">クレジットカード</c:when>
        <c:when test="${result.payment_method == 'paypay'}">PayPay</c:when>
        <c:otherwise>${result.payment_method}</c:otherwise>
    	</c:choose>
     <button class="btn"><a href="${pageContext.request.contextPath}/JobSelectServlet">ホーム画面へ戻る</a></button>
    </main>
    <footer>

    </footer>


</body>
</html>