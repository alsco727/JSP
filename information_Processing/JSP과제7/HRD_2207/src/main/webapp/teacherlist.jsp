<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>teacherlist</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section style="position:fixed; top:80px; left:0px; width:100%; height:100%; background-color:lightgray">
<h2 style="text-align:center">강사조회</h2>
<form style="display:flex; align-items:center; justify-content:center; text-align:center">
<table border="1">
<tr>
<td>강사코드</td>
<td>강사명</td>
<td>강의명</td>
<td>수강료</td>
<td>강사자격취득일</td>
</tr>
<%
request.setCharacterEncoding("UTF-8");
int temp;
try{
	String sql = "select * from tbl_teacher_202201";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		temp = Integer.valueOf(rs.getString(4));
		DecimalFormat DF = new DecimalFormat("###,###");
		String class_price = '￦' + DF.format(temp);
		String teacher_regist_date = rs.getString(5).substring(0,4) + '년' + rs.getString(5).substring(4,6) + '월' + rs.getString(5).substring(6,8) + '일';
		%>
		<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=class_price %></td>
		<td><%=teacher_regist_date %></td>
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