<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>サインアップ</title>

<style>
/* ▼ 背景（花柄） */
body {
    margin: 0;
    font-family: "HGP行書体", "HGS行書体", serif;
    background-image: url("${pageContext.request.contextPath}/img/haikei.png");
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;

    display: flex;
    flex-direction: column;
    align-items: center;
    min-height: 100vh;
}

/* ▼ ロゴ（画面幅いっぱい） */
header .logo {
    width: 100%;
    height: auto;
    display: block;
}

/* ▼ 白枠コンテナ */
main {
    background: rgba(255, 255, 255, 0.9);
    width: 68%;
    padding: 55px;
    margin-top: 100px;
    border-radius: 16px;
    box-shadow: 0 0 20px rgba(0,0,0,0.2);
    text-align: center;
}

/* ▼ 入力欄 */
.text {
    width: 100%;
    padding: 18px;
    margin: 18px 0;
    font-size: 40px;
    height: 80px;
    border-radius: 10px;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* ▼ ボタン */
.btn {
    width: 80%;
    height: 100px;
    padding: 20px;
    font-size: 60px;
    margin-top: 30px;

    background-color: #191970;
    color: white;

    cursor: pointer;
    transition: 0.2s;

    clip-path: polygon(
        10% 0%,
        90% 0%,
        100% 25%,
        100% 75%,
        90% 100%,
        10% 100%,
        0% 75%,
        0% 25%
    );
}

.btn:hover {
    background-color: #d90000;
}

#msg {
	font-size: 70px;
}

/* ▼ スマホ調整 */
@media (max-width: 480px) {
    main {
        padding: 35px;
    }

    .text {
        padding: 30px;
        font-size: 70px;
        height: 100px;
        line-height: 150px;
    }

    .text::placeholder {
        font-size: 70px;
    }

    .btn {
        font-size: 40px;
        padding: 16px;
    }

    body {
        background-attachment: fixed;
    }
}
</style>

</head>

<body>

<header>
    <img src="${pageContext.request.contextPath}/img/logo.png" alt="しの結び" class="logo">
</header>

<main>
    <p id="msg"></p>

    <form method="POST" action="/d2/NewRegistServlet" id="form">
        <input type="text" name="user_id" class="text" placeholder="ID">
        <input type="password" name="password" id="password" class="text" placeholder="PW">
        <input type="password" name="confirmpw" id="confirmpw" class="text" placeholder="PW確認用">

        <input type="submit" value="新規登録" class="btn">
    </form>

    <form method="GET" action="/d2/LoginServlet">
        <input type="submit" value="ログインページへ戻る" class="btn">
    </form>
</main>

<script src="js/NewRegist.js"></script>

</body>
</html>
