<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp"%>
<%
request.setCharacterEncoding("utf-8");
String mode = request.getParameter("mode");

String orderno = request.getParameter("orderno");
String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String menuno = request.getParameter("menuno");
String amount = request.getParameter("amount");
String orderdate = request.getParameter("orderdate");

try{
	String sql = "";
	PreparedStatement pstmt = null;
	
	switch(mode){
	case "insert":
		sql = "insert into order_tbl values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, orderno);
		pstmt.setString(2, custno);
		pstmt.setString(3, custname);
		pstmt.setString(4, menuno);
		pstmt.setString(5, amount);
		pstmt.setString(6, orderdate);
		
		pstmt.executeUpdate();
		%>
		<jsp:forward page="orderlist.jsp"></jsp:forward>
		<%
		break;
	case "update":
		sql = "update order_tbl set custno=?, custname=?, menuno=?, amount=?, orderdate=? where orderno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.setString(2, custname);
		pstmt.setString(3, menuno);
		pstmt.setString(4, amount);
		pstmt.setString(5, orderdate);
		pstmt.setString(6, orderno);
		
		pstmt.executeUpdate();
		%>
		<jsp:forward page="orderlist.jsp"></jsp:forward>
		<%
		break;
	case "delete":
		sql = "delete from order_tbl where orderno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, orderno);
		
		pstmt.executeUpdate();
		%>
		<jsp:forward page="orderlist.jsp"></jsp:forward>
		<%
		break;
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>