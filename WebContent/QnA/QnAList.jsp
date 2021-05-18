<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>TIS ESCAPE</title>
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
<div class="wrapper">
	<div class="maincontainer">
		<p class="titlebox">Question & Answer</p>
		<div style="width:1100px;"><a href="QnAWrite.do"><input type="button" value="글쓰기" class="defaultbutton" style="float: right;"></a></div>
		<div>
		<table class="reservetable">
		<tr>
			<th class="reserveth" width="100px">글번호</th>
			<th class="reserveth" width="150px">작성자</th>
			<th class="reserveth" width="500px">제목</th>
			<th class="reserveth" width="200px">작성일</th>
			<th class="reserveth" width="100px">조회수</th>
			<c:if test="${sessionScope.loginid eq 'admin'}">
			<th class="reserveth" width="70px">삭제</th>
			</c:if>
		</tr>
		<c:forEach var="qna" items="${qqqq}">
		<tr class="reservetr">
			<td class="reservetd">${qna.num}</td>
			<td class="reservetd">${qna.name}</td>
			<td class="reservetd1">
			<c:choose>
				<c:when test="${qna.rcnt>0}">
					<font style="color:#900; font-size:12pt; font-weight:bold;">&nbsp;[답변완료]&nbsp;&nbsp;&nbsp;</font>
				</c:when>
				<c:otherwise>
					<font style="color:#666; font-size:12pt; font-weight:bold;">&nbsp;[답변대기]&nbsp;&nbsp;&nbsp;</font>
				</c:otherwise>
			</c:choose>
			<c:choose>
			<c:when test="${sessionScope.loginid eq 'admin'}">
				<form name="myForm" action="QnAdetail.do" method="POST">
					<input type="hidden" name="QnAno" value="${qna.num}" readonly/>
					<input type="submit" class="qnatext1" value="${qna.title}">
				</form>
			</c:when>
			<c:otherwise>
				<form name="myForm" action="QnAprematch.do" method="POST">
					<input type="hidden" name="QnAno" value="${qna.num}" readonly/>
					<input type="submit" class="qnatext1" value="${qna.title}">
				</form>
			</c:otherwise>
			</c:choose>	
			</td>
			<td class="reservetd">${qna.wdate}</td>
			<td class="reservetd">${qna.hit}</td>
			<c:if test="${sessionScope.loginid eq 'admin'}">
			<td class="reservetd">
				<a href="QnAdelete.do?data=${qna.num}">
				<input type="button" value="삭제" class="deletebutton" onclick="return confirm('글번호 ${qna.num}번, ${qna.name}님의\n글을 정말 삭제하시겠습니까?');"></a>
			</td> 
			</c:if>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="10" class="reservepage">
				<c:if test="${startPage>10}">
					<a href="QnAlist.do?pageNum=1"><input type="button" class="pagebutton" value="◀"></a>
					<a href="QnAlist.do?pageNum=${startPage-10}"><input type="button" class="pagebutton" value="◁"></a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<c:choose>
						<c:when test="${i==pageNum}">
							<input type="button" class="pageselectedbutton" value="${i}">
						</c:when>
						<c:otherwise>
							<a href="QnAlist.do?pageNum=${i}${returnPage}"><input type="button" class="pagebutton" value="${i}"></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${endPage<pageCount}">
					<a href="QnAlist.do?pageNum=${startPage+10}"><input type="button" class="pagebutton" value="▷"></a>
					<a href="QnAlist.do?pageNum=${pageCount}"><input type="button" class="pagebutton" value="▶"></a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="10" class="reservesearch">
				<form name="listsearch" action="QnAlist.do">
				<select name="keyfield" onchange="clear()" class="searchselect">
					<option value="num" <c:if test="${skey eq 'num'}">selected</c:if>>글번호</option>
					<option value="name" <c:if test="${skey eq'name'}">selected</c:if>>작성자</option>
					<option value="title" <c:if test="${skey eq 'title'}">selected</c:if>>제목</option>
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
<div id="footers"></div>
</body>
</html>
