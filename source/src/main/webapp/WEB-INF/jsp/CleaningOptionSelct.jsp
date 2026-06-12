<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- ★ スマホ対応 -->
    <title>オプション選択</title>

    <style>
        body {
            font-family: "Arial", "Helvetica", "Yu Gothic", "Meiryo", sans-serif;
            padding: 15px;
            margin: 0;
            background-color: #fafafa;
        }

        h2 {
            margin-bottom: 15px;
            font-size: 22px;
            text-align: center;
        }

        /* ▼ 日付スクロール */
        .date-scroll {
            display: flex;
            overflow-x: auto;
            white-space: nowrap;
            padding-bottom: 10px;
            margin-bottom: 20px;
            gap: 10px;
        }

        .date-btn {
            min-width: 110px;
            padding: 12px;
            background: #e0e0e0;
            border-radius: 8px;
            text-align: center;
            cursor: pointer;
            transition: 0.2s;
            font-size: 16px;
            flex-shrink: 0;
        }

        .date-btn:hover { background: #d0d0d0; }
        .date-btn.active { background: #4da3ff; color: white; }

        /* ▼ 時間帯エリア */
        .time-area {
            margin-top: 20px;
            padding: 15px;
            border: 2px solid #ccc;
            border-radius: 10px;
            display: none;
            background: #fff;
        }

        .time-option {
            display: inline-block;
            padding: 12px 18px;
            margin: 8px;
            border: 2px solid #ccc;
            border-radius: 8px;
            font-size: 18px;
            background: #fafafa;
            cursor: pointer;
        }

        /* ▼ オプション選択 */
        .option-area {
            margin-top: 30px;
            text-align: center;
        }

        .option-box {
            display: block;
            border: 3px solid #999;
            padding: 18px;
            margin: 14px auto;
            border-radius: 12px;
            background: #ffffff;
            font-size: 20px;
            width: 90%;           /* ★ スマホ対応 */
            max-width: 360px;     /* PC では最大幅 */
            text-align: left;
            cursor: pointer;
            transition: 0.2s;
        }

        .option-box:hover { background: #f0f0f0; }

        /* ▼ 次へボタン */
        .confirm-btn {
            display: block;
            margin: 30px auto 0 auto;
            padding: 14px 30px;
            background: #ff4d4d;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 20px;
            cursor: pointer;
            width: 90%;           /* ★ スマホで押しやすい */
            max-width: 360px;
            transition: 0.2s;
        }

        .confirm-btn:hover { background: #d90000; }

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
</head>

<body>

<h2>日付を選択してください</h2>

<form action="${pageContext.request.contextPath}/OptionSelectServlet"
      method="post"
      onsubmit="return validateOptionForm()">

    <input type="hidden" name="job" value="${job}">
    <input type="hidden" name="date" id="dateInput">
    <input type="hidden" name="selectedTime" id="timeInput">

    <div class="date-scroll" id="dateScroll"></div>

    <div class="time-area" id="timeArea">
        <h3 id="selectedDateTitle"></h3>
        <div id="timeList"></div>
    </div>

    <div class="option-area">
        <h3>オプションを選択（複数選択できます）</h3>

        <label class="option-box">
            <input type="checkbox" name="option" value="しみ抜き"> しみ抜き
        </label>

        <label class="option-box">
            <input type="checkbox" name="option" value="においブロック加工"> においブロック加工
        </label>

        <label class="option-box">
            <input type="checkbox" name="option" value="はっ水加工"> はっ水加工
        </label>

        <button type="submit" class="confirm-btn">必要項目記入画面へ</button>
    </div>

</form>

<!-- ▼ ポップアップ -->
<div id="alertPopup">
    <p id="alertMessage">必須項目が選択されていません。</p>
    <button onclick="closeAlert()">確認</button>
</div>

<script>
const dateScroll = document.getElementById("dateScroll");
const timeArea = document.getElementById("timeArea");
const timeList = document.getElementById("timeList");
const selectedDateTitle = document.getElementById("selectedDateTitle");
const dateInput = document.getElementById("dateInput");
const timeInput = document.getElementById("timeInput");

const today = new Date();
let currentSelectedDate = null;

// ▼ 日付ボタン生成
for (let i = 0; i < 7; i++) {
    let d = new Date(today.getTime() + i * 24 * 60 * 60 * 1000);
    let month = d.getMonth() + 1;
    let day = d.getDate();
    let label = month + "月" + day + "日";

    let btn = document.createElement("div");
    btn.className = "date-btn";
    btn.textContent = label;

    btn.onclick = function () {

        if (currentSelectedDate === label) {
            currentSelectedDate = null;
            dateInput.value = "";
            timeArea.style.display = "none";
            document.querySelectorAll(".date-btn").forEach(b => b.classList.remove("active"));
            return;
        }

        currentSelectedDate = label;

        document.querySelectorAll(".date-btn").forEach(b => b.classList.remove("active"));
        btn.classList.add("active");

        dateInput.value = label;
        showTimeSlots(label);
    };

    dateScroll.appendChild(btn);
}

// ▼ 時間帯生成
function showTimeSlots(dateLabel) {
    selectedDateTitle.textContent = dateLabel + " の予約時間";
    timeList.innerHTML = "";

    for (let hour = 8; hour <= 20; hour += 2) {
        let timeText = hour + ":00 〜 " + (hour + 2) + ":00";

        let div = document.createElement("div");
        div.className = "time-option";

        div.innerHTML =
            "<label>" +
            "<input type='radio' name='timeRadio' value='" + timeText + "'>" +
            timeText +
            "</label>";

        div.querySelector("input").onclick = function () {
            timeInput.value = timeText;
        };

        timeList.appendChild(div);
    }

    timeArea.style.display = "block";
}

// ▼ 必須チェック（ポップアップ表示）
function validateOptionForm() {
    const date = dateInput.value.trim();
    const time = timeInput.value.trim();

    let message = "";

    if (date === "") message += "・日付\n";
    if (time === "") message += "・時間\n";

    if (message !== "") {
        document.getElementById("alertMessage").innerText =
            "以下の必須項目が選択されていません。\n\n" + message;

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
