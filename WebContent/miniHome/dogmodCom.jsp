<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.dao.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/static/pages/head.jsp"%>
<script src="//code.jquery.com/jquery.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
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
<div align="center"><button id="close" class="btn btn-default" data-toggle="button">닫기</button></div>
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
<%@ include file="/static/pages/footer.jsp"%>