<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>환영합니다.</title>
</head>
<body>
	<form action="/gaenari/home.do">
	<table align="center" width="400" height="600">
		<colgroup>
			<col align="center" width="30%"><col align="center" width="70%">
		</colgroup>
		<tr>
			<td colspan="2">${sessionScope.userid}님 반갑습니다! 로그인해주세요</td>
		</tr>
		<tr>
			<td>Email주소</td><td><input type="text" value="${requestScope.email}" disabled="disabled"></td>
		</tr>
		<tr>
			<td>PASSWORD</td>
			<td>
				<input type="password" name="pwd">
				<input type="hidden" name="userid" value="${sesssionScope.userid}">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="로그인">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="취소하기">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>