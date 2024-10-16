<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="/SpringHotel/resources/css/bootstrap.css">
<link rel="stylesheet" href="/SpringHotel/resources/css/custom.css">
<link rel="stylesheet" href="/SpringHotel/resources/css/joinCSS.css">
<title>호텔 예약 시스템</title>
</head>
<body>
	<div id="viewName" hidden="">join</div>
	<jsp:include page="../common/header.jsp" />
	<div class="container">
	  	<form>
			<table align="center" class="joinform" style="background-color: #EEEEEE;">
				<tr>
					<td colspan="2" align="center" id="comment">
						C&S 호텔에 오신 것을 환영합니다.<br/>
						※ 모든 항목에 개인정보를 입력해주시기를 바랍니다
					</td>
				</tr>
				<tr>
					<td colspan="2">아이디</td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" name="userID" size="30" placeholder="아이디" />
	
					</td>
				</tr>
				<tr>
					<td colspan="2">비밀번호</td>
				</tr>
				<tr>
					<td colspan="2"><input type="password" name="userPW" size="30"/></td>
				</tr>
				<tr>
					<td colspan="2">성함</td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" name="userName" size="30" placeholder="${userDTO.name }"/></td>
				</tr>
	
				<tr>
					<td colspan="2">E-mail</td>
				</tr>
				<tr>
					<td colspan="2"><input type="email" name="userEmail" placeholder="${userDTO.email }" size="30"></td>
				</tr>
				<tr>
					<td colspan="2">전화번호</td>
				</tr>
				<tr>
					<td colspan="2"><input type="tel" name="userPhone" placeholder="${userDTO.tel2 }" size="30"></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="button" value="회원가입" class="btn" />
					</td>
				</tr>
			</table>
		</form>
	</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/SpringHotel/resources/js/bootstrap.js"></script>
<script src="/SpringHotel/resources/js/header.js"></script>
</body>
</html>