<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
/* 메뉴1 */
#reservation #menu1 {
	margin: 5% 0;
	font-size: 25px;
}

#reservation #menu1 .nav-tabs {
	padding-left: 5%;
}

#reservation #menu1 .nav-tabs .nav-link {
	color: #382f24;
}
/* 메뉴2 */
#reservation #menu2 .table {
	border: none;
}
#reservation #menu2 .btn {
	background-color: #ded3c5;
	color: #382f24;
	height: 30px;
}
#reservation #menu2 .btn:hover {
	background-color: #382f24;
	color: white;
}
#reservation #menu2 .table tbody {
	height: 100px;
}
#reservation #menu2 .table tbody #calVal {
	border-bottom: 7px solid #f2f1f0;
}
#reservation #menu2 .table tbody #calVal input {
	margin-top: 30px;
}
#reservation #menu2 .table tfoot tr {
	height: 500px;
	border: none;
}
#reservation #menu2 .table tfoot #noData {
	margin-top: 10%;
    text-align: center; /* 텍스트 가운데 정렬 */
}
#reservation #menu2 .table tfoot #roomList {
	margin-top: 2%;
}
</style>
<div id="reservation" data-menu="${menuNum}">
	<div id="menu1">
		<ul class="nav nav-tabs">
		  <li class="nav-item" id="m1">
		    <a class="nav-link" href="#">날짜&인원 선택</a>
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
				<tr id="calVal" align="center">
					<td><input type="date" id="checkin" name="checkin" min='' pattern="yyyy-MM-dd" /></td>
					<td><input type="date" id="checkout" name="checkout" min=''  pattern="yyyy-MM-dd" /></td>
					<td><input type="text" id="diffday" min="1" value="" readonly/></td>
					<td><input type="number" id="adults" name="adults" min="1" value="1"/></td>
					<td><input type="number" id="kids" name="kids" value="0" min="0" /></td>
					<td><input type="button" class="btn" id="findRoomBtn" value="검색"></td>
				</tr>
			</tbody>
			<tfoot>
				<c:if test="${menuNum == 1}">
					<tr align="center">
						<td colspan="6">
							<div id="noData">
								예약을 원하는 날짜,인원을 선택해주세요.
							</div>
						</td>
					</tr>
				</c:if>
				<c:if test="${menuNum == 2}">
					<tr>
						<td colspan="6">
							<div id="roomList">
								<div class="card mb-3">
								  <img src="/SpringHotel/resources/image/1.png" width="400px" class="card-img-top" alt="">
								  <div class="card-body">
								    <h5 class="card-title">Card title</h5>
								    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
								    <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
								  </div>
								</div>
							</div>
						</td>
					</tr>
				</c:if>
			</tfoot>
		</table>
	</div>
</div>