<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<section style="position:fixed; top:70px; left:0px; width:100%; height:100%; background-color:lightgray">
<h2 style="text-align:center">주문 수정하기</h2>
<form method="post" action="action.jsp" name="frm" style="display:flex; align-items: center; justify-content:center">
<input type="hidden" name="mode" value="update">
<table border="1">
<%
request.setCharacterEncoding("utf-8");
String orderno = request.getParameter("orderno");

try{
	String sql = "select * from order_tbl where orderno = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, orderno);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	String menuno = rs.getString(4);
	String amount = rs.getString(5);
	String orderdate = rs.getString(6).substring(0,4) + rs.getString(6).substring(5,7) + rs.getString(6).substring(8,10);
%>
<tr>
	<td style="text-align:center">주문번호</td>
	<td><input type="text" name="orderno" value="<%=orderno %>" readonly></td>
</tr>
<tr>
	<td style="text-align:center">고객번호</td>
	<td><input type="text" name="custno" value="<%=rs.getString(2) %>"></td>
</tr>
<tr>
	<td style="text-align:center">고객이름</td>
	<td><input type="text" name="custname" value="<%=rs.getString(3)%>"></td>
</tr>
<tr>
	<td style="text-align:center">메뉴번호</td>
	<td>
	<input type="radio" name="menuno" value="10001" <% if(menuno.equals("10001")) out.println("checked"); %>>아메리카노&nbsp;
	<input type="radio" name="menuno" value="10002" <% if(menuno.equals("10002")) out.println("checked"); %>>카페 라떼&nbsp;
	<input type="radio" name="menuno" value="10003" <% if(menuno.equals("10003")) out.println("checked"); %>>카페 모카&nbsp;
	<input type="radio" name="menuno" value="10004" <% if(menuno.equals("10004")) out.println("checked"); %>>돌체 라떼&nbsp;
	<input type="radio" name="menuno" value="10005" <% if(menuno.equals("10005")) out.println("checked"); %>>콜드 브루
	</td>
</tr>
<tr>
	<td style="text-align:center">수량</td>
	<td><select name="amount">
	<option value="1" <% if(amount.equals("1")) out.println("selected"); %>>1개(추가 주문 시 선택)</option>
	<option value="2" <% if(amount.equals("2")) out.println("selected"); %>>2개</option>
	<option value="3" <% if(amount.equals("3")) out.println("selected"); %>>3개</option>
	<option value="4" <% if(amount.equals("4")) out.println("selected"); %>>4개</option>
	<option value="5" <% if(amount.equals("5")) out.println("selected"); %>>5개</option>
	<option value="6" <% if(amount.equals("6")) out.println("selected"); %>>6개</option>
	<option value="7" <% if(amount.equals("7")) out.println("selected"); %>>7개</option>
	<option value="8" <% if(amount.equals("8")) out.println("selected"); %>>8개</option>
	<option value="9" <% if(amount.equals("9")) out.println("selected"); %>>9개</option>
	<option value="10" <% if(amount.equals("10")) out.println("selected"); %>>10개</option>
	</select></td>
</tr>
<tr>
	<td style="text-align:center">주문일자</td>
	<td><input type="text" name="orderdate" value="<%=orderdate%>"></td>
</tr>
<tr style="text-align:center">
	<td colspan="2">
		<input type="button" value="수정하기" onclick="return mod()">&nbsp;&nbsp;&nbsp;
		<input type="button" value="취소" onclick="return res()">
	</td>
</tr>
<%
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