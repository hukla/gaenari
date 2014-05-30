<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<link href="/gaenari/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<script src="//code.jquery.com/jquery.js"></script>

<!--<link href="/gaenari/bootstrap/css/bootstrap-ko.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.9.1.min.js"></script> -->

<style type="text/css">
	body { padding-top: 55px; }
</style>
<!-- (0 399px 29px 293px
작성자: 최성훈
작성목적: 모든 페이지에 적용될 프레임의 구현
작성내용: 총 세 칸으로 구성 
		  상단(colspan=2 -> 페이지명, 웹서비스로고, 전체서비스 naviBar), 
		  좌하단(미니홈피 naviBar), 우하단(메인 기능구현)
		  
수정: 최성훈
수정일: 2014-04-23
수정내용: 메인페이지 이동할 때 url패턴으로 action 통해서 가도록 수정

수정: 최성훈
수정일: 2014-05-25
수정내용: 좌측 메뉴바 그냥 상단 고정 내비게이션바로 바꿈

수정: 2014-05-27, 최성훈
내용: 위치 miniHome -> webcontent밑으로 이동

수정: 2014-05-28, 최성훈
내용: 로그아웃 버튼 페이스북로그아웃 연동 추가

수정: 2014-05-29, 최성훈
내용: 개인정보보기 기능추가
 -->
</head>
<!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->

<body>
<font face="서울한강체" size="4">
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>&nbsp;&nbsp;&nbsp;&nbsp;
    <a class="navbar-brand" href="/gaenari/home.do" class="active">GAENARI</a>
  </div>
 
  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav">
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">내 홈피<b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="/gaenari/miniHome.do">메인페이지</a></li>
          <li><a href="/gaenari/calendar.do">달력보기</a></li>
          <li><a href="/gaenari/visitList.do">방명록</a></li>
          <li><a href="/gaenari/friends.do">친구관리</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">커뮤니티<b class="caret"></b></a>
        <ul class="dropdown-menu">
          <!-- <li><a href="/gaenari/missingBoardList.do">유기견</a></li> -->
          <li><a href="/gaenari/missingBoardMain.do">유기견</a></li>
          <li><a href="/gaenari/adpBoardList.do">애견입양</a></li>
          <li><a href="/gaenari/voluBoardList.do">자원봉사</a></li>
          <li><a href="/gaenari/ptBoardList.do">펫 도우미</a></li>
        </ul>
      </li>
      <li><a href="/gaenari/mall/mallMain.do">기부몰</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
        <a href="#" class="dropdown-toggle glyphicon glyphicon-cog" data-toggle="dropdown"><b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a id="fbLogoutBtn" href="#" onclick="location.href='/gaenari/login.do'">로그아웃</a></li>
          <li><a href="#" onclick="getUserinfo()">개인정보수정</a></li>
          <li><a href="#">회원탈퇴</a></li>
          <li><a href="#">개발자정보</a></li>
        </ul>
      </li>
    </ul>
  </div><!-- /.navbar-collapse -->
 
</nav></font>
<table align="center" width="100%" border="0">
	<tr height="45%">
		<td><div align="center">
		<h2 align="center">
			<a href="/gaenari/home.do">
				<img src="/gaenari/image/logo.jpg"  width="70"/></a>THE GAENARI</h2>
			</div>
		<td>
	</tr>
</table>

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
		
		function getUserinfo() {
			var newwindow;
			var url = "/gaenari/userinfo.do";
			
			newwindow = window.open(url, '회원정보', 'height=700,width=660,scrollbars=yes');
			if(window.focus) {
				newwindow.focus;
			}
		}
	</script>
</body>
</html>
