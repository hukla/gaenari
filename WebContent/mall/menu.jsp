<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  
	작성자 : 장재희
	작성일 : 2014-05-27
-->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	h1,h2,h3,h4,h5 {   font-family:'서울한강체' } 
</style>
</head>
<!-- <script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/gaenari/bootstrap/js/bootstrap.min.js"></script> -->
<body>
	<table border="0" align="left" width="14%" >
		<tr>
			<td width="10%">
			</td>
			<td width="90%">
				<font face="서울한강체">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="/gaenari/mallMain.do">기부몰 메인</a></li>
						<c:if test="${sessionScope.user.usertype == 0}"><li><a href="/gaenari/mallMyPage.do">나의 기부 내역</a></li></c:if><!-- TODO -->
						<c:if test="${sessionScope.user.usertype == -1}"><li><a href="/gaenari/mallManage.do">기부몰 관리하기</a></li></c:if>
					</ul>
				</font>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				${requestScope.user.userid}님<br>안녕하세요!
			</td>
		</tr>
	</table>
</body>
</html>