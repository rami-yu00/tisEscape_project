<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 제이쿼리 ui css --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<%-- 예약페이지 style css --%>
<link rel="stylesheet" type="text/css" href="./css/reservation.css"/>
<link href="./css/css.css" rel="stylesheet" type="text/css">
<%-- 제이쿼리 js --%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%-- 제이쿼리 ui js --%>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"> 
	$(document).ready(function() {
		$("#headers").load("TE_common/header.jsp");
		$("#footers").load("TE_common/footer.jsp");
	});
	function clear() {
		listsearch.keyword.value="";
		listsearch.keyword.focus();
	}
</script>
<style type="text/css">
	.nav_btm_line{
    position: absolute;
    box-sizing: border-box;
    width: 50%;
    height: 54px;
    left: 50%;
    top: 0px;
    border: 8px solid #980b0b;
    display: block;
	}
</style>
</head>
<body>
<div id="headers"></div>
<section class="rsv-nav">
		<div class="wrap">
			<a id="rsv_link" href="./reservation.do">실시간예약</a>
			<a id="rsv_serch_link" href="./reservationSearch.do">예약확인</a>
			<div class="nav_btm_line"></div>
		</div>
</section>
<section class="rsv-main">
	<div class="swrap top_pd">
		<div class="rsv_swrap">
			<div class="rsv_swrap_item1" align="center">
				<input name="search_pick" id="search_rscode" type="radio" checked="checked"><label for="search_rscode">예약번호로 조회</label>
				<input name="search_pick" id="search_rsname" type="radio"><label for="search_rsname">예약자정보로 조회</label>
				<input  type="radio" ><label class="lb_nbsp">&nbsp;&nbsp;</label>
				<div id="rsv_search_con1" class="rsv_scon">
					<form class="rsv_sform_wrap_rscode" name="rsv_sform">
						<table class="rsv_stable">
								<tbody>
									<tr> <th>예약번호</th> <td><input id="rscode" name="rscode_date" class="input_bg"  type="text" onchange="checkRsvCode()" placeholder="예약번호( ' - '포함한 총 15자리)">
									<span class="rscode_lb2" > ! </span></td> </tr>
									
								</tbody>
							</table>
							<div class="rsv_sbtn_con" >
								<input id="get_rsview" type="button" value="조회하기"  >
							  <input type="reset" value="취소"  >
							</div>
					</form>
				</div>
				<div id="rsv_search_con2" class="rsv_scon">
					<form class="rsv_sform_wrap" name="rsv_sform">
						<table class="rsv_stable">
								<tbody>
									<tr> <th>예약자명</th> <td><input id="sname" name="name" class="input_bg" type="text" onchange="checkName()" placeholder="예약자명">
									<span class="sname_lb2" > ! </span></td></tr>
									<tr><th>연락처</th><td class="td_phone"><select class="" name="num1" id="snum1">
																			<option selected="selected">010</option>
																			<option>011</option>
																			<option>016</option>
																			<option>017</option>
																			<option>018</option>
																			<option>019</option>
																		</select>
																		&nbsp;-&nbsp;<input name="num2" type="text"  class="" onchange="checkNum2()" id="snum2" maxlength="4" >
																		&nbsp;-&nbsp;<input name="num3" type="text"  class="" onchange="checkNum3()" id="snum3" maxlength="4" >
																		<span class="sphone_lb2" > ! </span>
																</td> 
									</tr>
								</tbody>
							</table>
							<div class="rsv_sbtn_con" align="center">
								<input id="get_rsview2" type="button" value="조회하기"  >
								<input type="reset" value="취소"  >
							</div>
					</form>
				</div>
			</div>
			<div class="scrollbar" id="style-1">
  			<div class="force-overflow">
  				<div class="rsv_srst"></div>
  			</div>
			</div>
			
			
		</div>
	</div>
</section>
<div id="footers"></div>
<div id="loading">
     <div class="fa-3x icon_ld">
		<i class="fas fa-spinner fa-pulse"></i>
		<div class="desc_ld">
			<span>Loding...</span>
		</div>
	</div>
</div>

<script type="text/javascript">
		$('#loading').hide();
		window.onbeforeunload = function () { $('#loading').show(); }  
		$(window).load(function () { 
		     $('#loading').hide();
		});
		$('#rsv_link').hover(
				function() {$('.nav_btm_line').stop(); $('.nav_btm_line').animate({"left" : "0" },400);/* .css( {"left" : "50%" } ); */ }, 
				function() {$('.nav_btm_line').stop(); $('.nav_btm_line').animate({"left" : "50%" },400); }
			);
</script>
<script type="text/javascript" src="./js/reservationSearch.js"></script>
</body>
</html>