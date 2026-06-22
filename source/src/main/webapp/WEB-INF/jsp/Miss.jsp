<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css2?family=Kaisei+Decol:wght@400;700&display=swap" rel="stylesheet">
    <title>予約失敗</title>
    <style>
@font-face {
  font-family: "KouzanBrush";
  src: url("/d2/fonts/Satuki.woff2") format("woff2"),
  font-display: swap;
}</style>
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