<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<ul class="nav nav-pills nav-stacked" id="mall-menu">
	<li><a href="/gaenari/mallMain.do">기부몰 메인</a></li>
	<c:if test="${sessionScope.user.usertype == 0}">
		<li><a href="/gaenari/mallMyPage.do">나의 기부 내역</a></li>
	</c:if>
	<c:if test="${sessionScope.user.usertype > 0}">
		<li><a href="/gaenari/mallMyPage.do">나의 기부 요청 내역</a></li>
	</c:if>
	<c:if test="${sessionScope.user.usertype == -1}">
		<li><a href="/gaenari/mallManage.do">기부몰 관리하기</a></li>
	</c:if>
</ul>