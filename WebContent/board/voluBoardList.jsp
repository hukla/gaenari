<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="frame.jsp"%>
<%@ include file="menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자원봉사 구해요/할래요!</title>

</head>
<body>
	<table align="center" border="1" cellpadding="5" cellspacing="2" width="100%">
					<tr>
						<td>
							<p align="center"><font color="black"><b><span style="font-size:10pt;">글번호</span></b></font></p>
						</td>
						<td>
							<p align="center"><font color="black"><b><span style="font-size:10pt;">제 목</span></b></font></p>
						</td>
						<td>
							<p align="center"><font color="black"><b><span style="font-size:9pt;">작 성 자</span></b></font></p>
						</td>
						<td>
							<p align="center"><font color="black"><b><span style="font-size:9pt;">작 성 일</span></b></font></p>
						</td>
					</tr>
							<c:forEach items="${requestScope.voluBoardList}" var="volu">
								    <tr>
								    	<td><p align="center">${volu.vbrdno}</p></td>
								        <td bgcolor="">
											<p><span style="font-size:9pt;">
											<a href="/gaenari/control?command=voluBoardView&vbrdno=${volu.vbrdno}">
											${volu.title}</a></span></p>
								        </td>
								        <td bgcolor="">
								            <p align="center"><span style="font-size:9pt;">
											${volu.userid}</span></p>
								        </td>
								        <td bgcolor="">
								            <p align="center"><span style="font-size:9pt;">
								            ${volu.wrdate}</span></p>
								        </td>
								    </tr>
						    </c:forEach>
					</table>
					<span style="font-size:9pt;"><a href="/gaenari/board/voluBoardWrite.jsp"><input type="hidden" value=${id} name="id"><input type=submit value=글쓰기></a></span></div>

</body>
</html>
<%@ include file="bottom.jsp"%>