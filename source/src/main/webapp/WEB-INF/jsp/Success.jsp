<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>予約成功</title>
</head>
<body>
<!--ヘッダー-->
    <header>
   
    </header>
    <!--ヘッダーここまで-->
    <!--メイン-->
     <main>
     <p>ご予約が確定しました。</p>
     <p class="imp">ご予約内容はお知らせ画面からご確認いただけます。</p>

     <p>ご予約確定日:<span id="date"></span></p>
     <p>ご予約時間:<span id="time"></span></p>
     <p>ご予約日:<span id="thisdate"></span></p>
     <br>
     <p>依頼内容</p>
     <p>選択業種:<span id="category"></span></p>
     <p>選択オプション:<span id="optionName"></span></p>
     <p>合計金額:<span id="total_amount"></span>円</p>
     <p>お支払方法:<span id="payment_method"></span></p>
     <button type="submit" class="btn">ホーム画面へ戻る</button>
    </main>
    <footer>

    </footer>

</body>
</html>