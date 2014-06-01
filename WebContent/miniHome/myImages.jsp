<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/frame.jsp"%>
<%@ include file="menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<style type="text/css">
	img {
	float: left;
	width: 200;
	height: 200;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사진첩</title>
</head>
<body>
	<table align="center">
		<tr>
			<c:if test="${requestScope.imageList != null}">
				<c:forEach items="${requestScope.imageList}" var="list" varStatus="status">
					<td align="center"><img src="${list}" width="200" height="200"></td>
					<c:if test="${status.count % 3 ==0}">
						</tr>
						<tr>
					</c:if>
				</c:forEach>
			</c:if>
		</tr>
	</table>
</body>
</html>
<%@ include file="/bottom.jsp"%>