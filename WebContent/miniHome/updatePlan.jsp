<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/frame.jsp" %>
    <%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정 수정하기</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>
</head>
<!-- 
작성: 2014-05-21
작성자: 최성훈
내용: 일정 수정하기

수정: 2014-05-27, 최성훈
내용: 일기 수정중에 미니홈페이지 메뉴기능 이용이 불가능 했던 오류 수정
 -->
<body>
	<form action="/gaenari/updatePlan.do" method="post">
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
								<div align="center">
									<input type="text" name="title" value="${requestScope.onePlan.title}">
								</div>
							</td>
						</tr>
						<tr>
							<td align="center" height="10%">수행날짜</td>
							<td>
								<div align="center">
									<input type="text" id="datepicker" name="wrdate" value="${requestScope.date}">
								</div>
							</td>
						</tr>
						<tr>
							<td align="center" height="10%">장소</td>
							<td>
								<div align="center">
									<input type="text" name="ploc" value="${requestScope.onePlan.ploc}">
								</div>
							</td>
						</tr>
						<tr>
							<td align="center" height="40%">내용</td>
							<td>
								<div align="center">
									<textarea rows="10" cols="50" name="brdcontent">${requestScope.onePlan.brdcontent}</textarea>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="hidden" name="brdno" value="${requestScope.onePlan.brdno}">
					<input type="hidden" name="userid" value="${requestScope.user.userid}">
					<input type="submit" value="수정하기">
					&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="reset" value="취소하기">
					&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="button" onclick="history.back()" value="뒤로가기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<%@ include file="/bottom.jsp"%>