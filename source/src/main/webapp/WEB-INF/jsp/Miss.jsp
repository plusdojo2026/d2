<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>予約失敗</title>
    <style>
    body{
            margin: 0;
    }
    *{
        padding: 20px;
        line-height: 1.6;
        margin-bottom: 24px;
        text-align: center;

    }
    
    .btn {
        width: 40%;
        padding: 14px;
        font-size: 16px;

        border: 1px solid #333;
        border-radius: 6px;

        background: #e0e0e0;
    }

    </style>
</head>   
<body>
    <!--ヘッダー-->
    <header>
   
    </header>
    <!--ヘッダーここまで-->
    <!--メイン-->
     <main>
     <p>ご予約が失敗しました。</p>
     <p>${errormsg}</p>
     <p></p>
     <p>お手数をおかけしますが、下のボタンを押し、再度予約をお願いします</p>
     <button class=btn>ホーム画面へ戻る</button>
    </main>
    <footer>

    </footer>
    
</body>     
</html>