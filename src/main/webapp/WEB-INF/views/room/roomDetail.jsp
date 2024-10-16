<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Room Detail</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
    <!-- Font Awesome CSS (아이콘 사용을 위한 링크) -->
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@400;700&family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/roomDetail.css">
</head>
<body>
<input type="button" value="Index" class="btn btn-light" onclick="window.location.href='${pageContext.request.contextPath}/';">

<div class="container mt-5">
    <h2 class="text-center"><i class="fas fa-bed"></i> ${room.type} 상세 정보</h2>
    
    <!-- 객실 이미지 -->
    <div class="room-images mt-5">
        <h4><i class="fas fa-images"></i> 객실 이미지</h4>
        <div class="row">
            <c:forEach var="image" items="${roomImages}">
                <div class="col-md-4 mb-3">
                    <img src="${pageContext.request.contextPath}/resources/images/${image.imageFileName}" 
                    	alt="${image.imageOriginalFileName}" 
                    	class="img-fluid">
                </div>  
            </c:forEach>
        </div>
    </div>
    
    <!-- 객실 정보 -->
    <div class="room-details">
        <p><i class="fas fa-expand-arrows-alt"></i> 크기: ${room.size} m²</p>
        <p><i class="fas fa-users"></i> 수용 인원: ${room.capacity}명</p>
        <p><i class="fas fa-money-bill-wave"></i> 가격: ${room.price} ₩</p>
        <p><i class="fas fa-info-circle"></i> 설명: ${room.description}</p>
        <p><i class="fas fa-couch"></i> 구성: ${room.form}</p>
        <p><i class="fas fa-mountain"></i> 전망: ${room.view}</p>
        <p><i class="fas fa-bed"></i> 침대 유형: ${room.bedtype}</p>
    </div>
</div>

<!-- jQuery and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
