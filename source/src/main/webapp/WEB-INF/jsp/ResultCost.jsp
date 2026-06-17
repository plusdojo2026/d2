<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>料金精算画面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ResultCost.css">
</head>
<body>
    <!-- ===== 中身：花柄の上に浮くカード。タイトルもこの中に入れる ===== -->
    <main>
        <h1>料金精算画面</h1>
        <form id="paymentForm" action="ResultCostServlet" method="POST">
            <p>選択した業種:${dto.category} ${dto.costst}円</p>
            <p>選択したオプション:</p>
            <c:if test="${not empty dto.option1}">
                <p>${dto.option1}:${dto.cost1}円</p>
            </c:if>
            <c:if test="${not empty dto.option2}">
                <p>${dto.option2}:${dto.cost2}円</p>
            </c:if>
            <c:if test="${not empty dto.option3}">
                <p>${dto.option3}:${dto.cost3}円</p>
            </c:if>
            <c:if test="${not empty dto.option4}">
                <p>${dto.option4}:${dto.cost4}円</p>
            </c:if>
            <!-- 合計金額（class="total" で強調） -->
            <p class="total">合計金額:${dto.total_amount}円</p>
            <!-- 支払い方法選択（同じ name="payment" で1つだけ選べる） -->
            <fieldset>
                <legend>支払い方法</legend>
                <label class="option-box">
                    <input type="radio" name="payment" value="credit"> クレジットカード
                </label>
                <label class="option-box">
                    <input type="radio" name="payment" value="paypay"> PayPay
                </label>
            </fieldset>
            <!-- メッセージエリア（普段は空。エラーや案内をJSで表示する） -->
            <p id="message"></p>
            <!-- 操作ボタン -->
            <button type="button" id="cancel">キャンセル</button>
            <input type="submit" value="確定">
        </form>
    </main>
    <script src="${pageContext.request.contextPath}/js/ResultCost.js?v=2"></script>
</body>
</html>