<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TIS ESCAPE</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" type="text/css" href="./css/Review.css">
<link rel="stylesheet" href="css/css.css">
<script type="text/javascript"> 
	$(document).ready(function() {
		$("#headers").load("TE_common/header.jsp");
		$("#footers").load("TE_common/footer.jsp");
		});
</script>
</head>
<body>
<div id="headers"></div>
<div id="wrap">
<header></header>
<section class="section_top" style=" background-image: url('./images/rsv_bg.png');">
	<div class="div_top">
		<c:forEach var="bean" items="${themeList}">
		<h1 class="h1_top">${bean.theme}</h1>
		<span class="span_top">Theme Detail</span>
		</c:forEach>
	</div>
</section>
 	
<section class="reviewList">
<c:forEach var="bean" items="${themeList}">
 <div class="div_rtTheme">
	<div class="div_rtImg"><img class="img_theme" src="./images/${bean.img}"></div>
	<div class="div_rtTitle"><font class="font_rtContent_title">&nbsp; 테마정보</font></div>
	<div class="div_rtRating">&nbsp;<img class="img_star" src="./images/star.png">&nbsp;&nbsp;평점 ${avg} / 5</div>
	<div class="div_rtDifficulty">&nbsp;<img class="img_difficulty" src="./images/ghost.png">&nbsp;&nbsp;난이도 ${bean.difficulty}</div>
	<div class="div_rtHeadcount">&nbsp;<img class="img_man" src="./images/man.png">&nbsp;&nbsp;추천인원수 ${bean.headcount}</div>
	<div class="div_rtContent"><font class="font_rtContent_title">테마소개</font><br><font class="font_rtContent">${bean.content}</font></div>
 </div>	
 <input type="hidden" id="theme" value="${bean.theme}">
</c:forEach>
<table class="rvTable">
<tr class="rvTh">
<th width="150px">닉네임</th><th width="500px">내용</th><th width="50px">별점</th>
</tr>
<c:forEach var="bean" items="${reviewList}">
<tr>
<td>${bean.name}</td><td>${bean.content}</td><td>${bean.rating}</td>
</tr>
</c:forEach>
<c:forEach var="bean" items="${reviewList}" end="0">
 <tr>
    <td colspan="7">
      <c:if test="${startpage>10}">
      	<a href="ReviewController?theme=${bean.theme}&pageNum=${startpage-10}">[Pre]</a>
      </c:if>
    
      <c:forEach var="i" begin="${startpage}" end="${endpage}" step="1">
       <c:choose>
       		<c:when test="${i==pageNum}"> <input type="button" class="pageselectedbutton" value="${i}">  </c:when>
       		<c:otherwise> <a href="ReviewController?theme=${bean.theme}&pageNum=${i}">
       			<input type="button" class="pagebutton" value="${i}"> </a> </c:otherwise>
       </c:choose>
      </c:forEach>
      
      <c:if test="${endpage<pagecount}">
       <a href="ReviewController?theme=${bean.theme}&pageNum=${startpage+10}">[Next]</a>
      </c:if>
    </td>
  </tr>
</c:forEach>
</table>
<div class="div_rvform">
<form action="ReviewInsertController">
 &nbsp;&nbsp;&nbsp;  예약번호 &nbsp;<input id="rscode" class="form_num" type="text">
 &nbsp;&nbsp;&nbsp;  닉네임 &nbsp;<input id="name" class="form_name" type="text"> &nbsp;&nbsp;&nbsp;

<div class="div_radio"> 
<br> &nbsp;&nbsp;&nbsp; 평점
 	<input id="rating" name="rating" type="radio" onclick="check('20%')" value="1">1점
 	<input id="rating" name="rating" type="radio" onclick="check('40%')" value="2">2점
 	<input id="rating" name="rating" type="radio" onclick="check('60%')" value="3">3점
 	<input id="rating" name="rating" type="radio" onclick="check('80%')" value="4">4점
 	<input id="rating" name="rating" type="radio" onclick="check('100%')" value="5" checked="checked">5점
 	&nbsp;
 	<span class="span_starRating">
    <span style="width: 100%" id="span_star"></span></span>&nbsp;&nbsp;<span></span>
</div>
 <br>
 &nbsp;&nbsp;&nbsp;  후기&nbsp;&nbsp;<input id="review" class="form_review" type="text">
<input class="form_button" onclick="reviewInsert()" type="button" value="후기 입력">
</form>
</div>
<div id="div_rvInsert"></div>
</section>
<footer></footer>
</div>
<script src="./js/Review.js" type="text/javascript"></script>
<div id="footers"></div>
</body>
</html>