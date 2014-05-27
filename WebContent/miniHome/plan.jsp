<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="frame.jsp" %>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/gaenari/bootstrap/css/bootstrap-ko.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<title>미니홈피 일정</title>

<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
<!-- 
작성자: 최성훈
작성목적: 일정을 월별로 간단히 확인할 수 있다.
작성내용: 일정전체보기가 아니라 title의 목록으로 구현되기 때문에
		  월별 일정목록을 확인할 수 있다.
		  세 테이블로 구성되며 왼쪽부터 오른쪽 순서로 최근 등록된 일정의
		  월별 테이블이 배치된다.(ex 4월 3월 2월)
추가할 사항: 페이지 번호 링크를 추가하여 지난 일기를 찾아보기 용이하도록한다.

수정: 최성훈
수정내용: 메인페이지 이동할 때 url패턴으로 action 통해서 가도록 수정
		  등록되어있는 링크를 클릭하여 상세보기로 넘어가도록 수정
		  우상단에 일정 전체보기 버튼,
		  하단에 수정하기 삭제하기 버튼

수정: 최성훈
수정날짜: 2014-05-19
수정내용: 일정 처음작성하거나 특정 월에만 일정을 작성한 user가
		 일정 게시판에 접근하지 못 하던 오류해결
		 
수정: 최성훈
수정날짜: 2014-05-22
수정내용: 	기존에 월별로 일정을 묶어서 출력하던 방법 대신 전체 일정목록을 게시판으로
			띄워주기
			
수정: 최성훈
수정날짜: 2014-05-27
수정내용:1.request스코프에 userid를 받아와서 session user와 상관없이
		   request의 user 일정을 확인, 상세보기 접근하기 

		 2.session의 user와 request의 user를 구분하여  
		   내 홈피 일정에 접근하는 경우(작성,수정,삭제 가능)와
		   친구의 홈피 일정에 접근하는 경우(작성,수정,삭제 불가능)를 나눔. 
 -->
</head>

<body>
	<table border="0" align="center" width="80%" height="100%" cellpadding="20">
		<tr>
			<c:if test="${requestScope.user.userid eq sessionScope.userid }">
			<td width="33%">
				<form action="/gaenari/writePlan.do" method="post">
					<table border="0" width="100%" height="380" style="outline-style: double;">
						<tr height="18%">
							<td><h2>일정 등록하기</h2></td>
						</tr>
						<tr height="10%">
							<td>&nbsp;&nbsp;제목 : <input type="text" size="33" name="title">
							</td>
						</tr>
						<tr height="65%">
							<td>&nbsp;&nbsp;지역 : <select name="loc" class="btn btn-default">
									<option selected="selected">지역 선택</option>
									<option value="광진구">광진구</option>
									<option value="동대문구">동대문구</option>
									<option value="중랑구">중랑구</option>
									<option value="용산구">용산구</option>
									<option value="성동구">성동구</option>
									<option value="강북구">강북구</option>
									<option value="도봉구">도봉구</option>
									<option value="노원구">노원구</option>
									<option value="은평구">은평구</option>
									<option value="서대문구">서대문구</option>
									<option value="마포구">마포구</option>
									<option value="양천구">양천구</option>
									<option value="강서구">강서구</option>
									<option value="구로구">구로구</option>
									<option value="금천구">금천구</option>
									<option value="영등포구">영등포구</option>
									<option value="동작구">동작구</option>
									<option value="관악구">관악구</option>
									<option value="서초구">서초구</option>
									<option value="강남구">강남구</option>
									<option value="송파구">송파구</option>
									<option value="강동구">강동구</option>
									<option value="종로구">종로구</option>
									<option value="중구">중구</option>
									<option value="성북구">성북구</option>
							</select><br/> &nbsp;&nbsp;날짜 : <input type="text" id="datepicker" name="date"><br/>
								<p/> &nbsp; <textarea rows="10" cols="35" name="content"></textarea>
											<p/>
										</td>
						</tr>
						<tr height="7%">
							<td>
								<div align="center">
									<input type="hidden" name="userid" value="${requestScope.user.userid}">
									<input type="submit" value="등록하기">
									&nbsp;&nbsp;&nbsp; 
									<input type="reset" value="취소하기">
								</div>
							</td>
						</tr>
					</table>
				</form>
			</td>
			</c:if>
			<td width="67%">
				<table class="table table-condensed" width="100%" height="395">
					<colgroup>
						<col width="20%">
						<col width="50%">
						<col width="20%">
					</colgroup>
					<tr>
						<td align="center" height="30" style="word-break: break-all;">작성날짜</td>
						<td align="center">제목</td>
						<td align="center">지역</td>
					</tr>
					<c:choose>
						<c:when test="${not empty requestScope.tenPlans}">
							<c:forEach items="${requestScope.tenPlans}" var="plan">
								<tr height="30" style="table-layout: fixed;">
									<td align="center">${plan.wrdate}</td>
									<td>
										<a href="control?command=planDetail&brdno=${plan.brdno}&userid=${requestScope.user.userid}">${plan.title}</a>
									</td>
									<td align="center">${plan.ploc}</td>
								</tr>
							</c:forEach>
							<c:if test="${fn:length(tenPlans) < 10}">
								<c:forEach begin="1" end="${10-fn:length(tenPlans)}">
									<tr height="30">
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</c:forEach>
							</c:if>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="3" align="center">등록된 일정이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
					<tr height="30">
						<td colspan="3" align="center"><c:choose>
								<c:when test="${not empty requestScope.pageCount}">
									<ul class="pagination">
										<c:choose>
											<c:when test="${requestScope.pageNumber-1 > 0}">
												<li><a href="control?command=planList&pageNumber=${requestScope.pageNumber-1}&userid=${requestScope.user.userid}">«</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="#">«</a></li>
											</c:otherwise>
										</c:choose>
										<c:forEach begin="1" end="${requestScope.pageCount}" var="cnt">
											<c:choose>
												<c:when test="${cnt eq requestScope.pageNumber}">
													<li class="active">
														<a href="control?command=planList&pageNumber=${cnt}&userid=${requestScope.user.userid}">${cnt}<span class="sr-only">(current)</span></a>
													</li>
												</c:when>
												<c:otherwise>
													<li><a href="control?command=planList&pageNumber=${cnt}&userid=${requestScope.user.userid}">${cnt}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${requestScope.pageNumber+1 < requestScope.pageCount+1}">
												<li><a href="control?command=planList&pageNumber=${requestScope.pageNumber+1}&userid=${requestScope.user.userid}">»</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="#">»</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</c:when>
								<c:otherwise>
									<div align="center">등록된 목록 없습니다.</div>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
<%@ include file="bottom.jsp"%>