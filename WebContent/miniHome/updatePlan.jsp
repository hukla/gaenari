<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 -->
<body>
	<table border="1" width="1350" height="630">
		<tr>
			<td colspan="2" height="20%">
				<h3>${sessionScope.user.username}님의 일정 수정 페이지</h3>
				<div align="right">
					<input type="button" value="로그아웃" onclick="location.href='control?command=logout'">
				</div>
				<hr color="gray">
			</td>
		</tr>
		<tr>
			<td width="17%" height="80%">
				<table border="1" align="center" width="203" cellpadding="40">
				
				<!-- 페이지 왼편 서브메뉴(메인페이지, 달력, 방명록, 친구신청) -->
				
					<tr>
						<td><a href="control?command=login">메인페이지</a></td>
					</tr>
					<tr>
						<td><a href="control?command=calendar">달력</a></td>
					</tr>
					<tr>
						<td><a href="control?command=visitList">방명록</a></td>
					</tr>
					<tr>
						<td><a href="">친구관리</a></td>
					</tr>
					<tr>
						<td><a href="mall/mall_index.jsp">기부몰</a></td>
					</tr>
				</table>
			</td>
			<td rowspan="2" width="83%" height="80%">
			<form action="control?command=updatePlan" method="post">
				<table border="0" width="100%" height="100%">
					<tr>
						<td width="100%" align="right">
							<input type="button" onclick="location.href='control?command=planList'"value="일정전체">
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
							<input type="submit" value="수정하기"> 
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" value="취소하기">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" onclick="history.back()" value="뒤로가기">
						</td>
					</tr>
				</table>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>