<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/frame.jsp" %>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
[구현할 기능]<br>
1. 친구목록보기<br>
2. 요청받은 친구목록보기<br>
3. 친구검색하기<br>
4. 추천받은 친구목록보기<br>

<table border="1">
	<tr>
		<td>
			<c:choose>
				<c:when test="${not empty requestScope.friendList}">
					<c:forEach items="${requestScope.friendList}" var="friends">
						<a href="/gaenari/miniHome.do?userid=${friends.userid}">${friends.userid}</a>
					</c:forEach>
				</c:when>
				<c:otherwise>
				친구목록이 없습니다.
				</c:otherwise>
			</c:choose>
		</td>
		<td align="center">
			<c:if test="${sessionScope.userid eq requestScope.user.userid}">
				<c:choose>
					<c:when test="${not empty sessionScope.sender}">
					요청받은 친구:
						<c:forEach items="${sessionScope.sender}" var="sender">
							<table border="0" class="table">
								<tr>
									<td>
						 				<a href="/gaenari/miniHome.do?userid=${sender.userid}">
						 					<img src="${sender.img}" width="50"> ${sender.username}
						 				</a>
						 				<form id="acform" action="/gaenari/acptRequest.do">
						 					<input type="hidden" name="sender" value="${sender.userno}">
						 					<input type="hidden" name="receiver" value="${requestScope.user.userno}">
						 					<button onclick="accept()">수락</button>&nbsp;
						 				</form>
						 				<form id="reform" action="/gaenari/rjctRequest.do">
						 					<input type="hidden" name="sender" value="${sender.userno}">
						 					<input type="hidden" name="receiver" value="${requestScope.user.userno}">
						 					<button onclick="reject()">거절</button>
						 				</form>
						 			</td>
						 		</tr>
						 	</table>
						</c:forEach>
					</c:when>
					<c:otherwise>
						요청받은 친구신청이 없습니다.
					</c:otherwise>
				</c:choose>
			</c:if>
		</td>
	</tr>
	
	<tr>
		<td>
		<form method="post" id="inForm" name="inForm">
			<select name="searchType" id="searchType">
				<option selected="selected">검색구분</option>
				<option value="userid">아이디</option>
				<option value="username">이름</option>
				<option value="address">사는곳</option>
			</select><input type="text" name="word"><input type="button" id="btn" value="검색">
			<input type="button" id="btn2" value="닫기">
		</form>
		</td>
		<td rowspan="2" width="800"><div id="display">여기에출력</div></td>
	</tr>
	<tr>
		<td>
			<table id="listTable" width="300">
				<tr bgcolor="pink">
					<td>이름</td>
					<td>아이디</td>
					<td>강아지이름</td>
					<td>강아지 종</td>
					<td>주소</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<a href="/gaenari/miniHome.do?userid=hukla">hukla</a><br>
<a href="/gaenari/miniHome.do?userid=lyuel">lyuel</a><br>
<a href="/gaenari/miniHome.do?userid=hukla">admin</a><br>
<a href="/gaenari/miniHome.do?userid=csh8908">csh8908</a><br>
<a href="/gaenari/miniHome.do?userid=csh0806">csh0806</a><br>
</body>
<script type="text/javascript">
	function accept() {
		var result = confirm("친구 요청을 수락하시겠습니까?");
		if(result){
			$("#acform").submit();
			alert("요청승인이 완료됐습니다!");
		}else{
			alert("요청승인이 취소됐습니다");
			return;
		}
	}
	function reject() {
		var result = confirm("친구 요청을 거부하시겠습니까?");
		if(result){
			$("#reform").submit();
			alert("요청을 거절하셨습니다!");
		}else{
			alert("요청거절이 취소됐습니다");
			return;
		}
	}
</script>
</html>

<%@ include file="/bottom.jsp"%>