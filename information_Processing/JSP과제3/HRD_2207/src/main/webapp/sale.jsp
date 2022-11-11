<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sale</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section style="position:fixed; top:100px; left:0px; width:100%; height:100%; background-color:lightgray">
<h2 style="text-align:center"><b>골프연습장 회원관리 프로그램</b></h2>
<form style="display:flex; align-items:center; justify-content:center; text-align:center; width:100%">
<table border="1">
<tr>
	<td>강사코드</td>
	<td>강의명</td>
	<td>강사명</td>
	<td>총매출</td>
</tr>
<%
request.setCharacterEncoding("UTF-8");

try{
	Connection conn = Util.getConnection();
	String sql="select te.teacher_code, class_name, teacher_name, sum(tuition) " + 
				"from tbl_teacher_202201 te, tbl_class_202201 cl " + 
				"where te.teacher_code = cl.teacher_code " +
				"group by te.teacher_code, class_name, teacher_name " + 
				"order by te.teacher_code";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		String tuition = "￦" + rs.getString(4);
%>
<tr>
	<td><%=rs.getString(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	<td><%=tuition %></td>
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