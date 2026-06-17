<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>予約失敗</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Miss.css">
</head>
<body>
    <main>
        <p class="headline">ご予約が失敗しました。</p>
        <p class="errormsg">${errormsg}</p>
     <p></p>
     <p>お手数をおかけしますが、下のボタンを押し、再度予約をお願いします</p>
     <button class=btn><a href="${pageContext.request.contextPath}/JobSelectServlet">ホーム画面へ戻る</a></button>
    </main>
    <footer>

    </footer>
    
</body>     
</html>