<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="./js/datepicker-ko.js"></script>
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
	.nav_btm_line { position: absolute; box-sizing: border-box; width: 50%;  height: 55px; left: 0px; top: 0px; border: 8px solid darkred; border-radius: 2px; display: block;
   box-shadow: 0 10px 10px rgb(0 0 0 /20%), 0 6px 6px rgb(0 0 0 /10%); }
	#loading{ position: fixed; z-index: 1001; width: 100%; height: 100%; }
</style>
</head>
<body id="bb">
<div id="headers"></div>
<%-- 페이지 상단--%>
<section class="rsv-nav ">
		<div class="wrap">
			<a id="rsv_link" href="./reservation.do"><span>실시간예약</span></a>
			<a id="rsv_serch_link" href="./reservationSearch.do">예약확인</a>
			<div class="nav_btm_line"></div>
		</div>
</section>
<%-- /페이지 상단 END --%>
<%-- 페이지 중앙  * 메인 * --%>
<section class="rsv-main">
	<div class="wrap">
		<div class="wrap">
			<form class="rsv_form"  name="rsv_form" action="?" method="post">
				<label id="dd">예약날짜&nbsp;&nbsp;&nbsp;
				<input type="text" id="datepicker" name="date" onchange="changeDateRsvList(this.value)" value ="${date}" readonly="readonly"/>
					</label>&nbsp;&nbsp;&nbsp;
				<label>테마선택&nbsp;&nbsp;&nbsp;
				
				<select id="theme" name="tmcode" onchange="changethemeRsvList(this.value)">
													<option <c:if test="${ tmcode eq '' }">selected="selected"</c:if> value="" >전체테마</option>
													<c:forEach var="theme_select_list" items="${tm_select_list }">
													<option <c:if test="${ theme_select_list.tmcode eq tmcode }">selected="selected"</c:if>
													 value="${theme_select_list.tmcode}"> ${theme_select_list.theme}</option>
													</c:forEach>
				</select>
				</label>
				<input type="hidden" name="param_rscode_date" value="${rscode_date}">
				</form>
			<span>⬜예약가능 ⬛예약불가</span>
		</div>
		<div id="a" class="tm_wrap">
		
		</div>
	</div>
</section>
<div id="footers"></div>
<%--페이지 중앙  * 메인 *  END --%>
<%-- 에약정보입력 모달창 --%>
<div id="md_rsv_next">
	<div class="md_lay"></div>
	<div class="md_con" id="md__con">
	<div class="md_con_top">
		<h2 class="md_con_mid_top">02. 예약정보 입력</h2>
	</div>
		<form name="rsv2_form" class="md_con_mid_pd">
			<div class="md_con_mid">
				<div class="md_con_img"><img src="http://placehold.it/150x190" /></div>
				<table class="md_rsv_table">
					<tbody>
						<tr> <th>테마 (Room)</th><td><input name="theme" id=rsvtheme type="text" readonly onfocus="this.blur();" ></td> </tr>
						<tr> <th>예약일시 (Date)</th><td class="md_rsv_tb_date"><input name="date" id="rsvdate" type="text" value="" readonly onfocus="this.blur();" >&nbsp;<input name="time" id="rsvtime" type="text" value="" readonly onfocus="this.blur();" ></td> </tr>
						<tr> <th>인원</th><td><select name="prsnl" onchange="javascript:changePrice(this.value);">
																		<option  selected="selected" value="2">2명</option>
																		<option  value="3">3명</option>
																		<option  value="4">4명</option>
																		<option  value="5">5명</option>
																	</select>
						</tr>
						<tr> <th>예약자</th>
								 <td>
									<input  class="input_bg" id="sname" name="name" type="text" maxlength="12"
									 onchange="checkName()">
									  <span class="sname_lb" > ! </span>
								 </td> 
						</tr>
						<tr> <th>연락처</th><td class="md_rsv_tb_phone" ><select class="input_bg" name="num1" id="snum1">
																			<option selected="selected">010</option>
																			<option>011</option>
																			<option>016</option>
																			<option>017</option>
																			<option>018</option>
																			<option>019</option>
																		</select>
																		&nbsp;-&nbsp;
																		<input name="num2" type="text"  class="input_bg" 
																		onchange="checkNum2()" id="snum2" maxlength="4" >
																		&nbsp;-&nbsp;
																		<input name="num3" type="text"  class="input_bg" 
																		onchange="checkNum3()" id="snum3" maxlength="4" >
																		<span class="sphone_lb" > ! </span>
																</td>
						</tr>
						<tr> <th>총이용요금</th><td class="md_rsv_tb_price"><input name="price" type="text" value="" readonly onfocus="this.blur();" >&nbsp;원</td> </tr>
					</tbody>
				</table>
			</div>
			<div class="md_con_btm">
				<div>
					<p class="md_red_lb">※  게임시작 1시간전 예약확인 전화 부재시 자동 예약취소가 되니 이점 양지하여 주시기 바랍니다.</p>
					<p class="md_red_lb">※ 게임 시작 시간 10분전까지 매장 내방해주시기 바랍니다.</p>
				</div>
				<div class="md_rsv_ntc">
