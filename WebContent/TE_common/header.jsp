<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title></title>
<link href="../css/css.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="headerbg">
	<div class="wrapper">
	<div class="logocontainer">
		<ul id="logo_menu">
			<li style="background-color:rgba(0,0,0,0);">
			<img src="http://localhost:8080/TisEscape/images/logo.png" onclick="javascript:location.href='http://localhost:8080/TisEscape/index.jsp';" class="logoimg">
			</li>
		</ul>
	</div>
	<div class="menubar">
		<div class="menugroup">
			<ul id="main_menu">
				<li><a href="http://localhost:8080/TisEscape/index.jsp">홈</a></li>
				<li><a href="http://localhost:8080/TisEscape/ThemeController">테마보기</a> </li>
				<li><a href="http://localhost:8080/TisEscape/reservation.do">예약하기</a>
					<ul class="sub_menu">
						<li><a href="http://localhost:8080/TisEscape/reservationSearch.do">예약확인</a></li>
					</ul>
				</li>
				<li><a href="QnAlist.do">QnA</a></li>
			</ul>
		</div>
		<div class="menugroup">
			<c:choose>
    			<c:when test="${sessionScope.loginid eq null}">
					<ul id="hidden_menu">
						<li class="li_hidden"><a href="http://localhost:8080/TisEscape/TE_admin/login.jsp">&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul id="main_menu">
						<li><a href="http://localhost:8080/TisEscape/reservelist.do">예약현황</a></li>
						<li><a href="http://localhost:8080/TisEscape/logout.do">로그아웃</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	</div>
</div>
</body>
</html>