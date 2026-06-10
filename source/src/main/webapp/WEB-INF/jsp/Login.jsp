<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
</head>
<body>
<main>
	<p id="msg"></p>
		<form method="POST" action="/d2/LoginServlet" id="form">
			<input type="text" name="user_id" placeholder="ID"><br>
			<input type="password" name="password" placeholder="PW"><br>
			<input type="submit" value="ログイン"><br>
		</form>
		<form method="GET" action="/d2/NewRegistServlet">
			<input type="submit" value="新規登録">
		</form>
 </main>
 <script src="js/Login.js"></script>
</body>
</html>