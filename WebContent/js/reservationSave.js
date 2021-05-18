var snameFlag = false;
var snum2Flag = false;
var snum3Flag = false;
$('#md_rsv_submit').on("click", function() {

	var stheme = rsv2_form.theme.value;
	var srsdate = rsv2_form.date.value; 
	var stime = rsv2_form.time.value;
	var sprsnl = rsv2_form.prsnl.value;
	var sname = rsv2_form.name.value;
	var snum1 = rsv2_form.num1.value;
	var snum2 = rsv2_form.num2.value;
	var snum3 = rsv2_form.num3.value;
	var sprice = rsv2_form.price.value;
	var scheck = rsv2_form.check.checked;
	var scode = rsv2_form.code.value;
	
	if( sname == "" || sname == null ){
			alert("이름을 입력하지 않았습니다");
			$('.sname_lb').css({"display":"inline-block"});
			$('#sname').css({"color":"#ca1414"});
			$('#sname').focus();
	        return; 
	}
	if( snum2 == "" || snum2 == null || 
		rsv2_form.num3.value == "" || rsv2_form.num3.value == null ){
			alert("연락처를 입력하지 않았습니다");
			$('.sphone_lb').css({"display":"inline-block"});
			$('#snum2').css({"color":"#ca1414"});
			$('#snum1').focus();
			return;
	}//num null end
	if( scheck == false ){
		alert("개인정보취급방침에 동의해 주세요.");
		$('#rsv_ntc_check').focus();
		return;
		
	}checkName();checkNum2();checkNum3();
	var data = {"insertcode" : scode, "theme" : stheme, "rsdate": srsdate, "time": stime ,
				"prsnl": sprsnl, "price": sprice,
				"name": sname, "phone": snum1+"-"+snum2+"-"+snum3 };
	$.ajax({
		url : "./reservationSave.do",
		type : "post",
		dataType : "text",
		data : data,
		success : function(data){
			$("#md__con").html(data);
			
		} 
	});
	
});


function checkName(){
	var reName = /^[가-힣a-zA-Z ]{2,10}$/;//\s
	var name = document.getElementById('sname');

		if(!reName.test(name.value)){
			snameFlag = false;
			$('.sname_lb').css({"display":"inline-block"});
			$('#sname').css({"color":"#ca1414"});
			alert("잘못된 형식의 이름입니다.");
			
			$('#sname').val("");
			$('#sname').focus();
			return false;
		}else{
			snameFlag = true;
			$('.sname_lb').css({"display":"none"});
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
		$('.sphone_lb').css({"display":"inline-block"});
		$('#snum2').css({"color":"#ca1414"});
		alert("잘못된 형식의 연락처입니다. 숫자만 입력하세요");
		
		$('#snum2').val("");
		$('#snum2').focus();
		return false; 
	}else{
		snum2Flag = true;
		$('.sphone_lb').css({"display":"none"});
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
		$('.sphone_lb').css({"display":"inline-block"});
		$('#snum3').css({"color":"#ca1414"});
		alert("잘못된 형식의 연락처입니다. 숫자만 입력하세요");
		
		$('#snum3').val("");
		$('#snum3').focus();
		
		return false; 
	}else{
		snum3Flag = true;
		$('.sphone_lb').text("");
		$('.sphone_lb').css({"display":"none"});
		$('#snum3').css({"color":"#fff"});
		return true;
	}
	return true;
}//end

