document.getElementById('form').onsubmit = function(event){ //新規登録が押されたら
	let id = document.getElementById('form').user_id.value; //値の取得
	let pw = document.getElementById('form').password.value;
	let confpw = document.getElementById('form').confirmpw.value;
	//idとpwに値が含まれているか
	if(id === '' && pw === ''){
		event.preventDefault();
		document.getElementById('msg').style.color = 'Red';
		document.getElementById('msg').textContent = 'IDとPWを入力してください';
	}
	//idに値が含まれているか
	else if(id === ''){
		event.preventDefault();
		document.getElementById('msg').style.color = 'Red';
		document.getElementById('msg').textContent = 'IDを入力してください';
	}
	//pwに値が含まれているか
	else if(pw === ''){
		event.preventDefault();
		document.getElementById('msg').style.color = 'Red';
		document.getElementById('msg').textContent = 'PWを入力してください';
	}
	//idとpwの文字数判断
	else if((id.length < 7 || id.length > 16)&&(pw.length < 7 || pw.length > 16)){
		event.preventDefault();
		document.getElementById('msg').style.color = 'Red';
		document.getElementById('msg').textContent = 'IDとPWは8文字以上16文字以下で入力してください';
	}
	//idの文字数判断
	else if(id.length < 7 || id.length > 16){
		event.preventDefault();
		document.getElementById('msg').style.color = 'Red';
		document.getElementById('msg').textContent = 'IDは8文字以上16文字以下で入力してください';
	}
	//pwの文字数判断
	else if(pw.length < 7 || pw.length > 16){
		event.preventDefault();
		document.getElementById('msg').style.color = 'Red';
		document.getElementById('msg').textContent = 'PWは8文字以上16文字以下で入力してください';
	}
	//pwと確認用pwが一致するか
	else if(pw !== confpw){
		event.preventDefault();
		document.getElementById('msg').style.color = 'Red';
		document.getElementById('msg').textContent = 'PWが一致しません';
	}
}