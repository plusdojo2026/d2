//ログインが押されたら
document.getElementById('form').onsubmit = function(event){
	//値の取得
	let id = document.getElementById('form').user_id.value;
	let pw = document.getElementById('form').password.value;
	//idとpwに値があるか
	if(id === '' && pw === ''){
		event.preventDefault();
		document.getElementById('msg').style.color = 'Red';
		document.getElementById('msg').textContent = 'IDとPWを入力してください'
	}
	//idに値があるか
	else if(id === ''){
		event.preventDefault();
		document.getElementById('msg').style.color = 'Red';
		document.getElementById('msg').textContent = 'IDを入力してください'
	}
	//pwに値があるか
	else if(pw === ''){
		event.preventDefault();
		document.getElementById('msg').style.color = 'Red';
		document.getElementById('msg').textContent = 'PWを入力してください'
	}
}