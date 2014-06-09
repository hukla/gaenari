<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="/frame.jsp"%> --%>
<%@ include file="menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
div#dogs {
	width: 230px;
	height: 70px;
	text-align: inherit;
}
div#scroll{
	overflow-y: scroll;
	height: 270px;
	border: hidden;
}
div#panel-heading{
padding: 1px;
    height: 37px;
    text-align: left;
}
div#doginfo {
    height: 60px;
    font-size: 15px;
    text-align: left;
    padding: 2px;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미니홈피 메인</title>
<!-- 
작성자: 최성훈
작성목적: 전체적인 미니홈피 기능을 관리할 수 있다.
작성내용: user의 메인사진과 이름, 기르는 강아지정보, 일기, 일정, 방명록, 친구신청
		  등의 최신 소식을 미리보기로 확인할 수 있다.
		  홈페이지 하단엔 실종 강아지의 신고글과 사진 알림을 확인할 수 있다.
		  
수정: 2014-04-23, 최성훈	내용: 미리보기의 방명록, 일기, 일정 모두 글 하나씩 볼 수있도록 링크 걸어놓음
수정: 2014-05-03, 장재희	내용: 기부몰 들어가기 추가
수정: 2014-05-24, 최성훈	내용: LoginCheckAction에서의 불필요한 session attributing을 request로 수정함에 따라
메인 페이지에서 만 쓸 리스트의 scope를 requestScope로 수정
			
수정: 2014-05-25, 최성훈	내용: 내비게이션 바 추가함에 따라 기부몰 들어가기를 미니홈피 메뉴에서 제거한 후
전 페이지 공통으로 include되는 내비게이션 바에 추가함.
			
수정: 2014-05-27, 최성훈	내용: 내 홈피, 친구홈피 방문을 구분하기 위해 a태그 접근시 꼭 requestScope의 userid를 지니고 가게함.		
수정: 2014-05-29, 최성훈	내용: 페이스북 메인사진 받아서 뿌리기
수정: 2014-05-30, 최성훈	내용: 친구요청란 지우고 테이블 bootstrap class추가
 -->
</head>

<body>
	<table align="left" width="900" id="tb">
		<tr>
			<td width="100%" align="center">
				<table border="0" align="center" width="80%" class="table">
					<tr>
						<td width="35%" height="100%" rowspan="4">
							<div align="center">
								<c:choose>
									<c:when test="${requestScope.user.userid == sessionScope.userid}">
										<h3><font face="맑은 고딕">${requestScope.user.userid}님 홈페이지</font></h3>
										<input type="image" src="${requestScope.user.img}" onclick="image()" width="200">
									</c:when>
									<c:otherwise>
										<img src="${requestScope.user.img}" width="200">
									</c:otherwise>
								</c:choose>
							</div> <br>
							<div align="center">
								<h4>
									${requestScope.user.username}<br>${requestScope.user.email}
								</h4>
							</div>
							<c:choose>
								<c:when test="${not empty requestScope.dog}">
									<div class="panel panel-default" id="scroll">
										<div class="panel-heading" id="panel-heading">
											<h5>&nbsp;&nbsp;&nbsp;${requestScope.user.userid}님 강아지 목록</h5>
										</div>
										<div class="panel-body">
											<c:forEach items="${requestScope.dog}" var="dog">
												<div class="alert alert-success" id="doginfo">
													<a href="#">
														<img src="${dog.dogimg}" height="55px" class="img-rounded">
													</a>
													<a href="#">
														${dog.dogname}
													</a><p>
												</div>
											</c:forEach>
											<c:if test="${requestScope.user.userid == sessionScope.userid}">
												<a class="btn btn-success btn-xs" onclick="addDog()">새 강아지 등록</a>
											</c:if>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									등록된 강아지가 없습니다.
									<c:if test="${requestScope.user.userid == sessionScope.userid}">
										<br>기르시는 강아지를 등록해주세요
										<a class="btn btn-success btn-xs" onclick="addDog()">강아지 등록</a>
									</c:if>
								</c:otherwise>
							</c:choose>
						</td>
						<td width="65%" height="30%">
							<h1 align="center"><%-- ${sessionScope.today} 오늘의 일정<br>
								<c:choose>
									<c:when test="${requestScope.plans eq 1}">
									<small>[ ${requestScope.plan.title} ] 입니다.</small>
									</c:when>
									<c:when test="${requestScope.plans > 1}">
									<small>[ ${requestScope.plans}개의 일정이 있습니다. ]</small>
									</c:when>
									<c:otherwise><small>등록된 일정이 없습니다.</small></c:otherwise>
								</c:choose> --%>
								안녕하세요 ${requestScope.user.userid}입니다.
							</h1>
						</td>
					</tr>
					<tr>
						<td height="25%">
							<h4 align="center">일정(<%-- ${fn:length(planList)} --%>)</h4> 
							<c:choose>
								<c:when test="${not empty requestScope.planList}">
									<c:forEach items="${requestScope.planList}" var="plan">
										<ul>
											<li>
											<a href="/gaenari/planDetail.do?brdno=${plan.brdno}&userid=${requestScope.user.userid}">
											${plan.title} - ${plan.wrdate}
											</a>
											</li>
										</ul>
									</c:forEach>
								</c:when>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td height="80px">
							<h4 align="left">최근 Diary소식</h4>
							<c:choose>
								<c:when test="${requestScope.di != null}">
									<%-- <c:forEach items="${requestScope.diary}" var="diary">
										<ul>
											<li>
											<a href="/gaenari/diaryDetail.do?brdno=${diary.brdno}&userid=${requestScope.user.userid}">
											${diary.title} - ${diary.wrdate}
											</a>
											</li>
										</ul>
									</c:forEach> --%>
									<table style="border: hidden;" border="0">
										<tr>
											<c:if test="${requestScope.diImage != null}">
												<td>
													<img src="${requestScope.diImage}" height="80px">
												</td>
											</c:if>
											<td>
												<h4><a href="/gaenari/diaryDetail.do?brdno=${requestScope.di.brdno}&userid=${requestScope.user.userid}">${requestScope.di.title}</a></h4> ${requestScope.diContent}
											</td>
										</tr>
									</table>
								</c:when>
								<c:otherwise>
									작성된 일기가 없습니다.
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td height="20%">
							<table style="border: hidden;">
								<tr>
									<td width="25%">
										<!-- 실종견 커뮤니티에서 사진과 실종신고 제목 불러오기 --> 
										<input type="image" src="image/horse.jpg" width="80">
									</td>
									<td width="75%">${requestScope.mfMessage}우리말좀찾아줘요</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>

<script type="text/javascript">
function addDog() {
	var newwindow;
	var url = "/gaenari/addDog.do?userid=${sessionScope.user.userid}";

	newwindow = window.open(url, '강아지등록 페이지', 'height=600,width=660,scrollbars=yes');
	if (window.focus) {
		newwindow.focus;
	}
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
var result = "${fn:length(dog)}";
var scroll = document.getElementById("scroll");

if(result>3){
	scroll.style.overflowY="scroll";
}else{
	scroll.style.overflowY="hidden";
}
function image(){
	var newwindow;
	var url = "/gaenari/myImage.do?userid=${sessionScope.user.userid}";

	newwindow = window.open(url, '강아지등록 페이지', 'height=600,width=660,scrollbars=yes');
	if (window.focus) {
		newwindow.focus;
	}
}

</script>
</html>