<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/static/pages/head.jsp" %>
<style type="text/css">
	body {
		background-color: white;
	}
	
	h1,h2,h3,h4,small,a,button,p {
		font-family: "맑은 고딕";
	}
	
	div#myCarousel{
		float: left;
		margin-left: 100px;
		width: 980px;
		heigth: 400px;
	}
	
	div#container {
		width: 980px;
		float: left;
		margin-left: 100px;
	}
	
	div#writer {
		width: 400px;
		margin-right: 60px;
		float: right;
	}
	
	div#bigimg {
		float: left;
		margin-left: 100px;
	}
	
	div#thumb {
		float: left;
		margin-left: 100px;
		width: 280px;
	}
	
	div#thumb2 {
		float: left;
		left:;
		width: 280px;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 
작성: 2014-05-25
작성자: 최성훈
내용: 개나리 웹페이지 메인페이지

수정: 최성훈, 2014-06-04	내용: 안쓰는 주석 지우고 강아지 등록 팝업 크기조절
수정: 이수진, 2014-06-07	내용: 유기견 광고 넣기
 -->
</head>
<body>
	<div id="wrapper">
		<%@ include file="/static/pages/header.jsp"%>
		<div id="content">
		<%@ include file="/static/pages/menubar.jsp"%>
			<div class="container">
				<div id="myCarousel" class="carousel slide" align="left">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<!-- 회전광고판 항목 -->
					<div class="carousel-inner" align="left">
						<div class="active item">
							<img src="/gaenari/image/SplitShire_IMG_1177.jpg" width="980">
							<div class="carousel-caption">
								<div align="left">
									<h1>개나리 홈페이지에 오신 것을 환영합니다.</h1>
								</div>
								<p>애견 관련 세계 최대 포탈, GAENARI에 방문하신것을 환영합니다. 저희 개나리 서비스는 강아지와 내
									정보를 관리하고 다른 유저들과의 커뮤니티 활동은 물론 보다 높은 접근성으로 기부활동을 이끌어 생활의 편의와 공익을
									실현합니다.</p>
							</div>
						</div>
						<div class="item">
							<img src="/gaenari/image/dogface.jpg" width="980">
							<div class="carousel-caption">
								<div align="left">
									<h1>커뮤니티와 내 홈페이지를 이용해보세요!</h1>
								</div>
								<p>...</p>
							</div>
						</div>
						<div class="item">
							<img src="/gaenari/image/dogonroad.jpg" width="980">
							<div class="carousel-caption">
								<div align="left">
									<h1>기부몰에 방문하셔서 유기견들에게 사랑을 나눠주세요</h1>
								</div>
								<p>...</p>
							</div>
						</div>
					</div>
					<!-- 회전광고판 탐색 -->
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
						href="#myCarousel" data-slide="next">&rsaquo;</a>
				</div>

				<div class="jumbotron" id="container">
					<div class="container">
						<h1>
							<font face="맑은 고딕">${sessionScope.userid}님, 안녕하세요</font>
						</h1>
						<small>사랑스런 강아지를 개나리에 등록해주세요!</small> &nbsp;&nbsp;&nbsp;<a
							class="btn btn-primary btn-lg" onclick="addDog()">등록하기</a>
					</div>
				</div>
				<div class="jumbotron" id="writer">
					<div class="col-lg-12" id="write">
						<div class="input-group">
							<input type="text" class="form-control"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">Go!</button>
							</span>
						</div>
						<small>검색? or 문구입력?</small>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-md-3" id="thumb">
						<div class="thumbnail">
							<div align="center">
								<small>${sessionScope.userid}님 이 아이 보신적있나요?</small>
							</div>
							<br> <img src="/gaenari/image/horse.jpg" width="200"
								class="img-rounded">
							<div class="caption">
								<h3>좀찾아주십시오</h3>
								<p>말을잃어버려서기분이안좋스빈다.<br><div id="mname">mname</div></p>
								<p>
									<a href="#" class="btn btn-primary">봤어요</a> <a
										href="/gaenari/missingBoardMain.do" class="btn btn-default">다른신고보기</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-3" id="thumb2">
						<div class="thumbnail">
							<div align="center">
								<small>${sessionScope.userid}님께 친구로 이 분 추천해요!</small>
							</div>
							<br> <img src="/gaenari/image/euriiiii.jpg" width="200"
								class="img-rounded">
							<div class="caption">
								<h3>개나으리</h3>
								<p>가슴이 부서지지 않으면 시가 나올 수 없다. 사면 내리고 팔면 오르네 개미들의 파수꾼이 되는 그날까지</p>
								<p>
									<a href="#" class="btn btn-primary">방문하기</a> <a href="#"
										class="btn btn-default">다른사람보기</a>
								</p>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<%@ include file="/static/pages/footer.jsp"%>
	</div>
</body>
<script type="text/javascript">
	function addDog() {
		var newwindow;
		var url = "/gaenari/addDog.do?userid=${sessionScope.user.userid}";

		newwindow = window.open(url, '강아지등록 페이지',
				'height=600,width=660,scrollbars=yes');
		if (window.focus) {
			newwindow.focus;
		}
	}
</script>
<script>
$(function(){
	$.ajaxSetup({
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
		type:"post"
	});
	
	function getRandomList() {
		$.ajax({
			url: "/gaenari/getRandomMissing.do",
			dataType: "xml",
			success: function(data) {
				$(data).find('mlist').each(function(){
					var mname = $(this).find("mname").text();
					var brdno = $(this).find("brdno").text();
					var mbrdno = $(this).find("mbrdno").text();
					var mkind = $(this).find("mkind").text();
					var mdate = $(this).find("mdate").text();
					var mloc = $(this).find("mloc").text();
					alert(mname);
				});
				$("#mname").append(mname);
				alert(mname);
			},
			error: function(data) { alert(data+' => 에러 발생');}
			
		});// ajax 끝
	}// getRandomList() 함수 끝
	
	getRandomList();
});
</script>
</html>
