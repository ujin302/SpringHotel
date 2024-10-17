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
<title>Spring Hotel</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
		<form>
			<table id="joinTable" class="log">
				<tr>
					<th id="title" colspan="2">회원가입</th>
				</tr>
				<tr align="center">
					<td colspan="2">
						<p id="welcomText">
							Spring Hotel에 오신 것을 진심으로 환영합니다.<br />
							※ 모든 항목에 개인정보를 입력해주시기를 바랍니다
						</p>
					</td>
				</tr>
				<tr align="center">
				<th><label for="userid">아이디: </label></th>
					<td>
						<input type="text" id="userid" name="userid" size="35" class="input" placeholder="아이디 입력"/>
						<div id="idDiv"></div>
					</td>
				</tr>
				<tr align="center">
					<th><label for="pwd">비밀번호: </label></th>
					<td>
						<input type="password" id="pwd" name="pwd" size="35" class="input" placeholder="비밀번호 입력"/>
						<div id="pwdDiv"></div>
					</td>
				</tr>
				<tr align="center">
					<th><label for="email">이메일: </label></th>
					<td>
						<input type="email" id="email" name="email" size="35" class="input" placeholder="이메일 입력"/>
						<div id="emailDiv"></div>
					</td>
				</tr>
				<tr align="center">
					<th><label for="email">성별: </label></th>
					<td>
						<input type="radio" name="gender" value="남" checked="checked">남자
						<input type="radio" name="gender" value="여">여자
					</td>
				</tr>
				<tr align="center">
					<th><label for="email">성별: </label></th>
					<td>
						<input type="radio" name="gender" value="남" checked="checked">남자
						<input type="radio" name="gender" value="여">여자
					</td>
				</tr>
				<tr align="center">
					<td colspan="2"><input id="joinBtn" type="button" value="회원가입" onclick="location.href='/SpringHotel/user/join'" class="btn"/></td>
				</tr>
			</table>
		</form>
	</div>
<jsp:include page="../common/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="/SpringHotel/resources/js/bootstrap.js"></script>
<script src="/SpringHotel/resources/js/header.js"></script>
</body>
</html>