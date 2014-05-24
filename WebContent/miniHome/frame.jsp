<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공통 프레임</title>
<!-- 
작성자: 최성훈
작성목적: 모든 페이지에 적용될 프레임의 구현
작성내용: 총 세 칸으로 구성 
		  상단(colspan=2 -> 페이지명, 웹서비스로고, 전체서비스 naviBar), 
		  좌하단(미니홈피 naviBar), 우하단(메인 기능구현)
		  
수정: 최성훈
수정일: 2014-04-23
수정내용: 메인페이지 이동할 때 url패턴으로 action 통해서 가도록 수정
 -->

</head>
<body>
	<table border="1" width="1350" height="630">
		<tr>
			<td colspan="2" height="20%">
				<h3>${sessionScope.user.username}님의 [??] 페이지</h3>
				<div align="right">
					<input type="button" value="로그아웃" onclick="location.href='control?command=logout'">
				</div>
				<hr color="gray">
			</td>
		</tr>
		<tr>
			<td width="17%" height="80%">
				<table border="1" align="center" width="203" cellpadding="40">
				
				<!-- 페이지 왼편 서브메뉴(메인페이지, 달력, 방명록, 친구신청) -->
				
					<tr>
						<td><a href="control?command=login">메인페이지</a></td>
					</tr>
					<tr>
						<td><a href="control?command=calendar">달력</a></td>
					</tr>
					<tr>
						<td><a href="control?command=visitList">방명록</a></td>
					</tr>
					<tr>
						<td><a href="">친구관리</a></td>
					</tr>
					<tr>
						<td><a href="mall/mall_index.jsp">기부몰</a></td>
					</tr>
				</table>
			</td>
			<td rowspan="2" width="83%" height="80%">
				메인
			</td>
		</tr>
	</table>
</body>
</html>