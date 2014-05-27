<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="frame.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강아지 등록완료</title>
<!-- 
작성: 2014-05-27
작성자: 최성훈
내용: 강아지 정보 등록완료후 창닫기
 -->
</head>
<body>
<H1 align="center">강아지 등록 완료</H1>
<div align="center">
	${requestScope.user.userid}님의 강아지<br>
	<c:forEach items="${requestScope.dog}" var="doggy">
		<font face="서울한강체">[${doggy.dogname}]</font>
	</c:forEach><br>
	(이)의 정보가 개나리 사이트에 등록되었습니다.<br>
	 미니홈피에서 ${fn:length(dog)}마리 강아지의 일정과 일상을 공유해보세요!
</div>
<div align="center"><button id="close">창 닫기</button></div>
</body>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
	$(function(){
		$("#close").click(function(){
			opener.location.reload();
			self.close();
		});
	});
</script>
</html>
<%@ include file="bottom.jsp" %>