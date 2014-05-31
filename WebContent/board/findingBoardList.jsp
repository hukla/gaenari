<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/frame.jsp"%>
<%@ include file="menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유기견 제보 페이지</title>
</head>
<body>
	<div align=right>
		<span style="font-size:9pt;"><a href="/gaenari/board/findingBoardWrite.jsp">
		<input type="hidden" value=${id} name="id">
		<input type=submit value=글쓰기></a></span></div>
</body>
</html>
<%@ include file="../bottom.jsp"%>