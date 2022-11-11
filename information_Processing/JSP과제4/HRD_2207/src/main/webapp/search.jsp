<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section style="position:fixed; top:100px; left:0px; width:100%; height:100%; background-color:lightgray">
<h2 style="text-align:center"><b>후보조회</b></h2>
<form style="display:flex; align-items:center; justify-content:center; text-align:center">
<table border="1">
<tr>
	<td>후보번호</td>
	<td>성명</td>
	<td>소속정당</td>
	<td>학력</td>
	<td>주민번호</td>
	<td>지역구</td>
	<td>대표전화</td>
</tr>
<%
request.setCharacterEncoding("UTF-8");

try{
	Connection conn = Util.getConnection();
	String sql = "select m_no, m_name, p_name, p_school, m_jumin, m_city, p_tel1, p_tel2, p_tel3 " + 
				"from tbl_member_202005 me, tbl_party_202005 pa " + 
				"where me.p_code = pa.p_code";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		String school = rs.getString(4);
		switch(school){
		case "1":
			school = "고졸";
			break;
		case "2":
			school = "학사";
			break;
		case "3":
			school = "석사";
			break;
		case "4":
			school = "박사";
			break;
		}
		String jumin = rs.getString(5).substring(0,6) + "-" + rs.getString(5).substring(6, 13);
		String phone = rs.getString(7) + "-" + rs.getString(8) + "-" + rs.getString(9);
%>
<tr>
	<td><%=rs.getString(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	<td><%=school %></td>
	<td><%=jumin %></td>
	<td><%=rs.getString(6) %></td>
	<td><%=phone %></td>
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