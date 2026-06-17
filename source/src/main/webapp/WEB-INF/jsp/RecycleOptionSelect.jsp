<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>オプション選択</title>

    <style>
        body {
            font-family: "Arial", "Helvetica", "Yu Gothic", "Meiryo", sans-serif;
            padding: 15px;
            margin: 0;
            background-image: url("${pageContext.request.contextPath}/img/hanagara.png");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
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
            background: rgba(255,255,255,0.97);
            border-radius: 8px;
            text-align: center;
            cursor: pointer;
            transition: 0.2s;
            font-size: 16px;
            flex-shrink: 0;
            border: 2px solid #000; /* ★ 黒枠 */
        }
        .date-btn:hover { background: #D0D0D0; }
        .date-btn.active { background: #4DA3FF; color: white; }

        /* ▼ 時間帯エリア（最初は非表示） */
        #timeSectionBox {
            display: none; /* ★ 余分な白ボックスを消す */
        }

.time-area {
    margin-top: 20px;
    padding: 15px;
    border-radius: 10px;
    background: rgba(255,255,255,0.97);
}


        .time-option {
            display: inline-block;
            padding: 12px 18px;
            margin: 8px;
            border: 2px solid #000;
            border-radius: 8px;
            font-size: 18px;
            background: rgba(255,255,255,0.97);
            cursor: pointer;
        }

        /* ▼ オプション選択 */
        .option-area {
            margin-top: 30px;
            text-align: center;
        }

        .option-box {
            display: block;
            border: 3px solid #000;
            padding: 18px;
            margin: 14px auto;
            border-radius: 12px;
            background: rgba(255,255,255,0.97);
            font-size: 20px;
            width: 90%;
            max-width: 360px;
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
            background: #FF1A1A;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 20px;
            cursor: pointer;
            width: 90%;
            max-width: 360px;
            transition: 0.2s;
        }

        .confirm-btn:hover {
            background: #d90000;
        }

        /* ▼ 白背景ボックス（共通） */
        .section-box {
            background: rgba(255,255,255,0.97);
            padding: 20px;
            margin: 20px auto;
            border-radius: 12px;
            width: 90%;
            max-width: 420px;
            box-shadow: 0 0 15px rgba(0,0,0,0.15);
            border: 2px solid #000;
        }

        /* ▼ ポップアップ */
        #alertPopup {
            position: fixed;
            top: -250px;
            left: 50%;
            transform: translateX(-50%);
            width: 90%;
            max-width: 400px;
            background: rgba(255,255,255,0.97);
            border: 1px solid #cccccc;
            padding: 20px;
            text-align: center;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            transition: top 0.4s ease;
            z-index: 9999;
        }

        #alertPopup.show { top: 30px; }

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

<form action="${pageContext.request.contextPath}/OptionSelectServlet"
      method="post"
      onsubmit="return validateOptionForm()">
      
      <input type="hidden" name="job" value="${job}">
    <input type="hidden" name="date" id="dateInput">
    <input type="hidden" name="selectedTime" id="timeInput">

    <!-- ▼ 日付選択エリア -->
    <div class="section-box">
        <h2>日付を選択してください</h2>
        <div class="date-scroll" id="dateScroll"></div>
    </div>

    <!-- ▼ 時間帯エリア（最初は非表示） -->
    <div class="section-box" id="timeSectionBox">
        <div class="time-area" id="timeArea">
            <h3 id="selectedDateTitle"></h3>
            <div id="timeList"></div>
        </div>
    </div>

    <!-- ▼ オプション選択エリア -->
    <div class="section-box">
        <div class="option-area">
            <h3>オプション（複数選択できます）</h3>

            <label class="option-box">
            <input type="checkbox" name="option1" value="大型粗大ごみ"> 大型粗大ごみ　3000円
        </label>

        <label class="option-box">
            <input type="checkbox" name="option2" value="家具の解体"> 家具の解体 3000円
        </label>

        <label class="option-box">
            <input type="checkbox" name="option3" value="回収物の破棄"> 回収物の破棄 3000円
        </label>

            <button type="submit" class="confirm-btn">必要項目記入画面へ</button>
        </div>
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
let reservedList = [];

<c:forEach var="item" items="${dto}">
reservedList.push({
    date: "${item.date}",
    time: "${item.time}"
});
</c:forEach>

for (let i = 0; i < 7; i++) {
    let d = new Date(today.getTime() + i * 86400000);
    let label = (d.getMonth() + 1) + "月" + d.getDate() + "日";

    let btn = document.createElement("div");
    btn.className = "date-btn";
    btn.textContent = label;

    btn.onclick = function () {
        if (currentSelectedDate === label) {
            currentSelectedDate = null;
            dateInput.value = "";
            timeArea.style.display = "none";
            document.getElementById("timeSectionBox").style.display = "none";
            document.querySelectorAll(".date-btn").forEach(b => b.classList.remove("active"));
            return;
        }

        currentSelectedDate = label;
        document.querySelectorAll(".date-btn").forEach(b => b.classList.remove("active"));
        btn.classList.add("active");

        dateInput.value = (d.getYear()+1900) + "年" + label;
        showTimeSlots(dateInput.value);
    };

    dateScroll.appendChild(btn);
}


function showTimeSlots(dateLabel) {
    document.getElementById("timeSectionBox").style.display = "block"; // ★ 白ボックスごと表示

    timeList.innerHTML = "";

    for (let hour = 8; hour <= 20; hour += 2) {
    	let timeText = hour + ":00 〜 " + (hour + 2) + ":00";
    	
    	let isReserved = reservedList.some(r =>
        r.date === dateLabel && r.time === timeText
    );

    if (isReserved) continue;

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
