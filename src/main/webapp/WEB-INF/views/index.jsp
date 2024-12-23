<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring Hotel</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css">
<link rel="icon" href="${pageContext.request.contextPath}/resources/static/favicon.ico" type="image/x-icon">
</head>
<body>
	<jsp:include page="./common/header.jsp" />
	
	<div class="container" data-view="index">
		
		<div id="myCarousel" class="carousel slide" date-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1" ></li>
				<li data-target="#myCarousel" data-slide-to="2" ></li>				
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="${pageContext.request.contextPath}/resources/image/1.png">
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/resources/image/2.png">
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/resources/image/3.png">
				</div>			
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	
<jsp:include page="./common/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/SpringHotel/resources/js/bootstrap.js"></script>
<script src="/SpringHotel/resources/js/header.js"></script>
</body>
</html>
