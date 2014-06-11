<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/gaenari/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<style type="text/css">
	th{ text-align:left; font-family: '나눔고딕';font-size: large;}
	td{ text-align:left; font-family: '나눔고딕';font-size: medium;}
	span{ font-size: small; font-weight: lighter; }
	button,h1,h4{	font-family: '나눔고딕';	}
	.hidden{display: none;}
</style>
<title>회원가입 페이지</title>
<!-- 
작성: 2014-05-23
작성자: 최성훈
내용: 회원가입 받기

수정: 2014-05-28, 최성훈	내용: 첫 방문시 가입하도록 하고 페북을 통해 받은 이메일, 아이디 뿌려주기
수정: 2014-05-29, 최성훈	내용: ui수정 및 페이스북 메인사진받아서 뿌리기
수정: 2014-05-30, 최성훈	내용: 일반회원가입시 email 파라미터 넘겨주기 오류 수정
수정: 2014-06-07, 이수진	내용: 미니홈피에 인근에서 실종된 유기견 광고를 뿌리기 위해 주소를 select로 받기
 -->
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="/gaenari/bootstrap/js/bootstrap.min.js"></script>
<script src="/gaenari/dupcheck.js"></script>

<body>
	<h1 class="form-signin-heading" align="center">
		<font size="8" color="#3f4536" face="나눔고딕">
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
					<td>
					<select name="addr" class="form-control">
					<option value="광진구">광진구</option>
					<option value="동대문구">동대문구</option>
					<option value="중랑구">중랑구</option>
					<option value="용산구">용산구</option>
					<option value="성동구">성동구</option>
					<option value="강북구">강북구</option>
					<option value="도봉구">도봉구</option>
					<option value="노원구">노원구</option>
					<option value="은평구">은평구</option>
					<option value="서대문구">서대문구</option>
					<option value="마포구">마포구</option>
					<option value="양천구">양천구</option>
					<option value="강서구">강서구</option>
					<option value="구로구">구로구</option>
					<option value="금천구">금천구</option>
					<option value="영등포구">영등포구</option>
					<option value="동작구">동작구</option>
					<option value="관악구">관악구</option>
					<option value="서초구">서초구</option>
					<option value="강남구">강남구</option>
					<option value="송파구">송파구</option>
					<option value="강동구">강동구</option>
					<option value="종로구">종로구</option>
					<option value="중구">중구</option>
					<option value="성북구">성북구</option>				
				</select>
					
					</td>
				</tr>
				<tr>
					<th>타입</th>
					<td align="center">
						유기견센터운영자<input type="radio" name="type" value="1" id="center" onclick="moreinfo(this.value,'con')">
						일반사용자<input type="radio" name="type" value="0" checked="checked" id="center" onclick="moreinfo(this.value,'con')">
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
	<div id="con" style="display: none">
			<table align="center" width="500">
				<colgroup>
					<col width="40%"><col width="60%">
				</colgroup>
				<tr>
					<th>센터명</th>
					<td align="center">
						<input class="form-control" type="text" name="cntrname" placeholder="센터명을 입력하세요">
					</td>
				</tr>
				<tr>
					<th>센터 연락처</th>
					<td align="center">
						<input class="form-control" type="text" name="cntrcontact" placeholder="센터 연락처를 입력하세요">
					</td>
				</tr>
				<tr>
					<th>지역 / 강아지 수</th><td>
					<div class="row"><div class="col-lg-4">
						<select name="cntrloc" class="btn btn-default">
									<option selected="selected" value="unchosen">지역 선택</option>
									<option value="광진구">광진구</option>
									<option value="동대문구">동대문구</option>
									<option value="중랑구">중랑구</option>
									<option value="용산구">용산구</option>
									<option value="성동구">성동구</option>
									<option value="강북구">강북구</option>
									<option value="도봉구">도봉구</option>
									<option value="노원구">노원구</option>
									<option value="은평구">은평구</option>
									<option value="서대문구">서대문구</option>
									<option value="마포구">마포구</option>
									<option value="양천구">양천구</option>
									<option value="강서구">강서구</option>
									<option value="구로구">구로구</option>
									<option value="금천구">금천구</option>
									<option value="영등포구">영등포구</option>
									<option value="동작구">동작구</option>
									<option value="관악구">관악구</option>
									<option value="서초구">서초구</option>
									<option value="강남구">강남구</option>
									<option value="송파구">송파구</option>
									<option value="강동구">강동구</option>
									<option value="종로구">종로구</option>
									<option value="중구">중구</option>
									<option value="성북구">성북구</option>
							</select>
							</div>
  							<div class="col-lg-4 pull-right">
								<input class="form-control" type="text" name="dogs" placeholder="강아지 수">
							</div><div align="right">강아지수</div>
						</div>
					</td>
				</tr>
				</table><br>
				</div>
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
		function moreinfo(v,id){
			if(v == "1"){
				document.getElementById(id).style.display = ""; // 보여줌
			}else{
				document.getElementById(id).style.display = "none"; // 숨김
			}
		}
	</script>
</body>
</html>
<%@ include file="bottom.jsp"%>