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
			
			<!-- 예약 화면 -->
			<div id="menu2">
				<table width="80%" align="center" class="reserve table">
					<thead>
						<tr align="center" id="colName" style="color:#a0a0a0; font-weight:bold;">
							<td>체크인</td>
							<td>체크아웃</td>
							<td width="10%" align="center"><img src="/SpringHotel/resources/image/night.png" width="30" height="30"></td>
							<td width="10%">성인</td>
							<td width="10%">어린이</td>
						</tr>
					</thead>
					<tbody>
						<!-- <tr id="calVal" align="center">
							<td><input type="date" id="checkin" name="checkin" min='' pattern="yyyy-MM-dd" /></td>
							<td><input type="date" id="checkout" name="checkout" min=''  pattern="yyyy-MM-dd" /></td>
							<td><input type="text" id="diffday" min="1" value="" readonly/></td>
							<td><input type="number" id="adults" name="adults" min="1" value="1"/></td>
							<td><input type="number" id="kids" name="kids" value="0" min="0" /></td>
							<td><input type="button" class="btn" id="findRoomBtn" value="검색"></td>
						</tr> -->
					</tbody>
					<tfoot>
						<tr align="center">
							<td colspan="6">
								<div class="card mb-3" >
										<img class="col-md-6" src="https://kr.object.ncloudstorage.com/springhotel/storage/${roomDTO.roomImg.imageFileName}" width="450px" class="card-img-top" alt="">
										<div class="room-details bg-light p-5 rounded shadow-sm">
											<h3 class="card-title">${roomDTO.type }</h3>
											<div class="row roomInfo">
												<div class="col-md-6">
													<p><i class="fas fa-expand-arrows-alt"></i>크기: ${roomDTO.size} m²</p>
								                    <p><i class="fas fa-users"></i> 어른: ${roomDTO.capacity}인</p>
								                    <p><i class="fas fa-users"></i> 아이: ${roomDTO.capacity}인</p>
								                    <p><i class="fas fa-money-bill-wave"></i> 가격: ₩${roomDTO.price}</p>
						                		</div>
								                <div class="col-md-6">
								                    <p><i class="fas fa-info-circle"></i> 설명: ${roomDTO.description}</p>
								                    <p><i class="fas fa-couch"></i> 구성: ${roomDTO.form}</p>
								                    <p><i class="fas fa-mountain"></i> 전망: ${roomDTO.view}</p>
								                    <p><i class="fas fa-bed"></i> 침대 유형: ${roomDTO.bedtype}</p>
								                    <p align="right"><button type="button" class="btn btn-primary reserveBtn">예약<span hidden>${roomDTO.roomId }</span></button></p>
								                </div>
						            		</div>
							          	</div>
									</div>
							</td>
						</tr>				
					</tfoot>
				</table>
			</div>
		</div>
	</div>
	
<jsp:include page="../common/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="/SpringHotel/resources/js/bootstrap.js"></script>
<script src="/SpringHotel/resources/js/header.js"></script>
<script src="/SpringHotel/resources/js/reservation.js"></script>
</body>
</html>