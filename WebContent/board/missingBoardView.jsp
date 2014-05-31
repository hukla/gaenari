<%@page import="model.dto.BoardDTO"%>
<%@ include file="/frame.jsp"%>
<%@ include file="menu.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width=950 cellpadding=0 cellspacing=0 align=center valign='top' border=0>
		<tr>
			<td>
				<img src='${picPath}' width='350' height='350' border='0' align='absmiddle'></a>
			</td>
			<td valign="top" width=520 align=center cellpadding=0 cellspacing=0>
			<table width=500 valign="top" cellpadding=0 cellspacing=0>
				<tr>
					<td valign=top>
					<span style='font-size: 18px; font-family: 돋움; line-height: 130%;'>
						<strong>${requestScope.resultContent.mname}를 찾습니다!</strong>
					</span>
					</td>
				</tr>
				<tr height="100"></tr>
				<tr>
					<td><p align="center"><font color="black"><b><span style="font-size:10pt;">이 름</span></b></font></p></td>
					<td><span style="font-size:9pt;"><b>${requestScope.resultContent.mname}</b></span></td>
				</tr>
				<tr>
					<td><p align="center"><font color="black"><b><span style="font-size:10pt;">나 이</span></b></font></p></td>
					<td><span style="font-size:9pt;"><b>${requestScope.resultContent.mage}</b></span></td>
				</tr>
				<tr>
					<td><p align="center"><font color="black"><b><span style="font-size:10pt;">종 류</span></b></font></p></td>
					<td><span style="font-size:9pt;"><b>${requestScope.resultContent.mkind}</b></span></td>
				</tr>
				<tr>
					<td><p align="center"><font color="black"><b><span style="font-size:10pt;">성 별</span></b></font></p></td>
					<td><span style="font-size:9pt;"><b>${requestScope.resultContent.mgender}</b></span></td>
				</tr>
				<tr>
					<td><p align="center"><font color="black"><b><span style="font-size:10pt;">연 락 처</span></b></font></p></td>
					<td><span style="font-size:9pt;"><b>${requestScope.resultContent.mcontact}</b></span></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>
<%@ include file="../bottom.jsp"%>