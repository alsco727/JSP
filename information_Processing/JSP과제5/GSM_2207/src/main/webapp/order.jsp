<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order</title>
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<section style="position:fixed; top:70px; left:0px; width:100%; height:100%; background-color:lightgray">
<h2 style="text-align:center">카페 메뉴 주문하기</h2>
<form method="post" action="action.jsp" name="frm" style="display:flex; align-items: center; justify-content:center">
<input type="hidden" name="mode" value="insert">
<table border="1">
<tr>
	<td style="text-align:center">주문번호</td>
	<%
	request.setCharacterEncoding("utf-8");
	String orderno = "";
	
	try{
		String sql="select max(orderno) + 1 from order_tbl";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		orderno = rs.getString(1);
	}
	catch(Exception e){
		e.printStackTrace();
	}
	%>
	<td><input type="text" name="orderno" value="<%=orderno %>" readonly></td>
</tr>
<tr>
	<td style="text-align:center">고객번호</td>
	<td><input type="text" name="custno"></td>
</tr>
<tr>
	<td style="text-align:center">고객이름</td>
	<td><input type="text" name="custname"></td>
</tr>
<tr>
	<td style="text-align:center">메뉴번호</td>
	<td>
	<input type="radio" name="menuno" value="10001">아메리카노&nbsp;
	<input type="radio" name="menuno" value="10002">카페 라떼&nbsp;
	<input type="radio" name="menuno" value="10003">카페 모카&nbsp;
	<input type="radio" name="menuno" value="10004">돌체 라떼&nbsp;
	<input type="radio" name="menuno" value="10005">콜드 브루
	</td>
</tr>
<tr>
	<td style="text-align:center">수량</td>
	<td><select name="amount">
	<option value="1">1개(추가 주문 시 선택)</option>
	<option value="2">2개</option>
	<option value="3">3개</option>
	<option value="4">4개</option>
	<option value="5">5개</option>
	<option value="6">6개</option>
	<option value="7">7개</option>
	<option value="8">8개</option>
	<option value="9">9개</option>
	<option value="10">10개</option>
	</select></td>
</tr>
<tr>
	<td style="text-align:center">주문일자</td>
	<td><input type="text" name="orderdate" placeholder="예) 20220105"></td>
</tr>
<tr style="text-align:center">
	<td colspan="2">
		<input type="button" value="주문하기" onclick="return addCheck()">&nbsp;&nbsp;&nbsp;
		<input type="button" value="다시하기" onclick="return res()">
	</td>
</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>