<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section style="position:fixed; top:100px; left:0px; width:100%; height:100%; background-color:lightgray">
<h2 style="text-align:center"><b>수강신청</b></h2>
<form style="display:flex; align-items:center; justify-content:center; width:100%">
<table border="1">
<tr>
	<td style="text-align:center">수강월</td>
	<td><input type="text" name="regist_month" style="width:40%">2022월03월 예)202203</td>
</tr>
<tr>
	<td style="text-align:center">회원명</td>
	<td>
	<select name="c_name">
		<option value="">회원명</option>
		<option value="1">홍길동</option>
		<option value="2">장발장</option>
		<option value="3">임꺽정</option>
		<option value="4">성춘향</option>
		<option value="5">이몽룡</option>
	</select>
	</td>
</tr>
<%
request.setCharacterEncoding("UTF-8");
String c_name = getInitParameter("c_name");

try{
	Connection conn = Util.getConnection();
	String sql = "select c_no from tbl_member_202201 where c_name = '홍길동'";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	rs.next();
%>
<tr>
	<td>회원번호</td>
	<td><input type="text" value="<%=rs.getString(1) %>" readonly></td>
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