<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>vote</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section style="position:fixed; top:100px; left:0px; width:100%; height:100%; background-color:lightgray">
<h2 style="text-align:center"><b>후보조회</b></h2>
<form style="display:flex; align-items:center; justify-content:center;">
<table border="1">
<tr>
	<td style="text-align:center">주민번호</td>
	<td><input type="text" name="v_jumin"> 예 : 8906153154726</td>
</tr>
<tr>
	<td style="text-align:center">성명</td>
	<td><input type="text" name="v_name"></td>
</tr>
<tr>
	<td style="text-align:center">투표번호</td>
	<td>
	<select>
		<option value=""></option>
		<option value="1">[1] 김후보</option>
		<option value="2">[2] 이후보</option>
		<option value="3">[3] 박후보</option>
		<option value="4">[4] 조후보</option>
		<option value="5">[5] 최후보</option>
	</select>
	</td>
</tr>
<tr>
	<td style="text-align:center">투표시간</td>
	<td><input type="text" name="v_time"></td>
</tr>
<tr>
	<td style="text-align:center">투표장소</td>
	<td><input type="text" name="v_area"></td>
</tr>
<tr>
	<td style="text-align:center">유권자확인</td>
	<td><input type="radio">확인 <input type="radio">미확인</td>
</tr>
<tr style="text-align:center">
	<td colspan="2">
	<input type="button" value="투표하기">
	<input type="button" value="다시하기">
</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>