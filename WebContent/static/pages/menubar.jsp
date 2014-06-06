<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<!--메뉴바 시작-->
<nav class="navbar navbar-menu" id="menu-navbar" role="navigation">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="#">GAENARI</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">유기견 신고/제보<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="/gaenari/missingBoardMain.do">유기견 신고</a></li>
						<li><a href="/gaenari/findingBoardMain.do">유기견 제보</a></li>
					</ul></li>
				<li><a href="/gaenari/adpBoardMain.do">애견 입양</a></li>
				<li><a href="/gaenari/voluBoardList.do">자원봉사</a></li>
				<li><a href="/gaenari/ptBoardList.do">펫 도우미</a></li>
				<li><a href="/gaenari/mallMain.do">기부몰</a></li>
				<li class="pull-right"><a href="/gaenari/miniHome.do">미니홈피</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
	<!-- 메뉴바 끝 -->
</nav>
</html>