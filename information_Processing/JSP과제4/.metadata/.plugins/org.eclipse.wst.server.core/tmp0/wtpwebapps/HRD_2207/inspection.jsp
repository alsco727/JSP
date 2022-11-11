<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inspection</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section style="position:fixed; top:100px; left:0px; width:100%; height:100%; background-color:lightgray">
<h2 style="text-align:center"><b>투표검수조회</b></h2>
<form style="display:flex; align-items:center; justify-content:center; text-align:center">
<table border="1">
<tr>
	<td>성명</td>
	<td>생년월일</td>
	<td>나이</td>
	<td>성별</td>
	<td>후보번호</td>
	<td>투표시간</td>
	<td>유권자확인</td>
</tr>
<%
request.setCharacterEncoding("UTF-8");

try{
	Connection conn = Util.getConnection();
	String sql = "select v_name, v_jumin, m_no, v_time, v_confirm from tbl_vote_202005 where v_area = '제1투표장'";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		String birth = "19" + rs.getString(2).substring(0,2) + "년" + rs.getString(2).substring(2,4) + "월" + rs.getString(2).substring(4, 6) + "일";
		int age = Integer.parseInt(rs.getString(2).substring(0,2)) + 1900;
		String age2 = "만 " + (2020 - age) + "세";
		String gender = rs.getString(2).substring(6,7);
		switch(gender){
		case "1":
			gender="남";
			break;
		case "2":
			gender="여";
			break;
		}
%>
<tr>
	<td><%=rs.getString(1) %></td>
	<td><%=birth %></td>
	<td><%=age2 %></td>
	<td><%=gender %></td>
	<td></td>
	<td></td>
	<td></td>
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