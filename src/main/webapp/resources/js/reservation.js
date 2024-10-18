// 메뉴 설정
function setMenu() {
	var menuNum = $('#reservation').data('menu');
	
	console.log(menuNum);
	$('#m' + menuNum).addClass('active');
    $('#m' + menuNum + ' > a').css('color', 'white');
    $('#m' + menuNum + ' > a').css('background-color', '#ded3c5');
	
}

// 오늘 날짜 구하기
function getToday() {
    var today = new Date();

	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	
	var dateString = year + '-' + month  + '-' + day;
	
	console.log(dateString);

    return dateString;
}

// 체크인 다음날 구하기
function getTomorrow() {
    // 체크인 날짜를 가져오기
    var checkinDate = new Date($('#checkin').val());
    
    // 하루를 더하기 (1일 = 24 * 60 * 60 * 1000 ms)
    checkinDate.setDate(checkinDate.getDate() + 1);
    
    // 날짜를 YYYY-MM-DD 형식으로 변환
    var year = checkinDate.getFullYear();
    var month = ('0' + (checkinDate.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 +1
    var day = ('0' + checkinDate.getDate()).slice(-2);
    
    var tomorrowString = year + '-' + month + '-' + day;
    
    console.log('+1 day: ' + tomorrowString);
    
    return tomorrowString;
}

// 숙박일 구하기
function calculateStayDuration() {
    var checkinDate = new Date($('#checkin').val());
    var checkoutDate = new Date($('#checkout').val());

    // 날짜 차이 계산 (밀리초 단위)
    var timeDiff = checkoutDate - checkinDate;

    // 밀리초를 하루 단위로 변환 (1일 = 24 * 60 * 60 * 1000 ms)
    var dayDiff = timeDiff / (1000 * 60 * 60 * 24);

    console.log('숙박일수: ' + dayDiff + '박');
    return dayDiff;
}

// 날짜, 인원 데이터 전송
function findRoom() {
	$.ajax({
		type: 'post',
		url: '/SpringHotel/reserve/findRoom',
		data: {
			'checkin' : $('#checkin').val(),
			'checkout' : $('#checkout').val(),
			'adults' : $('#adults').val(),
			'kids' : $('#kids').val()
		},
		dataType: 'text',
		success: function(data) {
			alert(1);
			location.href = '/SpringHotel/reserve/menu2';
		},
		error: function(e) {
			console.log(e);
		}
	});
}

$(function() {
	// [ 날짜&인원 선택 ]
	// 1. 메뉴 활성화
	setMenu();
    
    // 2. 날짜 초기화
    $('#checkin').attr('min', getToday()); // min : 오늘 날짜
    $('#checkin').val(getToday()); // val : 오늘 날짜 
    $('#checkout').val(getTomorrow()); // min : 내일 날짜
    $('#checkout').attr('min', getTomorrow()); // val : 내일 날짜 
    $('#diffday').val(calculateStayDuration() + '박'); // 숙박일 계산
    
    // 3. 체크아웃 min 설정: 체크인+1일부터 선택 가능
    $('#checkin').change(function() {
    	$('#checkout').attr('min', getTomorrow());
    });
    
    // 4. 숙박 일수 계산 
    $('#checkout').change(function() {
    	if($('#checkout').val != '') {
    		$('#diffday').val(calculateStayDuration() + '박');
    	}
    })

    // 5. 날짜, 인원 데이터 전송
    $('#findRoomBtn').click(findRoom);
})