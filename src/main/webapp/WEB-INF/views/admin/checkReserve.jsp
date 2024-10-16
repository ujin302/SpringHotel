<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Spring Hotel 예약 내역 조회</title>
	<link rel="stylesheet" href="/SpringHotel/resources/css/adminCSS.css">
</head>

<body>
	<%@ include file="header.jsp" %>
	<div id="reserveTitle"><font size="20">예약 내역</font></div>
	

	<table align="center" class="reserveInfo">
		<tr align="center" id="list">
			<td>NO</td>
			<td>ID</td>
			<td>성인 투숙객 수(명)</td>
			<td>어린이 투숙객 수(명)</td>
			<td>체크인</td>
			<td>체크아웃</td>
			<td>객실</td>
			<td>금액(원)</td>
			<td>예약시간</td>
		</tr>
				
		<c:choose>
			<c:when test="${result.size() != 0 }">
				<c:forEach items="${result }" var="dto">
					<tr align="center">
						<td>${dto.getReserveId() }</td>
						<td>${dto.getRoomId() }</td>
						<td>${dto.getAdults() }</td>
						<td>${dto.getKids() }</td>
						<td>${dto.getCheckin() }</td>
						<td>${dto.getCheckout() }</td>
						<td>${dto.getType() }</td>
						<td><fmt:formatNumber value="${dto.getPrice()}" pattern="#,###" />원</td>
						<td>${dto.getTime() }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr align="center"><td colspan="9" align="center">예약 내역이 존재하지 않습니다</td></tr>
			</c:otherwise>
		</c:choose>
						
	</table>
			
</body>
</html>