<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- ★ スマホ対応 -->
    <link href="https://fonts.googleapis.com/css2?family=Kaisei+Decol:wght@400;700&display=swap" rel="stylesheet">
    <title>業種選択</title>

<style>
        body {
            font-family: "HGP行書体", "HGS行書体", serif;
            background-color: #f5f5f5;
            margin: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 15px;
        }

.container {
    background: rgba(255, 255, 255, 0.97); /* ← 0.8 は透明度。0 に近いほど透明 */
    width: 90%;
    max-width: 420px;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 0 15px rgba(0,0,0,0.15);
}


        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 22px; /* 少し小さめでスマホ向け */
        }

        .option-box {
            border: 2px solid #ccc;
            padding: 15px;
            margin: 12px 0;
            border-radius: 10px;
            font-size: 18px; /* スマホ向けに少し調整 */
            display: flex;
            align-items: center;
            cursor: pointer;
            transition: 0.2s;
        }

        .option-box:hover {
            background-color: #f0f0f0;
        }

        .option-box input[type="radio"] {
            transform: scale(1.4);
            margin-right: 12px;
        }

        .submit-btn {
            background-color: #FF1A1A;
            color: white;
            border: none;
            padding: 14px 25px;
            font-size: 18px;
            border-radius: 8px;
            cursor: pointer;
            width: 100%; /* ★ スマホで押しやすく */
            margin-top: 20px;
            transition: 0.2s;
        }

        .submit-btn:hover {
            background-color: #d90000;
        }

        /* ▼ スライドダウンポップアップ（白背景） */
        #alertPopup {
            position: fixed;
            top: -250px;
            left: 50%;
            transform: translateX(-50%);
            width: 90%;
            max-width: 400px;
            background-color: #ffffff;
            border: 1px solid #cccccc;
            padding: 20px;
            text-align: center;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            transition: top 0.4s ease;
            z-index: 9999;
        }

        #alertPopup.show {
            top: 30px;
        }

        #alertPopup button {
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #b00020;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
        }
    </style>
    <style>
    /* ▼ 通知ボタン（右上固定） */
    .notify-btn {
        position: fixed;
        top: 15px;
        right: 15px;
        width: 40px;
        height: 40px;
        cursor: pointer;
        z-index: 10000;
    }

    .notify-btn img {
        width: 100%;
        height: 100%;
        object-fit: contain;
    }
.notify-btn img {
    width: 100%;
    height: 100%;
    object-fit: cover; /* ← 画像を丸いっぱいに拡大して切り取る */
    border-radius: 50%; /* ← 丸く切り取る */
    padding: 0; /* ← 余白を完全に削除 */
}



    /* スマホ対応（少し大きめに） */
    @media (max-width: 480px) {
        .notify-btn {
            width: 48px;
            height: 48px;
            top: 10px;
            right: 10px;
        }
    }
</style>
    <style>
body {
    background-image: url("${pageContext.request.contextPath}/img/hanagara.png");
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}

.notify-under-img {
    position: fixed;
    top: 40px;
    right: 3px;
    width: 80px;
    height: 80px;
    object-fit: contain; /* ← 画像をそのまま表示 */
    border-radius: 0;    /* ← 丸くしない */
    z-index: 9999;
}


</style>
    
</head>

<body>
<!-- ▼ 通知ボタン（画像をクリックして newsServlet へ） -->
<a href="${pageContext.request.contextPath}/NewsServlet" class="notify-btn">
    <img src="${pageContext.request.contextPath}/img/べる.png" alt="通知">
</a>

<img src="${pageContext.request.contextPath}/img/巻物.png"
     alt="下の画像"
     class="notify-under-img">


    <div class="container">
        <h2>業種をご選択ください</h2>

        <form action="${pageContext.request.contextPath}/JobSelectServlet"
              method="post"
              onsubmit="return validateJobForm()">

            <label class="option-box">
                <input type="radio" name="job" value="出張洗車"> 出張洗車
            </label>

            <label class="option-box">
                <input type="radio" name="job" value="出張廃品回収"> 出張廃品回収
            </label>

            <label class="option-box">
                <input type="radio" name="job" value="出張クリーニング"> 出張クリーニング
            </label>

            <label class="option-box">
                <input type="radio" name="job" value="出張修理"> 出張修理
            </label>

            <button type="submit" class="submit-btn"><b>希望日時・オプション選択画面へ</b></button>
        </form>
    </div>

    <!-- ▼ ポップアップ -->
    <div id="alertPopup">
        <p id="alertMessage">業種を選択してください。</p>
        <button onclick="closeAlert()"><b>確認</b></button>
    </div>

<script>
function validateJobForm() {
    const selected = document.querySelector('input[name="job"]:checked');

    if (!selected) {
        document.getElementById("alertMessage").innerText = "業種を選択してください。";
        showAlert();
        return false;
    }

    return true;
}

function showAlert() {
    document.getElementById("alertPopup").classList.add("show");
}

function closeAlert() {
    document.getElementById("alertPopup").classList.remove("show");
}
</script>

</body>
</html>
