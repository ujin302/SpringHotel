<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="/SpringHotel/resources/css/bootstrap.css">
<link rel="stylesheet" href="/SpringHotel/resources/css/custom.css">
<link rel="stylesheet" href="/SpringHotel/resources/css/footer.css">
<link rel="stylesheet" href="/SpringHotel/resources/css/reserveCSS.css">
<link rel="icon" href="${pageContext.request.contextPath}/resources/static/favicon.ico" type="image/x-icon">
<title>Spring Hotel</title>
<style type="text/css">
a {
	text-decoration: none;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	
	<div class="container" data-view="reservationList">
		<div class="card mb-3" >
			<img class="col-md-6" src="https://kr.object.ncloudstorage.com/springhotel/storage/${reserveDTO.room.roomImg.imageFileName}" width="450px" class="card-img-top" alt="">
			<div class="room-details bg-light p-5 rounded shadow-sm">
				<div class="row roomInfo">
					<div class="col-md-6">
						<p><i class="fa fa-calendar"></i> 체크인: ${reserveDTO.checkin} 14:00</p>
	                    <p><i class="fa fa-calendar"></i> 체크아웃: ${reserveDTO.checkout} 11:00</p>
	                    <p><i class="fas fa-users"></i> 어른: ${reserveDTO.adults}인</p>
	                    <p><i class="fas fa-users"></i> 어린이: ${reserveDTO.kids}인</p>
	                    <p><i class="fas fa-users"></i> 투숙 인원: ${reserveDTO.adults + reserveDTO.kids}인</p>
	                    <p><i class="fas fa-money-bill-wave"></i> 총 금액: ₩ ${reserveDTO.price}</p>
	                    <p><i class="fas fa-money-bill-wave"></i> 객실 정보: ${reserveDTO.room.view}</p>
	                    <p><i class="fas fa-expand-arrows-alt"></i> 객실 면적: ${reserveDTO.room.size} m²</p>
               		</div>
           		</div>
          	</div>
		</div>
	</div>
	
<jsp:include page="../common/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="/SpringHotel/resources/js/bootstrap.js"></script>
<script src="/SpringHotel/resources/js/header.js"></script>
</body>
</html>