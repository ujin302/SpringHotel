<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>    
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
/* 	 //로그인 하지 않았을 시 로그인 페이지로 이동
		if(session.getAttribute("userID")==null){
		response.sendRedirect("login.jsp");
	}

	// 오늘 날짜를 나타내는 변수 생성
	Date today = new Date();
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String now = simpleDateFormat.format(today); */
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>Spring Hotel</title>
<link rel="stylesheet" href="/SpringHotel/resources/css/bootstrap.css">
<link rel="stylesheet" href="/SpringHotel/resources/css/custom.css">
<link rel="stylesheet" href="/SpringHotel/resources/css/reserveCSS.css">
<style>
#btn{
	margin-top:15px;
	margin-bottom:15px;
	background-color: #382f24;
	width:120px;
	height:50px;
	border: none;
	font-size:medium;
	color:#f1ebd5;
}
</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	
	
	<div class="container" data-view="reservation1">
		<jsp:include page="menu.jsp" />
		<table width="80%" align="center" class="reserve1">
			<tr align="center" style="color:#a0a0a0; font-weight:bold;">
				<td>체크인</td>
				<td>체크아웃</td>
				<td width="10%">성인</td>
				<td width="10%">어린이</td>
			</tr>
			<tr align="center">
				<td><input type="date" id="r_checkin" name="r_checkin" min='' pattern = "yyyy-MM-dd" /></td>
				<td><input type="date" id="r_checkout" name="r_checkout"  pattern = "yyyy-MM-dd" /></td>
				<td><input type="number" id="r_adults" name="r_adults" min="1" value="1"/></td>
				<td><input type="number" id="r_kids" name="r_kids" value="0" min="0" /></td>
				<td><input type="submit" value="검색" id="btn" onclick="submitForm()"/></td>
			</tr>
			<script>
				function submitForm() {
				  var r_checkin = new Date(document.getElementById("r_checkin").value);
				  var r_checkout = new Date(document.getElementById("r_checkout").value);
				  
				  // 날짜 간의 차이 계산
				  var timeDiff = r_checkout.getTime() - r_checkin.getTime();
				  var diffday = Math.ceil(timeDiff / (1000 * 3600 * 24));
				  
				  var r_adults = document.getElementById("r_adults").value;
				  var r_kids = document.getElementById("r_kids").value;
				  
				  var url = "reservation2.jsp?";
				  url += "&r_checkout=" + encodeURIComponent(r_checkout.toISOString());
				  url += "&r_adults=" + r_adults;
				  url += "&r_kids=" + r_kids;
				  url += "&diffday=" + diffday;
				  
				  location.href = url;
				}
			</script>
			<tr align="center">
				<td colspan="5">예약을 원하는 날짜,인원을 선택해주세요</td>
			</tr>
		</table>
	</div>

<table width="80%" align="center" class="reserve1">
			<tr align="center" id="list1" style="color:#a0a0a0; font-weight:bold;">
				<td>체크인</td>
				<td>체크아웃</td>
				<td width="10%" align="center"><img src="img/night.png" width="30" height="30"></td>
				<td width="10%" >성인</td>
				<td width="10%">어린이</td>
			</tr>
			<tr align="center">
				<td><input type="date" name="r_checkin" min=""  pattern = "yyyy-MM-dd"/></td>
				<td><input type="date" name="r_checkout" pattern = "yyyy-MM-dd"/></td>
				
				<td><input type="number" name="diffday" size="10" readonly="readonly"/></td>
				<td><input type="number" name="r_adults" size="10" min="1""/></td>
				<td>
					<input type="number" name="r_kids" size="10" min="0"/>
				</td>
				<td><input type="submit" id="btn" value="검색" onclick="location.href='reservation2.jsp'"/></td>
			</tr>
		</table>
		
		<table width="80%" align="center" class="reserveOption">
			<tr height="15%">
				<th colspan="4" align="center"><font size="5">예약정보</font></th>
			</tr>
			<tr id="line">
				<td align="center" id="line"><img src="img/1.jpg" width="280" height="200"></td>
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
					<input type="button" id="btn" value="예약하기" onclick="location.href='reservationProc.jsp'"/>
				</td>
			</tr>
		</table>
<jsp:include page="../../common/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="/SpringHotel/resources/js/bootstrap.js"></script>
<script src="/SpringHotel/resources/js/header.js"></script>
<script src="/SpringHotel/resources/js/reservationMenu.js"></script>
</body>
</html>