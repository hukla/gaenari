<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유기견을 찾습니다!</title>
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
						<td><a href="/gaenari/control?command=missingBoardList">유기견 신고</a></td>
					</tr>
					<tr>
						<td><a href="/gaenari/control?command=findingBoardList">유기견 제보</a></td>
					</tr>
					<tr>
						<td><a href="/gaenari/control?command=adpBoardList">유기견 입양</a></td>
					</tr>
				</table>
			</td>
			<td rowspan="2" width="83%" height="80%">
				<br><br>
				<center>
				<table border='0' cellspacing=3 cellpadding=20 width='600'>
								    <tr>
									   	<td><div align="center">
											<img src="/gaenari/board/dogpic/dog1.jpg" width="150" height="100">
										</div> <br>
										</td>
									<td>
									   <div align="center">
											<img src="/gaenari/board/dogpic/dog2.jpg" width="150" height="100">
										</div> <br>
								    </td>
								    <td>
								    	<div align="center">
											<img src="/gaenari/board/dogpic/dog3.jpg" width="150" height="100">
										</div> <br>
									</td>
									<td>
										<div align="center">
											<img src="/gaenari/board/dogpic/dog4.jpg" width="150" height="100">
										</div> <br>
									</td>
								    </tr>
								       <tr>
									   	<td><div align="center">
											<img src="/gaenari/board/dogpic/dog1.jpg" width="150" height="100">
										</div> <br>
										</td>
									<td>
									   <div align="center">
											<img src="/gaenari/board/dogpic/dog2.jpg" width="150" height="100">
										</div> <br>
								    </td>
								    <td>
								    	<div align="center">
											<img src="/gaenari/board/dogpic/dog3.jpg" width="150" height="100">
										</div> <br>
									</td>
									<td>
										<div align="center">
											<img src="/gaenari/board/dogpic/dog4.jpg" width="150" height="100">
										</div> <br>
									</td>
								    </tr>
								       <tr>
									   	<td><div align="center">
											<img src="/gaenari/board/dogpic/dog1.jpg" width="150" height="100">
										</div> <br>
										</td>
									<td>
									   <div align="center">
											<img src="/gaenari/board/dogpic/dog2.jpg" width="150" height="100">
										</div> <br>
								    </td>
								    <td>
								    	<div align="center">
											<img src="/gaenari/board/dogpic/dog3.jpg" width="150" height="100">
										</div> <br>
									</td>
									<td>
										<div align="center">
											<img src="/gaenari/board/dogpic/dog4.jpg" width="150" height="100">
										</div> <br>
									</td>
								    </tr>
				</table>
				</center>
					<span style="font-size:9pt;"><a href="/gaenari/board/missingBoardWrite.jsp"><input type="hidden" value=${id} name="id"><input type=submit value=글쓰기></a></span></div>
			</td>
		</tr>
	</table>
</body>
</html>