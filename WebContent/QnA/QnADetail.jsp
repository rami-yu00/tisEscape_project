<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>TIS ESCAPE</title>
<link rel="stylesheet" href="css/css.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"> 
	$(document).ready(function() {
		$("#headers").load("TE_common/header.jsp");
		$("#footers").load("TE_common/footer.jsp");
		$("#reply").load("QnAreplyList.do?QnAno=${dddd.num}");
		});
</script>
</head>
<body>
<div id="headers"></div>
<div class="wrapper">
	<div class="maincontainer">
	<p class="titlebox">Question</p>
	<table class="qnatable">
		<tr>
			<th class="qnath1">
			<c:choose>
				<c:when test="${rcrc>1}">[답변완료] </c:when>
				<c:otherwise>[답변대기] </c:otherwise>
			</c:choose>
			${dddd.title}</th>
		</tr>
		<tr>
			<td class="qnatd1">작성자 : ${dddd.name}
			
		</tr>
		<tr>
			<td class="qnatd2">작성일 : ${dddd.wdate} | 조회수 : ${dddd.hit}<hr class="qnahr"></td>
		</tr>
		<tr>
			<td class="qnatd3">${dddd.content}</td>
		</tr>
		<tr>
			<td align="center">
				<a href="http://localhost:8080/TisEscape/QnAlist.do"><input type="button" class="defaultbutton" value="목록으로"></a> &nbsp;
				<a href="#"><input type="button" class="defaultbutton" value="수정"></a> &nbsp;
				<a href="QnAdelete.do?data=${dddd.num}"><input type="button" value="삭제" class="defaultbutton" onclick="return confirm('정말 삭제하시겠습니까?');"></a>
			</td>
		</tr>
	</table>
	<div id="reply"></div>
	</div>
</div>
<div id="footers"></div>
</body>
</html>