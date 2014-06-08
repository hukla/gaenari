<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--메뉴바 시작-->
<div class="navbar navbar-inverse" id="menubar">
    <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </button>
            <a href="./" class="navbar-brand"><img src="http://www.flaticon.com/png/256/17479.png" style="height:inherit;">GAENARI</a>
        </div>
        <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
            <ul class="nav navbar-nav">
                <li>
                    <a href="/gaenari/mallMain.do"><img src="http://www.flaticon.com/png/256/22025.png">기부몰</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="http://www.flaticon.com/png/256/41489.png">애견 커뮤니티 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/gaenari/adpBoardMain.do">애견 분양</a></li>
                        <li><a href="/gaenari/ptBoardList.do">펫 도우미</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="http://www.flaticon.com/png/256/10641.png">유기견 센터<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/gaenari/missingBoardMain.do">유기견 신고</a></li>
                        <li><a href="/gaenari/findingBoardMain.do">유기견 제보</a></li>
                        <li><a href="/gaenari/voluBoardList.do">자원봉사</a></li>
                    </ul>
                </li>
                <c:if test="#{sessionScope.userid != null }">
                <li style="position:absolute;right:20px;">
                    <a href="" onclick="miniHome()"><img src="http://www.flaticon.com/png/256/35141.png">미니홈피</a>
                </li>
                </c:if>
            </ul>
        </nav>
    </div>
</div>
<!-- 메뉴바 끝 -->