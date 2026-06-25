<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Kaisei+Decol:wght@400;700&display=swap" rel="stylesheet">
<title>登録結果</title>
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
    width: 95%;
    max-width: 900px;   /* ← さらに大きく */ 
    width:83%;
    height: 40%;
    padding: 55px;      /* ← 内側の余白も増やす */ 
    margin-top: 50%;
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
    height: 100px;
    padding: 20px;
    font-size: 60px;
    margin-top: 80px;

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




.btn:hover {
    background-color: #d90000;
}

/* ▼ スマホ調整 */
@media (max-width: 480px) {
    main {
        padding: 35px;  /* ← スマホでも広め */
    }
    .btn {
        font-size: 40px;
        padding: 16px;
    }
.text, .texta {
    width: 100%;
    padding: 30px;        /* ← 内側の余白をさらに増やす */
    margin: 18px 0;
    font-size: 70px;
    height: 100px;        /* ← 高さを大きく */
    line-height: 150px;   /* ← テキスト位置を中央に */
    border-radius: 10px;
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
<main>
	<h1>
	<span class="text">
		<c:out value="${result.title}" />
		</span>
	</h1>
	<hr>
	<p>
	<span class="text">
		<c:out value="${result.message}"/>
	</span>
	</p>
	<c:if test="${fn:contains(result.backTo, '/d2/LoginServlet')}">
		<button onclick="location.href='${result.backTo}'" class="btn">ログインページ</button>
	</c:if>
	<c:if test="${fn:contains(result.backTo, '/d2/NewRegistServlet')}">
		<button onclick="location.href='${result.backTo}'" class="btn"> 新規登録へ戻る</button>
	</c:if>
	</main>
</body>
</html>