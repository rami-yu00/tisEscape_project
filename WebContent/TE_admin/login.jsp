<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title></title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"> 
	$(document).ready( function() {
	$("#headers").load("../TE_common/header.jsp");
	$("#footers").load("../TE_common/footer.jsp");
	});
</script>
<link href="../css/css.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="headers"></div>
<div class="wrapper">
	<div class="maincontainer">
		<p class="titlebox">관 리 자 로 그 인</p>
		<form action="http://localhost:8080/TisEscape/login.do" method="post">
			<table class="logintable">
				<tr>
					<td class="loginlable">아이디</td>
					<td><input type="text" class="logintext" name="adminid" maxlength="10"></td>
				</tr>
				<tr>
					<td class="loginlable">비밀번호</td>
					<td><input type="password" class="logintext" name="adminpwd" maxlength="10"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" class="defaultbutton" value="로그인"> &nbsp;
						<input type="reset" class="defaultbutton" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<div id="footers"></div>
</body>
</html>