<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	td,th {	text-align: center; font-family: '서울한강체'	}
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
</head>
<body>
	<h1 align="center">
		${requestScope.user.userid}님 회원정보
	</h1>
	<hr color="blue">
	<table align="center">
		<tr>
			<td width="480">
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
						<img src="${requestScope.user.img}"> 
					</td>
					<td colspan="4">
						<font size="4">이름: ${requestScope.user.username}</font> 
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<font size="4">주소: ${requestScope.user.address}</font>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<font size="4">Facebook 계정(E-mail): ${requestScope.user.email}</font>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<font size="4"> 친구 몇명?</font>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<c:choose>
							<c:when test="${not empty requestScope.dog}">
							기르는 강아지: <c:forEach items="${requestScope.dog}" var="doggy">
									${doggy.dogname}(${doggy.dogkind})&nbsp;
								</c:forEach>
							</c:when>
							<c:otherwise>
								강아지 정보가 없습니다.
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td colspan="6" height="300">
						<div id="bigimg"><img src="/gaenari/image/logo.jpg" height="70" width="100"></div>
					</td>
				</tr>
				<tr>
					<td id="p"><img src="/gaenari/image/47H.jpg" height="55" width="80"></td>
					<td id="p"><img src="/gaenari/image/defaultDog.jpg" height="55" width="80"></td>
					<td id="p"><img src="/gaenari/image/logo.jpg" height="55" width="100"></td>
					<td id="p"><img src="/gaenari/image/retriever-348572.jpg" height="55" width="80"></td>
					<td id="p"><img src="/gaenari/image/euriiiii.jpg" height="55" width="80"></td>
					<td id="p"><img src="/gaenari/image/horse.jpg" height="55" width="80"></td>
				</tr>
				<tr>
					<td colspan="6"><button id="close">닫기</button></td>
				</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#p img").mouseover(function(){
			var imgSrc = $(this).attr("src");
			var img = "<img src='"+imgSrc+"' height='200' />";
			$("#bigimg").html(img);
		});
	});
	$(function(){
		$("#close").click(function(){
			opener.location.reload();
			self.close();
		});
	});
</script>
</html>
<%@ include file="/bottom.jsp"%>