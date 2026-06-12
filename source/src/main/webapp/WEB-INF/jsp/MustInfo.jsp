<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- ★ スマホ対応 -->
    <title>必要情報記入</title>

    <style>
        body {
            font-family: sans-serif;
            margin: 0;
            padding: 15px;
            background-color: #fafafa;
        }

        h1 {
            margin-bottom: 20px;
            font-size: 22px;
            text-align: center;
        }

        .mustInfo-container {
            width: 90%;              /* ★ スマホ対応 */
            max-width: 600px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .mustInfo-form-group {
            margin-bottom: 18px;
        }

        .mustInfo-form-group label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            font-size: 16px;
        }

        .mustInfo-form-group input[type="text"],
        .mustInfo-form-group input[type="email"],
        .mustInfo-form-group textarea {
            width: 100%;
            padding: 12px; /* ★ スマホで押しやすく */
            font-size: 16px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .mustInfo-form-group textarea {
            height: 140px;
            resize: vertical;
        }

        /* ▼ プレビュー画像 */
        #preview {
            max-width: 100%; /* ★ スマホ対応 */
            margin-top: 10px;
            display: none;
            border: 1px solid #ccc;
            padding: 5px;
            border-radius: 6px;
        }

        /* ▼ ボタンエリア */
        .mustInfo-button-area {
            margin-top: 25px;
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        .mustInfo-btn-cancel,
        .mustInfo-btn-confirm {
            flex: 1;
            padding: 14px;
            font-size: 18px;
            border-radius: 8px;
            cursor: pointer;
            border: none;
        }

        .mustInfo-btn-cancel {
            background-color: #e0f4ff;
            border: 1px solid #a0c8e0;
        }

        .mustInfo-btn-confirm {
            background-color: #b00020;
            color: #ffffff;
            border: 1px solid #800010;
        }

        /* ▼ スライドダウンポップアップ */
        #alertPopup {
            position: fixed;
            top: -250px;
            left: 50%;
            transform: translateX(-50%);
            width: 90%;
            max-width: 400px;
            background-color: #ffffff;
            border: 1px solid #ff8888;
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
</head>

<body>
<div class="mustInfo-container">
    <h1>必要情報記入</h1>

<form id="MustInfoForm" name="MustInfoForm"
      method="post"
      action="MustInfoServlet"
      enctype="multipart/form-data">

        <!-- 電話番号（必須） -->
        <div class="mustInfo-form-group">
            <label for="mustInfoPhone">電話番号（必須）</label>
            <input type="text" id="mustInfoPhone" name="phone"
                   placeholder="例：090-1234-5678">
        </div>

        <!-- メールアドレス（必須） -->
        <div class="mustInfo-form-group">
            <label for="mustInfoEmail">メールアドレス（必須）</label>
            <input type="email" id="mustInfoEmail" name="email"
                   placeholder="例：example@example.com">
        </div>

        <!-- 出張先（住所）（必須） -->
        <div class="mustInfo-form-group">
            <label for="mustInfoAddress">出張先（住所）（必須）</label>
            <input type="text" id="mustInfoAddress" name="destination"
                   placeholder="例：京都府京都市〇〇区〇〇町1-2-3">
        </div>

        <!-- 備考 -->
        <div class="mustInfo-form-group">
            <label for="mustInfoRemark">備考</label>
            <textarea id="mustInfoRemark" name="note"
                      placeholder="備考を入力してください"></textarea>
        </div>

        <!-- 画像添付 -->
        <div class="mustInfo-form-group">
            <label for="mustInfoImage">画像添付</label>
            <input type="file" id="mustInfoImage" name="image_file"
                   accept="image/*" onchange="previewImage(event)">
            <img id="preview" alt="プレビュー画像">
        </div>

        <!-- ボタンエリア -->
        <div class="mustInfo-button-area">
            <button type="button" class="mustInfo-btn-cancel"
                    onclick="location.href='OptionSelectServlet'">
                戻る
            </button>

            <button type="submit" class="mustInfo-btn-confirm" onclick="return validateForm()">
                予約確定
            </button>
        </div>
    </form>
</div>

<!-- ▼ 必須項目未入力ポップアップ -->
<div id="alertPopup">
    <p id="alertMessage">必須項目が入力されていません。</p>
    <button onclick="closeAlert()">確認</button>
</div>

<!-- ▼ プレビュー機能 -->
<script>
function previewImage(event) {
    const file = event.target.files[0];
    const preview = document.getElementById('preview');

    if (!file) {
        preview.style.display = "none";
        preview.src = "";
        return;
    }

    const reader = new FileReader();
    reader.onload = function(e) {
        preview.src = e.target.result;
        preview.style.display = "block";
    };
    reader.readAsDataURL(file);
}
</script>

<!-- ▼ 必須チェック + ポップアップ表示 -->
<script>
function validateForm() {
    const phone = document.getElementById("mustInfoPhone").value.trim();
    const email = document.getElementById("mustInfoEmail").value.trim();
    const destination = document.getElementById("mustInfoAddress").value.trim();

    let message = "";

    if (phone === "") message += "・電話番号\n";
    if (email === "") message += "・メールアドレス\n";
    if (destination === "") message += "・出張先（住所）\n";

    if (message !== "") {
        document.getElementById("alertMessage").innerText =
            "以下の必須項目が入力されていません。\n\n" + message;

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
