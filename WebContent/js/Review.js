function check(c) {
	var star = document.getElementById('span_star');
	star.style.width=c;
}
function reviewInsert() {
	var check=document.getElementsByName('rating').length;
	var rscode = document.getElementById('rscode').value;
	var name = document.getElementById('name').value;
	var review = document.getElementById('review').value;
    var theme = document.getElementById('theme').value;	
    var rating;
    
	var flag=false;
	var xhr =new XMLHttpRequest();
	
	for (var i = 0; i < check; i++) {
		if(document.getElementsByName('rating')[i].checked == true){
			rating = document.getElementsByName('rating')[i].value;
		}
	}
	
	if(rscode==null || rscode =='') {
		alert("예약번호를 입력해주세요");
		return;
	}else if(name==null || name =='') {
		alert("닉네임을 입력해주세요");
		return;
	}else if(review==null || review =='') {
		alert("후기를 입력해주세요");
		return;
	}else if (rating == null || rating =='') {
		alert("평점을 선택해주세요");
		return;
	}else{flag = true;}

	function reviewAjax() {
		var url ="./ReviewCheckReserveController?rscode="+rscode+"&name="+name+"&review="+review+"&theme="+ theme +"&rating="+rating;
		xhr.onreadystatechange=display;
		xhr.open("GET",url,true);
		xhr.send(null);
	}
	function display() {
		if(xhr.readyState==4){
			if(xhr.status==200){
				var str=xhr.responseText;
				document.getElementById("div_rvInsert").innerHTML=str;
			}
		}
	}
	if(flag == true){
		reviewAjax();
	}
}
