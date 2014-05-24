<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>기부 완료 페이지</title>
</head>
<body>
	<h1 align='center'>기부해주셔서 감사합니다.</h1>
	<table>
		<tr>
			<td colspan="4">기부한 상품 내역</td>
		</tr>
		<tr>
			<td>상품명</td>
			<td>수량</td>
			<td>기부 대상</td>
			<td>금액</td>
		</tr>
		<tr>
			<td>${requestScope.item.itemname}</td>
			<td>${requestScope.donnation.qty }</td>
			<td>${requestScope.cntrname }</td>
			<td>${requestScope.donnation.price }</td>
		</tr>
	</table>
	<br/><br/>
	일주일 이내로 위 금액을 <strong>계좌번호</strong>로 입금해주세요.	
</body>
</html>