<pre>
개인정보 수집, 이용 및 제공 등에 관한 고지사항
이용자 본인은 아래의 개인정보가 사실임을 확인하며, 아래와 같이 개인정보를 수집 및 이용하는 것에 동의합니다.

[개인정보의 수집 및 이용목적]
- 비회원 예매서비스 제공
- 예약 정보를 확인 및 관리하고, 필요 시 예약 이행 여부 확인을 위해 예약자에게 연락을 취할 목적 등

[수집하는 개인정보의 항목]
- 필수입력사항 : 이용자의 식별을 위한 정보
- 입력정보 : 이름, 휴대폰번호, 이메일 주소

[개인정보의 보유 및 이용기간]
개인정보의 수집목적 또는 제공 받은 목적이 달성되면 즉시 파기합니다. 다만, 상법 등 관련 법령의 규정에 의하여 거래관련 관리 의무 관계의 확인 등을 이유로 대금결제및재화들 의공급에관한기록에 의거 5년간 보유합니다.
* 개인 정보 제공에 동의하지 않을 권리가 있으며 개인 정보 제공에 동의하지 않을 경우 비회원 서비스는 제공되지 않습니다.

[기술적/관리적 보호대책]					
- 더큐이스케이프는 서버 및 네트워크 관련 보안시스템을 갖추고 있습니다. 방화벽 등 해킹 등 외부침입에 대비하여 각 서버마다 침입차단시스템 및 취약점 분석시스템 등을 갖추어 ‘이용자’가 제공한 개인정보보호에 만전을 기하고 있습니다. 개인 정보 취급직원 최소화는 물론 각 직원별 개인정보 접근권한을 달리하고, 수시보안교육을 통해 본 방침의 준수를 강조하고 있습니다.
- 더큐이스케이프는 “이용자” 개인의 실수나 기본적인 인터넷의 위험성 때문에 일어나는 일들에 대해 책임을 지지 않습니다.
- 그 외 내부 관리자의 실수나 기술관리 상의 사고로 인해 개인정보의 상실, 유출, 변조, 훼손이 유발될 경우 더큐이스케이프는 즉각“이용자”에게 사실을 알리고 적절한 대책과 보상을 강구할 것입니다.
</pre>
				</div>
				<div class="md_rsv_ntc_check"><input name="check" id="rsv_ntc_check" type="checkbox" value="check"><label for="rsv_ntc_check" >개인정보취급방침에 동의함</label></div>
				<div><input class="md_rsv_submit_btn" id="md_rsv_submit" type="button" value="예약하기" ><input class="md_rsv_close_btn" id="md_rsv_close" type="reset" value="취소"></div>
			</div>
			<input type="hidden" id="param_inrsvcode" name="code" value="">
		</form>
	</div>
</div>
<%-- /에약정보입력 모달창 END--%>
<%-- loading layer --%>
<div id="loading">
   <div class="fa-3x icon_ld">
			<i class="fas fa-spinner fa-pulse"></i>
			<div class="desc_ld">
					<span>Loding...</span>
			</div>
	</div>
 </div>
<%-- /loading layer end --%>
<script type="text/javascript">
		$('#loading').hide();
		window.onbeforeunload = function () { $('#loading').show(); }  
		$(window).load(function () { 
		     $('#loading').hide();
		});
		$('#rsv_serch_link').hover(
				function() {
					$('.nav_btm_line').stop(); 
					$('.nav_btm_line').animate( {"left" : "50%" } ,400); },
				function() { 
					$('.nav_btm_line').stop(); 
					$('.nav_btm_line').animate( {"left" : "0" } ,400 ); }
		);
		function chkReservation(rtime, theme) {
			var f = document.fm;
			f.rtime.value = rtime;
			f.theme.value = theme;
			f.submit();
		}//end
</script>
<script>
window.onload = function () {
	 setTimeout("updateData()" , 500);
}
$(window).on('scroll',function(){
	var sc_top = $(this).scrollTop();
	if(sc_top <100){setTimeout("updateData()", 1000);}
	console.log(sc_top);
});
function updateData() {
	var param_rscode_date =getFormatDate($( "#datepicker" ).val());
	var param_tmcode = document.rsv_form.tmcode.value;
    $.ajax ({
        url : "./reservationList.do?param_rscode_date="+param_rscode_date+"&param_tmcode="+param_tmcode,
        cache : false,
        type : "get",
		dataType : "text",
		success : function(result){
			$("#a").html(result);
			resultdefult =result;
			} 
  });
}
</script>
<script type="text/javascript" src="./js/reservation.js"></script>
<script type="text/javascript" src="./js/reservationSave.js"></script>
</body>
</html>