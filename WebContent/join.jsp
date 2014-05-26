<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="login?command=join" method="post">
	<table align="center" border="1" width="500" height="400">
		<colgroup>
			<col width="30%">
			<col width="70%">
		</colgroup>
		<tr>	
			<td>E-mail</td><td><input type="text" name="email" value=""></td>
		</tr>
		<tr>
			<td>ID</td><td><input type="text" name="userid"></td>
		</tr>
		<tr>
			<td>이름</td><td><input type="text" name="username"></td>
		</tr>
		<tr>
			<td>Password</td><td><input type="password" name="pwd"></td>
		</tr>
		<tr>
			<td>Password확인</td><td><input type="password" name="pwd1"></td>
		</tr>
		<tr>
			<td>주소</td><td><input type="text" name="addr"></td>
		</tr>
		<tr>
			<td>타입</td>
			<td>
				유기견센터운영자<input type="radio" name="type" value="1">
				일반사용자<input type="radio" name="type" value="0">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="가입하기">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="취소하기">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" onclick="history.back()" value="뒤로가기">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
<%@ include file="miniHome/bottom.jsp"%>