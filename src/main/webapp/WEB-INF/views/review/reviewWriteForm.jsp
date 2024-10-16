<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/review.css">
</head>
<body>

<h2>리뷰 작성</h2>

<form action="${pageContext.request.contextPath}/review/insertReview" method="post">
    <!-- 객실 ID 입력 -->
    <label for="roomId">Room ID:</label>
    <input type="text" id="roomId" name="roomId" required /><br/><br/>
    
    <!-- 사용자 ID 입력 -->
    <label for="userId">User ID:</label>
    <input type="text" id="userId" name="userId" required /><br/><br/>
    
    <!-- 평점 입력 (1~5 범위) -->
    <label for="rating">Rating:</label>
    <input type="number" id="rating" name="rating" min="1" max="5" required /><br/><br/>
    
    <!-- 리뷰 코멘트 입력 -->
    <label for="comment">Comment:</label>
    <textarea id="comment" name="comment" rows="4" cols="50" required></textarea><br/><br/>
    
    <!-- 리뷰 제출 버튼 -->
    <button type="submit">리뷰 작성</button>
</form>


<input type="button" value="List" onclick="window.location.href='${pageContext.request.contextPath}/review/reviewList';">
<input type="button" value="Index" onclick="window.location.href='${pageContext.request.contextPath}/';">



</body>
</html>