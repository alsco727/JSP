<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menulist</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section style="position:fixed; top:70px; left:0px; width:100%; height:100%; background-color:lightgray">
<h2 style="text-align:center">카페 메뉴</h2>
<form style="display:flex; align-items:center; justify-content:center; text-align:center">
<table border="1">
<tr>
	<td>메뉴번호</td>
	<td>메뉴이름</td>
	<td>가격</td>
	<td>칼로리</td>
</tr>
<%
request.setCharacterEncoding("UTF-8");

try{
	String sql = "select * from menu_tbl";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		String price = rs.getString(3) + "원";
%>
<tr>
	<td><%=rs.getString(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=price%></td>
	<td><%=rs.getString(4)%></td>
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