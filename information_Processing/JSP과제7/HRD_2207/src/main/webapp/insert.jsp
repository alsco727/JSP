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
<h2 style="text-align:center">골프연습장 회원관리 프로그램</h2>
<form method="post" action="action.jsp" name="frm" style="display:flex; align-items:center; justify-content:center">
<table border="1">
<tr>
<td style="text-align:center">수강월</td>
<td><input type="text" name="regist_month">2022년03월 예)202203</td>
</tr>
<tr>
<td style="text-align:center">회원명</td>
<td><select name="c_name" onchange="nameChange()">
<option value="">회원명</option>
<option value="10001">홍길동</option>
<option value="10002">장발장</option>
<option value="10003">임꺽정</option>
<option value="20001">성춘향</option>
<option value="20002">이몽룡</option>
</select></td>
</tr>
<tr>
<td style="text-align:center">회원번호</td>
<td><input type="text" name="c_no" readonly></td>
</tr>
<tr>
<td style="text-align:center">강의장소</td>
<td><select name="class_area">
<option value="">강의장소</option>
<option value="1">서울본원</option>
<option value="2">성남분원</option>
<option value="3">대전분원</option>
<option value="4">부산분원</option>
<option value="5">대구분원</option>
</</select></td>
</tr>
<tr>
<td style="text-align:center">강사명</td>
<td><select name="teacher_code" onchange="price()">
<option value="">강사명</option>
<option value="100">이초급</option>
<option value="200">김중급</option>
<option value="300">박고급</option>
<option value="400">정심화</option>
</select></td>
</tr>
<tr>
<td style="text-align:center">수강료</td>
<td><input type="text" name="class_price" readonly></td>
</tr>
<tr style="text-align:center">
<td colspan="2">
<input type="button" value="수강신청" onclick="addCheck()">
<input type="button" value="다시쓰기" onclick="res()">
</td>
</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>