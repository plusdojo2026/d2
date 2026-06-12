<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>業種選択</title>

    <style>
        body {
            font-family: sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background: #fff;
            width: 420px;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 24px;
        }

        .option-box {
            border: 2px solid #ccc;
            padding: 15px;
            margin: 12px 0;
            border-radius: 10px;
            font-size: 20px;
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
            background-color: #ff4d4d;
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 18px;
            border-radius: 8px;
            cursor: pointer;
            float: right;
            margin-top: 20px;
            transition: 0.2s;
        }

        .submit-btn:hover {
            background-color: #d90000;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>業種をご選択ください</h2>

        <!-- ★ OptionSelectServlet に送る -->
<form action="${pageContext.request.contextPath}/JobSelectServlet" method="post">

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

            <button type="submit" class="submit-btn">確定</button>
        </form>
    </div>
</body>
</html>
