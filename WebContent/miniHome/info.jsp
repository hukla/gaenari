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
		width: 270px;
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

수정: 최성훈, 2014-06-04	내용: UI수정, 친구맺기 기능 오류수정중..

수정: 이수진, 2014-06-06	내용: 애견 입양 적합도 테스트 버튼 클릭 시 결과 여부 뜨게 하기
 -->
</head>
<body>
	<h1 align="center">
		${requestScope.user.userid}님 회원정보
	</h1>
	<hr color="blue">
	<table align="center">
		<tr>
			<td width="300">
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
						<img src="${requestScope.user.img}" width="130"> 
					</td>
					<th align="center">
						이름
					</th>
					<td colspan="3">
						${requestScope.user.username}
						<c:choose>
							<c:when test="${sessionScope.userid == requestScope.user.userid}">
								<div class="btn-group btn-group-xs">
									<button onclick="goModify('${requestScope.user.userid}')"  class="btn btn-success" data-toggle="button">정보수정</button>
								</div>
							</c:when>
							<c:otherwise>
								<form action="/gaenari/frndReq.do" id="form">
									<c:choose>
										<c:when test="${requestScope.result == 3}"><!-- 내가 요청 안 했으면 -->
											<c:choose>
												<c:when test="${requestScope.friend eq true}">
												친구입니다.
												</c:when>
												<c:otherwise>
												<div class="btn-group btn-group-xs">
													<button onclick="sendReq()" class="btn btn-success" data-toggle="button">친구신청하기</button>
												</div>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise><!-- 내가 요청 했으면 -->
											친구요청된 상태입니다.
											<div class="btn-group btn-group-xs">
												<input type="hidden" name="cancel" value="cancel">
												<c:choose>
													<c:when test="${requestScope.result == 1}">
														<button onclick="cancelReq()" class="btn btn-default" data-toggle="button">요청 취소하기</button>
													</c:when>
													<c:otherwise>
														<button class="btn btn-success" onclick="acceptReq()">요청 수락하기</button>
														<button onclick="cancelReq()" class="btn btn-default" data-toggle="button">요청 거부하기</button>	
													</c:otherwise>
												</c:choose>
											</div>
										</c:otherwise>
									</c:choose>
									<input type="hidden" name="sender" value="${sessionScope.userid}">
									<input type="hidden" name="receiver" value="${requestScope.user.userid}">
								</form>
								<form id="acform" action="/gaenari/acptRequest.do">
									<input type="hidden" name="sender" value="${requestScope.sender.userno}">
									<input type="hidden" name="receiver" value="${requestScope.user.userno}">
								</form>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th align="center">
						주소
					</th>
					<td colspan="3">
						${requestScope.user.address}
					</td>
				</tr>
				<tr>
					<th align="center">
						E-mail
					</th>
					<td colspan="3">
						${requestScope.user.email}
					</td>
				</tr>
				<tr>
					<th colspan="4" align="center">
						${requestScope.user.userid}님의 친구: ${fn:length(friendList)}명
					</th>
				</tr>
				<tr>
					<th colspan="2">
						${requestScope.user.userid}님의 강아지
					</th>
					<td colspan="4" align="left">
						<c:choose>
							<c:when test="${not empty requestScope.dog}">
								<c:forEach items="${requestScope.dog}" var="doggy">
									<a href="#"><img src="${doggy.dogimg}" width="35" class="img-rounded"> ${doggy.dogname}(${doggy.dogkind})</a><br/><br/>
								</c:forEach>
							</c:when>
							<c:otherwise>
								강아지 정보가 없습니다.
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td colspan="6" height="300" align="center">
						<div id="bigimg"><img src="${requestScope.imageList[0]}" height="70" width="100"></div>
					</td>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${not empty requestScope.imageList}">
							<c:forEach items="${requestScope.imageList}" var="image" end="5">
								<td id="p"><img src="${image}" height="55" width="80"></td>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<h4>등록된 사진이 없습니다.</h4>
						</c:otherwise>
					</c:choose>
				</tr>
				<c:if test="${sessionScope.userid == requestScope.user.userid}">
					<tr>
						<td colspan="3" align="center">
							<button onclick="goQuest('${requestScope.user.userid}')"  class="btn btn-success" data-toggle="button">애견입양적합도테스트</button>
						</td>
						<td colspan="2" align="center">
							<button id="close" class="btn btn-default" data-toggle="button">닫기</button>
						</td>
					</tr>
				</c:if>
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

	function goModify(userid) {
		location.href = "/gaenari/modifyform.do?userid="+userid;
	}
	function goQuest(userid){
		location.href = "/gaenari/questionform.do?userid="+userid;
	}
	function sendReq() {
		var result = confirm("친구 요청을 보내시겠습니까?");
		if(result){
			$("#form").submit();
			alert("친구요청이 완료됐습니다!");
		}else{
			alert("친구요청이 취소됐습니다");
			return;
		}
	}
	function cancelReq() {
		var result = confirm("요청을 취소하시겠습니까?");
		if(result){
			$("#form").submit();
			alert("친구요청이 취소됐습니다!");
		}else{
			return;
		}
	}
	function acceptReq() {
		var result = confirm("요청을 수락하시겠습니까?");
		if(result){
			$("#acform").submit();
			alert("요청승인이 완료됐습니다!");
		}else{
			alert("요청승인이 취소됐습니다");
			return;
		}
	}
</script>
</html>
<c:if test="${requestScope.user.userid == sessionScope.userid}">
	<%@ include file="/bottom.jsp"%>
</c:if>
