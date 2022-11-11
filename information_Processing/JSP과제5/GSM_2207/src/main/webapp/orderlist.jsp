<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>orderlist</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section style="position:fixed; top:70px; left:0px; width:100%; height:100%; background-color:lightgray">
<h2 style="text-align:center">주문 조회 페이지</h2>
<form style="display:flex; align-items:center; justify-content:center; text-align:center">
<table border="1">
<tr>
	<td>주문번호</td>
	<td>고객번호</td>
	<td>고객이름</td>
	<td>메뉴이름</td>
	<td>수량</td>
	<td>지불금액</td>
	<td>주문일자</td>
	<td>수정</td>
	<td>삭제</td>
</tr>
<%
request.setCharacterEncoding("UTF-8");
int temp = 0;
String price = "";

try{
	String sql = "select orderno, custno, custname, menuname, amount, price * amount, orderdate from menu_tbl m, order_tbl o where m.menuno = o.menuno";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		temp = Integer.valueOf(rs.getString(6));
		DecimalFormat DF = new DecimalFormat("###,###");
		price = DF.format(temp) + "원";
		String orderdate = rs.getString(7).substring(0,10);
%>
<tr>
	<td><%=rs.getString(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getString(4)%></td>
	<td><%=rs.getString(5)%></td>
	<td><%=price %></td>
	<td><%=orderdate%></td>
	<td><a href="modify.jsp?orderno=<%=rs.getString(1)%>">주문 수정</a></td>
	<td><a href="action.jsp?orderno=<%=rs.getString(1)%>&mode=delete">주문 삭제</a></td>
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