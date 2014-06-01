<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/gaenari/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<style type="text/css">
	th{ text-align:left; font-family: '서울한강체';font-size: large;}
	td{ text-align:left; font-family: '서울한강체';font-size: medium;}
	span{ font-size: small; font-weight: lighter; }
	button,h1,h4{	font-family: '맑은 고딕';	}
</style>
<title>회원가입 페이지</title>
<!-- 
작성: 2014-05-23
작성자: 최성훈
내용: 회원가입 받기

수정: 2014-05-28, 최성훈	내용: 첫 방문시 가입하도록 하고 페북을 통해 받은 이메일, 아이디 뿌려주기
수정: 2014-05-29, 최성훈	내용: ui수정 및 페이스북 메인사진받아서 뿌리기
수정: 2014-05-30, 최성훈	내용: 일반회원가입시 email 파라미터 넘겨주기 오류 수정
 -->
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="/gaenari/bootstrap/js/bootstrap.min.js"></script>
<script src="/gaenari/dupcheck.js"></script>

<body>
	<h1 class="form-signin-heading" align="center">
		<font size="8" color="#3f4536" face="맑은 고딕">
		<c:if test="${requestScope.username ne null}">
			<img src="${requestScope.image}" width="100" class="img-rounded"><p><p>${requestScope.username}님
		</c:if>
		첫 방문을 환영합니다.</font>
	</h1>
	<h4 align="center">회원정보를 입력해주세요</h4>
	<hr color="blue">
	<form action="/gaenari/join.do" method="post" id="joinForm">
		<table align="center"><tr><td width="500">
			<table align="center" border="0" class="table">
				<colgroup>
					<col width="40%" align="center">
					<col width="60%">
				</colgroup>
				<tr>	
					<th>E-mail</th>
					<td><input class="form-control" type="text" value="${requestScope.email}" name="email" id="email" placeholder="Email을 입력하세요"></td>
				</tr>
				<tr>
					<th>ID&nbsp;&nbsp;&nbsp;<span>중복결과 여부</span></th>
					<td><input class="form-control" type="text" name="userid" id="id" placeholder="ID를 4자 이상 입력하세요"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input class="form-control" type="text" name="username" value="${requestScope.username}" placeholder="이름을 입력하세요"></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input class="form-control" type="password" name="pwd" placeholder="비밀번호를 입력하세요"></td>
				</tr>
				<tr>
					<th>Password 확인</th>
					<td><input class="form-control" type="password" name="pwd1" placeholder="비밀번호를 확인하세요"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input class="form-control" type="text" name="addr" placeholder="주소를 입력하세요"></td>
				</tr>
				<tr>
					<th>타입</th>
					<td align="center">
						유기견센터운영자<input type="radio" name="type" value="1">
						일반사용자<input type="radio" name="type" value="0">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<c:if test="${requestScope.image != null}">
							<input type="hidden" name="image" value="${requestScope.image}">
						</c:if>
						<c:if test="${requestScope.email != null}">
							<input type="hidden" name="email" value="${requestScope.email}">
						</c:if>
						<!-- <input type="submit" value="가입하기"> -->
						&nbsp;&nbsp;&nbsp;&nbsp;
						<!-- <input type="button" value="취소하기" id="fbLogoutBtn" onclick="location.href='/gaenari/login.do'"> -->
					</td>
				</tr>
			</table>
	</td></tr></table>
	<div align="center">
	<button type="button" class="btn btn-primary" onclick="login()">가입하기</button>
		&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" class="btn btn-default" id="fbLogoutBtn" onclick="location.href='/gaenari/login.do'">취소하기</button></div>
	</form>
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
		});
	</script>
	<script type="text/javascript">
		function login(){
			$("#joinForm").submit();
		}
	
		var emailResult = "${requestScope.email}";
		var email = document.getElementById("email");
		if(emailResult.length != 0){
			email.disabled=true;
		}
	</script>
</body>
</html>
<%@ include file="bottom.jsp"%>