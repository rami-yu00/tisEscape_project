<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 예약페이지 style css --%>
<link rel="stylesheet" type="text/css" href="./css/reservation.css"/>
<%-- 제이쿼리 js --%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style type="text/css">

	#md_rsv_next2{ position: fixed; top:0 ; left:0; width:100%; height: 100%; margin: 0 auto; z-index:100; }
	#md_rsv_next2 .md_lay{  position: absolute; background-color: rgba(0,0,0,0.6); width:100%;  height: 100%; }
	#md_rsv_next2 .md_con{ width: 540px; height:510px; position: absolute; top:50%; left:50%; transform: translate(-50%,-50%); box-sizing: border; z-index:110; border-radius: 6px;  background-color:var(--df-dark); box-shadow: 0 10px 20px rgb(0 0 0 /38%), 0 6px 6px rgb(0 0 0 /10%); }
	#md_rsv_next2 .md_con input:: -ms-clear{ display:none;} 
	 
	.md_con_top{ margin-bottom: 0.5rem; border-radius: 3px 3px 0 0 ; background-color: var(--dark-red); padding: 2.2rem 0; font-size: 20px; }
	.md_con_mid_pd, .md_con_mid_top{ padding: 0 30px; width: initial; }
	.md_con_mid{ display: flex; box-sizing: border-box; border-bottom: 1px solid var(--md-hr-color);  }
	
	.md_con_mid .md_con_img{ display: flex; justify-content: center; align-items: center; }
	.md_con_mid .md_rsv_table{ flex: 1 1 auto; margin-left: 20px; }
	.md_con_mid .md_rsv_table tr:not(:last-child){ border-bottom: 1px solid var(--md-hr-color); }
	.md_con_mid .md_rsv_table tr th{ padding: 5px 0;  text-align: left; width: 36%;}
	.md_con_mid .md_rsv_table tr td{  padding: 5px 0; }
	.md_con_mid .md_rsv_table .input_bg, .md_rsv_table select{ width: 96.5%; background-color: var(--input-dark); border: none; padding: 3px;}
	.md_con_mid	.md_rsv_table	input[readonly]{ background-color: transparent; cursor: default; width: 96.5%; border: none; padding: 3px;  }
	.md_con_mid .md_rsv_tb_date { display: inline-flex; }
	.md_con_mid .md_rsv_tb_date > #testinput{flex: 0 0 35%; }
	.md_con_mid .md_rsv_tb_phon{ display: inline-flex; }
	.md_con_mid .md_rsv_tb_phon select { width: 70px; }
	.md_con_mid .md_rsv_tb_phon select, .md_rsv_tb_phon input {  }
	.md_con_mid	.md_rsv_table .md_pwd_td{ height: 45px; display: flex; flex-wrap: wrap; width: unset; align-items: initial; }
	.md_con_mid	.md_rsv_table input[name="pwd"]{ flex: 0 0 auto; }
	
	.md_red_lb { color: var(--dark-red) ; font-size: 0.9rem; line-height: 1rem; }
	.md_red_lb.md_td_p{ line-height: 1; padding-top: 6px; }
	.md_con_btm div:nth-child(1) { padding: 5px 0; }
	
	.md_rsv_ntc{  border:1px solid var(--md-hr-color); padding: 10px 5px; overflow-y : scroll; overflow-x : hidden;  height: 70px; font-size: .3rem; line-height: 1rem; }
	.md_rsv_ntc pre{ color: var(--df-grey);  white-space:pre-wrap; } 
	.md_con_btm .md_rsv_ntc_check { text-align: center; font-size: .3rem; line-height: 2.5rem;}
	.md_con_btm div:nth-child(4) { text-align: right; }
	.md_con_btm div:nth-child(4)::before{content: ' '; border-bottom: 1px solid var(--md-hr-color); display: block; margin: 0 auto; margin-bottom:1rem;}
	
	.md_con_btm .md_rsv_submit_btn { margin-right: 8px;  background-color: var(--dark-red);  }
	.md_con_btm .md_rsv_submit_btn, .md_rsv_close_btn {  border-radius: 2px; box-shadow: 3px 3px 6px 0px rgb(0 0 0 / 20%); width : 100px; padding: 12px 0; border:none; }
	.md_rsv_save_submit_btn.rsv_false{background-color: var(--dark-red); color: white; cursor: pointer; float: none; margin-top: 30px; padding: 9px 0; }
	.md_rsv_save_submit_btn.rsv_false:hover{background-color: #820909;}
	.rsv_save_rsult.rsv_false { padding: 8rem 0 0; }
	.cmt_rsv_false { font-size: 4rem; margin-bottom: 3rem; }
</style>
</head>
<body>
	<div class="md_con2">
	<div class="md_con_top">
		<h2 class="md_con_mid_top">03. 예약정보확인 </h2>
	</div>
		<c:choose>	
					<c:when test="${result eq 1 }">
		<form name="rsv2_form" class="md_con_mid_pd">
			<div class="rsv_save_rsult" align="center">
						<p>예약이 완료 되었습니다!</p>
						<p>예약번호 <input type="text" readonly="readonly" value="${rscode}"></p>
						<p class="md_red_lb f_lg">※ 예약조회시 예약번호, 예약자명과 연락처가 필요합니다. </p>
			</div>
			<div class="md_con_mid rsv_smg">
				<table class="md_rsv_save_table">
					<tbody>
						<tr> <th>테마 (Room)</th><td>${theme}</td> </tr>
						<tr> <th>예약일시 (Date)</th><td>${rsdate}  ${time}</td> </tr>
						<tr> <th>인원</th><td>${prsnl} 명</td>
						</tr>
						<tr> <th>예약자명</th><td>${name}</td> </tr>
						<tr> <th>연락처</th><td>${phone}</td></tr>
						<tr> <th>총이용요금</th><td>${price} 원</td> </tr>
					</tbody>
				</table>
			</div>
			<div class="md_con_btm">
				<div class="rsv_sbtm_ntc">
					<p class="md_red_lb">※ 예약취소시 QNA에 문의글 작성 또는 매장 연락처 000-000-0000 으로 연락 주시기 바랍니다.</p>
					<p class="md_red_lb">※ 게임시작 1시간전 예약확인 전화 부재시 자동 예약취소가 되니 이점 양지하여 주시기 바랍니다.</p>
					<p class="md_red_lb">※ 게임시작 시간 10분전까지 매장 내방해주시기 바랍니다.</p>
				</div>
				<div class="rsv_sbtm_submit"><input class="md_rsv_save_submit_btn" id="md_rsv_submit" type="button" value="확인" ></div>
			</div>
		</form>
		</c:when>
					<c:otherwise>
					<div class="rsv_save_rsult rsv_false" align="center">
						<p class="cmt_rsv_false">. . .</p>
						<p>이미 예약이 마감되었습니다.</p>
						<p>잠시 후 예약페이지로 이동합니다.</p>
						<p><input class="md_rsv_save_submit_btn rsv_false" id="md_rsv_submit" type="button" value="확인" ></p>
					</div>
						<script type="text/javascript">
							setTimeout("location.href ='./reservation.do'", 5000);
						</script>
					</c:otherwise>
				</c:choose>
	</div>
<script type="text/javascript">
		
		$('.md_lay').on("click",function(){
			location.reload(true);
		
		});
		$('#md_rsv_submit').on("click",function(){
			location.reload(true);
		
		});
</script>
</body>
</html>