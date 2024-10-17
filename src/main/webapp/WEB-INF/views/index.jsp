<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring Hotel</title>
<link rel="stylesheet" href="/SpringHotel/resources/css/bootstrap.css">
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
         	<button type="button" class="navbar-toggle collapsed"
            	data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
            	aria-expanded="false">
            	<span class="icon-bar"></span>
            	<span class="icon-bar"></span>
            	<span class="icon-bar"></span>
         	</button>
         	<a class="navbar-brand" href="${pageContext.request.contextPath}/">Spring Hotel</a>
     	 </div>
     	  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
         	<ul class="nav navbar-nav">
            	<li class="active"><a href="${pageContext.request.contextPath}/">HOME</a></li>
            	 <li><a href="${pageContext.request.contextPath}/room/roomView">객실 정보</a></li>
               <li><a href="reservation1.jsp">예약</a></li>
               <li><a href="reserveInfo.jsp">예약내역</a></li>
               <li><a href="inquiryList.jsp">Q&A</a></li>

            </ul>
            <ul class="nav navbar-nav navbar-right">
            	<li class="dropdown">
               		<a href="#" class="dropdown-toggle"
                  		data-toggle="dropdown" role="button" aria-haspopup="true"
                  		aria-expanded="false">접속하기<span class="caret"></span></a>
           			<ul class="dropdown-menu">
                	  	<li class="active"><a href="login.jsp">로그인</a></li>
                  		<li><a href="join.jsp">회원가입</a></li>
               		</ul>
            	</li>
         	</ul>
     	 </div> 
	</nav>

	<a href="/SpringHotel/user/login">로그인</a>
	${state }
	
</body>
</html>
