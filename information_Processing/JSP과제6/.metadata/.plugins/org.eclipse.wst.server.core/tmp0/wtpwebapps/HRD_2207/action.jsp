<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String mode = request.getParameter("mode");
String sql = "";
PreparedStatement pstmt = null;

String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");

try{
	switch(mode){
	case "insert":
		sql = "insert into member_tbl_02 values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.setString(2, custname);
		pstmt.setString(3, phone);
		pstmt.setString(4, address);
		pstmt.setString(5, joindate);
		pstmt.setString(6, grade);
		pstmt.setString(7, city);
		pstmt.executeUpdate();
		%>
		<jsp:forward page="insert.jsp"></jsp:forward>
		<%
		break;
	case "update":
		sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custname);
		pstmt.setString(2, phone);
		pstmt.setString(3, address);
		pstmt.setString(4, joindate);
		pstmt.setString(5, grade);
		pstmt.setString(6, city);
		pstmt.setString(7, custno);
		pstmt.executeUpdate();
		%>
		<jsp:include page="modify.jsp"></jsp:include>
		<%
		break;
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>