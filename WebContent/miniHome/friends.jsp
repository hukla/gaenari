<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/frame.jsp" %>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

table#searching{
	width:700px;
	float: right;
	margin-right: 80px;
}
table#friendsList{
	float: left;
	left:;
	width:300px;
}
table#requestList{
	float: left;
	width:300px;
}
div#container{
	width:240px;
	height:80px;
	background-color: #E9E9F7;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>친구관리 페이지</title>
</head>
<script src="/gaenari/dupcheck.js"></script>
<!-- 
작성: 최성훈
작성일: 2014-05-29
내용: 친구관리기능, 친구검색 후 검색된 친구 user정보 미리보기(진행중)

수정: 2014-05-30, 최성훈	내용: 친구요청하기, 친구요청 있을시 띄우기(진행중)
수정: 2014-05-30, 최성훈	내용: 친구검색 후 친구요청하기, 친구 요청상태확인, 친구인상태보이기
 -->
<body>

	<table id="friendsList" border="0">
		<c:if test="${sessionScope.userid eq requestScope.user.userid && not empty sessionScope.sender}">
			<tr>
				<td>
					<div class="panel panel-info">
						<div class="panel-heading">
							<h5>친구요청정보</h5>
						</div>
						<div class="panel-body">
							<c:forEach items="${sessionScope.sender}" var="sender">
								<div class="alert alert-info">
									<table width="100%" border="0">
										<colgroup><col width="75%"><col width="25%"></colgroup>
										<tr>
										<td>
											<a href="#" onclick="getinfo('${sender.userid}')">
											<img src="${sender.img}" width="50"> ${sender.userid}</a>
										</td>
											<td>
												<div class="btn-group btn-group-xs">
													<button class="btn btn-success" onclick="accept('${sender.userno}')">친구맺기</button>
												</div><p>
												<div class="btn-group btn-group-xs">
													<button class="btn btn-default" onclick="reject('${sender.userno}')">거절하기</button>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</c:forEach>
						</div>
					</div>
				</td>
			</tr>
		</c:if>
		<c:choose>
			<c:when test="${not empty requestScope.friendList}">
				<tr>
					<td>
						<div class="panel panel-success">
							<div class="panel-heading">
								<h5>내 친구 목록</h5>
							</div>
							<div class="panel-body">
								<c:forEach items="${requestScope.friendList}" var="friends">
									<div class="alert alert-success">
										<table width="100%">
											<colgroup><col width="25%"><col width="75%"></colgroup>
											<tr>
												<td><a href="/gaenari/miniHome.do?userid=${friends.userid}">
												<img class="img-rounded" src="${friends.img}" width="50">
												</a></td>
												<td><a href="/gaenari/miniHome.do?userid=${friends.userid}">
												${friends.userid}</a><br> <h5>일정, 일기 등등 최근활동</h5></td>
											</tr>
										</table>
									</div>
								</c:forEach>
							</div>
						</div>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<h5>친구목록이 없습니다.</h5>
			</c:otherwise>
		</c:choose>
	</table>


	<table id="searching">
		<tr>
			<td>
				<div class="jumbotron" id="writer">
					<div class="container">
						<h2>
							${requestScope.user.userid}님, 친구를 검색해보세요
						</h2>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td align="center"><form method="post" id="inForm" name="inForm">
				<table border="0" class="table">
					<colgroup><col width="20%"><col width="55%"><col width="25%"></colgroup>
						<tr>
							<td>
								<select name="searchType" id="searchType"  class="btn btn-default">
									<option selected="selected" value="unchosen">검색구분</option>
									<option value="userid">아이디</option>
									<option value="username">이름</option>
									<option value="address">사는곳</option>
								</select>
							</td>
							<td><input type="text" name="word" class="form-control"></td>
							<td>
								<input type="button" id="btn" class="btn btn-success" value="검색"> 
								<input type="button" id="btn2" class="btn btn-default" value="취소">
							</td>
						</tr>
						<tr>
						<td colspan="3">
							<table id="listTable" width="100%" class="table">
								<tr bgcolor="#F0F092">
									<td align="center">이름</td>
									<td align="center">아이디</td>
									<td align="center">Email</td>
									<td align="center">주소</td>
									<td align="center">강아지</td>
									<td> </td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div id="display"></div>
						</td>
					</tr>
				</table>
				</form>
			</td>
		</tr>
	</table>
	<table height="400"></table>
</body>
<script type="text/javascript">
	function accept(sender) {
		var result = confirm("친구 요청을 수락하시겠습니까?");
		if(result){
			location.href="/gaenari/acptRequest.do?sender="+sender+"&receiver=${requestScope.user.userno}";
			alert("요청승인이 완료됐습니다!");
		}else{
			alert("요청승인이 취소됐습니다");
			return;
		}
	}
	function reject(sender) {
		var result = confirm("친구 요청을 거부하시겠습니까?");
		if(result){
			//$("#reform").submit();
			location.href="/gaenari/rjctRequest.do?sender="+sender+"&receiver=${requestScope.user.userno}";
			alert("요청을 거절하셨습니다!");
		}else{
			alert("요청거절이 취소됐습니다");
			return;
		}
	}

	function getinfo(userid) {
		var newwindow;
		var url = "/gaenari/userinfo.do?userid="+userid;
		
		newwindow = window.open(url, '회원정보', 'height=700,width=660,scrollbars=yes');
		if(window.focus) {
			newwindow.focus;
		}
	}
</script>
</html>
<%@ include file="/bottom.jsp"%>