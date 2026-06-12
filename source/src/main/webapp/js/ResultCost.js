// ============================================
// 料金精算画面表示用JavaScript（ResultCost.js）
// ============================================

// 画面のHTMLがすべて読み込まれてから処理を始める
window.addEventListener('DOMContentLoaded', function () {

    // ----- 1. 必要な要素を取得する-----
    const paymentForm = document.getElementById('paymentForm'); // フォーム全体
    const messageArea = document.getElementById('message');     // メッセージ表示エリア
    const confirmBtn = document.getElementById('decision'); // 確定ボタン
    const cancelBtn  = document.getElementById('cancel');   // キャンセルボタン

    // ----- 2. 確定ボタンを押したときの処理 -----
    confirmBtn.addEventListener('click', function () {

        // 支払い方法のラジオボタンの中から「選ばれているもの」を探す
        const selected = document.querySelector('input[name="payment"]:checked');

        // 何も選ばれていなければ、メッセージを出して送信を止める
        if (selected === null) {
            messageArea.textContent = '支払い方法を選択してください';
            return; // ここで処理を打ち切る（送信しない）
        }

        // 支払い方法が選ばれていれば、フォームをサーバーへ送信する
        paymentForm.submit();
    });

    // ----- 3. キャンセルボタンを押したときの処理 -----
    cancelBtn.addEventListener('click', function () {
        // 前の画面に戻る
        history.back();
    });

});