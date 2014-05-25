<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Welcome to the GNR!</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/gaenari/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>
<script language="javascript">
 window.fbAsyncInit = function() {
	  FB.init({
	    appId      : '846213518728713',
	    cookie     : true,  // enable cookies to allow the server to access 
	                        // the session
	    xfbml      : true,  // parse social plugins on this page
	    version    : 'v2.0' // use version 2.0
	  });

	  FB.getLoginStatus(function(response) {
			    if (response.status === 'connected') {
			    	FB.api('/me', function(user) {
                        if (user) {
                            var image = document.getElementById('image');
                            image.src = 'http://graph.facebook.com/' + user.id + '/picture';
                            var name = document.getElementById('name');
                            name.innerHTML = user.name
                            var id = document.getElementById('id');
                            id.innerHTML = user.id
                            alert(user.name);
                        }
                    });   
			    } else if (response.status === 'not_authorized') {
			    } else {
			    }
	  });
	  };
	  (function(d, s, id) {
		    var js, fjs = d.getElementsByTagName(s)[0];
		    if (d.getElementById(id)) return;
		    js = d.createElement(s); js.id = id;
		    js.src = "//connect.facebook.net/en_US/sdk.js";
		    fjs.parentNode.insertBefore(js, fjs);
		  }(document, 'script', 'facebook-jssdk'));
</script>
<script type="text/javascript">
	$('.carousel').carousel();
</script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/gaenari/bootstrap/js/bootstrap.min.js"></script>
<body>
<% if(!session.isNew()) session.invalidate(); %>
<div id="fb-root"></div>
	<table height="60" width="100%">
		<tr>
			<td width="40%" align="right">
				<h1 class="form-signin-heading"><font size="10" color="#3f4536">THE GAENARI</font></h1>
			</td>
			<td width="55%" align="left">
				<h3><small>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				"개팔자가 상팔자"입니다. 개의 개에 의한 개를 위한, <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				여러분의 개 나으리를 모시겠습니다. 지금 세계 최대의 애견관리 포털 "개나리"에 가입하세요!
				</small></h3>
			</td>
		</tr>
	</table>
	<hr color="black">
	<table width="1300" align="center">
		<tr>
			<td width="60%">
				<div id="myCarousel" class="carousel slide" align="left">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<!-- 회전광고판 항목 -->
					<div class="carousel-inner" align="left">
						<div class="active item">
							<img src="image/retriever-348572.jpg" width="800">
						</div>
						<div class="item">
							<img src="image/woman-335394.jpg" width="800">
						</div>
						<div class="item">
							<img src="image/47H.jpg" width="800">
						</div>
					</div>
					<!-- 회전광고판 탐색 -->
					<a class="carousel-control left en-font-family" href="#myCarousel" data-slide="prev">&lsaquo;</a> 
					<a class="carousel-control right en-font-family" href="#myCarousel" data-slide="next">&rsaquo;</a>
				</div>
			</td>
			<td width="40%">
				<table width="100%" height="535" style="background-color: #dddacc;">
					<tr>
						<td>
							<div class="container">
								<form class="form-signin" action="home.do" method="post">
									<h2 class="form-signin-heading">로그인하세요</h2>
									<input name="userid" type="text" class="form-control" placeholder="Please Enter ID" autofocus> <br>
									<input name="pwd" type="password" class="form-control" placeholder="Please Enter Password">
									<label class="checkbox"> 
									<input type="checkbox" value="remember-me"> 기억하겠습니다.
									</label>
									<button class="btn btn-lg btn-primary btn-block" type="submit">SIGN IN</button>
									<button class="btn btn-lg btn-primary btn-block" type="button" onclick="location.href='join.jsp'">JOIN US</button>
									<br>
									<div align="center" class="fb-login-button" data-max-rows="1" data-size="medium" data-show-faces="false" data-auto-logout-link="false"  scope="email"></div>
									
								</form>
								<p>사용자정보 출력</p>
								<div align="left">
									<img id="image" />
									<div id="name"></div>
									<div id="id"></div>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</td>
	</table>
	<hr color="black">
</body>
</html>