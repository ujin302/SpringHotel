<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Spring Hotel Q&A</title>
	<link rel="stylesheet" href="/SpringHotel/resources/css/adminCSS.css">
</head>

<body>
	<%@ include file="../common/header.jsp" %>
	<div id="reserveTitle"><font size="20">Q&A</font></div>
	
	<table align="center" class="reserveInfo">
	    <tr align="center" id="list">
	        <td>NO</td>
	        <td>작성자</td>
	        <td>문의 유형</td>
	        <td>내용</td>
	        <td>작성일</td>
	    </tr>
	    
	    <c:choose>
	        <c:when test="${map2.list != null}">
	            <c:forEach items="${map2.list}" var="questionsDTO">
	                <tr align="center">
	                    <td>${questionsDTO.questionsId}</td>
	                    <td>${questionsDTO.writerId}</td> 
	                    <td>${questionsDTO.typename}</td>
	                    <td><a href="/SpringHotel/admin/inquiryDetail2?questionsId=${questionsDTO.questionsId}&writerId=${questionsDTO.writerId}&typename=${questionsDTO.typename}"><b>${questionsDTO.content}</b></a></td>
	                    <td>${questionsDTO.logtime}</td>
	                </tr>
	            </c:forEach>
	        </c:when>
	        <c:otherwise>
	            <tr>
	                <td colspan="5" align="center">작성된 글이 없습니다</td>
	            </tr>
	        </c:otherwise>
	    </c:choose>
	</table>
	
	<!-- 글쓰기 버튼 추가 -->
	<div style="text-align: center; margin-top: 20px;">
	    <a href="/SpringHotel/admin/inquiryWrite">
	        <button class="btn small-btn">글쓰기</button>
	    </a>
	</div>
</body>
</html>
