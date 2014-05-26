<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="frame.jsp" %>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/gaenari/bootstrap/css/bootstrap-ko.css" rel="stylesheet">
<script src="//code.jquery.com/jquery.js"></script>
<script src="//code.jquery.com/jquery-1.9.1.min.js"></script>
<title>미니홈피 일기</title>
<!-- 
작성자: 최성훈
작성목적: 일기 작성, 검색, 수정, 삭제 등의 관리
작성내용: 화면상에 세가지 일기 테이블을 구현한다.
		  일기를 작성하는 테이블이 가장 왼쪽에 위치하고,
		  지난 일기는 가장 최신 순서로 가운데와 오른편에 위치한다.
		  페이지 우상단에 일정게시판으로 이동하는 버튼이 있다.
추가할 사항: 페이지 번호 링크를 추가하여 지난 일기를 찾아보기 용이하도록한다.

수정: 최성훈
수정일: 2014-04-23
수정내용: 메인페이지 이동할 때 url패턴으로 action 통해서 가도록 수정

수정: 최성훈
수정날짜: 2014-05-20
수정내용: 일기 정보가 없을 때 페이지에 접근 못 하던 오류 해결

수정: 최성훈
수정날짜: 2014-05-22
수정내용: 다이어리 전체 페이지에서 수정, 삭제기능 javascript추가

