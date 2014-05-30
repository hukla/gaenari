<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	h1,h2,h3,h4,h5 {   font-family:'서울한강체' } 
</style>
</head>
<body>
	<table border="0" align="left" width="14%" >
		<tr>
			<td width="10%">
			</td>
			<td width="90%">
				<font face="서울한강체">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="/gaenari/miniHome.do?userid=${requestScope.user.userid}">메인페이지</a></li>
						<li><a href="/gaenari/calendar.do?userid=${requestScope.user.userid}">달력</a></li>
						<li><a href="/gaenari/diaryList.do?userid=${requestScope.user.userid}">일기</a></li>
						<li><a href="/gaenari/planList.do?userid=${requestScope.user.userid}">일정</a></li>
						<li><a href="/gaenari/visitList.do?userid=${requestScope.user.userid}">방명록</a></li>
						<li><a href="/gaenari/friends.do?userid=${requestScope.user.userid}">친구목록</a></li>
					</ul>
				</font>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				${requestScope.user.userid}님<br>홈페이지 이용중
			</td>
		</tr>
	</table>
</body>
</html>