<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title></title>
<link rel="stylesheet" href="css/css.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript"> 
	$(document).ready(function() {
		$("#headers").load("TE_common/header.jsp");
		$("#footers").load("TE_common/footer.jsp");
		});
	$(document).ready(function(){
		$('.slider').bxSlider({
			mode:'fade',
			autoControls: true,
			auto:true,
			stopAutoOnClick: true,
			controls:true,
    		slideWidth:800
			});
		});
</script>
<style type="text/css">
.bx-wrapper, .bx-wrapper .bx-pager, .bx-wrapper .bx-controls-auto {background:rgba(0,0,0,0); border:0; box-shadow:none; margin:auto; width:100%;}
.slider {margin-bottom: 0; width:100%;}
</style>
</head>
<body>
<div id="headers"></div>
<div class="wrapper">
	<div class="maincontainer">
		<p class="titlebox">TIS ESCAPE OPEN EVENT</p>
		<p>
		안녕하세요. TIS ESCAPE입니다. <br>
		TIS ESCAPE는 호러 테마를 메인으로 한 방탈출 카페입니다.<br><br>
		신규 오픈 이벤트로 탈출에 성공하신 분들께<br>
		인당 5천원 할인 쿠폰을 드리고 있습니다.<br>
		다음 예약부터 바로 사용 가능하시며,<br>
		재미있게 탈출을 즐기고 SNS에 후기를 올려주시면<br>
		동반 1인 2천원 할인 쿠폰도 추가로 증정해드리고 있습니다.<br><br>
		많은 참여 부탁드립니다. ヾ(•ω•`)o</p>
	</div>
	<div class="maincontainer">
		<p class="titlebox">INTERIOR</p>
		<div class="slider">
			<div><img src="images/interior1.jpg" class="slideimg"></div>
			<div><img src="images/interior2.jpg" class="slideimg"></div>
			<div><img src="images/interior3.jpg" class="slideimg"></div>
			<div><img src="images/interior4.jpg" class="slideimg"></div>
		</div>
	</div>
	<div class="maincontainer">
		<p class="titlebox">NOTICE</p>
		<div class="noticegroup">
			<div class="noticebox">
				<p>10분 전<br>도착</p>
				<img src="images/clock.png" class="noticeimg">
			</div>
			<div class="noticebox">
				<p>외부 누설<br>금지</p>
				<img src="images/secret.png" class="noticeimg">
			</div>
			<div class="noticebox">
				<p>사진촬영<br>금지</p>
				<img src="images/photo.png" class="noticeimg">
			</div>
			<div class="noticebox">
				<p>위험물품<br>반입 금지</p>
				<img src="images/weapon.png" class="noticeimg">
			</div>
		</div>
	</div>
	<div class="maincontainer">
		<p class="titlebox">LOCATION</p>
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.258643943267!2d126.89123105151751!3d37.52539989276568!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9fe3aff941ff%3A0x26b6217443241372!2z7JeQ7J207Iqk7ZWY7J207YWM7YGs7Iuc7YuwMw!5e0!3m2!1sko!2skr!4v1614842366531!5m2!1sko!2skr" width="70%" height="300px" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
		<div>
			<p>서울특별시 영등포구 양평동3가 선유로 130</p>
			<p style="padding-bottom:50px;">010-0099-8877</p>
		</div>
	</div>
</div>
<div id="footers"></div>
</body>
</html>