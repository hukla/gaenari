<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	td,th {	font-family: '서울한강체'	}
	#bigimg > img{
		width: 400px;
		height: 330px;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/gaenari/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<script src="//code.jquery.com/jquery.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<title>개인정보</title>
<!-- 
작성자: 최성훈
작성: 2014-05-29
내용: 회원정보 보기-> 개인정보수정하도록, 다른 유저의 회원정보 보기-> 친구신청하기 로 경우 나눔.
 -->
</head>
<body>
	<h1 align="center">
		${requestScope.user.userid}님 회원정보수정
	</h1>
	<hr color="blue">
	<table align="center">
		<tr>
			<td width="480">
			<form action="/gaenari/modifyInfo.do" method="post">
				<table align="center" border="0" class="table">
				<colgroup>
					<col width="16%">
					<col width="16%">
					<col width="16%">
					<col width="16%">
					<col width="16%">
					<col width="16%">
				</colgroup>
				<tr>
					<td rowspan="4" colspan="2">
						<img src="${requestScope.user.img}"><br>${requestScope.user.email}
					</td>
					<td colspan="4">
						이름: <input type="text" name="username" value="${requestScope.user.username}">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						ID : <input type="text" name="userid" value="${requestScope.user.userid}">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						비밀번호: <input type="password" name="pwd">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						주소: <input type="text" name="address" value="${requestScope.user.address}">
					</td>
				</tr>
				<tr>
					<td colspan="6" align="center">
						<c:choose>
							<c:when test="${not empty requestScope.dog}">
							강아지 이름수정 
								<c:forEach items="${requestScope.dog}" var="doggy">
									<a href="#" id="dogbtn" name="dogname">${doggy.dogname}</a>(${doggy.dogkind})&nbsp;
								</c:forEach>
							</c:when>
							<c:otherwise>
								강아지 정보가 없습니다.
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td colspan="6" align="center">
						<input type="hidden" name="userno" value="${requestScope.user.userno}">
						<input type="submit" value="수정하기">
						&nbsp;&nbsp;&nbsp;
						<button id="close">취소하기</button>
					</td>
				</tr>
				</table>
				</form>
			</td>
		</tr>
	</table>
</body>
<script type="text/javascript">

	$(function() {
		$("#close").click(function() {
			opener.location.reload();
			self.close();
		});
	});
/* 	function modDogname(dogname) {
		var newwindow;
		var url = "/gaenari/modDogname.do?dogname="+dogname;
		newwindow = window.open(url, '강아지이름수정','height=300,width=660,scrollbars=auto');
		if (window.focus) {
			newwindow.focus;
		}
	}; */
</script>
</html>
<%@ include file="/bottom.jsp"%>