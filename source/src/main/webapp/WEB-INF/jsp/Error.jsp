<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>エラー画面</title>
    <style>
    @font-face {
  font-family: "KouzanBrush";
  src: url("/d2/fonts/Satuki.woff2") format("woff2"),
  font-display: swap;
}</style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Error.css">
</head>
<body>
    <main>
        <h1>エラー</h1>
        <p>予期せぬエラーが発生しました。</p>

        <button class=btn><a href="${pageContext.request.contextPath}/JobSelectServlet">ホーム画面へ戻る</a></button>
        
    </main>
</body>
</html>