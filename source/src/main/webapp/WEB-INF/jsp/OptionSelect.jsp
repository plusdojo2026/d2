<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>オプション選択</title>

    <style>
        body {
            font-family: "Arial", "Helvetica", "Yu Gothic", "Meiryo", sans-serif;
            padding: 20px;
        }

        h2 { margin-bottom: 20px; }

        .date-scroll {
            display: flex;
            overflow-x: auto;
            white-space: nowrap;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .date-btn {
            min-width: 120px;
            padding: 12px;
            margin-right: 10px;
            background: #e0e0e0;
            border-radius: 8px;
            text-align: center;
            cursor: pointer;
            transition: 0.2s;
            font-size: 18px;
        }

        .date-btn:hover { background: #d0d0d0; }
        .date-btn.active { background: #4da3ff; color: white; }

        .time-area {
            margin-top: 20px;
            padding: 15px;
            border: 2px solid #ccc;
            border-radius: 10px;
            display: none;
        }

        .time-option {
            display: inline-block;
            padding: 12px 18px;
            margin: 8px;
            border: 2px solid #ccc;
            border-radius: 8px;
            font-size: 20px;
            background: #fafafa;
            cursor: pointer;
        }

        .option-area { margin-top: 35px; text-align: center; }

        .option-box {
            display: block;
            border: 3px solid #999;
            padding: 20px 22px;
            margin: 16px auto;
            border-radius: 12px;
            background: #ffffff;
            font-size: 26px;
            width: 360px;
            text-align: left;
            cursor: pointer;
            transition: 0.2s;
        }

        .option-box:hover { background: #f0f0f0; }

        .confirm-btn {
            display: block;
            margin: 30px auto 0 auto;
            padding: 16px 35px;
            background: #ff4d4d;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 22px;
            cursor: pointer;
            transition: 0.2s;
        }

        .confirm-btn:hover { background: #d90000; }
    </style>
</head>

<body>

<h2>日付を選択してください</h2>

<form action="${pageContext.request.contextPath}/OptionSelectServlet" method="post">

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
            <input type="checkbox" name="option" value="泡ムース洗浄"> 泡ムース洗浄
        </label>

        <label class="option-box">
            <input type="checkbox" name="option" value="下部洗浄"> 下部洗浄
        </label>

        <label class="option-box">
            <input type="checkbox" name="option" value="撥水コーティング"> 撥水コーティング
        </label>

        <button type="submit" class="confirm-btn">確定</button>
    </div>

</form>

<script>
const dateScroll = document.getElementById("dateScroll");
const timeArea = document.getElementById("timeArea");
const timeList = document.getElementById("timeList");
const selectedDateTitle = document.getElementById("selectedDateTitle");
const dateInput = document.getElementById("dateInput");
const timeInput = document.getElementById("timeInput");

const today = new Date();

// ★ 現在選択中の日付（トグル判定用）
let currentSelectedDate = null;

for (let i = 0; i < 7; i++) {
    let d = new Date(today.getTime() + i * 24 * 60 * 60 * 1000);
    let month = d.getMonth() + 1;
    let day = d.getDate();

    let label = month + "月" + day + "日";

    let btn = document.createElement("div");
    btn.className = "date-btn";
    btn.textContent = label;

    btn.onclick = function () {

        // ★ 同じ日付をクリック → 時間帯を閉じる
        if (currentSelectedDate === label) {
            currentSelectedDate = null;
            dateInput.value = "";
            timeArea.style.display = "none";
            document.querySelectorAll(".date-btn").forEach(b => b.classList.remove("active"));
            return;
        }

        // ★ 違う日付をクリック → 時間帯を表示
        currentSelectedDate = label;

        document.querySelectorAll(".date-btn").forEach(b => b.classList.remove("active"));
        btn.classList.add("active");

        dateInput.value = label;
        showTimeSlots(label);
    };

    dateScroll.appendChild(btn);
}

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
</script>

</body>
</html>
