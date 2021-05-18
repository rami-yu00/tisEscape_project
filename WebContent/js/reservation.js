
function changethemeRsvList(tmcode) {
	var param_rscode_date =getFormatDate($( "#datepicker" ).val());
	var param_tmcode = tmcode;
	console.log(" param_rscode_date : "+param_rscode_date);
	console.log(" param_tmcode      : "+param_tmcode);
	$.ajax({
		url : "./reservationList.do",
		type : "post",
		dataType : "text",
		data : { "param_rscode_date" : param_rscode_date , "param_tmcode": param_tmcode }, // 넘길 파라메터 여러개면 콤마로 구분
		success : function(result){
			$("#a").html(result);
		} 
    });
};

function changeDateRsvList(date) {
	var param_rscode_date = getFormatDate(date);
	var param_tmcode = document.rsv_form.tmcode.value;
	console.log(" param_rscode_date : "+param_rscode_date);
	console.log(" param_tmcode      : "+param_tmcode);
	$.ajax({
		url : "./reservationList.do",
		type : "post",
		dataType : "text",
		data : { "param_rscode_date" : param_rscode_date , "param_tmcode": param_tmcode , }, // 넘길 파라메터 여러개면 콤마로 구분
		success : function(result){
			$("#a").html(result);
		} 
    });
};

function getFormatDate(date) {
	var str_date = String(date);
    var y = str_date.substring(2,4);
    var m = str_date.substring(5,7);
    var d = str_date.substring(8,10);
    return y+m+d;
}//getFormatDate() end

var numPrice = 0;
function getStap2Modal( param_rscode_date ,param_tmcode , param_time, tm, ti ,price, img) {
	
	console.log(param_rscode_date+" "+param_tmcode+" "+param_time);
	console.log(tm+" "+ti+" "+price+" "+img);
	 $('#param_inrsvcode').val(param_rscode_date+"-"+param_tmcode+param_time);
	$('.md_con_img').html('<img class="md_img_style" src="storage/'+img+'">');
	 $('#rsvdate').val($( "#datepicker" ).val());
	 $('#rsvtheme').val(tm);
	 $('#rsvtime').val(ti);
	 numPrice = price;
	 document.rsv2_form.price.value = defualtPrice(price);
	$('#md_rsv_next').fadeIn(50,"linear");
	$('.md_lay').on("click",function(){
		fadeOutRsvNextModal();
	});
	$('#md_rsv_close').on("click",function(){
		fadeOutRsvNextModal();
	});
}//getStap2Page() end

function defualtPrice(price) {
	var numPrice = 2 * price ;
	return numberFormat(numPrice);
}//defualtPrice() end

function changePrice( parsnlOption ){
	var numprice = parsnlOption * numPrice ;
	console.log(numprice+" "+numberFormat(numprice));
	document.rsv2_form.price.value = numberFormat(numprice); 
}//changePrice() end

function numberFormat(num) { //숫자 99,999 형식으로 포맷
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}//numberFormat() end
$('#md_rsv_next').hide();
function fadeOutRsvNextModal() {
	document.rsv2_form.reset();
	$('.sname_lb').css({"display":"none"});
	$('#sname').css({"color":"#fff"});
	$('.sphone_lb').css({"display":"none"});
	$('#snum2').css({"color":"#fff"});
	$('#md_rsv_next').fadeOut(50,"linear");
}//end















