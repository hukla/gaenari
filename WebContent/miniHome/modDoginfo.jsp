<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	td,th { text-align: center; vertical-align: center; font-family: "맑은 고딕";}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/gaenari/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<script src="//code.jquery.com/jquery.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<title>강아지 정보수정 페이지</title>
<!-- 
작성: 2014-06-03
작성자: 최성훈
내용: 강아지 정보 수정하기
 -->
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
</head>
<body>
	<h3 align="center">
		${requestScope.user.userid}님 강아지 정보수정
	</h3>
	<hr color="blue">
	<table width="90%" align="center">
		<tr>
			<td>
				<form action="dogmodify.do" method="post" enctype="multipart/form-data">
				<table class="table" align="center">
					<colgroup>
					<col width="20%"><col width="20%"><col width="60%">
					</colgroup>
					<tr>
						<td rowspan="3"><input type="image" src="${requestScope.dog.dogimg}" width="150" class="img-rounded"></td>
						<th>이름</th>
						<td><input class="form-control" type="text" name="dogname" value="${requestScope.dog.dogname}"></td>
					</tr>
					<tr>
						<th>나이 / 종</th>
						<td>${requestScope.dog.dogage}살 / ${requestScope.dog.dogkind}</td>
					</tr>
					<tr>
						<td colspan="2"><textarea class="form-control" rows="1" cols="40" name="doginfo">${requestScope.dog.doginfo}</textarea></td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="hidden" name="dogno" value="${requestScope.dog.dogno}">
							<input type="submit" value="등록하기">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="취소하기" id="close">
						</td>
					</tr>
				</table>
				</form>
			</td>
		</tr>
	</table>
</body>
<script>
	$(function(){
		$("#close").click(function(){
			opener.location.reload();
			self.close();
		});
	});
</script>
</html>