<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='http://api.mobilis.co.kr/webfonts/css/?fontface=NanumBrushWeb' rel='stylesheet' type='text/css' />
<link href="/gaenari/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<script src="//code.jquery.com/jquery.js"></script>
<!--<link href="/gaenari/bootstrap/css/bootstrap-ko.css" rel="stylesheet"> -->
<script src="//code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="/gaenari/bootstrap/js/bootstrap.min.js"></script>
<title>Untitled Document</title>
<style type="text/css">
		.toggler { width: 500px; height: 200px; position: relative; }
		#button {  position:relative; text-indent:-99px; cursor:pointer;}
		#effect { width: 140px; height: 100%;  position: fixed;  left:0px; }
		#content { width:160px; height: 100%; float:left; background-color:#FFCC00;top:0%;}
		
</style>
<!-- <style type="text/css">
	body { padding-top: 45px; }
</style> -->
<style type="text/css">
	h1,h2,h3,h4,h5,td,small,a,button,p {   font-family:'맑은 고딕' } 
	table#menu{
		margin-top: 50px;
	}
	body{
		margin-left: 170px;
	}
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script> 
<script type="text/javascript"> 
jQuery(function() {
	jQuery( "#button" ).toggle(
		function() {
			jQuery( "#effect" ).animate({left: '-140px'}, 500 );
			jQuery( "#button" ).html("<img src='/gaenari/image/arrow487.png' width='14px'>");
		},	
			
		function() {
			jQuery( "#effect" ).animate({left: 0}, 500 );
			jQuery( "#button" ).html("<img src='/gaenari/image/arrowhead7.png' width='14px'>");
		}
		
	);
});
</script> 
</head>
<body>

	<div id="effect">
	    <div id="content">
		<table border="0" align="left" width="100%" id="menu">
		<tr>
			<td width="90%">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="/gaenari/miniHome.do?userid=${requestScope.user.userid}"><img src="/gaenari/image/mainpage.PNG" width="90px"></a></li>
					<li><a href="/gaenari/calendar.do?userid=${requestScope.user.userid}"><img src="/gaenari/image/calendar.PNG" width="90px"></a></li>
					<li><a href="/gaenari/diaryList.do?userid=${requestScope.user.userid}"><img src="/gaenari/image/diarypage.PNG" width="90px"></a></li>
					<li><a href="/gaenari/planList.do?userid=${requestScope.user.userid}"><img src="/gaenari/image/planImage.PNG" width="90px"></a></li>
					<li><a href="/gaenari/visitList.do?userid=${requestScope.user.userid}"><img src="/gaenari/image/visit.png" width="90px"></a></li>
					<li><a href="/gaenari/friends.do?userid=${requestScope.user.userid}"><img src="/gaenari/image/friends.PNG" width="90px"></a></li>
				</ul>
			</td>
			<td width="10%"></td>
		</tr>
		<tr>
			<td>
			</td>
			<td align="right">
				<div id="button">
					<p><a href="#"><img src="/gaenari/image/arrowhead7.png" width="14px"></a></p>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				${requestScope.user.userid}님<br><small>홈페이지 이용중</small>
			</td>
		</tr>
	</table>
		</div>

	</div>
	<%@ include file="/static/pages/miniHomebar.jsp"%>
	</body>
</html>
