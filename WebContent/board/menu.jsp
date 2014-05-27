<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	h1,h2,h3,h4,h5 {   font-family:'서울한강체' } 
</style>
<!-- 
수정: 이수진
수정일: 2014-05-27
수정내용: voluBoard/ptBoard 게시판 성격에 맞게 수정
-->
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
						<li><a href="/gaenari/control?command=missingBoardList">유기견신고</a></li>
						<li><a href="/gaenari/control?command=findingBoardList">유기견제보</a></li>
						<li><a href="/gaenari/control?command=adpBoardList">애견입양</a></li>
						<li><a href="/gaenari/control?command=voluBoardList">자원봉사</a></li>
						<li><a href="/gaenari/control?command=ptBoardList">펫 도우미</a></li>
					</ul>
				</font>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				${sessionScope.user.userid}님<br>홈페이지
			</td>
		</tr>
	</table>
</body>
</html>