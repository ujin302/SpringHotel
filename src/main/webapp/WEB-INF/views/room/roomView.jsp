<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Room Information - Hotel S&H</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/room.css">
</head>
<body>

<header class="bg-primary text-white p-3 text-end">
    <input type="button" value="Index" class="btn btn-light" onclick="window.location.href='${pageContext.request.contextPath}/';">
</header>

<div class="container mt-5">
    <!-- 페이지 타이틀 -->
    <h2 class="my-4 text-center"><i class="fas fa-bed"></i> 객실 정보</h2>

    <!-- 객실 테이블 정보 -->
    <div class="room-info-table">
        <table class="table table-bordered table-hover table-responsive">
            <thead class="thead-dark">
                <tr class="table-primary text-center">
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
                <!-- 클릭 시 roomDetail 페이지로 이동 -->
                <c:forEach var="room" items="${rooms}">
				    <tr class="text-center" 
				    	onclick="location.href='${pageContext.request.contextPath}/room/detail/${room.roomId}'" 
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
        <h3 class="mb-4"><i class="fas fa-dumbbell"></i> 부대시설</h3>
        <ul class="list-group">
            <li class="list-group-item"><i class="fas fa-check-circle"></i> 피트니스 센터 무료 이용</li>
            <li class="list-group-item"><i class="fas fa-calendar-alt"></i> 피트니스 센터는 매월 세 번째 수요일 정기 휴일입니다.</li>
            <li class="list-group-item"><i class="fas fa-swimmer"></i> 실내 수영장 무료 이용 (만 13세 이상 입장 가능)</li>
            <li class="list-group-item"><i class="fas fa-hot-tub"></i> 사우나 이용 시 유료</li>
            <li class="list-group-item"><i class="fas fa-parking"></i> 투숙 기간 내 무료 주차 가능</li>
        </ul>
    </div>

    <!-- 호텔 정보 섹션 -->
    <div class="hotel-info bg-light p-4 mt-5 rounded">
        <h3><i class="fas fa-hotel"></i> 호텔 정보</h3>
        <table class="table">
            <tr>
                <td>
                    <h4><i class="fas fa-utensils"></i> 조식 이용 안내</h4>
                    <ul class="list-unstyled">
                        <li>다이닝 존 (뷔페) : 07:30 ~ 10:30</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>
                    <h4><i class="fas fa-clock"></i> 체크인 / 체크아웃 시간</h4>
                    <ul class="list-unstyled">
                        <li>체크인 : 오후 2시 이후</li>
                        <li>체크아웃 : 오전 11시</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>
                    <h4><i class="fas fa-calendar-times"></i> 예약 취소/변경 및 No-Show 안내</h4>
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
</body>
</html>
