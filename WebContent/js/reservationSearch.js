
$('.rsv_srst').hide();

$('#get_rsview').on("click", function() {

	var rscode = checkRsvCode2();
	
	console.log(rscode);
	
	if( rscode == "" || rscode == null ){
		alert("예약번호를 입력해주세요");
		$('.rscode_lb2').css({"display":"inline-block"});
		$('#rscode').css({"color":"#ca1414"});
		$('#rscode').focus();
        return; 
	}
	
	checkRsvCode();
	$.ajax({
		url : "reservationView.do",
		type : "get",
		dataType : "text",
		data :{ "rscode" : rscode}, // 넘길 파라메터 여러개면 콤마로 구분
		success : function(data){
			$('.scrollbar').css({"height": "300px"});
			$('.scrollbar').slideDown(250,"swing", function() {
				$(".force-overflow").html(data);
			}); 
		}
	});
	
});

$('#get_rsview2').on("click", function() {
	
	var name = $('#sname').val();
	var num1 = $('#snum1').val();
	var num2 =$('#snum2').val();
	var num3 =$('#snum3').val();
	
	console.log(name+" "+num1+" "+num2+" "+num3);
	if( name == "" || name == null ){
			alert("이름을 입력해주세요");
			$('.sname_lb2').css({"display":"inline-block"});
			$('#sname').css({"color":"#ca1414"});
			$('#sname').focus();
	        return; 
	}
	if( num2 == "" || num2 == null || num3 == "" || num3 == null ){
			alert("연락처를 입력해주세요");
			$('.sphone_lb2').css({"display":"inline-block"});
			$('#snum2').css({"color":"#ca1414"});
			$('#snum1').focus();
			return;
	}//num null end
	checkName();checkNum2();checkNum3();
	$.ajax({
		url : "reservationView.do",
		type : "post",
		dataType : "text",
		data :{"name": name, "phone":num1+"-"+num2+"-"+num3}, // 넘길 파라메터 여러개면 콤마로 구분
		success : function(data){
			$('.scrollbar').css({"height": "580px"});
			$('.scrollbar').slideDown(250,"swing", function() {
				$(".force-overflow").html(data);
			}); 
		} 
	});
	
});

function checkRsvCode2(){
	var name = $('#rscode').val().trim();
	$('#rscode').val(name)
	return name;
};



function checkRsvCode(){
	
	var reName =/^[a-zA-Z0-9,-]{15}$/;//\s
	var name = checkRsvCode2();

		if(!reName.test(name)){
			snameFlag = false;
			$('.rscode_lb2').css({"display":"inline-block"});
			$('#rscode').css({"color":"#ca1414"});
			alert("잘못된 형식의 코드입니다..");
			
			$('#rscode').val("");
			$('#rscode').focus();
			return false;
		}else{
			snameFlag = true;
			$('.rscode_lb2').css({"display":"none"});
			$('#rscode').css({"color":"#fff"});
			return true;
		}
		return true;
}//end

function checkName(){
	var reName = /^[가-힣a-zA-Z ]{2,10}$/;//\s
	var name = document.getElementById('sname');

		if(!reName.test(name.value)){
			snameFlag = false;
			$('.sname_lb2').css({"display":"inline-block"});
			$('#sname').css({"color":"#ca1414"});
			alert("잘못된 형식의 이름입니다.");
			
			$('#sname').val("");
			$('#sname').focus();
			return false;
		}else{
			snameFlag = true;
			$('.sname_lb2').css({"display":"none"});
			$('#sname').css({"color":"#fff"});
			return true;
		}
		return true;
}//end

function checkNum2(){
	
	var reNum = /^[0-9]{4}$/;
	var num2 = document.getElementById('snum2');
	
	if (! reNum.test(num2.value)){
		snum2Flag = false;
		$('.sphone_lb2').css({"display":"inline-block"});
		$('#snum2').css({"color":"#ca1414"});
		alert("잘못된 형식의 연락처입니다. 숫자만 입력하세요");
		
		$('#snum2').val("");
		$('#snum2').focus();
		return false; 
	}else{
		snum2Flag = true;
		$('.sphone_lb2').css({"display":"none"});
		$('#snum2').css({"color":"#fff"});
		return true;	
	}
	return true;
	 
}//end

function checkNum3(){
	var reNum = /^[0-9]{4}$/;
	var num3 = document.getElementById('snum3');
	
	if (! reNum.test(num3.value)){
		snum3Flag = false;
		$('.sphone_lb2').css({"display":"inline-block"});
		$('#snum3').css({"color":"#ca1414"});
		alert("잘못된 형식의 연락처입니다. 숫자만 입력하세요");
		
		$('#snum3').val("");
		$('#snum3').focus();
		
		return false; 
	}else{
		snum3Flag = true;
		$('.sphone_lb2').text("");
		$('.sphone_lb2').css({"display":"none"});
		$('#snum3').css({"color":"#fff"});
		return true;
	}
	return true;
}//end

$('input[type="radio"] + label').on('click' , function() {
	$('.scrollbar').css({"display":"none"});
	$(".force-overflow").html('<div class="rsv_srst"></div>');
	$('form').each(function() {
	      this.reset();
	  });
});






