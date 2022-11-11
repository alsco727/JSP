<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section style="position:fixed; top:100px; left:0px; width:100%; height:100%; background-color:lightgray">
<h2 style="text-align:center"><b>회원정보조회</b></h2>
<form style="display:flex; align-items:center; justify-content:center; text-align:center; width:100%">
<table border="1">
<tr>
	<td>수강월</td>
	<td>회원번호</td>
	<td>회원명</td>
	<td>강의명</td>
	<td>강의장소</td>
	<td>수강료</td>
	<td>등급</td>
</tr>
<%
request.setCharacterEncoding("UTF-8");

try{
	Connection conn = Util.getConnection();
	String sql="select regist_month, me.c_no, c_name, class_name, class_area, class_price, grade " + 
				"from tbl_teacher_202201 te, tbl_member_202201 me, tbl_class_202201 cl " + 
				"where me.c_no = cl.c_no and te.teacher_code = cl.teacher_code";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		String regist_month = rs.getString(1).substring(0, 4) + "년" + rs.getString(1).substring(4, 6) + "월";
		String class_price = "￦" + rs.getString(6);
%>
<tr>
	<td><%=regist_month %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	<td><%=rs.getString(4) %></td>
	<td><%=rs.getString(5) %></td>
	<td><%=class_price %></td>
	<td><%=rs.getString(7) %></td>
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