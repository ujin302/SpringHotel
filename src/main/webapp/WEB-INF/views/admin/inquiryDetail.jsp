<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Spring Hotel Q&A 상세내역</title>
	<link rel="stylesheet" href="/SpringHotel/resources/css/inquiryCSS.css?ver=1">
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
	<%@ include file="header.jsp" %>
	<br/><br />
	&nbsp;&nbsp;&nbsp; <font size="20">Q&A<br /></font>
	
	<div id="detailcomment">
		Spring Hotel은 언제나 고객님의 목소리에 귀기울이고 있습니다.<br />
		고객님들의 소중한 충고와 격려, 또는 제안의 말씀을 주시면 더 나은 서비스로 보답하겠습니다.
	</div>
	
	<form action="">
		<table align="center" class="inquiryDetail">
			<tr>
				<td id="detail">제목</td>
				<td>
					${dto.getB_title()}
					<input type="hidden" name="b_title" value="${dto.getB_title()}" />
				</td>
				<td id="detail">번호</td>
				<td>
					${dto.getB_number()}
					<input type="hidden" name="b_number" value="${dto.getB_number()}" />
				</td>
			</tr>
			<tr>
				<td id="detail">작성자</td>
				<td>
					${dto.getB_writer()}
					<input type="hidden" name="b_writer" value="${dto.getB_writer()}" />
				</td>
				<td id="detail">작성일</td>
				<td>
					${dto.getB_time()}
					<input type="hidden" name="b_time" value="${dto.getB_time()}"  />
				</td>
	
			</tr>
			<tr>
				<td id="detailcontent">내용</td>
				<td colspan="3">
					<textarea rows="5" cols="40" id="detailtextarea" readonly="readonly" name="b_content">${dto.getB_content()}</textarea>
				</td>
			</tr>
			<tr align="center">
				<td colspan="4">
				<input type="submit" id="btn" value="수정" />
				<input type="button" id="btn" value="삭제"  onclick="location.href='inquiryremove?b_number=${dto.getB_number()}'" />
				<input type="button" id="btn" value="목록" onclick="location.href='/SpringHotel/admin/inquiryList'" />
				</td>
			</tr>
		</form>
			<tr>
				<td colspan="4" id="commentWrite">
					<form action="CommentWrite" method="post">
						<textarea rows="6" cols="100" name="c_comment" required="required" placeholder="댓글을 작성해주시길 바랍니다."></textarea>
						<input type="hidden" name="b_number" value="${dto.getB_number()}">
						<input type="hidden" name="c_writer" value="${dto.getB_writer()}">
						<input type="submit" value="댓글 작성" id="commentWriteBtn" />
					</form>
				</td>
			</tr>
		</table>
	
</body>
</html>