<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title></title>
<link href="css/css.css" rel="stylesheet" type="text/css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
</head>
<body>
<div id="headers"></div>
<c:choose>
    <c:when test="${sessionScope.loginid eq null}">
		<script type="text/javascript">
		alert("권한이 없습니다.");
		location.href("http://localhost:8080/TisEscape/QnAlist.do");
		</script>
	</c:when>
	<c:otherwise>
		<div class="wrapper">
			<div class="maincontainer">
				<p class="titlebox">RESERVE LIST</p>
				<div>
					<table class="reservetable">
						<tr>
							<th class="reserveth" width="50px">예약번호</th>
							<th class="reserveth" width="250px">테마명</th>
							<th class="reserveth" width="180px">예약일</th>
							<th class="reserveth" width="70px">시간</th>
							<th class="reserveth" width="50px">인원</th>
							<th class="reserveth" width="150px">예약자</th>
							<th class="reserveth" width="200px">연락처</th>
							<th class="reserveth" width="100px">총액</th>
							<th class="reserveth" width="180px">등록일</th>
							<th class="reserveth" width="70px">삭제</th>
						</tr>
					<c:forEach var="item" items="${aaaa}">
						<tr class="reservetr">
							<td class="reservetd">${item.rscode}</td>
							<td class="reservetd">${item.theme}</td>
							<td class="reservetd">${item.rsdate}</td>
							<td class="reservetd">${item.time}</td>
							<td class="reservetd">${item.prsnl}</td>
							<td class="reservetd">${item.name}</td>
							<td class="reservetd">${item.phone}</td>
							<td class="reservetd">${item.price}</td>
							<td class="reservetd">${item.regdate}</td>
							<td class="reservetd">
								<a href="http://localhost:8080/TisEscape/reservedelete.do?rscode=${item.rscode}">
								<input type="button" value="삭제" class="deletebutton" onclick="return confirm('예약번호 ${item.rscode}번, ${item.name}님의\n예약을 정말 삭제하시겠습니까?');"></a>
							</td>
						</tr>
					</c:forEach>
						<tr>
							<td colspan="10" class="reservepage">
								
								<c:if test="${startPage>10}">
									<a href="reservelist.do?pageNum=1"><input type="button" class="pagebutton" value="◀"></a>
									<a href="reservelist.do?pageNum=${startPage-10}"><input type="button" class="pagebutton" value="◁"></a>
								</c:if>
								
								<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
									<c:choose>
										<c:when test="${i==pageNum}">
											<input type="button" class="pageselectedbutton" value="${i}">
										</c:when>
										<c:otherwise>
											<a href="reservelist.do?pageNum=${i}${returnPage}"><input type="button" class="pagebutton" value="${i}"></a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<c:if test="${endPage<pageCount}">
									<a href="reservelist.do?pageNum=${startPage+10}"><input type="button" class="pagebutton" value="▷"></a>
									<a href="reservelist.do?pageNum=${pageCount}"><input type="button" class="pagebutton" value="▶"></a>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="10" class="reservesearch">
								<form name="listsearch" action="reservelist.do">
								<select name="keyfield" onchange="clear()" class="searchselect">
									<option value="rscode" <c:if test="${skey eq 'rscode'}">selected</c:if>>예약번호</option>
									<option value="theme" <c:if test="${skey eq'theme'}">selected</c:if>>테마</option>
									<option value="name" <c:if test="${skey eq 'name'}">selected</c:if>>예약자</option>
									<option value="phone" <c:if test="${skey eq 'phone'}">selected</c:if>>연락처</option>
								</select>
								<input type="text" name="keyword" value="${sval}" maxlength="15" size="20" class="searchtext">
								<input type="submit" class="defaultbutton" value="검색">
								</form>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>
<div id="footers"></div>
</body>
</html>
