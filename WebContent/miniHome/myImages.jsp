<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<style type="text/css">
	img {
	float: left;
	height: 200;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사진첩</title>
</head>
<body>
<h2>${requestScope.user.userid}님의 사진</h2>
<hr>
	<table align="left" id="images">
		<tr>
			<c:if test="${requestScope.imageList != null}">
				<c:forEach items="${requestScope.imageList}" var="list" varStatus="status">
					<td align="center">
						<form action="/gaenari/miniHome.do?userid=${requestScope.user.userid}&updateimg=${list}">
							<input type="image" src="${list}" height="80" onclick="selectPsa('${list}')"><%-- <br>
							<input type="radio" name="image" value="${list}"> --%>
						</form>
					</td>
					<c:if test="${status.count % 3 ==0}">
						</tr>
						<tr>
					</c:if>
				</c:forEach>
			</c:if>
		</tr>
	</table>
	<form action="/gaenari/miniHome.do" enctype="multipart/form-data" method="post" id="imgForm">
		<input type="file" name="myImage">
		<input type="hidden" name="userid" value="${requestScope.user.userid}">
		<input type="button" onclick="submit()" value="등록">
	</form>
</body>
<script type="text/javascript">
	function selectPsa(image){
		window.opener.location.href="/gaenari/miniHome.do?updateimg="+image+"&userid=${requestScope.user.userid}";
		window.self.close();
	}
	function submit(){
		$("#imgForm").submit();
		window.self.close();
	}
</script>
</html>
