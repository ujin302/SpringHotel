<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Spring Hotel RoomInfo</title>
	<link rel="stylesheet" href="/SpringHotel/resources/css/adminCSS.css">
	<style>
		#updateBtn{
			margin:1% auto;
			background-color: #382f24;
   			width:110px;
   			height:50px;
    		border: none;
    		font-size:medium;
    		color:#f1ebd5;
		}
	</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div id="inquiryTitle"><font size="20">객실 정보 수정</font></div>
		
		<form action="roomUpdate" method="post">
			<table align="center" class="inquiryDetail">
				<tr>
					<td id="detail">객실 타입</td>
					<td align="center">
						<img src="../image/${dto.getRoomImg() }" width="300" height="250"><br />
						<input type="text" class="writeTitle" name="type" value="${dto.getType()}" readonly="readonly"  size="15"/>
					</td>
				</tr>
				<tr>
					<td id="detail">객실 크기(㎡)</td>
					<td>
						 <input type="text" class="writeTitle" name="size" value="${dto.getSize()}" required="required" pattern="[0-9]+" size="15"/>
					</td>
				</tr>
				<tr>
					<td id="detail">수용 인원(명)</td>
					<td>
						<input type="text" class="writeTitle" name="capacity" value="${dto.getCapacity()}" required="required" pattern="[0-9]+" size="15"/>
					</td>
				</tr>
				<tr>
					<td id="detail">금 액(원)</td>
					<td>
						<input type="text" class="price" name="price" onkeyup="inputNumberFormat(this)" value="${dto.getPrice()}" required="required" pattern="[0-9]+" size="15"/>
					</td>
				</tr>
				<tr>
					<td id="detail">객실 수(개)</td>
					<td>
						<input type="text" class="writeTitle" name="count" value="${dto.getCount()}" required="required" pattern="[0-9]+" size="15"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" name="roomId" value="${dto.getRoomId()}">
						<input type="submit" id="updateBtn" value="수정완료" />
					</td>
				</tr>
			</table>	
		</form>			
</body>
</html>