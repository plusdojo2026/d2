<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>サインアップ</title>
</head>
<body>
<main>
	<p id="msg"></p>
	<form method="POST" action="/d2/NewRegistServlet" id="form">
		<input type="text" name="user_id" placeholder="ID"><br>
		<input type="password" name="password" id="password" placeholder="PW"><br>
		<input type="password" name="confirmpw" id="confirmpw" placeholder="PW確認用"><br>
		<button>新規登録</button>
	</form>
	<form method="GET" action="/d2/LoginServlet">
			<button>ログインページへ戻る</button>
		</form>
</main>
<script src="js/NewRegist.js"></script>
</body>
</html>