<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Kaisei+Decol:wght@400;700&display=swap" rel="stylesheet">
<title>ログイン</title>

<style>
/* ▼ 背景（花柄） */
@font-face {
  font-family: "KouzanBrush";
  src: url("/d2/fonts/Satuki.woff2") format("woff2"),
  font-display: swap;
}
body {
	font-family: "KouzanBrush", serif;
    margin: 0;
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

/* ▼ 白枠コンテナ（ID / PW / ボタンを囲む）*/ 
main {
    background: rgba(255, 255, 255, 0.9);
    width:68%;
    padding: 55px;      /* ← 内側の余白も増やす */ 
    margin-top: 100px;
    border-radius: 16px;
    box-shadow: 0 0 20px rgba(0,0,0,0.2);
    text-align: center;
}

/* ▼ テキスト入力欄（ID / PW） */
.text, .texta {
    width: 100%;
    padding: 18px;      /* ← 高さアップ */
    margin: 18px 0;
    font-size: 60px;    /* ← 文字も大きく */
    height:80px;
    border-radius: 10px;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* ▼ パスワード欄のアイコン横並び */
.pw-line {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.psimg {
    width: 40px;        /* ← アイコンも大きく */
    height: 40px;
    cursor: pointer;
}

/* ▼ ボタン（ログイン / 新規登録） */
.btn {
    width: 60%;
    height: 40%;
    padding: 3%;
    font-size: 60px;
    margin-top: 30px;

    background-color: #191970; /* 紺色 */
    color: white;

    cursor: pointer;
    transition: 0.2s;

    /* ★ 横長の八角形（角を削る） */
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

#msg {
	font-size: 70px;
}


.btn:hover {
    background-color: #d90000;
}

/* ▼ スマホ調整 */
@media (max-width: 480px) {
    main {
        padding: 6%;  /* ← スマホでも広め */
    }
    .btn {
        font-size: 300%;
    }
.text, .texta {
    width: 100%;
    padding: 30px;        /* ← 内側の余白をさらに増やす */
    margin: 18px 0;
    font-size: 70px;
    height: 100px;        /* ← 高さを大きく */
    line-height: 150px;   /* ← テキスト位置を中央に */
    border-radius: 4%;
    border: 1px solid #ccc;
    box-sizing: border-box;
}


html, body {
    height: 100%;
    min-height: 100%;
}

body {
    background-image: url("${pageContext.request.contextPath}/img/haikei.png");
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    background-attachment: fixed; /* ← スクロールしても背景が途切れない */
}
/* ▼ プレイスホルダーの文字サイズを大きくする */
.text::placeholder,
.texta::placeholder {
    font-size: 70px;     /* ← 入力文字と同じ大きさに */
    line-height: 1.2;
}



</style>

</head>

<body>

<header>
    <img src="${pageContext.request.contextPath}/img/logo.png" alt="しの結び" class="logo">
</header>

<main>
    <p id="msg"></p>

    <form method="POST" action="/d2/LoginServlet" id="form">
        <input type="text" name="user_id" class="text" placeholder="ID">

        <div class="pw-line">
            <input type="password" name="password" id="password" class="texta" placeholder="PW">
            <img src="${pageContext.request.contextPath}/img/psimg.png" id="psimg" class="psimg" onclick="togglePassword()">
        </div>

        <input type="submit" value="ログイン" class="btn">
    </form>

    <form method="GET" action="/d2/NewRegistServlet">
        <input type="submit" value="新規登録" class="btn">
    </form>
</main>
<script src="js/Login.js"></script>
<script>
function togglePassword() {
    const pw = document.getElementById("password");
    pw.type = pw.type === "password" ? "text" : "password";
}
</script>

</body>
</html>
