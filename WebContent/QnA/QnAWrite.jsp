<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>TIS ESCAPE</title>
<link rel="stylesheet" href="css/css.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"> 
	$(document).ready(function() {
		$("#headers").load("TE_common/header.jsp");
		$("#footers").load("TE_common/footer.jsp");
		});
	
	function formCheck() {
  		if (!$('#name').val()) {
  			alert('작성자를 입력해주세요.')
  			$('#name').focus()
  			return false
  		}
  	
	  	else if(!$('#pwd').val()) {
  			alert('비밀번호를 입력해주세요.')
	  		$('#pwd').focus()
			return false
  		}
  	
	  	else if(!$('#pwdCheck').val()) {
	  		alert('비밀번호를 다시 한번 입력해주세요.')
	  		$('#pwdCheck').focus()
  			return false	
	  	}
  		
	  	else if ($('#pwd').val()!=$('#pwdCheck').val()) {
	  		alert('비밀번호가 일치하지 않습니다.')
  			$('#pwd').focus()
			return false
	  	}
  		
	  	else if(!$('#title').val()) {
	  		alert('제목을 입력해주세요.')
  			$('#title').focus()
  			return false
	  	}
  		
  		else if(!$('#content').val()) {
	  		alert('내용을 입력해주세요.')
	  		$('#content').focus()
  			return false	
  		}	
  	
	  	else {
	  		qnaform.submit();
  		}
	}
</script>
</head>
<body>
<div id="headers"></div>
<div class="wrapper">
	<div class="maincontainer">
	<p class="titlebox">Write</p>
	<form style="width: 40vw;" id="qnaform" action="QnAWriteSave.do">
	<table class="qnatable1" align="center">
		<tr>
			<th class="qnath1">작성자</th>
			<td class="qnatd1"><input type="text" name="name" id="name" class="qnatext3" maxlength="10"></td>
		</tr>
		<tr>
			<th class="qnath1">비밀번호</th>
			<td class="qnatd1"><input type="password" name="pwd" id="pwd" class="qnatext3" maxlength="10"></td>
		</tr>
		<tr>
			<th class="qnath1">비밀번호 확인</th>
			<td class="qnatd1"><input type="password" name="pwdCheck" id="pwdCheck" class="qnatext3" maxlength="10"></td>
		</tr>
		<tr>
			<th class="qnath1">제목</th>
			<td class="qnatd1"><input type="text" name="title" id="title" class="qnatext3" maxlength="20"></td>
		</tr>
		<tr>
			<th class="qnath1">내용</th>
			<td class="qnatd1"><textarea rows="5" cols="40" name="content" id="content" class="qnatext2" maxlength="300"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" class="defaultbutton" id="writebtn" value="작성" onclick="formCheck()"> &nbsp;
				<input type="reset" class="defaultbutton" value="취소" > &nbsp;
				<a href="QnAlist.do"><input type="button" class="defaultbutton" value="목록으로"></a>
			</td>
		</tr>
	</table>
	</form>
	<div id="reply"></div>
	</div>
</div>
<div id="footers"></div>
</body>
</html>