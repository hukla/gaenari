<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/gaenari/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<title>환영합니다.</title>
<style type="text/css">
	th{ text-align:left; font-family: '서울한강체';font-size: large;}
	td{ text-align:left; font-family: '서울한강체';font-size: medium;}
	span{ font-size: small; font-weight: lighter; }
	button,h1,h4{	font-family: '맑은 고딕';	}
</style>
<!-- 
작성: 2014-05-24
작성자: 최성훈
내용: 새로 가입한 사람 환영하고 로그인시키기

수정: 2014-05-28, 최성훈	내용: 페이스북 로그인으로 회원가입후 첫페이지 이동시 페이스북로그아웃 안 되는 오류 수정 
수정: 2014-05-29, 최성훈	내용: ui수정 및 페이스북 메인사진받아서 뿌리기
 -->
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<body>
	<h1 class="form-signin-heading" align="center">
		<font size="8" color="#3f4536" face="맑은 고딕">
		<c:if test="${requestScope.image != null}">
			<img src="${requestScope.image}" width="100" class="img-rounded">
		</c:if><p><p>${sessionScope.userid}님 가입을 축하드립니다!</font>
	</h1>
	<h4 align="center">로그인 해주세요</h4>
	<hr color="blue">
	<form action="/gaenari/home.do" method="post"  class="form-horizontal" role="form" id="joinForm">
	<table align="center">
		<tr>
			<td width="500">
				<table align="center" class="table">
					<colgroup>
						<col width="35%">
						<col width="65%">
					</colgroup>
						<tr>
							<td>
								<div class="form-group">
									<label class="col-lg-2 control-label">Email</label>
								</div>
							</td>
							<td>
								<div class="form-group">
									<div class="col-lg-10">
										<p class="form-control-static">${requestScope.email}</p>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
									<label for="inputPassword" class="col-lg-2 control-label">Password</label>
								</div>
							</td>
							<td>
								<div class="form-group">
									<div class="col-lg-10">
										<input type="hidden" name="userid"
											value="${sessionScope.userid}"> <input
											type="password" name="pwd" class="form-control"
											id="inputPassword" placeholder="Password">
									</div>
								</div>
							</td>
						</tr><!-- 
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="로그인">
								&nbsp;&nbsp;&nbsp;&nbsp;
								<a id="fbLogoutBtn" href="#" onclick="location.href='/gaenari/logout.do'">첫 페이지로</a>
								<input type="button" value="첫 페이지로" id="fbLogoutBtn" onclick="location.href='/gaenari/login.do'">
							</td>
						</tr> -->
					</table>
				</td>
			</tr>
		</table>
		<div align="center">
			<button type="button" class="btn btn-primary" onclick="login()">가입하기</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-default" id="fbLogoutBtn" onclick="location.href='/gaenari/login.do'">첫 페이지로</button>
		</div>
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
		
		function login(){
			$("#joinForm").submit();
		}
	</script>
</html>
<%@ include file="bottom.jsp"%>