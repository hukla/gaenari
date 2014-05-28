<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="/gaenari/bootstrap/css/bootstrap.min.css">
<link rel="shortcut icon" type="image/x-icon" href="http://img.naver.net/static/www/favicon.ico" />

<!-- 
<link rel="stylesheet"
	href="/SeoulManProject/btsrp/css/bootstrap.min.css">
<link rel="shortcut icon" type="image/x-icon"
	href="http://img.naver.net/static/www/favicon.ico" />
<link rel="shortcut icon" href="../../assets/ico/favicon.png">
 -->
 
<title>로그인</title>
<!-- 
<link href="../../dist/css/bootstrap.css" rel="stylesheet">
<link href="signin.css" rel="stylesheet">
 -->
 
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
 
</head>

<body>
<% if(!session.isNew()) session.invalidate(); %>
<div id="fb-root"></div>


	<div class="container">

		<form class="form-signin" action="login.do" method="post">

			<h2 class="form-signin-heading" align="center">THE GAENARI</h2>
			<h3 align="center">
				<small>세계 최대의 애견관리 포털 "개나리"에 가입하세요!</small>
			</h3>
			<h3 align="center">
				<img src="/gaenari/image/logo.jpg" width="300" height="300" align="middle"><br>
				<br>
			</h3>
			<center>
			<div class="col-lg-4">
				<label for="exampleInputEmail1">USER ID</label> <input type="text"
					class="form-control" name="userid" placeholder="Enter ID">
			</div>
			<div class="col-lg-4">
				<label for="exampleInputPassword1">PASSWORD</label> <input
					type="password" class="form-control" name="pwd" placeholder="Password">
			</div>
			</center>

			<h1 align="center">
				<button type="submit" class="btn btn-primary btn-lg">SIGN IN</button>
				&nbsp;
				<button type="button" class="btn btn-primary btn-lg"
					onclick="location.href='join.jsp'">JOIN US</button>
					&nbsp;
					<div class="fb-login-button" data-max-rows="1" data-size="medium" data-show-faces="false" data-auto-logout-link="false"  scope="email"></div>
			</h1>
		</form>
	</div>
	<p>사용자정보 출력</p>
	<div align="left">
		<img id="image"/>
        <div id="name"></div>
		<div id="id"></div>
	</div>
</body>
</html>
