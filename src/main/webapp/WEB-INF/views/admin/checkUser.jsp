<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Spring Hotel 회원 조회 </title>
	<link rel="stylesheet" href="/SpringHotel/resources/css/adminCSS.css">
</head>

<body>
	<%@ include file="header.jsp" %>
	<div id="reserveTitle"><font size="20">회원 조회</font></div>
	
				
					<table align="center" class="reserveInfo">
						<tr align="center" id="list">
							<td>성함</td>
							<td>ID</td>
							<td>PWD</td>
							<td>전화번호</td>
							<td>e-mail</td>
						</tr>
					<c:if test="${dto.size() != 0 }">
						<c:forEach items="${dto }" var="dto">
							<tr align="center">
								<td>${dto.getName() }</td>
								<td>${dto.getUserId() }</td>
								<td>${dto.getPwd() }</td>
								<td>${dto.getTel1 }</td>
								<td>${dto.getEmail() }</td>
							</tr>
						</c:forEach>
						
					</c:if>
					<c:if test="${dto.size()== 0 }">
						<tr>
							<td colspan="5" align="center">가입한 회원이 존재하지 않습니다</td>
						</tr>
					</c:if>
					</table>
</body>
</html>