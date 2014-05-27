<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/frame.jsp"%>
<%@ include file="menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미니홈피 메인</title>
<!-- 
작성자: 최성훈
작성목적: 전체적인 미니홈피 기능을 관리할 수 있다.
작성내용: user의 메인사진과 이름, 기르는 강아지정보, 일기, 일정, 방명록, 친구신청
		  등의 최신 소식을 미리보기로 확인할 수 있다.
		  홈페이지 하단엔 실종 강아지의 신고글과 사진 알림을 확인할 수 있다.
		  
수정: 최성훈
수정일: 2014-04-23
수정내용: 미리보기의 방명록, 일기, 일정 모두 글 하나씩 볼 수있도록 링크 걸어놓음

수정: 장재희
수정일: 2014-05-03
수정내용: 기부몰 들어가기 추가

수정: 최성훈
수정일: 2014-05-24
수정내용: 	LoginCheckAction에서의 불필요한 session attributing을 request로 수정함에 따라
			메인 페이지에서 만 쓸 리스트의 scope를 requestScope로 수정
			
수정: 최성훈
수정일: 2014-05-25
수정내용: 	내비게이션 바 추가함에 따라 기부몰 들어가기를 미니홈피 메뉴에서 제거한 후
			전 페이지 공통으로 include되는 내비게이션 바에 추가함.
			
수정: 최성훈
수정일: 2014-05-27
수정내용: 	내 홈피, 친구홈피 방문의 경우를 나누기 위해 a태그 접근시 꼭
			requestScope의 userid를 지니고 가게함.
 -->
</head>
<body>
	<table border="1" align="center" width="80%">

		<!-- ~님의 홈페이지, [오늘 날짜]의 일정: [일정제목]-[일정날짜] -->

		<tr>
			<td width="25%" height="20%">
				<h2 align="center">${requestScope.user.userid}님의<br>미니홈페이지</h2>
			</td>
			<td width="75%" colspan="2" height="15%">
				<h2 align="center">${sessionScope.today}
					오늘의 일정
					<c:choose>
						<c:when test="${requestScope.plans eq 1}">
										[ ${requestScope.plan.title} ] 입니다.
									</c:when>
						<c:when test="${requestScope.plans > 1}">
										[ ${requestScope.plans}개의 일정이 있습니다. ] 
									</c:when>
						<c:otherwise>
										: 등록된 일정이 없습니다.
									</c:otherwise>
					</c:choose>
				</h2>
			</td>
		</tr>
		<tr>
			<td rowspan="2" height="80%">
				<!-- 자기가 설정한 메인사진 -->

				<div align="center">
					<img src="http://localhost:9000/gaenari/image/hoonc.jpg">
				</div> <br>
				<div align="center">${sessionScope.user.username}</div>
			</td>
			<td width="37%" height="40%">
				<!-- 일정미리보기 [제목]-[날짜] 형태에 최신순으로 목록나열 -->

				<h4 align="center">일정(${fn:length(planList)})</h4> <c:choose>
					<c:when test="${not empty requestScope.planList}">
						<c:forEach items="${requestScope.planList}" var="plan">
							<ul>
								<li>
									<a href="control?command=planDetail&brdno=${plan.brdno}&userid=${requestScope.user.userid}"> 
										${plan.title} - ${plan.wrdate} 
									</a>
								</li>
							</ul>
						</c:forEach>
					</c:when>
				</c:choose>
			</td>
			<td width="37%">
				<h4 align="center">일기(${fn:length(diary)})</h4> <c:choose>
					<c:when test="${not empty requestScope.diary}">
						<c:forEach items="${requestScope.diary}" var="diary">
							<ul>
								<li>
									<a href="control?command=diaryDetail&brdno=${diary.brdno}&userid=${requestScope.user.userid}">
										${diary.title} - ${diary.wrdate}
									</a>
								</li>
							</ul>
						</c:forEach>
					</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td width="37%" height="40%">
				<h4 align="center">친구신청</h4> 없습니다.
			</td>
			<td width="37%">
				<h4 align="center">방명록(${fn:length(visit)})</h4> <c:choose>
					<c:when test="${not empty requestScope.visit}">
						<c:forEach items="${requestScope.visit}" var="visit">
							<ul>
								<li>
									<a href="control?command=visitDetail&brdno=${visit.brdno}&userid=${requestScope.user.userid}">
										${visit.userid} - ${visit.wrdate}
									</a>
								</li>
							</ul>
						</c:forEach>
					</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td height="20%">
				<!-- 자기소개란 [이름, 기르는 견종, 강아지 이름] -->
				<div align="center">안녕하세요 ${requestScope.user.username}입니다.</div>
				<div align="center">견종: ${sessionScope.dog[0].dogkind}</div>
				<div align="center">강아지 이름: ${sessionScope.dog[0].dogname}</div>
			</td>
			<td colspan="2">
				<table>
					<tr>
						<td width="25%">
							<!-- 실종견 커뮤니티에서 사진과 실종신고 제목 불러오기 --> 
							<input type="image" src="image/horse.jpg" width="80">
						</td>
						<td width="75%">${requestScope.mfMessage}우리말좀 찾아줘요</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
<%@ include file="/bottom.jsp"%>