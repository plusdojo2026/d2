<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>予約成功</title>
</head>
<body>
<!--ヘッダー-->
    <header>
   
    </header>
    <!--ヘッダーここまで-->
    <!--メイン-->
      <main>
     <p>ご予約が確定しました。</p>
     <p class="imp">ご予約内容はお知らせ画面からご確認いただけます。</p>

     <p>ご予約確定日:${result.date}</p>
     <p>ご予約時間:${result.time}</p>
     <p>ご予約日:${result.thisdate}</p>
     <br>
     <p>依頼内容</p>
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
     <p>合計金額:${result.total_amount}円</p>
     <p>お支払方法:${result.payment_method}</p>
     <button class="btn">ホーム画面へ戻る</button>
    </main>
    <footer>

    </footer>


</body>
</html>