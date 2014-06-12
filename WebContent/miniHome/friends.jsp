<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="menu.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- <script src="//code.jquery.com/jquery-1.9.1.min.js"></script> -->
<style type="text/css">

 table#searching{
	/* width:600px; */
	float: left;
	margin-left: 20px;
	width: 65%;
}

 table#friendsList{
	float: left;
	left:;
	/* width:280px; */
	width: 32%;
}
table#requestList{
	float: left;
	/* width:300px; */
	width: 32%;
}

div#container{
	width:240px;
	height:80px;
	background-color: #E9E9F7;
}
.jumbotron {
    padding-top: 0px;
    padding-bottom: 26px;
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
<div id="tb">
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
								<h5>${requestScope.user.userid}님의 친구 목록</h5>
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
												${friends.userid}</a><br> <h5>${friends.mainmsg}</h5></td>
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
				<tr>
					<td>
						<div class="panel panel-success">
							<div class="panel-heading">
								<h5>${requestScope.user.userid}님의 친구 목록</h5>
							</div>
							<div class="panel-body">
								<div class="alert alert-success">
									<h5>친구목록이 없습니다.</h5>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>


	<table id="searching">
		<tr>
			<td>
				<div class="jumbotron" id="writer">
					<div class="container">
						<h2>
							${requestScope.user.userid}님,<br>친구를 검색해보세요
						</h2>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td align="center"><form method="post" id="inForm" name="inForm">
				<table border="0" class="table">
					<colgroup><col width="20%"><col width="55%"><col width="12%"><col width="13%"></colgroup>
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
							<td style="vertical-align: middle;">
								<div class="btn-group btn-group-sm">
									<input type="button" id="btn" class="btn btn-success" value="검색"> 
								</div>
							</td>
							<td style="vertical-align: middle;">
								<div class="btn-group btn-group-sm">
									<input type="button" id="btn2" class="btn btn-default" value="취소">
								</div>
							</td>
						</tr>
						<tr>
						<td colspan="4">
							<table id="listTable" width="100%" class="table">
								<tr bgcolor="#F0F092">
									<td align="center">이름</td>
									<td align="center">아이디</td>
									<td align="center">Email</td>
									<td align="center">주소</td>
									<td align="center">강아지</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<div id="display" style="width: 560px"></div>
						</td>
					</tr>
				</table>
				</form>
			</td>
		</tr>
	</table>
	</div>
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
<%-- <%@ include file="/bottom.jsp"%> --%>