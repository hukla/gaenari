<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��� �Ϸ� ������</title>
</head>
<body>
	<h1 align='center'>������ּż� �����մϴ�.</h1>
	<table>
		<tr>
			<td colspan="4">����� ��ǰ ����</td>
		</tr>
		<tr>
			<td>��ǰ��</td>
			<td>����</td>
			<td>��� ���</td>
			<td>�ݾ�</td>
		</tr>
		<tr>
			<td>${requestScope.item.itemname}</td>
			<td>${requestScope.donnation.qty }</td>
			<td>${requestScope.cntrname }</td>
			<td>${requestScope.donnation.price }</td>
		</tr>
	</table>
	<br/><br/>
	������ �̳��� �� �ݾ��� <strong>���¹�ȣ</strong>�� �Ա����ּ���.	
</body>
</html>