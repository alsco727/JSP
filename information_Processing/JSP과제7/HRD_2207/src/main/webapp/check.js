function nameChange(){
	document.frm.c_no.value = document.frm.c_name.value;
	document.frm.teacher_code.value = "";
	document.frm.class_price.value="";
}

function price(){
	if(document.frm.c_no.value >= 20000)
		document.frm.class_price.value = document.frm.teacher_code.value * 1000 / 2
	else
		document.frm.class_price.value = document.frm.teacher_code.value * 1000;
}

function addCheck(){
	if(frm.regist_month.value.length == 0){
		alert("수강월이 입력되지 않았습니다.");
		frm.regist_month.focus();
		return false;
	}
	else if(frm.c_name.value.length == 0){
		alert("회원명이 입력되지 않았습니다.");
		frm.c_name.focus();
		return false;
	}
	else if(frm.class_area.value.length == 0){
		alert("강의장소가 입력되지 않았습니다.");
		frm.class_area.focus();
		return false;
	}
	else if(frm.teacher_code.value.length == 0){
		alert("강사명이 입력되지 않았습니다.");
		frm.teacher_code.focus();
		return false;
	}
	else{
		alert("수강신청이 정상적으로 완료되었습니다!");
		frm.submit();
		return true;
	}
}

function res(){
	alert("정보를 지우고 처음부터 다시 입력합니다.");
	frm.reset();
	frm.regist_month.focus();
}