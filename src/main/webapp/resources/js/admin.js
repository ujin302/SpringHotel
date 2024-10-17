$(function(){
    $('#updateRoomInfo').submit(function(event){
        event.preventDefault(); 

        let formData = new FormData(this); 

        $.ajax({
            type: 'POST',
            url: '/SpringHotel/admin/update',
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            data: formData,
            success: function(data){
                //alert(data); 
                // 페이지 이동
                location.href = "/SpringHotel/admin/updateRoom";
            },
            error: function(e){
                console.log(e); 
            }
        });
    });
    
 	// 댓글 작성
    $('#commentWriteBtn').on('click', function(event){
        event.preventDefault(); 

        let formData = {
            comment: $('#comment').val(),
            questionsId: $('input[name="questionsId"]').val(),
            userId: $('input[name="userId"]').val()
        };

        $.ajax({
            type: 'POST',
            url: '/SpringHotel/admin/writeComment', 
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(formData),
            success: function(response){
                alert("댓글이 작성되었습니다.");  
                location.reload(); 
            },
            error: function(error){
                console.log(error);
            }
        });
    });
    
	$('#loginBtn').on('click', function(event) {
	    event.preventDefault(); // 기본 폼 제출 방지
	
	    let formData = {
	        adminId: $('#adminId').val(),
	        pwd: $('#pwd').val()
	    };
	
	    $.ajax({
	        type: 'POST',
	        url: '/SpringHotel/admin/loginForm',
	        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	        data: formData,
	        success: function(data) {
	            console.log(data);
	            if (data === "로그인에 성공하였습니다.") {
	                alert(data);
	                location.href = '/SpringHotel/';
	            } else {
	                // 로그인 실패 시, loginDiv에 오류 메시지 표시
	                $('#loginDiv').text(data).css('color', 'red'); // 메시지 색상 설정
	            }
	        },
	        error: function(e) {
	            console.log(e);
	            $('#loginDiv').text("서버 오류가 발생했습니다.").css('color', 'red'); // 서버 오류 시 메시지 표시
	        }
	    });
	});
     
 	$('#commentWriteBtn').on('click', function(event) {
        event.preventDefault();
		console.log("ddd");
        let formData = {
            comment: $('#comment2').val(),
            questionsId: $('input[name="questionsId"]').val(),
            userId: $('input[name="userId"]').val()
        };
		console.log(formData);
        $.ajax({
            type: 'POST',
            url: '/SpringHotel/admin/writeComment',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: formData,
            success: function(response) {
                alert("댓글이 작성되었습니다.");
                location.reload(); 
            },
            error: function(error) {
                console.log(error);
            }
        });
    });   
    
    function showDesc(answerId) {
        var showContent = document.getElementById('showContent' + answerId);
        var hideContent = document.getElementById('hideContent' + answerId);

        // 현재 표시 상태에 따라 전환
        if (showContent.style.display === "none") {
            showContent.style.display = "block"; // 원본 내용 표시
            hideContent.style.display = "none"; // 수정 폼 숨기기
        } else {
            showContent.style.display = "none"; // 원본 내용 숨기기
            hideContent.style.display = "block"; // 수정 폼 표시
        }
    }
    
    // 댓글 수정 버튼 
    $('.updateCommentBtn').on('click', function() {
        const answerId = $(this).data('answerid');
        $('#showContent' + answerId).hide(); // 기존 댓글 내용 숨김
        $('#hideContent' + answerId).show(); // 수정 폼 표시
    });

    // 수정 완료 버튼
    $(document).on('click', '#updateCommentBtn2', function() {
        const answerId = $(this).data('answerid');
        const comment = $('#hideContent' + answerId + ' textarea[name="comment"]').val(); 
        const questionId = $('#hideContent' + answerId + ' input[name="questionId"]').val(); // 질문 ID

        $.ajax({
            type: 'POST',
            url: '/SpringHotel/admin/updateComment',
            data: {
                answerId: answerId,
                comment: comment,
                questionId: questionId
            },
            success: function(response) {
                if (response === "success") {
                    alert("댓글이 수정되었습니다.");
                    location.reload(); // 페이지 새로고침
                } else {
                    alert("댓글 수정에 실패하였습니다.");
                }
            },
            error: function(error) {
                console.log(error);
                alert("서버 오류가 발생하였습니다.");
            }
        });
    });

	// 댓글 수정 버튼 클릭 시 UI 전환
	$(document).on('click', '.updateCommentBtn', function() {
	    const answerId = $(this).data('answerid');
	    $('#showContent' + answerId).hide(); // 기존 댓글 내용 숨김
	    $('#hideContent' + answerId).show(); // 수정 폼 표시
	
	    // 수정 버튼 자신을 숨기고 삭제 버튼도 숨김
	    $(this).hide(); // 클릭한 수정 버튼 숨기기
	    $(this).siblings('.deleteCommentBtn').hide(); // 삭제 버튼 숨기기
	
	    // 수정 완료 및 취소 버튼만 표시
	    $('#hideContent' + answerId + ' .commentBtn').show(); // 수정 완료 및 취소 버튼 표시
	});
		
    // 댓글 보여주는/숨기는 함수
    window.showDesc = function(answerId) {
        var showContent = document.getElementById('showContent' + answerId);
        var hideContent = document.getElementById('hideContent' + answerId);

        // 현재 표시 상태에 따라 전환
        if (showContent.style.display === "none") {
            showContent.style.display = "block"; // 원본 내용 표시
            hideContent.style.display = "none"; // 수정 폼 숨기기
        } else {
            showContent.style.display = "none"; // 원본 내용 숨기기
            hideContent.style.display = "block"; // 수정 폼 표시
        }
    };
	
	// 댓글 삭제
	$('.deleteCommentBtn').on('click', function() {
	    const answerId = $(this).data('answerid'); 
	
	    if (confirm("정말로 이 댓글을 삭제하시겠습니까?")) {
	        $.ajax({
	            type: 'GET',
	            url: '/SpringHotel/admin/deleteComment',
	            data: {
	                answerId: answerId
	            },
	            success: function(response) {
	                if (response === "success") {
	                    alert("댓글이 삭제되었습니다.");
	                    location.reload(); 
	                } else {
	                    alert("댓글 삭제에 실패하였습니다.");
	                }
	            },
	            error: function(error) {
	                console.log(error);
	                alert("서버 오류가 발생하였습니다.");
	            }
	        });
	    }
	});    
});
