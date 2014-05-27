<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="2014-05-03:장재희:기부몰 메인으로 진입하는 페이지"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.getRequestDispatcher("mallMain.do").forward(request, response); %>
</body>
</html>