<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String regist_month = request.getParameter("regist_month");
String c_no = request.getParameter("c_no");
String class_area = request.getParameter("class_area");
String tuition = request.getParameter("tuition");
String teacher_code = request.getParameter("teacher_code");
try{
	Connection conn = Util.getConnection();
	String sql = "insert into tbl_class_202201 values(?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, regist_month);
	pstmt.setString(2, c_no);
	pstmt.setString(3, class_area);
	pstmt.setString(4, tuition);
	pstmt.setString(5, teacher_code);
	
	pstmt.executeUpdate();
	
	sql = "update tbl_teacher_202201 set class_price=? where =?";
	pstmt.setString(1, )
}
catch(Exception e){
	e.printStackTrace();
}
%>