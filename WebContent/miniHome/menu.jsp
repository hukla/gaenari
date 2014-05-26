<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/gaenari/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"> -->
<title>Insert title here</title>
<style type="text/css">
	h4 { font-size:13pt ;  font-family:'서울한강체' } 
</style>
</head>
<!-- <script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/gaenari/bootstrap/js/bootstrap.min.js"></script> -->
<body>
	<table border="0" align="left" width="14%" >
		<tr>
			<td width="10%">
			</td>
			<td width="90%">
				<font face="서울한강체">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="/gaenari/control?command=login&userid=${requestScope.user.userid}">메인페이지</a></li>
						<li><a href="/gaenari/control?command=calendar&userid=${requestScope.user.userid}">달력</a></li>
						<li><a href="/gaenari/control?command=diaryList&userid=${requestScope.user.userid}">일기</a></li>
						<li><a href="/gaenari/control?command=planList&userid=${requestScope.user.userid}">일정</a></li>
						<li><a href="/gaenari/control?command=visitList&userid=${requestScope.user.userid}">방명록</a></li>
						<li><a href="/gaenari/control?command=friends&userid=${requestScope.user.userid}">친구목록</a></li>
					</ul>
				</font>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				${requestScope.user.userid}님<br>홈페이지
			</td>
		</tr>
	</table>
</body>
</html>