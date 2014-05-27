<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/frame.jsp" %>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미니홈피 방명록 상세보기</title>
<!-- 
작성자: 최성훈
작성일: 2014-04-23
작성내용: 방명록 작성자의 링크를 클릭하여 방명록의 상세보기가 가능하다.
		  메인페이지 이동할 때 url패턴으로 action 통해서 가도록 수정
		  우상단에 일정 전체보기 버튼,
		  하단에 수정하기 삭제하기 버튼

수정: 최성훈
수정일: 2014-05-27
수정내용: 	내 홈피, 친구홈피 방문의 경우를 나누기 위해 a태그 접근시 꼭
			requestScope의 userid를 지니고 가게함.
			
			친구홈피에 방문하는 경우, 수정, 삭제 기능을 이용하지 못 하도록 함.
			(방명록의 경우는 이 부분 다시 생각해야할 듯)
 -->
</head>
<body>
	<table border="0" width="80%" height="480">
		<tr>
			<td width="100%" align="right">
				<input type="button" onclick="/gaenari/visitList.do'" value="방명록전체">
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
						<td align="center" height="10%">작성자</td>
						<td>
							<div align="center">${requestScope.oneVisit.userid}</div>
						</td>
					</tr>
					<tr>
						<td align="center" height="10%">작성날짜</td>
						<td>
							<div align="center">
								${requestScope.oneVisit.wrdate}
								<c:if test="${requestScope.oneVisit.wrdate eq sessionScope.today}">
									<font color="blue">[오늘입니다]</font>
								</c:if>
							</div>
						</td>
					</tr>
					<tr>
						<td align="center" height="50%">내용</td>
						<td>
							<div align="center">${requestScope.oneVisit.brdcontent}</div>
						</td>
					</tr>
					<tr>
						<!-- 14-05-21 성훈 수정: 이전 글, 다음 글 index로 이동 -->
						<td align="center" colspan="2" height="7%">
							<input type="button" onclick="location.href='control?command=visitDetail&index=${requestScope.index + 1}&userid=${requestScope.user.userid}'" value="이전 글">
							&nbsp;&nbsp;&nbsp;&nbsp; 
							<c:if test="${requestScope.user.userid eq sessionScope.userid }">
								<input type="button" onclick="" value="수정하기"> 
								&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="button" onclick="" value="삭제하기">
								&nbsp;&nbsp;&nbsp;&nbsp; 
							</c:if>
							<input type="button" onclick="location.href='control?command=visitDetail&index=${requestScope.index - 1}&userid=${requestScope.user.userid}'" value="다음 글">
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
<%@ include file="/bottom.jsp"%>