<%@page import="model.dto.BoardDTO"%>
<%@ include file="/frame.jsp"%>
<%@ include file="menu1.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유기견 제보 게시판</title>
</head>
<body>
	<table width=950 cellpadding=0 cellspacing=0 align=center valign='top' border=0>
		<tr>
			<td>
				<img src='image/board/${requestScope.resultContent.brdno}.jpg' width='350' height='350' border='0' align='absmiddle'></a>
			</td>
			<td valign="top" width=520 align=center cellpadding=0 cellspacing=0>
			<table width=500 valign="top" cellpadding=0 cellspacing=0>
				<tr>
					<td><p align="center"><font color="black"><b><span style="font-size:10pt;">발 견 장 소</span></b></font></p></td>
					<td><span style="font-size:9pt;"><b>${requestScope.resultContent.floc}</b></span></td>
				</tr>
				<tr>
					<td><p align="center"><font color="black"><b><span style="font-size:10pt;">제 목</span></b></font></p></td>
					<td><span style="font-size:9pt;"><b>${requestScope.resultContent.title}</b></span></td>
				</tr>
				<tr>
					<td><p align="center"><font color="black"><b><span style="font-size:10pt;">내 용</span></b></font></p></td>
					<td><span style="font-size:9pt;"><b>${requestScope.resultContent.brdcontent}</b></span></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>
<%@ include file="../bottom.jsp"%>