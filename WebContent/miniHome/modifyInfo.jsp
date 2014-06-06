<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	td,th {	font-family: '맑은 고딕'	}
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

수정: 2014-06-04, 최성훈	내용: 강아지정보 수정하기추가
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
			<form action="/gaenari/modifyInfo.do" method="post" id="modForm">
				<table align="center" border="0" class="table">
				<colgroup>
					<col width="32%">
					<col width="20%">
					<col width="48%">
				</colgroup>
				<tr>
					<td rowspan="3">
						<img src="${requestScope.user.img}">
					</td>
					<td align="center">
						이름
					</td>
					<td>
						<input type="text" class="form-control" name="username" value="${requestScope.user.username}">
					</td>
				</tr>
				<tr>
					<td align="center">
						ID
					</td>
					<td>
						<input type="text" class="form-control" name="userid" value="${requestScope.user.userid}">
					</td>
				</tr>
				<tr>
					<td align="center">
						비밀번호
					</td>
					<td>
						<input type="password" class="form-control" name="pwd">
					</td>
				</tr>
				<tr>
					<td>
						E-mail<br/>${requestScope.user.email}
					</td>
					<td align="center">
						주소
					</td>
					<td>
						<input type="text" name="address" class="form-control" value="${requestScope.user.address}">
					</td>
				</tr>
				<tr>
					<td colspan="3" align="left">
						<c:choose>
							<c:when test="${not empty requestScope.dog}">
							강아지 정보수정 :
								<c:forEach items="${requestScope.dog}" var="doggy">
									<a href="#" onclick="modDoginfo(${doggy.dogno})" id="dogbtn" name="dogname">${doggy.dogname}</a>(${doggy.dogkind})&nbsp;
								</c:forEach>
							</c:when>
							<c:otherwise>
								강아지 정보가 없습니다.
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<input type="hidden" name="userno" value="${requestScope.user.userno}">
						<button type="button" onclick="submit()" class="btn btn-success" data-toggle="button">수정하기</button>
						&nbsp;&nbsp;&nbsp; 
						<button type="button" onclick="history.back()" class="btn btn-default" data-toggle="button">뒤로가기</button>
						&nbsp;&nbsp;&nbsp; 
						<button type="button" id="close" class="btn btn-default" data-toggle="button">취소하기</button>
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

 	function modDoginfo(dogno) {
		var newwindow;
		var url = "/gaenari/modDoginfo.do?dogno="+dogno;
		newwindow = window.open(url, '강아지정보수정','height=350,width=550,scrollbars=auto');
		if (window.focus) {
			newwindow.focus;
		}
	};
	function submit(){
		$("#modForm").submit();
	}
</script>
</html>
<%@ include file="/bottom.jsp"%>