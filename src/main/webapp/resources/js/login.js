function login() {
	$.ajax({
		type: 'post',
		url: '/SpringHotel/user/login/sh',
		data: {
			'userid' : $('#userid').val(),
			'pwd' : $('#pwd').val()
		},
		dataType: 'text',
		success: function(data) {
			if(data) {
				console.log('SH 로그인 성공');
				alert("환영합니다.");
				location.href="/SpringHotel";
			}else {
				console.log('SH 로그인 실패');
				alert("아이디 혹은 비밀번호가 틀렸습니다.");
				location.reload();
			}
		},
		error: function(e) {
			console.log(e);
		}
	});
}

$(function() {
	// 로그인
	$('#loginBtn').click(login);
});