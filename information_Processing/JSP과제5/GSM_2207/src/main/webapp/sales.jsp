<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
<section style="position:fixed; top:70px; left:0px; width:100%; height:100%; background-color:lightgray">
<h2 style="text-align:center">카페 매출 조회 프로그램</h2>
<form style="display:flex; align-items: center; justify-content:center; text-align:center">
<table border="1">
<tr>
<td>메뉴번호</td>
<td>메뉴이름</td>
<td>주문량</td>
<td>합계</td>
</tr>
<%
request.setCharacterEncoding("utf-8");
try{
	String sql="select m.menuno, menuname, sum(amount), sum(price * amount) from menu_tbl m, order_tbl o where m.menuno=o.menuno group by m.menuno, menuname";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		String money = rs.getString(4) + "원";
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=money %></td>
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