<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List" %>
<%@ page import="model.dto.UserDTO" %>
<%@ page import="model.dao.UserDAO" %>
<%@ page import="model.dao.TestDAO" %>
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
	
/* 	div#myCarousel {
		float: left;
		margin-left: 8%;
		width: 980px;
		heigth: 400px;
	} */
	div#myCarousel {
		width: 100%;
		heigth: 300px;
	}
 	div#container {
		width: 980px;
		float: left;
		margin-left: 8%;
		margin-top: 20px;
	}
	
	div#writer {
		width: 400px;
		margin-right: 6%;
		float: right;
	}
	
	div#bigimg {
		float: left;
		margin-left: 8%;
	}
	
	div#thumb {
		float: left;
		margin-left: 8%;
		width: 280px;
	}
	
	div#thumb2 {
		float: left;
		left:;
		width: 400px;
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
							<img src="/gaenari/image/dog1.jpg" width="1500">
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
							<img src="/gaenari/image/dog9.jpg" width="1500">
							<div class="carousel-caption">
								<div align="left">
									<h1>커뮤니티와 내 홈페이지를 이용해보세요!</h1>
								</div>
								<p>...</p>
							</div>
						</div>
						<div class="item">
							<img src="/gaenari/image/dog6.jpg" width="1500">
							<div class="carousel-caption">
								<div align="left">
									<h1>기부몰에 방문하셔서 유기견들에게 사랑을 나눠주세요</h1>
								</div>
								<p>...</p>
							</div>
						</div>
					</div>
					<!-- 회전광고판 탐색 -->
					<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
					<a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
				</div>
				<div class="jumbotron" id="container">
					<div class="container">
						<c:choose>
							<c:when test="${sessionScope.userid != null }">
								<h1>${sessionScope.userid}님, 안녕하세요!</h1>
								<small>사랑스런 강아지를 개나리에 등록해주세요!</small> &nbsp;&nbsp;&nbsp;
							<a class="btn btn-primary btn-lg" onclick="addDog()">등록하기</a>
							</c:when>
							<c:otherwise>
								<h1>안녕하세요.</h1>
								<h3 align="center">
									개나리 서비스를 이용해보세요!
									<a href="#" class="btn btn-success btn-lg" data-toggle="modal" data-target="#signup-modal">가입하기</a>
								</h3>
							</c:otherwise>
						</c:choose>
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
								<p>말을잃어버려서기분이안좋스빈다.</p>
								<p>
									<a href="#" class="btn btn-primary">봤어요</a> <a
										href="/gaenari/missingBoardMain.do" class="btn btn-default">다른신고보기</a>
								</p>
							</div>
						</div>
					</div>
					<%
					String img = null;
						if(session.getAttribute("userid")==null){
							List<UserDTO> list = null;
							list = UserDAO.allUsers();
							int ran = (int)(Math.random()*list.size());
							UserDTO user = UserDAO.selectOne(list.get(ran).getUserno());
							/* img = TestDAO.selectLastDiary(user.getUserno()).getBrdcontent().split("!split!")[0];
							if(img!=null){
								request.setAttribute("image", img);
							}else{
								request.setAttribute("image", null);
								request.setAttribute("content", TestDAO.selectLastDiary(user.getUserno()).getBrdcontent().split("!split!")[1]);
							} */
							request.setAttribute("randomUser", user);
						}
					%>
					<div class="col-sm-6 col-md-3" id="thumb2">
						<div class="panel panel-default" style="border:hidden;">
							<div class="panel-heading">
								<img src="${requestScope.randomUser.img}" width="30" class="img-rounded">
								 ${requestScope.randomUser.userid}님의 소식
							</div>
							<div class="panel-body">
								<div class="caption">
									<p>최근 포스트</p>
									<p>
									</p>
								</div>
							</div>
							<div class="panel-body">
								<div class="caption">
									<p>최근 게시물</p>
									<p>
										<c:choose>
											<c:when test="${requestScope.image != null}">
												<img src="${requestScope.image}" width="100%">
											</c:when>
											<c:otherwise>
												${requestScope.content}
											</c:otherwise>
										</c:choose>
										<a href="#" class="btn btn-primary" onclick="visitUser('${requestScope.randomUser.userid}')">방문하기</a>
										<a href="/gaenari/home.do" class="btn btn-default">다른사람보기</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
		</div>
		<%@ include file="/static/pages/footer.jsp"%>
	</div>

	
	<!-- <div class="jumbotron" id="writer">
					<div class="col-lg-12" id="write">
						<div class="input-group">
							<input type="text" class="form-control"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">Go!</button>
							</span>
						</div>
						<small>검색? or 문구입력?</small>
					</div>
				</div> -->
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
	function visitUser(userid) {
		var newwindow;
		var url = "/gaenari/miniHome.do?userid="+userid;

		newwindow = window.open(url, '미니홈페이지','height=570,width=1000,scrollbars=yes');
		if (window.focus) {
			newwindow.focus;
		}
	}
</script>
</html>
