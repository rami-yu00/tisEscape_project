<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 제이쿼리 ui css --%><%--
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> --%>
<%-- 예약페이지 style css --%><%-- 
<link rel="stylesheet" type="text/css" href="css/reservation.css"/>--%>
<%-- 제이쿼리 js --%><%--
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
<%-- 제이쿼리 ui js --%><%-- 
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/datepicker-ko.js"></script>--%>
<style type="text/css">
	.nav_btm_line { position: absolute; box-sizing: border-box; width: 50%;  height: 55px; left: 0px; top: 0px; border: 8px solid darkred; border-radius: 2px; display: block;
   box-shadow: 0 10px 10px rgb(0 0 0 /20%), 0 6px 6px rgb(0 0 0 /10%); }
	#loading{ position: fixed; z-index: 1001; width: 100%; height: 100%; }
</style>
</head>
<body>
	<c:forEach var="theme_list" items="${tm_list}" >
			<div class="tm_title"><span>${theme_list.theme}</span><span>난이도:⚠⚠⚠⚠⚠ 인원:2명~5명</span></div>
			<div class="tm_box">
				<div class="tm_box_img tm01_img"><img src="./storage/${theme_list.img }"/></div>
				<div class="tm_box_picker tm01_rsvbox">
					<a class="stop" id="PK${param_rscode_date}-${theme_list.tmcode}h1" href="javascript:void(0);" onclick="javascript:getStap2Modal('${param_rscode_date}','${theme_list.tmcode}','h1','${theme_list.theme}','${theme_list.h1}',${theme_list.price},'${theme_list.img }');">
							<span>${theme_list.h1}</span> <span class="state">예약가능</span>
					</a>
					<a class="stop" id="PK${param_rscode_date}-${theme_list.tmcode}h2" href="javascript:void(0);" onclick="javascript:getStap2Modal('${param_rscode_date}','${theme_list.tmcode}','h2','${theme_list.theme}','${theme_list.h2}',${theme_list.price},'${theme_list.img }');">
							<span>${theme_list.h2}</span> <span class="state">예약가능</span>
					</a>
					<a class="stop" id="PK${param_rscode_date}-${theme_list.tmcode}h3" href="javascript:void(0);" onclick="javascript:getStap2Modal('${param_rscode_date}','${theme_list.tmcode}','h3','${theme_list.theme}','${theme_list.h3}',${theme_list.price},'${theme_list.img }');">
							<span>${theme_list.h3}</span> <span class="state">예약가능</span>
					</a>
					<a class="stop" id="PK${param_rscode_date}-${theme_list.tmcode}h4" href="javascript:void(0);" onclick="javascript:getStap2Modal('${param_rscode_date}','${theme_list.tmcode}','h4','${theme_list.theme}','${theme_list.h4}',${theme_list.price},'${theme_list.img }');">
							<span>${theme_list.h4}</span> <span class="state">예약가능</span>
					</a>
					<a class="stop" id="PK${param_rscode_date}-${theme_list.tmcode}h5" href="javascript:void(0);" onclick="javascript:getStap2Modal('${param_rscode_date}','${theme_list.tmcode}','h5','${theme_list.theme}','${theme_list.h5}',${theme_list.price},'${theme_list.img }');">
							<span>${theme_list.h5}</span> <span class="state">예약가능</span>
					</a>
					<a class="stop" id="PK${param_rscode_date}-${theme_list.tmcode}h6" href="javascript:void(0);" onclick="javascript:getStap2Modal('${param_rscode_date}','${theme_list.tmcode}','h6','${theme_list.theme}','${theme_list.h6}',${theme_list.price},'${theme_list.img }');">
							<span>${theme_list.h6}</span> <span class="state">예약가능</span>
					</a>
					<a class="stop" id="PK${param_rscode_date}-${theme_list.tmcode}h7" href="javascript:void(0);" onclick="javascript:getStap2Modal('${param_rscode_date}','${theme_list.tmcode}','h7','${theme_list.theme}','${theme_list.h7}',${theme_list.price},'${theme_list.img }');">
							<span>${theme_list.h7}</span> <span class="state">예약가능</span>
					</a>
					<a class="stop" id="PK${param_rscode_date}-${theme_list.tmcode}h8" href="javascript:void(0);" onclick="javascript:getStap2Modal('${param_rscode_date}','${theme_list.tmcode}','h8','${theme_list.theme}','${theme_list.h8}',${theme_list.price},'${theme_list.img }');">
							<span>${theme_list.h8}</span> <span class="state">예약가능</span>
					</a>
					<a class="stop" id="PK${param_rscode_date}-${theme_list.tmcode}h9" href="javascript:void(0);" 
						onclick="javascript:getStap2Modal(
						'${param_rscode_date}','${theme_list.tmcode}','h9','${theme_list.theme}',
						'${theme_list.h9}',${theme_list.price},'${theme_list.img }');">
							<span>${theme_list.h9}</span> <span class="state">예약가능</span>
					</a>
				</div>
				</div>
	</c:forEach>
<script type="text/javascript">
$(function(){
	<c:forEach var="find_rscode" items="${rscode_list2}">
	$('#PK${find_rscode.rscode}').css({ "background-color": "#383636"});
	$('#PK${find_rscode.rscode} span').css({  "color": "#e7e2e2"});
	$('#PK${find_rscode.rscode} .state').text("예약마감");
	$('#PK${find_rscode.rscode}').attr({"onclick": 'alert("이미예약이 마감되었습니다.")' });
	</c:forEach>	
});
</script>
</body>
</html>