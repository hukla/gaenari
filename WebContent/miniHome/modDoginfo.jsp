<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.dao.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/static/pages/head.jsp"%>
<script src="//code.jquery.com/jquery.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
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
				<form action="dogmodify.do" method="post" enctype="multipart/form-data" id="modDogForm">
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
							<button type="button" onclick="submit()" class="btn btn-success" data-toggle="button">등록하기</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button id="close" class="btn btn-default" data-toggle="button">닫기</button>
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
	function submit(){
		$("#modDogForm").submit();
	}
</script>
</html>
<%@ include file="/static/pages/footer.jsp"%>