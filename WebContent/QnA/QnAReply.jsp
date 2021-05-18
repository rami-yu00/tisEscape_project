<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title></title>
<link rel="stylesheet" href="../css/css.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
<div id="headers"></div>
<div class="wrapper">
	<div class="maincontainer">
	<p class="titlebox">Answer</p>
	<c:choose>
		<c:when test="${replycnt>0}">
			<table class="qnatable">
				<c:forEach var="qnareply" items="${rrrr}">
				<tr>
					<th class="qnath1">
						<div style="display:none;"> ${qnareply.qnAno} / </div>
						${qnareply.replyWriter}
						<a href="QnAreplyDelete.do?replyNum=${qnareply.replyNum}&QnAno=${qnareply.qnAno}">
						<input type="button" value="삭제" class="defaultbutton" onclick="return confirm('정말 삭제하시겠습니까?');"></a>
					</th>
				</tr>
				<tr>
					<td class="qnatd1">${qnareply.replyContent}</td>
				</tr>
				<tr>
					<td class="qnatd2">작성일 : ${qnareply.replyDate}<hr class="qnahr"> </td>
				</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			최대한 빨리 답변드리겠습니다.<br>조금만 기다려주세요!
		</c:otherwise>
	</c:choose>
	<c:if test="${sessionScope.loginid eq 'admin'}">
	<p class="titlebox">Answer Form</p>
		<form action="QnAReplyWriteSave.do">
		<table>
			<tr style="display:none;">
				<td>글 번호</td>
				<td><input type="text" value="${data}" name="QnAno" class="qnatext1"></td>
			</tr>
			<tr>
				<th class="qnath1">작성자</th>
				<td class="qnatd1" align="left"><input type="text" name="replyWriter" class="qnatext1" value="admin" readonly></td>
				<td rowspan="2">
					<a href=>
					<input type="submit" class="defaultbutton" class="qnatext1" value="작성">
					</a>
				</td>
			</tr>
			<tr>
				<th class="qnath1">내용</th>
				<td><textarea rows="5" cols="60" name="replyContent" class="qnatext2" maxlength="1000"></textarea></td>
			</tr>
		</table>
		</form>
	</c:if>
	</div>
</div>
</body>
</html>