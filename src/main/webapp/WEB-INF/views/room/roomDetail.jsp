<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Room Detail</title>
    <!-- 기본 스타일 -->
    <link rel="stylesheet" href="/SpringHotel/resources/css/bootstrap.css">
    <!-- Bootstrap 최신 버전 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
    <!-- Font Awesome 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@400;700&family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
    <!-- 커스텀 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/roomDetail.css">
</head>
<body>

<!-- 네비게이션 바 -->
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expanded="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">Spring Hotel</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li class="active"><a href="${pageContext.request.contextPath}/">HOME</a></li>
            <li><a href="${pageContext.request.contextPath}/room/roomView">객실 정보</a></li>
            <li><a href="reservation1.jsp">예약</a></li>
            <li><a href="reserveInfo.jsp">예약내역</a></li>
            <li><a href="inquiryList.jsp">Q&A</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle"
                   data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">접속하기<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li class="active"><a href="login.jsp">로그인</a></li>
                    <li><a href="join.jsp">회원가입</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>

<!-- 룸 상세 정보 섹션 -->
<div class="container mt-5">
    <h2 class="text-center"><i class="fas fa-bed"></i> ${room.type} 상세 정보</h2>

	    <!-- 리뷰 관련 버튼 -->
	    <div class="room-actions text-right mb-4">
		    <a href="${pageContext.request.contextPath}/review/reviewList" 
		       class="btn btn-outline-secondary mr-2">리뷰 목록 보기</a>
		    <a href="${pageContext.request.contextPath}/review/reviewWriteForm?roomId=${room.roomId}" 
		       class="btn btn-outline-primary">리뷰 작성하기</a>
		</div>

    <!-- 객실 이미지 섹션 -->
    <div class="room-images mt-5">
        <h4 class="text-center"><i class="fas fa-images"></i> 객실 이미지</h4>
        <div class="row justify-content-center">
            <c:forEach var="image" items="${roomImages}">
                <div class="col-md-4 mb-3">
                    <div class="card shadow-sm">
                        <img src="${pageContext.request.contextPath}/resources/images/${image.imageFileName}" 
                             alt="${image.imageOriginalFileName}" 
                             class="card-img-top img-fluid">
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- 객실 정보 섹션 -->
    <div class="room-details bg-light mt-4 p-5 rounded shadow-sm">
        <div class="row">
            <div class="col-md-6">
                <p><i class="fas fa-expand-arrows-alt"></i> 크기: ${room.size} m²</p>
                <p><i class="fas fa-users"></i> 수용 인원: ${room.capacity}명</p>
                <p><i class="fas fa-money-bill-wave"></i> 가격: ${room.price} ₩</p>
            </div>
            <div class="col-md-6">
                <p><i class="fas fa-info-circle"></i> 설명: ${room.description}</p>
                <p><i class="fas fa-couch"></i> 구성: ${room.form}</p>
                <p><i class="fas fa-mountain"></i> 전망: ${room.view}</p>
                <p><i class="fas fa-bed"></i> 침대 유형: ${room.bedtype}</p>
            </div>
        </div>
    </div>
</div>

<!-- jQuery와 Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
