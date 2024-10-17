<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#reservation #menu1 {
	margin: 6% 0;
	font-size: 25px;
}

#reservation #menu1 .nav-tabs {
	padding-left: 5%;
}
</style>
<div id="reservation">
	<div id="menu1">
		<ul class="nav nav-tabs">
		  <li class="nav-item" id="m1">
		    <a class="nav-link" href="#">날짜, 인원 선택</a>
		  </li>
		  <li class="nav-item" id="m2">
		    <a class="nav-link" href="#">객실정보</a>
		  </li>
		  <li class="nav-item" id="m3">
		    <a class="nav-link" href="#">예약정보</a>
		  </li>
		</ul>
	</div>
	<div id="menu2">
		<table width="80%" align="center" class="reserve1">
			<tr align="center" style="color:#a0a0a0; font-weight:bold;">
				<td>체크인</td>
				<td>체크아웃</td>
				<td width="10%" align="center"><img src="img/night.png" width="30" height="30"></td>
				<td width="10%">성인</td>
				<td width="10%">어린이</td>
			</tr>
			<tr align="center">
				<td><input type="date" id="checkin" name="checkin" min='' pattern = "yyyy-MM-dd" /></td>
				<td><input type="date" id="checkout" name="checkout" min=''  pattern = "yyyy-MM-dd" /></td>
				<td><input type="number" id="adults" name="adults" min="1" value="1"/></td>
				<td><input type="number" id="kids" name="kids" value="0" min="0" /></td>
				<td><input type="button" value="검색" id="btn" onclick="submitForm()"/></td>
			</tr>
			<tr align="center">
				<td colspan="5">예약을 원하는 날짜,인원을 선택해주세요</td>
			</tr>
		</table>
	</div>
</div>
		<div class="card mb-3">
		  <img src="/SpringHotel/resources/image/1.png" width="400px" class="card-img-top" alt="">
		  <div class="card-body">
		    <h5 class="card-title">Card title</h5>
		    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
		    <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
		  </div>
		</div>
		
		
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