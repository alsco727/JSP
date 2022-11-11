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
<h2 style="text-align:center">홈쇼핑 회원 등록</h2>
<form method="post" action="action.jsp" name="frm" style="display:flex; align-items:center; justify-content:center;">
<input type="hidden" name="mode" value="insert">
<table border="1">
<%
request.setCharacterEncoding("UTF-8");
try{
	String sql="select max(custno) + 1 from member_tbl_02";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
%>
<tr>
<td style="text-align:center">회원번호(자동발생)</td>
<td><input type="text" name="custno" value="<%=rs.getString(1) %>" readonly></td>
</tr>
<tr>
<%
}
catch(Exception e){
	e.printStackTrace();
}
%>
<td style="text-align:center">회원성명</td>
<td><input type="text" name="custname"></td>
</tr>
<tr>
<td style="text-align:center">회원전화</td>
<td><input type="text" name="phone"></td>
</tr>
<tr>
<td style="text-align:center">회원주소</td>
<td><input type="text" name="address"></td>
</tr>
<tr>
<td style="text-align:center">가입일자</td>
<td><input type="text" name="joindate"></td>
</tr>
<tr>
<td style="text-align:center">고객등급[A:VIP,B:일반,C:직원]</td>
<td><input type="text" name="grade"></td>
</tr>
<tr>
<td style="text-align:center">도시코드</td>
<td><input type="text" name="city"></td>
</tr>
<tr style="text-align:center">
<td colspan="2">
<input type="button" value="등록" onclick="addCheck()">
<input type="button" value="조회" onclick="location.href='memberlist.jsp'">
</td>
</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>