<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="frame.jsp" %>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미니홈피 일정 상세보기</title>
<!-- 
작성자: 최성훈
작성일: 2014-04-23
작성내용: 일정 제목의 링크를 클릭하여 일정의 상세보기가 가능하다.
		  메인페이지 이동할 때 url패턴으로 action 통해서 가도록 수정
		  우상단에 일정 전체보기 버튼,
		  하단에 수정하기 삭제하기 버튼
		  
수정: 최성훈
수정일: 2014-05-14
내용: 이전 글, 다음 글 보기 기능 추가

수정: 최성훈
수정일: 2014-05-21
내용: 이전 글, 다음 글 보기 기능 오류 수정완료(전체 리스트에서 index로 이동하도록 수정)

수정: 최성훈
수정일: 2014-05-22
내용: 글 삭제기능 javascript 추가

수정: 최성훈
수정일: 2014-05-27
수정내용: 	내 홈피, 친구홈피 방문의 경우를 나누기 위해 a태그 접근시 꼭
			requestScope의 userid를 지니고 가게함.
			
			친구홈피에 방문하는 경우, 수정, 삭제 기능을 이용하지 못 하도록 함.
			
			일기 수정중에 미니홈페이지 메뉴기능 이용이 불가능 했던 오류 수정
 -->
</head>
<script type="text/javascript">
	function deleteCheck(){
		if(confirm("삭제하시겠습니까?")){
			document.requestForm.command.value="deletePlan";
			document.requestForm.brdno=brdno;
			document.requestForm.submit();
		}else{
			document.requestForm.command.value="planDetail";
			document.requestForm.brdno=brdno;
			document.requestForm.submit();
		}
	}
</script>
<body>
	<table border="0" width="80%" height="480">
		<tr>
			<td width="100%" align="right">
				<input type="button" onclick="location.href='/gaenari/planList.do'" value="일정전체">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" align="center" width="50%" height="80%">
					<tr>
						<td width="15%" align="center" height="10%">오늘날짜</td>
						<td width="85%" align="center">
							<div align="center">${sessionScope.today}</div>
						</td>
					</tr>
					<tr>
						<td align="center" height="10%">제목</td>
						<td>
							<div align="center">${requestScope.onePlan.title}</div>
						</td>
					</tr>
					<tr>
						<td align="center" height="10%">수행날짜</td>
						<td>
							<div align="center">
								${requestScope.onePlan.wrdate}
								<c:if test="${requestScope.onePlan.wrdate eq sessionScope.today}">
									<font color="blue">[오늘입니다]</font>
								</c:if>
							</div>
						</td>
					</tr>
					<tr>
						<td align="center" height="10%">장소</td>
						<td>
							<div align="center">${requestScope.onePlan.ploc}</div>
						</td>
					</tr>
					<tr>
						<td align="center" height="40%">내용</td>
						<td style="text-align: left; vertical-align: top;">
							${requestScope.onePlan.brdcontent}
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="center">
				<form action="control" method="post" name="requestForm">

					<!-- 14-05-14 성훈 추가: 이전 글, 다음 글 보기 -->
					<!-- 14-05-16 01:03 성훈추가 이전글,다음글 해결하고싶다 -->
					<!-- 14-05-21 성훈 수정: 이전 글, 다음 글 index로 이동, 수정, 삭제추가 -->
					<input type="button" onclick="location.href='control?command=planDetail&index=${requestScope.index -1}&userid=${requestScope.user.userid}'" value="이전 글">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${requestScope.user.userid eq sessionScope.userid }">
						<input type="button" onclick="location.href='control?command=updateFormPlan&brdno=${requestScope.onePlan.brdno}&userid=${requestScope.user.userid}'" value="수정하기"> 
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="hidden" name="command" value="">
						<input type="hidden" name="brdno" value="${requestScope.onePlan.brdno}">
						<input type="submit" onclick="javascript:deleteCheck();" value="삭제하기">
						&nbsp;&nbsp;&nbsp;&nbsp; 
					</c:if>
					<input type="button" onclick="location.href='control?command=planDetail&index=${requestScope.index +1}&userid=${requestScope.user.userid}'" value="다음 글">
					<ul class="pager">
						<li><a href="control?command=planDetail&index=${requestScope.index +1}&userid=${requestScope.user.userid}">Previous</a></li>
						<c:if test="${requestScope.user.userid eq sessionScope.userid }">
							<li><a href="control?command=updateFormPlan&brdno=${requestScope.onePlan.brdno}&userid=${requestScope.user.userid}">수정하기</a></li>
							<li><a href="javascript:deleteCheck();">삭제하기</a></li>
						</c:if>
						<li><a href="control?command=planDetail&index=${requestScope.index -1}&userid=${requestScope.user.userid}">Next</a></li>
					</ul>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
<%@ include file="bottom.jsp"%>