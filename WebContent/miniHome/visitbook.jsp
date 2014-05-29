<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/frame.jsp" %>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미니홈피 방명록</title>
</head>
<body>
<!-- 
작성자: 최성훈
작성일: 2014-04-21
작성내용: 메인페이지 이동할 때 url패턴으로 action 통해서 가도록 수정
		  상단의 방명록 작성란을 통해 방명록을 등록한다.
		  방명록이 등록되면 작성란 아래로 추가된다.
 -->
	<table width="80%" height="100%" border="0">
		<tr>
			<td>
				<form action="/gaenari/writeVisit.do" method="post">
					<table border="0" align="center" style="outline-style: double;">
						<tr>
							<td width="20%" align="center">
								<input type="image" src="image/hoonc.jpg">
							</td>
							<td width="80%">
								<textarea rows="9" cols="74" name="content" id="content"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div align="right">
									<input type="submit" value="등록하기">
									&nbsp;&nbsp;&nbsp; 
									<input
										type="reset" value="취소하기">
								</div>
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		<c:choose>
			<c:when test="${not empty sessionScope.visitAllList}">
				<c:forEach items="${sessionScope.visitAllList}" var="visit">
					<tr>
						<td>
							<form action="/gaenari/writeVisit.do" method="post">
								<table border="0" align="center" width="783"
									style="outline-style: double;">
									<tr>
										<td width="20%" align="center"><input type="image"
											src="image/hoonc.jpg"></td>
										<td width="80%">${visit.brdcontent}</td>
									</tr>
									<tr>
										<td align="center">${visit.userid}</td>
										<td align="right">No.${visit.vbrdno}
											&nbsp;&nbsp;&nbsp;&nbsp; 작성일 ${visit.wrdate}</td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td>
						<div align="center">작성된 방명록이 없습니다.</div>
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>
<%@ include file="/bottom.jsp"%>