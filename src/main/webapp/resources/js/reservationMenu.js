function getToday() {
    var today = new Date();

	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	
	var dateString = year + '-' + month  + '-' + day;
	
	console.log(dateString);

    return dateString;
}

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


$(function() {
	// 1. 메뉴 활성화
    $('#m1').addClass('active');
    
    // 2. 날짜 초기화
    $('#checkin').attr('min', getToday());
    $('#checkin').val(getToday());
    console.log('11: '+$('#checkin').val());
    $('#checkout').attr('min', $('#checkin').val());
    
    // 3. 체크아웃 min 설정: 체크인+1일부터 선택 가능
    $('#checkin').change(function() {
    	$('#checkout').attr('min', getTomorrow());
    });
    
    
})