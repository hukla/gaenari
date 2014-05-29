<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/frame.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>요청 완료 페이지</title>
</head>
<body>
	<h1 align='center'>요청이 완료되었습니다.</h1>
	<table>
		<tr>
			<td colspan="4">요청한 상품 내역</td>
		</tr>
		<tr>
			<td>상품명</td>
			<td>수량</td>
		</tr>
		<tr>
			<td>${requestScope.itemname}</td>
			<td>${requestScope.donnation.qty }</td>
		</tr>
	</table>
</body>
</html>