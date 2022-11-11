<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<section style="position:fixed; top:80px; left:0px; width:100%; height:100%; background-color:lightgray">
<h2 style="text-align:center">홈쇼핑 회원 정보 수정</h2>
<form method="post" action="action.jsp" name="frm" style="display:flex; align-items:center; justify-content:center;">
<input type="hidden" name="mode" value="update">
<table border="1">
<%
request.setCharacterEncoding("UTF-8");
String custno = request.getParameter("custno");
try{
	String sql="select * from member_tbl_02 where custno = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,custno);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	String joindate = rs.getString(5).substring(0,4) + rs.getString(5).substring(5,7) + rs.getString(5).substring(8,10);
%>
<tr>
<td style="text-align:center">회원번호(자동발생)</td>
<td><input type="text" name="custno" value="<%=rs.getString(1) %>" readonly></td>
</tr>
<tr>
<td style="text-align:center">회원성명</td>
<td><input type="text" name="custname" value="<%=rs.getString(2) %>"></td>
</tr>
<tr>
<td style="text-align:center">회원전화</td>
<td><input type="text" name="phone" value="<%=rs.getString(3) %>"></td>
</tr>
<tr>
<td style="text-align:center">회원주소</td>
<td><input type="text" name="address" value="<%=rs.getString(4) %>"></td>
</tr>
<tr>
<td style="text-align:center">가입일자</td>
<td><input type="text" name="joindate" value="<%=joindate %>"></td>
</tr>
<tr>
<td style="text-align:center">고객등급[A:VIP,B:일반,C:직원]</td>
<td><input type="text" name="grade" value="<%=rs.getString(6) %>"></td>
</tr>
<tr>
<td style="text-align:center">도시코드</td>
<td><input type="text" name="city" value="<%=rs.getString(7) %>"></td>
</tr>
<%
}
catch(Exception e){
	e.printStackTrace();
}
%>
<tr style="text-align:center">
<td colspan="2">
<input type="button" value="수정" onclick="modify()">
<input type="button" value="조회" onclick="location.href='memberlist.jsp'">
</td>
</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>