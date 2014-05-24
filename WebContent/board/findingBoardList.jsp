<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유기견 제보 페이지</title>
</head>
<body>
	<table border="1" width="1350" height="630">
		<tr>
			<td colspan="2" height="20%">
				<h3>${sessionScope.user.username}님 접속중:D</h3>
				<hr color="gray">
			</td>
		</tr>
		<tr>
			<td width="17%" height="80%">
				<table border="1" align="center" width="203" cellpadding="40">
				
				<!-- 페이지 왼편 서브메뉴(유기견 신고, 유기견 제보, 유기견 입양) -->
				
					<tr>
						<td><a href="/gaenari/control?command=MissingBoardActionList">유기견 신고</a></td>
					</tr>
					<tr>
						<td><a href="/gaenari/control?command=FindingBoardActionList">유기견 제보</a></td>
					</tr>
					<tr>
						<td><a href="/gaenari/control?command=AdpBoardList">유기견 입양</a></td>
					</tr>
				</table>
			</td>
			<td rowspan="2" width="83%" height="80%">
				<br><br>
					<span style="font-size:9pt;"><a href="/gaenari/board/voluBoardWrite.jsp"><input type="hidden" value=${id} name="id"><input type=submit value=글쓰기></a></span></div>
			</td>
		</tr>
	</table>
</body>
</html>