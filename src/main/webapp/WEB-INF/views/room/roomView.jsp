<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Room Information - Hotel S&H</title>
    <link rel="stylesheet" href="/SpringHotel/resources/css/bootstrap.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/resources/css/room.css">
</head>
<body>
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

    <div class="container mt-5">
        <!-- 페이지 타이틀 -->
        <h2 class="my-4 text-center"><i class="fas fa-bed"></i> 객실 정보</h2>

        <!-- 카드와 테이블 토글 버튼 -->
        <div class="text-center mb-4">
            <button class="btn btn-primary" id="toggleCard">카드 보기</button>
            <button class="btn btn-secondary" id="toggleTable">테이블 보기</button>
        </div>

        <!-- 객실 카드 정보 -->
        <div class="row" id="cardView" style="display: none;">
            <c:forEach var="room" items="${rooms}">
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/images/${room.roomImg.imageFileName}" alt="${room.type}">
                        <div class="card-body">
                            <h5 class="card-title">${room.type}</h5>
                            <p class="card-text">크기: ${room.size}m² | 수용 인원: ${room.capacity}명</p>
                            <p class="card-text">가격: ₩${room.price}</p>
                            <p class="card-text">${room.description}</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <button class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/room/detail/${room.roomId}'">상세 보기</button>
                                <button class="btn btn-primary">예약</button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- 객실 테이블 정보 -->
        <div class="room-info-table" id="tableView">
            <table class="table table-bordered table-hover table-responsive text-center">
                <thead class="table-dark">
                    <tr>
                        <th><i class="fas fa-door-open"></i> 객실 유형</th>
                        <th><i class="fas fa-ruler-combined"></i> 크기 (m²)</th>
                        <th><i class="fas fa-users"></i> 수용 인원</th>
                        <th><i class="fas fa-money-bill-wave"></i> 가격 (₩)</th>
                        <th><i class="fas fa-info-circle"></i> 설명</th>
                        <th><i class="fas fa-couch"></i> 구성</th>
                        <th><i class="fas fa-mountain"></i> 전망</th>
                        <th><i class="fas fa-bed"></i> 침대 유형</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="room" items="${rooms}">
                        <tr onclick="location.href='${pageContext.request.contextPath}/room/detail/${room.roomId}'"
                            style="cursor: pointer;">
                            <td>${room.type}</td>
                            <td>${room.size}</td>
                            <td>${room.capacity}</td>
                            <td>${room.price}</td>
                            <td>${room.description}</td>
                            <td>${room.form}</td>
                            <td>${room.view}</td>
                            <td>${room.bedtype}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        		<!-- 부대시설 정보 섹션 -->
		<div class="amenity-section bg-light p-4 mt-5 rounded">
			<h3><i class="fas fa-dumbbell"></i> 부대시설</h3>
			<table class="table">
				<tr>
					<td><h4><i class="fas fa-check-circle"></i> 피트니스 센터 무료 이용</h4>
						<ul class="list-unstyled">
							<li>이용 가능 시간: 06:00 ~ 22:00</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td><h4><i class="fas fa-calendar-alt"></i> 피트니스 센터 휴일</h4>
						<ul class="list-unstyled">
							<li>매월 세 번째 수요일 정기 휴일</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td><h4><i class="fas fa-swimmer"></i> 실내 수영장</h4>
						<ul class="list-unstyled">
							<li>만 13세 이상 입장 가능</li>
							<li>이용 가능 시간: 07:00 ~ 21:00</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td><h4><i class="fas fa-hot-tub"></i> 사우나</h4>
						<ul class="list-unstyled">
							<li>유료 이용</li>
							<li>이용 가능 시간: 07:00 ~ 22:00</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td><h4><i class="fas fa-parking"></i> 무료 주차</h4>
						<ul class="list-unstyled">
							<li>투숙 기간 내 무료 주차 가능</li>
						</ul>
					</td>
				</tr>
			</table>
		</div>

		<!-- 호텔 정보 섹션 -->
		<div class="hotel-info bg-light p-4 mt-5 rounded">
			<h3><i class="fas fa-hotel"></i> 호텔 정보</h3>
			<table class="table">
				<tr>
					<td><h4><i class="fas fa-utensils"></i> 조식 이용 안내</h4>
						<ul class="list-unstyled">
							<li>다이닝 존 (뷔페) : 07:30 ~ 10:30</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td><h4><i class="fas fa-clock"></i> 체크인 / 체크아웃 시간</h4>
						<ul class="list-unstyled">
							<li>체크인 : 오후 2시 이후</li>
							<li>체크아웃 : 오전 11시</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td><h4><i class="fas fa-calendar-times"></i> 예약 취소/변경 및 No-Show 안내</h4>
						<ul class="list-unstyled">
							<li>숙박 예정일 7일 전: 위약금 없음</li>
							<li>숙박 예정일 6일 전 ~ 1일 전 : 1박 요금의 20%</li>
							<li>숙박 예정일 1일 전 (18시 이후 취소 및 변경): 1박 요금의 80%</li>
						</ul>
					</td>
				</tr>
			</table>
		</div>
    </div>

    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

    <!-- 카드 및 테이블 토글 스크립트 -->
    <script>
        $(document).ready(function() {
            $('#toggleCard').click(function() {
                $('#tableView').hide();
                $('#cardView').show();
            });
            $('#toggleTable').click(function() {
                $('#cardView').hide();
                $('#tableView').show();
            });
        });
    </script>
</body>
</html>
