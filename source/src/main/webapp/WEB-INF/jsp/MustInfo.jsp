<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>必要情報記入</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 20px;
        }

        h1 {
            margin-bottom: 20px;
        }

        .mustInfo-container {
            max-width: 600px;
        }

        .mustInfo-form-group {
            margin-bottom: 15px;
        }

        .mustInfo-form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .mustInfo-form-group input[type="text"],
        .mustInfo-form-group input[type="email"],
        .mustInfo-form-group textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        .mustInfo-form-group textarea {
            height: 150px;
            resize: vertical;
        }

        .mustInfo-button-area {
            margin-top: 25px;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .mustInfo-btn-cancel {
            background-color: #e0f4ff;
            border: 1px solid #a0c8e0;
            padding: 8px 20px;
            cursor: pointer;
        }

        .mustInfo-btn-confirm {
            background-color: #b00020;
            color: #ffffff;
            border: 1px solid #800010;
            padding: 8px 20px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="mustInfo-container">
    <h1>必要情報記入</h1>

    <!-- 後で MustInfoServlet に接続予定 -->
<form id="MustInfoForm" name="MustInfoForm"
      method="post"
      action="MustInfoServlet"
      enctype="multipart/form-data">

        <!-- 電話番号（DB: phone） -->
        <div class="mustInfo-form-group">
            <label for="mustInfoPhone">電話番号</label>
            <input type="text" id="mustInfoPhone" name="phone"
                   placeholder="例：090-1234-5678">
        </div>

        <!-- メールアドレス（DB: email） -->
        <div class="mustInfo-form-group">
            <label for="mustInfoEmail">メールアドレス</label>
            <input type="email" id="mustInfoEmail" name="email"
                   placeholder="例：example@example.com">
        </div>

        <!-- 出張先（住所）（DB: destination） -->
        <div class="mustInfo-form-group">
            <label for="mustInfoAddress">出張先（住所）</label>
            <input type="text" id="mustInfoAddress" name="destination"
                   placeholder="例：京都府京都市〇〇区〇〇町1-2-3">
        </div>

        <!-- 備考（DB: note） -->
        <div class="mustInfo-form-group">
            <label for="mustInfoRemark">備考</label>
            <textarea id="mustInfoRemark" name="note"
                      placeholder="備考を入力してください"></textarea>
        </div>

        <!-- 画像添付（DB: image_file） -->
        <div class="mustInfo-form-group">
            <label for="mustInfoImage">画像添付</label>
            <input type="file" id="mustInfoImage" name="image_file" accept="image/*">
        </div>

        <!-- ボタンエリア -->
        <div class="mustInfo-button-area">
            <button type="button" class="mustInfo-btn-cancel">
                キャンセル
            </button>

<button type="submit" class="mustInfo-btn-confirm">
    確定
</button>
        </div>
    </form>
</div>
</body>
</html>
