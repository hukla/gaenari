<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/gaenari/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<title>환영합니다.</title>
<!-- 
작성: 2014-05-24
작성자: 최성훈
내용: 새로 가입한 사람 환영하고 로그인시키기

 -->
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<body>
	<form action="/gaenari/home.do" method="post">
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
				<input type="hidden" name="userid" value="${sessionScope.userid}">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="로그인">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<!-- <a id="fbLogoutBtn" href="#" onclick="location.href='/gaenari/logout.do'">첫 페이지로</a> -->
				<input type="button" value="첫 페이지로" id="fbLogoutBtn" onclick="location.href='/gaenari/login.do'">
			</td>
		</tr>
	</table>
	</form>
	<script src="/gaenari/bootstrap/js/bootstrap.min.js"></script>
<div id="fb-root"></div>
	<script src="//connect.facebook.net/en_US/all.js"></script>
	<script>
		$(window).load(function() {
			// init the FB JS SDK
			FB.init({
				appId : '846213518728713', // App ID from the App Dashboard
				// check the login status upon init?
				cookie : true, // set sessions cookies to allow your server to access the session?
				xfbml : false, // parse XFBML tags on this page?
				version : 'v2.0'
			});

			FB.getLoginStatus(function(response) {
				$("#fbLogoutBtn").show();
			});

			$("#fbLogoutBtn").click(function() {
				FB.logout(function(response) {
				});
			});
		});
	</script>
</html>
<%@ include file="bottom.jsp"%>