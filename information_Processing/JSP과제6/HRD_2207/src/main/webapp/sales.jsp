<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sales</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section style="position:fixed; top:80px; left:0px; width:100%; height:100%; background-color:lightgray">
<h2 style="text-align:center">회원매출조회</h2>
<form method="post" action="action.jsp" name="frm" style="display:flex; align-items:center; justify-content:center; text-align:center">
<table border="1">
<tr>
<td>회원번호</td>
<td>회원성명</td>
<td>고객등급</td>
<td>매출</td>
</tr>
<%
request.setCharacterEncoding("UTF-8");
String grade = "";
try{
	String sql = "select me.custno, custname, grade, sum(price) from member_tbl_02 me, money_tbl_02 mo where me.custno = mo.custno group by me.custno, custname, grade";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		switch(rs.getString(3)){
		case "A":
			grade = "VIP";
			break;
		case "B":
			grade = "일반";
			break;
		case "C":
			grade = "직원";
			break;
		}
		%>
		<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=grade %></td>
		<td><%=rs.getString(4) %></td>
		</tr>	
		<%
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>