수정: 최성훈
수정날짜: 2014-05-23
수정내용: 다이어리열람을 '미리보기', '목록보기' 두가지 탭으로 나눔
		미리보기 탭에선 2개씩 미리보고 좌우버튼으로 이전일기 다음일기 이동
		목록보기 탭에선 10개 묶음씩의 게시판 출력
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
	<table border="0" align="center" width="80%" height="100%" cellpadding="20">
		<!-- <tr>
			<td width="33%" align="center">
				<form action="">
					<select class="btn btn-default">
						<option selected="selected">분류</option>
						<option>날짜</option>
						<option>글번호</option>
						<option>제목</option>
						<option>장소</option>
					</select> <input type="text"> <input type="submit" value="검색">
				</form>
			</td>
			<td width="67%" align="center">
				<div align="center">
					<input type="button" onclick="location.href='/gaenari/planList.do'" value="일정게시판">
				</div>
			</td>
		</tr> -->
		<tr>
			<td width="33%">
				<form action="writeDiary.do" method="post" enctype="multipart/form-data">
					<table border="0" width="100%" height="380" style="outline-style: double; table-layout: fixed;">
						<tr height="18%">
							<td><h2>오늘 일기</h2></td>
						</tr>
						<tr height="10%">
							<td>&nbsp;&nbsp;제목 : <input type="text" size="33" name="title">
							</td>
						</tr>
						<tr height="65%">
							<td>&nbsp;&nbsp;기분 : 
							좋음<input type="radio" name="mood" value="good"> 
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							보통<input type="radio" name="mood" value="soso">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							구림<input type="radio" name="mood" value="bad"> <br/> 
							&nbsp; <textarea rows="10" cols="35" name="content"></textarea><p/> 
							&nbsp; <input type="file" name="uploadFile" size="29" value="찾아보기"><br/>
							</td>
						</tr>
						<tr height="7%">
							<td>
								<div align="center">
									<input type="submit" value="등록하기">
									&nbsp;&nbsp;&nbsp; 
									<input type="reset" value="취소하기">
								</div>
							</td>
						</tr>
					</table>
				</form>
			</td>

			<td width="67%">
				<ul class="nav nav-tabs" id="myTab">
					<li class="active"><a href="#justTwo" data-toggle="tab">미리보기</a></li>
					<li><a href="#getList" data-toggle="tab">목록보기</a></li>
				</ul>
				<div class="tab-content" id="myTab">
					<div class="tab-pane active" id="justTwo">
						<table border="0" width="100%" height="395">
							<tr>
								<td>
									<form action="control" method="post" name="firstForm">
										<table border="0" width="95%" height="370" style="outline-style: double; table-layout: fixed;">
											<c:choose>
												<c:when test="${not empty requestScope.diaryFirst}">
													<tr height="15%">
														<td><h2>${requestScope.diaryFirst.wrdate}</h2></td>
													</tr>
													<tr height="7%">
														<td>&nbsp;&nbsp;제목 : ${requestScope.diaryFirst.title}</td>
													</tr>
													<tr height="7%">
														<td>&nbsp;&nbsp;기분 : ${requestScope.diaryFirst.mood}</td>
													</tr>

													<!-- 14-05-13 성훈수정: 경우에 따라 사진 넣고 말고 하기 -->
													<tr height="43%">
														<td><c:if test="${requestScope.diaryFirstImg != null}">
																<img src="${requestScope.diaryFirstImg}" width="180" class="img-rounded">
															</c:if> ${requestScope.diaryFirst.brdcontent}</td>
													</tr>
													<tr height="7%">
														<td>
															<div align="center">
																<input type="hidden" name="command" value=""> 
																<input type="hidden" name="brdno" value="${requestScope.diaryFirst.brdno}"> 
																<input type="submit" value="수정하기" onclick="sendUpdate()">
																&nbsp;&nbsp;&nbsp; 
																<input type="submit" value="삭제하기" onclick="deleteCheck()">
															</div>
														</td>
													</tr>
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
								</td>
								<td>
									<form action="control" method="post" name="secondForm">
										<table border="0" width="95%" height="370"
											style="outline-style: double; table-layout: fixed;">
											<c:choose>
												<c:when test="${not empty requestScope.diarySecond}">
													<tr height="15%">
														<td><h2>${requestScope.diarySecond.wrdate}</h2></td>
													</tr>
													<tr height="7%">
														<td>&nbsp;&nbsp;제목 :
															${requestScope.diarySecond.title}
														</td>
													</tr>
													<tr height="7%">
														<td>&nbsp;&nbsp;기분 : 
															${requestScope.diarySecond.mood}
														</td>
													</tr>

													<!-- 14-05-13 성훈 수정 경우에 따라 사진 넣고 말고 하기 -->
													<tr height="43%">
														<td>
															<c:if test="${requestScope.diarySecondImg != null}">
																<img src="${requestScope.diarySecondImg}" width="180" class="img-rounded">
															</c:if> ${requestScope.diarySecond.brdcontent}
														</td>
													</tr>
													<tr height="7%">
														<td>
															<div align="center">
																<input type="hidden" name="command" value=""> 
																<input type="hidden" name="brdno" value="${requestScope.diarySecond.brdno}"> 
																<input type="submit" value="수정하기" onclick="sendingUpdate()">
																&nbsp;&nbsp;&nbsp; 
																<input type="submit" value="삭제하기" onclick="deleteChecking()">
															</div>
														</td>
													</tr>
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
								</td>
							</tr>
							<tr height="25">
								<td colspan="2" align="center"><font size="6"> <c:choose>
											<c:when test="${requestScope.diaryNumber < fn:length(diaryList)-1}">
												<a href="/gaenari/control?command=diaryList&diaryNumber=${requestScope.diaryNumber+1}" class="glyphicon glyphicon-chevron-left"></a>
											</c:when>
											<c:otherwise>
												<a href="#" class="glyphicon glyphicon-chevron-left"></a>
											</c:otherwise>
										</c:choose> 
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <c:choose>
											<c:when test="${requestScope.diaryNumber > 1}">
												<a href="/gaenari/control?command=diaryList&diaryNumber=${requestScope.diaryNumber-1}" class="glyphicon glyphicon-chevron-right"></a>
											</c:when>
											<c:otherwise>
												<a href="#" class="glyphicon glyphicon-chevron-right"></a>
											</c:otherwise>
										</c:choose>
								</font></td>
							</tr>
						</table>
					</div>
					<div class="tab-pane" id="getList">
						<table class="table table-condensed" width="100%" height="395">
							<colgroup>
								<col width="20%">
								<col width="50%">
								<col width="20%">
							</colgroup>
							<tr>
								<td align="center" height="30" style="word-break: break-all;">작성날짜</td>
								<td align="center">제목</td>
								<td align="center">기분</td>
							</tr>
							<c:choose>
								<c:when test="${not empty requestScope.tenDiaries}">
									<c:forEach items="${requestScope.tenDiaries}" var="diary">
										<tr height="30" style="table-layout: fixed;">
											<td align="center">${diary.wrdate}</td>
											<td><a href="control?command=diaryDetail&brdno=${diary.brdno}">
													${diary.title}
												</a>
											</td>
											<td align="center">${diary.mood}</td>
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
														<li><a href="control?command=diaryList&pageNumber=${requestScope.pageNumber-1}">«</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="#">«</a></li>
													</c:otherwise>
												</c:choose>
												<c:forEach begin="1" end="${requestScope.pageCount}" var="cnt">
													<c:choose>
														<c:when test="${cnt eq requestScope.pageNumber}">
															<li class="active">
																<a href="control?command=diaryList&pageNumber=${cnt}">
																	${cnt}<span class="sr-only">(current)</span>
																</a>
															</li>
														</c:when>
														<c:otherwise>
															<li><a href="control?command=diaryList&pageNumber=${cnt}">${cnt}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:choose>
													<c:when test="${requestScope.pageNumber+1 < requestScope.pageCount+1}">
														<li><a href="control?command=diaryList&pageNumber=${requestScope.pageNumber+1}">»</a></li>
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
</body>
</html>