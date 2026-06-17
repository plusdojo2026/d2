// ============================================
// 料金精算画面用JavaScript（ResultCost.js）
// ============================================
// 画面のHTMLがすべて読み込まれてから処理を始める
window.addEventListener('DOMContentLoaded', function () {
    // ----- 1. 必要な要素を取得する -----
    const paymentForm = document.getElementById('paymentForm'); // フォーム全体
    const messageArea = document.getElementById('message');     // メッセージ表示エリア
    const cancelBtn   = document.getElementById('cancel');      // キャンセルボタン

    // ----- 2. フォーム送信時のチェック -----
    // 確定ボタンは type="submit" なので、フォームの submit を監視する
    paymentForm.addEventListener('submit', function (event) {
        // 支払い方法のラジオボタンから「選ばれているもの」を探す
        const selected = document.querySelector('input[name="payment"]:checked');

        // 何も選ばれていなければ、送信を止めてメッセージを出す
        if (selected === null) {
            event.preventDefault(); // フォームの自動送信をキャンセル
            messageArea.textContent = '支払い方法を選択してください';
            return;
        }

        // 選ばれていれば、古いメッセージを消してそのまま送信させる
        messageArea.textContent = '';
    });

    // ----- 3. キャンセルボタンを押したときの処理 -----
    cancelBtn.addEventListener('click', function () {
        // 前の画面に戻る
        history.back();
    });
});