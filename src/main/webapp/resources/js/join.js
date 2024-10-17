// 아이디 중복 체크 	
function checkId(focusId) {
	console.log("checkId()")
	console.log('data checkid: ' + $('#userid').data('checkid'));
	
	if($('#userid').val() == '' || focusId == $('#userid').val()) return;
	
	$.ajax({
		type: 'get',
		url: '/SpringHotel/user/checkUserId?userId=' + $('#userid').val(),
		dataType: 'text',
		success: function(data) {
			console.log(data.trim());
			if(data.trim() == "true") {
				$('#idDiv').text('사용 가능');
				$('#idDiv').css('color', 'green');
			}
			else {
				$('#idDiv').text('사용 불가능');
				$('#idDiv').css('color', 'red');
			}
		}
	})
}

// 회원가입 시, 유효성 검사 
function Join(e) {
	console.log('Join()');
	var isOk = true;
	
	// 초기화
	$('.infoText').each(function (index, item) {
		if($(this).attr('id') != 'idDiv') {
			$(this).text('');
		}
    });
	
	// 1. 아이디 유효성 확인
	if($('#idDiv').text() == '사용 불가능') {
		$('#idDiv').text("아이디 중복체크 하세요.");
		$('#idDiv').css('color', 'red');
		e.preventDefault();
		isOk = false;
	}
	
	if($('#userid').val() == '' || $('#idDiv').text() == '아이디를 작성하세요.') {
		$('#idDiv').text("아이디를 작성하세요.");
		e.preventDefault();
		isOk = false;
	}
	
	// 2. 비밀번호 유효성 확인
	if($('#pwd').val() == '') {
		$('#pwdDiv').text("비밀번호를 작성하세요.");
		e.preventDefault();
		isOk = false;
	}
	
	// 3. 이름 유효성 확인
	if($('#name').val() == '') {
		$('#nameDiv').text("이름을 작성하세요.");
		e.preventDefault();
		isOk = false;
	}

	// 4. 이메일 유효성 확인
	if($('#email').val() == '') {
		$('#emailDiv').text("비밀번호를 작성하세요.");
		e.preventDefault();
		isOk = false;
	}
	
	// 5. 생년월일 유효성 확인
	$('.birth').each(function (index, item) {
		if($(this).val() == '') {
			$('#birthDiv').text("생년월일을 작성하세요.");
			e.preventDefault();
			isOk = false;
		}else if(index == 0 && $(this).val().length != 4) {
			$('#birthDiv').text("태어난 해는 4자리 수로 입력하세요.");
			e.preventDefault();
			isOk = false;
		}else if((index == 1 || index == 2) && $(this).val().length > 2) {
			$('#birthDiv').text("태어난 달과 일수는 1자리 또는 2자리로 입력하세요.");
			e.preventDefault();
			isOk = false;
		}
    });

	// 6. 전화번호 유효성 확인
	$('.tel').each(function (index, item) {
		if($(this).val() == '') {
			$('#telDiv').text("전화번호를 작성하세요.");
			e.preventDefault();
			isOk = false;
		}else if(index != 0 && $(this).val().length != 4) {
			$('#telDiv').text("4자리 수를 작성하세요.");
			e.preventDefault();
			isOk = false;
		}
    });
	
	if(isOk) {
		$.ajax({
			type: 'post',
			url: '/SpringHotel/user/join/submit',
			data: $('#joinForm').serialize(),
			success: function(data) {
				console.log('회원가입');
				alert("회원가입을 축하합니다.");
				location.href="/SpringHotel";
			},
			error: function(e) {
				console.log(e);
				alert('실패');
			}
		});
	}	
}

$(function() {
	// 1. id 중복 체크
	$('#userid').focus(function() {
		let focusId = $('#userid').val();
		$('#userid').blur(function() {
			checkId(focusId)
		});
	});
	
});