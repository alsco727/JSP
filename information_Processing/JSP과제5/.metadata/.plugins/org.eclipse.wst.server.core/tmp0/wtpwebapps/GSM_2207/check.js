function addCheck(){
	if(document.frm.orderno.value.length==0){
		alert("주문번호가 입력되지 않았습니다.");
		frm.orderno.focus();
		return false;
	}
	if(document.frm.custno.value.length==0){
		alert("고객번호가 입력되지 않았습니다.");
		frm.custno.focus();
		return false;
	}
	if(document.frm.custname.value.length==0){
		alert("고객이름이 입력되지 않았습니다.");
		frm.custname.focus();
		return false;
	}
	if(document.frm.menuno[0].checked==false && document.frm.menuno[1].checked==false && document.frm.menuno[2].checked==false && document.frm.menuno[3].checked==false && document.frm.menuno[4].checked==false){
		alert("메뉴가 선택되지 않았습니다.");
		frm.menu.focus();
		return false;
	}
	if(frm.orderdate.value.length==0){
		alert("주문일자가 입력되지 않았습니다.");
		frm.orderdate.focus();
		return false;
	}
	alert("주문 완료");
	document.frm.submit();
	return true;
}

function mod(){
	alert("수정 완료");
	document.frm.submit();
}

function res(){
	alert("처음부터 다시 시작");
	document.frm.reset();
	frm.custno.focus();
}