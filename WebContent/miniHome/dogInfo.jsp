<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	td,th,h2 {vertical-align: center; font-family: "나눔고딕";}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/gaenari/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<script src="//code.jquery.com/jquery.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<title>강아지 정보페이지</title>
<!-- 
작성: 2014-06-03
작성자: 최성훈
내용: 강아지 정보 수정하기
 -->
</head>
<body>
	<h1 align="center">
		${requestScope.user.userid}님 강아지 정보
	</h1>
	<hr color="blue">
	<table width="90%" align="center">
		<tr>
			<td>
				<table class="table" align="center" style="border: hidden;">
					<colgroup>
					<col width="20%"><col width="20%"><col width="60%">
					</colgroup>
					<tr>
						<td rowspan="3"><input type="image" src="${requestScope.dog.dogimg}" height="150px"  class="img-rounded"></td>
						<th>이름</th>
						<td>${requestScope.dog.dogname}</td>
					</tr>
					<tr>
						<th>나이 / 종</th>
						<td>${requestScope.dog.dogage}살 / ${requestScope.dog.dogkind}</td>
					</tr>
					<tr>
						<td colspan="2">${requestScope.dog.doginfo}</td>
					</tr>
					
				</table>
				<table class="table">
					<colgroup>
						<col width="20%"><col width="60%"><col width="10%"><col width="10%">
					</colgroup>
						<tr>
							<td align="center">일정날짜</td>
							<td align="center">일정제목</td>
							<td align="center">일정지역</td>
							<td align="center">완료여부</td>
						</tr>
					<c:choose>
						<c:when test="${not empty requestScope.dogsPlanList}">
							<c:forEach items="${requestScope.dogsPlanList}" var="dogPlan">
								<tr>
									<td align="center">${dogPlan.pdate}</td>
									<td align="left">
										<a href="#" onclick="goOnePlan('${dogPlan.brdno}')">${dogPlan.title}</a> 
									</td>
									<td align="center">${dogPlan.ploc}</td>
									<td align="center">
										<c:choose>
											<c:when test="${dogPlan.flag == 0}">
												<span class="label label-info">미완료</span>
											</c:when>
											<c:otherwise>
												<span class="label label-default">완료</span>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<button id="close" class="btn btn-default" data-toggle="button">닫기</button>
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
	
	function goOnePlan(brdno){
		window.opener.location.href="/gaenari/planDetail.do?brdno="+brdno+"&userid=${requestScope.user.userid}";
	}
</script>
</html>