<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/frame.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강아지 등록완료</title>
<!-- 
작성: 2014-06-04
작성자: 최성훈
내용: 강아지 정보 수정완료후 창닫기
 -->
</head>
<body>
<H1 align="center">강아지 수정 완료</H1>
<div align="center">
	${requestScope.user.userid}님의 강아지<br>
	${requestScope.dog.dogname}(이)의 정보가 수정되었습니다.<br>
	(이)의 정보가 수정되었습니다.<br>
</div>
<div align="center"><button id="close">창 닫기</button></div>
</body>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
	$(function(){
		$("#close").click(function(){
			window.opener.location.href="/gaenari/modifyform.do?userid=${requestScope.user.userid}";
			window.self.close();
		});
	});
</script>
</html>
<%@ include file="/bottom.jsp" %>