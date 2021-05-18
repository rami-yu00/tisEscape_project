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
</head>
<body>
<c:choose>
	<c:when test="${Cflag eq 0}">
					<center>
						<p>조회된 내역이 없습니다.</p>
					</center>
	</c:when>
	<c:when test="${Cflag eq 1}">
				<div class="srsv_warp">
						<div class="rsv_cnf_warp">
						<div class="rsv_cnf_top">
							<h2 class="rsv_cnf_top_h2">${shcode_rsvlist.theme}</h2>
						</div>
							<div class="rsv_cnf_mid_wrap">
								<div class="rsv_cnf_mid">
									<table class="rsv_cnf_mid_table">
										<tbody>
											<tr> <th>에약번호</th><td>${shcode_rsvlist.rscode}</td> </tr>
											<tr> <th>예약일시 (Date)</th><td>${shcode_rsvlist.rsdate}&nbsp;&nbsp;&nbsp;&nbsp;${shcode_rsvlist.time}</td> </tr>
											<tr> <th>인원</th><td>${shcode_rsvlist.prsnl}</td></tr>
											<tr> <th>예약자</th><td>${shcode_rsvlist.name}</td> </tr>
											<tr> <th>연락처</th><td >${shcode_rsvlist.phone}</td></tr>
											<tr> <th>총이용요금</th><td>${shcode_rsvlist.price}</td> </tr>
										</tbody>
									</table>
								</div>
								<div class="rsv_cnf_mid_ntc">
									<div>
<pre>
※ 게임시작 1시간전 예약확인 전화 부재시 자동 예약취소가 되니 이점 양지하여 주시기 바랍니다.
※ 게임 시작 시간 10분전까지 매장 내방해주시기 바랍니다.
※ 예약취소시 QNA에 문의글 작성 또는 매장 연락처 000-000-0000 으로 연락 주시기 바랍니다.
</pre>
									</div>
									<div class="logo">TIS ESCAPE</div>
									<a class="qna_link_btn">예약취소문의</a>
									<a class="qna_link_btn">리뷰작성하기</a>
								</div>
								
							</div>
						</div>
					</div>
	</c:when>
	<c:otherwise>
					<center>
						<p>서버오류: 잠시후 다시 이용해 주세요.</p>
					</center>
	</c:otherwise>
</c:choose>
<script type="text/javascript">
</script>
</body>
</html>