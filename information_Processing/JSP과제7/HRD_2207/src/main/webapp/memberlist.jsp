<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberlist</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section style="position:fixed; top:80px; left:0px; width:100%; height:100%; background-color:lightgray">
<h2 style="text-align:center">회원정보조회</h2>
<form style="display:flex; align-items:center; justify-content:center; text-align:center">
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
	String sql = "select c.regist_month, m.c_no, m.c_name, t.class_name, c.class_area, c.tuition, m.grade from tbl_teacher_202201 t, tbl_member_202201 m, tbl_class_202201 c where m.c_no = c.c_no and t.teacher_code = c.teacher_code";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		String regist_month = rs.getString(1).substring(0,4) + "년" + rs.getString(1).substring(4,6) + "월";
		int temp = Integer.valueOf(rs.getString(6));
		DecimalFormat DF = new DecimalFormat("###,###");
		String tuition =  "￦" + DF.format(temp);
		%>
		<tr>
		<td><%=regist_month %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=tuition %></td>
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