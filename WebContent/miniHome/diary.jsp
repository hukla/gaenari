<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ include file="/frame.jsp" %> --%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
div#imgPosition{
width:200px;
height:60px;

}
div#scroll{
	overflow-y: scroll;
	height: 140px;
}
.page-header {
    margin: -20px 0px -5px;
    border-bottom: 1px solid #EEE;
    padding-bottom: 0px;
}
.thumbnail {
    display: block;
    height: auto;
    max-width: 100%;
    padding: 4px;
    line-height: 1.42857;
    background-color: #CECECE;
    border: 1px solid #CCCCCC;
    border-radius: 4px;
    transition: all 0.2s ease-in-out 0s;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미니홈피 일기</title>
<!-- 
작성자: 최성훈
작성목적: 일기 작성, 검색, 수정, 삭제 등의 관리
작성내용: 화면상에 세가지 일기 테이블을 구현한다. 일기를 작성하는 테이블이 가장 왼쪽에 위치하고,
		  지난 일기는 가장 최신 순서로 가운데와 오른편에 위치한다. 페이지 우상단에 일정게시판으로 이동하는 버튼이 있다.
		  추가할 사항: 페이지 번호 링크를 추가하여 지난 일기를 찾아보기 용이하도록한다.

수정: 최성훈, 2014-04-23	내용: 메인페이지 이동할 때 url패턴으로 action 통해서 가도록 수정
수정: 최성훈, 2014-05-20	내용: 일기 정보가 없을 때 페이지에 접근 못 하던 오류 해결
수정: 최성훈, 2014-05-22	내용: 다이어리 전체 페이지에서 수정, 삭제기능 javascript추가
수정: 최성훈, 2014-05-23	내용: 다이어리열람을 '미리보기', '목록보기' 두가지 탭으로 나눔
	미리보기 탭에선 2개씩 미리보고 좌우버튼으로 이전일기 다음일기 이동
	목록보기 탭에선 10개 묶음씩의 게시판 출력
		
수정: 최성훈, 2014-05-27
수정내용:1.request스코프에 userid를 받아와서 session user와 상관없이 request의 user 일기를 확인, 상세보기 접근하기 
		 2.session의 user와 request의 user를 구분하여 내 홈피 일기에 접근하는 경우(작성,수정,삭제 가능)와
		   친구의 홈피 일기에 접근하는 경우(작성,수정,삭제 불가능)를 나눔. 
		 3.미리보기, 목록보기 탭기능이 새로고침시에 재기능하지 못하는 오류 수정
		 
수정: 최성훈, 2014-06-03	내용: 테이블 틀 수정
 -->
</head>

<script type="text/javascript">
	function sendUpdate() {
		document.firstForm.command.value = "updateFormDiary";
		document.firstForm.brdno = brdno;
		document.firstForm.submit();
	}
	function deleteCheck() {
		if (confirm("삭제하시겠습니까?")) {
			document.firstForm.command.value = "deleteDiary";
			document.firstForm.brdno = brdno;
			document.firstForm.submit();
		} else {
			document.firstForm.command.value = "diaryList";
			document.firstForm.submit();
		}
	}
	function sendingUpdate() {
		document.secondForm.command.value = "updateFormDiary";
		document.secondForm.brdno = brdno;
		document.secondForm.submit();
	}
	function deleteChecking() {
		if (confirm("삭제하시겠습니까?")) {
			document.secondForm.command.value = "deleteDiary";
			document.secondForm.brdno = brdno;
			document.secondForm.submit();
		} else {
			document.secondForm.command.value = "diaryList";
			document.secondForm.submit();
		}
	}
</script>

<body>
<table><tr><td width="900">
	<table border="0" align="center" width="100%" height="100%" cellpadding="20" class="table">
		<tr>
			<c:if test="${requestScope.user.userid eq sessionScope.userid }">
			<td width="45%">
			<div class="row">
  				<div class="col-lg-15 col-lg-10">
    				<div class="thumbnail">
				<form action="/gaenari/writeDiary.do" method="post" enctype="multipart/form-data" id="diaryForm">
					<table border="0" class="table" width="100%" height="380" style="border:hidden; table-layout: fixed;">
						<colgroup>
							<col width="20%"><col width="80%">
						</colgroup>
						<tr>
							<td colspan="2"><h2>오늘 일기</h2></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;제목 : </td>
							<td>
								<input type="text" size="33" class="form-control" name="title">
							</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;&nbsp;기분 : 
							<input type="radio" name="mood" value="/gaenari/image/joyful.png">&nbsp;<img src="/gaenari/image/joyful.png" height="17px">
							&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="radio" name="mood" value="/gaenari/image/love.png">&nbsp;<img src="/gaenari/image/love.png" height="15px">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="mood" value="/gaenari/image/angry.png">&nbsp;<img src="/gaenari/image/angry.png" height="17px">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="mood" value="/gaenari/image/sick.png">&nbsp;<img src="/gaenari/image/sick.png" height="17px">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="mood" value="/gaenari/image/thinking.png">&nbsp;<img src="/gaenari/image/thinking.png" height="17px"> 
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<textarea rows="6" cols="35" name="content" class="form-control"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2">
  								<input type="file" name="uploadFile">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div align="center">
									<input type="hidden" name="userid" value="${requestScope.user.userid}">
									<button type="button" onclick="submit()" class="btn btn-success" data-toggle="button">등록하기</button>
									&nbsp;&nbsp;&nbsp; 
									<button type="button" onclick="reset()" class="btn btn-default" data-toggle="button">취소하기</button>
								</div>
							</td>
						</tr>
					</table>
				</form>
				</div>
				</div>
				</div>
			</td>
			</c:if>
			<td width="55%">
				<ul class="nav nav-tabs" id="myTab">
					<c:choose>
						<c:when test="${requestScope.flag eq false}">
							<li class="active"><a href="#justTwo" data-toggle="tab">미리보기</a></li>
							<li><a href="#getList" data-toggle="tab">목록보기</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#justTwo" data-toggle="tab">미리보기</a></li>
							<li class="active"><a href="#getList" data-toggle="tab">목록보기</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
				<div class="tab-content" id="myTab">
					<c:choose>
						<c:when test="${requestScope.flag eq false}">
							<div class="tab-pane active"  id="justTwo">
						</c:when>
						<c:otherwise>
							<div class="tab-pane"  id="justTwo">
						</c:otherwise>
					</c:choose>
				<!-- 
					<div class="tab-pane active"  id="justTwo"> -->
						<table border="0" width="100%" height="395">
							<tr>
								<td>
								<div class="row">
  										<div class="col-lg-15 col-lg-10">
    										<div class="thumbnail" style="background-color: rgb(240, 240, 240); border-color: rgb(240, 240, 240);">
									<form action="control" method="post" name="firstForm">
									
										<table border="0" width="95%" height="400" style="border:hidden ; table-layout: fixed;">
											<c:choose>
												<c:when test="${not empty requestScope.diaryFirst}">
													<tr height="13%">
														<td><h2>${requestScope.diaryFirst.wrdate}</h2></td>
													</tr>
													<tr height="5%">
														<td>&nbsp;&nbsp;제목 : 
															${requestScope.diaryFirst.title}
															<div class="btn-group btn-group-xs">
																<a class="btn btn-info" href="/gaenari/diaryDetail.do?brdno=${requestScope.diaryFirst.brdno}&userid=${requestScope.user.userid}">상세보기</a>
															</div>
														</td>
													</tr>
													<tr height="12%">
														<td>&nbsp;&nbsp;기분 : 
															<%-- ${requestScope.diaryFirst.mood} --%>
															<img src="${requestScope.diaryFirst.mood}" height="17px">
															<c:if test="${requestScope.diaryFirstImg != null}">
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																&nbsp;&nbsp;
																첨부된 이미지 <img src="${requestScope.diaryFirstImg}" height="30" class="img-rounded">
															</c:if>
														</td>
													</tr>

													<!-- 14-05-13 성훈수정: 경우에 따라 사진 넣고 말고 하기 -->
													<tr height="43%">
														<td style="text-align: left;vertical-align: top;">
														<div id="scroll">
															${requestScope.diaryFirst.brdcontent}
														</div>
														</td>
													</tr>
													<c:if test="${requestScope.user.userid eq sessionScope.userid }">
													<tr height="5%">
														<td>
															<div align="center">
																<input type="hidden" name="command" value=""> 
																<input type="hidden" name="brdno" value="${requestScope.diaryFirst.brdno}"> 
																<input type="submit" class="btn btn-success" value="수정하기" onclick="sendUpdate()">
																&nbsp;&nbsp;&nbsp; 
																<input type="submit" class="btn btn-danger" value="삭제하기" onclick="deleteCheck()">
															</div>
														</td>
													</tr>
													</c:if>
												</c:when>
												<c:otherwise>
													<tr height="15%">
														<td><h2>등록된 일기가 없습니다.</h2></td>
													</tr>
													<tr height="7%">
														<td></td>
													</tr>
													<tr height="7%">
														<td></td>
													</tr>
													<tr height="50%">
														<td>등록된 일기가 없습니다. 일기를 새로 작성해 주세요.</td>
													</tr>
													<tr height="7%">
														<td></td>
													</tr>
												</c:otherwise>
											</c:choose>
										</table>
										</form>
										</div>
										</div>
										</div>
									
								</td>
								<td>
								<c:if test="${requestScope.user.userid != sessionScope.userid}">
								<div class="row">
  										<div class="col-lg-15 col-lg-10">
    										<div class="thumbnail" style="background-color: rgb(240, 240, 240); border-color: rgb(240, 240, 240);">
									<form action="control" method="post" name="secondForm">
										<table border="0" width="95%" height="400" style="border: hidden; table-layout: fixed;">
											<c:choose>
												<c:when test="${not empty requestScope.diarySecond}">
													<tr height="13%">
														<td><h2>${requestScope.diarySecond.wrdate}</h2></td>
													</tr>
													<tr height="5%">
														<td>&nbsp;&nbsp;제목 :
															${requestScope.diarySecond.title}
															<div class="btn-group btn-group-xs">
																<a class="btn btn-info" href="/gaenari/diaryDetail.do?brdno=${requestScope.diarySecond.brdno}&userid=${requestScope.user.userid}">상세보기</a>
															</div>
														</td>
													</tr>
													<tr height="12%">
														<td>&nbsp;&nbsp;기분 : 
															<%-- ${requestScope.diarySecond.mood} --%>
															<img src="${requestScope.diarySecond.mood}" height="17px">
															<c:if test="${requestScope.diarySecondImg != null}">
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																첨부된 이미지 <img src="${requestScope.diarySecondImg}" height="30" class="img-rounded">
															</c:if>
														</td>
													</tr>

													<!-- 14-05-13 성훈 수정 경우에 따라 사진 넣고 말고 하기 -->
													<tr height="43%">
														<td style="text-align: left;vertical-align: top;">
														<div id="scroll">
															${requestScope.diarySecond.brdcontent}
														</div>
														</td>
													</tr>
													<c:if test="${requestScope.user.userid eq sessionScope.userid }">
													<tr height="5%">
														<td>
															<div align="center">
																<input type="hidden" name="command" value=""> 
																<input type="hidden" name="brdno" value="${requestScope.diarySecond.brdno}"> 
																<input type="submit" class="btn btn-success" value="수정하기" onclick="sendingUpdate()">
																&nbsp;&nbsp;&nbsp; 
																<input type="submit" class="btn btn-danger" value="삭제하기" onclick="deleteChecking()">
															</div>
														</td>
													</tr>
													</c:if>
												</c:when>
												<c:otherwise>
													<tr height="15%">
														<td><h2>등록된 일기가 없습니다.</h2></td>
													</tr>
													<tr height="7%">
														<td></td>
													</tr>
													<tr height="7%">
														<td></td>
													</tr>
													<tr height="43%">
														<td>등록된 일기가 없습니다. 일기를 새로 작성해 주세요.</td>
													</tr>
													<tr height="7%">
														<td></td>
													</tr>
												</c:otherwise>
											</c:choose>
										</table>
									</form>
									</div>
									</div>
									</div>
									</c:if>
								</td>
							</tr>
							<tr height="25">
							<c:choose>
								<c:when test="${requestScope.user.userid != sessionScope.userid }">
									<td colspan="2" align="center">
								</c:when>
								<c:otherwise>
									<td align="center">
								</c:otherwise>
							</c:choose>
								<font size="6">
										<c:choose>
											<c:when test="${requestScope.diaryNumber < fn:length(diaryList)-1}">
												<a href="/gaenari/diaryList.do?diaryNumber=${requestScope.diaryNumber+1}&userid=${requestScope.user.userid}" class="glyphicon glyphicon-chevron-left"></a>
											</c:when>
											<c:otherwise>
												<a href="#" class="glyphicon glyphicon-chevron-left"></a>
											</c:otherwise>
										</c:choose> 
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<c:if test="${requestScope.user.userid != sessionScope.userid}">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
										</c:if>
										<c:choose>
											<c:when test="${requestScope.diaryNumber > 1}">
												<a href="/gaenari/diaryList.do?diaryNumber=${requestScope.diaryNumber-1}&userid=${requestScope.user.userid}" class="glyphicon glyphicon-chevron-right"></a>
											</c:when>
											<c:otherwise>
												<a href="#" class="glyphicon glyphicon-chevron-right"></a>
											</c:otherwise>
										</c:choose>
								</font></td>
							</tr>
						</table>
					</div>
					<c:choose>
						<c:when test="${requestScope.flag eq false}">
							<div class="tab-pane"  id="getList">
						</c:when>
						<c:otherwise>
							<div class="tab-pane active"  id="getList">
						</c:otherwise>
					</c:choose>
					<!-- <div class="tab-pane" id="getList"> -->
						<table class="table table-condensed" width="100%" height="395" style="table-layout: fixed;">
							<colgroup>
								<col width="20%">
								<col width="50%">
								<col width="20%">
							</colgroup>
							<tbody style="font-size: 13px;">
							<tr>
								<td colspan="3">
									<div class="page-header">
  										<h2>${requestScope.user.userid}님의 일기<small>${sessionScope.today}</small></h2>
									</div>
								</td>
							</tr>
							<tr height="40px" style="background-color: rgb(230, 227, 196);">
								<td align="center" height="30" style="word-break: break-all;vertical-align: middle;">작성날짜</td>
								<td align="center" style="vertical-align: middle;">제목</td>
								<td align="center" style="vertical-align: middle;">기분</td>
							</tr>
							<c:choose>
								<c:when test="${not empty requestScope.tenDiaries}">
									<c:forEach items="${requestScope.tenDiaries}" var="diary">
										<tr height="30" style="table-layout: fixed;">
											<td align="center">${diary.wrdate}</td>
											<td><a href="/gaenari/diaryDetail.do?brdno=${diary.brdno}&userid=${requestScope.user.userid}">
													${diary.title}
												</a>
											</td>
											<td align="center"><%-- ${diary.mood} --%><img src="${diary.mood}" height="18px"></td>
										</tr>
									</c:forEach>
									<c:if test="${fn:length(tenDiaries) < 10}">
										<c:forEach begin="1" end="${10-fn:length(tenDiaries)}">
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
										<td colspan="3" align="center">등록된 일기가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
							<tr height="30">
								<td colspan="3" align="center">
									<c:choose>
										<c:when test="${not empty requestScope.pageCount}">
											<ul class="pagination">
												<c:choose>
													<c:when test="${requestScope.pageNumber-1 > 0}">
														<li><a href="/gaenari/diaryList.do?pageNumber=${requestScope.pageNumber-1}&userid=${requestScope.user.userid}">«</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="#">«</a></li>
													</c:otherwise>
												</c:choose>
												<c:forEach begin="1" end="${requestScope.pageCount}" var="cnt">
													<c:choose>
														<c:when test="${cnt eq requestScope.pageNumber}">
															<li class="active">
																<a href="/gaenari/diaryList.do?pageNumber=${cnt}&userid=${requestScope.user.userid}">
																	${cnt}<span class="sr-only">(current)</span>
																</a>
															</li>
														</c:when>
														<c:otherwise>
															<li><a href="/gaenari/diaryList.do?pageNumber=${cnt}&userid=${requestScope.user.userid}">${cnt}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:choose>
													<c:when test="${requestScope.pageNumber+1 < requestScope.pageCount+1}">
														<li><a href="/gaenari/diaryList.do?pageNumber=${requestScope.pageNumber+1}&userid=${requestScope.user.userid}">»</a></li>
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
					</div>
				</div>
			</td>
		</tr>
	</table>
	</td></tr></table>
</body>
<script type="text/javascript">
function submit(){
	$("#diaryForm").submit();
}
function reset(){
	$("#diaryForm").reset();
}
</script>
</html>
<%-- <%@ include file="/bottom.jsp"%> --%>