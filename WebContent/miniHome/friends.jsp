<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/frame.jsp" %>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>친구관리 페이지</title>
</head>
<script src="/gaenari/dupcheck.js"></script>
<!-- 
작성: 최성훈
작성일: 2014-05-29
내용: 친구관리기능, 친구검색 후 검색된 친구 user정보 미리보기(진행중)
 -->
<body>
[구현할 기능]<br>
1. 친구목록보기<br>
2. 요청받은 친구목록보기<br>
3. 친구검색하기<br>
4. 추천받은 친구목록보기<br>
<form method="post" id="inForm" name="inForm">
<table border="1">
	<tr>
		<td>
			<select name="searchType" id="searchType">
				<option selected="selected">검색구분</option>
				<option value="userid">아이디</option>
				<option value="username">이름</option>
				<option value="address">사는곳</option>
			</select><input type="text" name="word"><input type="button" id="btn" value="검색">
			<input type="button" id="btn2" value="닫기">
		</td>
		<td rowspan="2" width="800"><div id="display">여기에출력</div></td>
	</tr>
	<tr>
		<td>
			<table id="listTable" width="300">
				<tr bgcolor="pink">
					<td>이름</td>
					<td>아이디</td>
					<td>강아지이름</td>
					<td>강아지 종</td>
					<td>주소</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>

<a href="/gaenari/miniHome.do?userid=hukla">hukla</a><br>
<a href="/gaenari/miniHome.do?userid=lyuel">lyuel</a><br>
<a href="/gaenari/miniHome.do?userid=hukla">admin</a><br>
<a href="/gaenari/miniHome.do?userid=csh8908">csh8908</a><br>
<a href="/gaenari/miniHome.do?userid=csh0806">csh0806</a><br>
</body>
</html>

<%@ include file="/bottom.jsp"%>