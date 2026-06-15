<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="css/Login.css">
</head>
<body>
<header>
	<img src="${pageContext.request.contextPath}/img/logo.png" alt="しの結び" class="logo">
</header>
<main>
    <p id="msg"></p>
        <form method="POST" action="/d2/LoginServlet" id="form">
            <input type="text" name="user_id" class="text" placeholder="ID"><br>
            <div class="pw-line">
            <input type="password" name="password" id="password" class="texta" placeholder="PW"><br>
            <img src="img/psimg.png" id="psimg" class="psimg" onclick="togglePassword()"></div>
            <input type="submit" value="ログイン" class="btn"><br>
        </form>
        <form method="GET" action="/d2/NewRegistServlet">
            <input type="submit" value="新規登録" class="btn">
        </form>
 </main>
 <script src="js/Login.js"></script>
</body>
</html>