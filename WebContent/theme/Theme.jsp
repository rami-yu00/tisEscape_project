<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TIS ESCAPE</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="css/css.css">
<link rel="stylesheet" type="text/css" href="./css/Theme.css">
<script type="text/javascript"> 
	$(document).ready(function() {
		$("#headers").load("TE_common/header.jsp");
		$("#footers").load("TE_common/footer.jsp");
		});
</script>
</head>
<body>
<div id="headers"></div>
 <div id ="wrap">
 	<header></header>
 	<section class="section_top" style=" background-image: url('./images/rsv_bg.png');">
	<div class="div_top">
		<h1 class="h1_top">테마</h1>
		<span class="span_top">Theme List</span>
	</div>
	</section>
 	<section class="section_theme">
 <c:forEach  var="bean" items="${list}" varStatus="vs">
	<div class="div_theme">
	  <div class="div_img"><a href="ReviewController?theme=${bean.theme}"><img class="img_theme" src="./images/${bean.img}"></img></a></div>
	  <div class="div_title"><a class="a_theme" href="ReviewController?theme=${bean.theme}">&nbsp;${bean.theme}</a></div>
	  <div class="div_rating"><img class="img_star" src="./images/star.png">&nbsp;${avg[vs.index].avg} / 5 </div>
	  <div class="div_headcount"><img class="img_man" src="./images/man.png">&nbsp;추천인원수 ${bean.headcount}</div>
	  <div class="div_review"><img class="img_review" src="./images/review.png">
	  <a href="ReviewController?theme=${bean.theme}" style="color:#900; background-color:rgba(0,0,0,0);">&nbsp;&nbsp;리뷰</a>
	  </div>
	  <div class="div_difficulty"><img class="img_difficulty" src="./images/ghost.png">&nbsp;난이도 ${bean.difficulty}</div>
	  <div class="div_button">	
	    <button id="open${vs.index}" class="button_content">테마설명</button>&nbsp;
	    <button class="button_reservation" onclick="location.href='reservation.do'">예약하기</button>
	  </div>
	 <div id ="modal${vs.index}">
		<div class="overlay"></div>
		  <div class="content">
		  	<h1>${bean.theme}</h1><br>
			${bean.content} 
		  </div>	
	  </div>
 <script type="text/javascript">
 $('#modal${vs.index}').hide();
 $('#open${vs.index}').click(function() {
	$('#modal${vs.index}').show();
});
 $('.overlay').click(function() {
	$('#modal${vs.index}').hide();
});
 </script>
    </div>
</c:forEach>
 	</section>
 	
 	<footer></footer>
 	 
 </div>
<div id="footers"></div>
</body>
</html>