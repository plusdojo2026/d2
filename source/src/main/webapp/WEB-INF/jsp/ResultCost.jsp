<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>料金精算画面</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
    <!-- ===== 看板：この画面のタイトル ===== -->
    <header>
        <h1>料金精算画面</h1>
    </header>

    <!-- ===== 中身：ユーザーが確認・操作する情報の本体 ===== -->
    <main>
        <form id="paymentForm" action="ResultServlet" method="post">

            <!-- ${dto.xxx} で、Servletから渡された DTO の中身を画面に差し込む -->
            <p>選択したオプション:${dto.option}</p>
            <p>合計金額:${dto.totalAmount}円</p>

            <!-- 支払い方法選択（同じ name="payment" で1つだけ選べる） -->
            <fieldset>
                <legend>支払い方法</legend>
                <label>
                    <input type="radio" name="payment" value="credit"> クレジットカード
                </label>
                <label>
                    <input type="radio" name="payment" value="paypay"> PayPay
                </label>
            </fieldset>

            <!-- メッセージエリア（普段は空。エラーや案内をJSで表示する） -->
            <p id="message"></p>

        </form>
    </main>

    <!-- ===== アクション：見終わったあとに押すボタン ===== -->
    <footer>
        <button type="button" id="cancel">キャンセル</button>
        <button type="button" id="decision">確定</button>
    </footer>

    <script src="js/result_cost.js"></script>
</body>
</html>
