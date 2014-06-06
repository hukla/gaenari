<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<link href="/gaenari/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<script src="//code.jquery.com/jquery.js"></script>
<!--<link href="/gaenari/bootstrap/css/bootstrap-ko.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.9.1.min.js"></script> -->
<script src="/gaenari/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
	body { padding-top: 45px; }
</style>
<style type="text/css">
	h1,h2,h3,h4,h5,td,small,a,button,p {   font-family:'맑은 고딕' } 
	table#menu{
		margin-top: 50px;
	}
</style>
</head>
<body>
	<table border="0" align="left" width="14%" id="menu">
		<tr>
			<td width="10%">
			</td>
			<td width="90%">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="/gaenari/miniHome.do?userid=${requestScope.user.userid}">메인페이지</a></li>
					<li><a href="/gaenari/calendar.do?userid=${requestScope.user.userid}">달력</a></li>
					<li><a href="/gaenari/diaryList.do?userid=${requestScope.user.userid}">일기</a></li>
					<li><a href="/gaenari/planList.do?userid=${requestScope.user.userid}">일정</a></li>
					<li><a href="/gaenari/visitList.do?userid=${requestScope.user.userid}">방명록</a></li>
					<li><a href="/gaenari/friends.do?userid=${requestScope.user.userid}">친구관리</a></li>
				</ul>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				${requestScope.user.userid}님<br>홈페이지 이용중
			</td>
		</tr>
	</table>
</body>
</html>