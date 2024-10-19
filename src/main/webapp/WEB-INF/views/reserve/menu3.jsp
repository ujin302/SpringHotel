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
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	
	<div class="container" data-view="reservation" data-menu="3">
	
		<!-- 메인 메뉴 -->
		<div id="reservation">
			<!-- 예약 순서 --> 
			<jsp:include page="./menu.jsp"/>
			${reserveDTO }
			<%-- ${reserveDTO.roomDTO.roomImg.imageFileName} --%>
			<!-- 예약 화면 -->
			<div id="menu2">
				<table width="80%" align="center" class="reserve table">
					<thead>
						<tr align="center" id="colName" style="color:#a0a0a0; font-weight:bold;">
							<div class="card mb-3" >
								<img class="col-md-6" src="https://kr.object.ncloudstorage.com/springhotel/storage/${reserveDTO.room.roomImg.imageFileName}" width="450px" class="card-img-top" alt="">
								<div class="room-details bg-light p-5 rounded shadow-sm">
									<h3 class="card-title">${roomDTO.type }</h3>
									<div class="row roomInfo">
										<div class="col-md-6">
											<p><i class="fas fa-expand-arrows-alt"></i> 체크인: ${reserveDTO.checkin}</p>
						                    <p><i class="fas fa-users"></i> 체크아웃: ${reserveDTO.checkout}</p>
						                    <p><i class="fas fa-users"></i> 어른: ${reserveDTO.adults}인</p>
						                    <p><i class="fas fa-users"></i> 어린이: ${reserveDTO.kids}인</p>
						                    <p><i class="fas fa-users"></i> 투숙인원: ${reserveDTO.adults + reserveDTO.kids}인</p>
						                    <p><i class="fas fa-money-bill-wave"></i> 총 금액: ₩ ${reserveDTO.price}</p>
						                    <p><i class="fas fa-money-bill-wave"></i> 객실 정보: ${reserveDTO.room.view}</p>
						                    <p><i class="fas fa-money-bill-wave"></i> 객실 면적: ${reserveDTO.room.view}</p>
				                		</div>
				            		</div>
					          	</div>
							</div>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	
	
	<table width="80%" align="center" class="reserveOption">
			<!-- <tr height="15%">
				<th colspan="4" align="center"><font size="5">예약정보</font></th>
			</tr>
			<tr id="line">
				<td align="center" id="line"><img src="img/.jpg" width="280" height="200"></td>
				<td colspan="3" id="line">
					<table width="100%">
						<tr align="left">	
							<td>
								예약 객실 : <b></b>
							</td>
							<td>
								체크인날짜 : <b></b>
							</td>
						</tr>
						<tr align="left">
							<td>
								체크아웃 날짜 : <b></b>
							</td>
							<td>
								성인 투숙객 수 : <b></b>명
							</td>
						</tr>
						<tr align="left">
							<td>
								아동 투숙객 수 : <b></b>명
							</td>
							<td> 
								총 금액 : <input type="number" name="r_price" id="input" readonly="readonly" value="" />원
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr id="line">
				<td colspan="4" align="center" id="line">
					<input type="button" id="btn" value="예약하기" onclick="location.href='reservationProc.jsp?r_id='"/>
				</td>
			</tr> -->
<jsp:include page="../common/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="/SpringHotel/resources/js/bootstrap.js"></script>
<script src="/SpringHotel/resources/js/header.js"></script>
<script src="/SpringHotel/resources/js/reservation.js"></script>
</body>
</html>