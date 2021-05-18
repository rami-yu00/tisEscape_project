<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TIS ESCAPE</title>
<style type="text/css">
p{color: red; font-size: 30px;}
</style>
</head>
<body>
<c:set var="0" value="0"/>
<c:choose>
<c:when test="${0 == reserveNum}">
	<p>&nbsp;&nbsp;&nbsp;&nbsp;*예약 번호를 확인하여주세요!</p>
</c:when>
<c:otherwise>
	<p>&nbsp;&nbsp;&nbsp;&nbsp;*후기등록 성공!</p>
</c:otherwise>
</c:choose>
</body>
</html>