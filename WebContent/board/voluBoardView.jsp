<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.dto.VoluBoardDTO" %>
<%@ include file="/frame.jsp"%>
<%@ include file="menu2.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자원봉사 구해요!</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<SCRIPT language=javascript>
function send(){
	if(document.requestForm.command.value!="") return true;
	else return false;
}
function voluDelete(){
	if(confirm("삭제하시겠습니까?")){
		alert("삭제되었습니다.");
		/* document.requestForm.command.value="voluBoardDelete";
		var no = document.requestForm.vbrdno;
		alert(no); */
		
		window.location.href("/gaenari/control?command=voluBoardDelete");
	}else{
		alert("뀨?");
		return;
	}
}
 </script>
</head>
<body>
				<table align="center" border="1" cellpadding="5" cellspacing="2" width="80%">
					<tr>
						<td>
							<p align="center"><font color="black"><b><span style="font-size:10pt;">제 목</span></b></font></p>
						</td>
						<td>
							<span style="font-size:9pt;"><b>${requestScope.resultContent.title}</b></span>
						</td>
					</tr>
					<tr>
						<td>
							<p align="center"><font color="black"><b><span style="font-size:9pt;">작 성 자</span></b></font></p>
						</td>
						<td>
							<span style="font-size:9pt;"><b>${requestScope.resultContent.userid }</b></span>
							<input type="hidden" id="boardWriter" value="${requestScope.resultContent.userid}"/>
						</td>
					</tr>
					<tr>
						<td>
							<p align="center"><font color="black"><b><span style="font-size:9pt;">작 성 시 간</span></b></font></p>
						</td>
						<td>
							<span style="font-size:9pt;"><b>${requestScope.resultContent.wrdate}</b></span>
						</td>
					</tr>
					<tr>
						<td>
							<p align="center"><font color="black"><b><span style="font-size:9pt;">작 성 내 용</span></b></font></p>
						</td>
						<td>
							<span style="font-size:9pt;"><b>${requestScope.resultContent.brdcontent}</b></span>
						</td>
					</tr>
					<tr>
						<td>
							<p align="center"><font color="black"><b><span style="font-size:9pt;">봉 사 시 간</span></b></font></p>
						</td>
						<td>
							<span style="font-size:9pt;"><b>${requestScope.resultContent.vhour}</b></span>
						</td>
					</tr>
					<tr>
						<td height="20" colspan="4" align="center" valign="middle">
				<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
						<form name="requestForm" method=post action="control" onsubmit="return send()">
							<input type=hidden name="vbrdno" value="${requestScope.resultContent.vbrdno}">
							<input type=hidden name="command" value="voluBoardUpdateForm">
							<input type=hidden name="user" value="<%=session.getAttribute("userid")%>">
							<input type=hidden name="writer" value="${requestScope.resultContent.userid}">
							<input type=submit value="수정하기">
							<input type=button value="삭제하기" onClick="voluDelete()">
					</form>
				</table>
				<div align=center><span style="font-size:9pt;"><a href="/gaenari/control?command=voluBoardList"><input type="submit" value="목록으로"></a></span></div>
			</td>
		</tr>
	</table>
</body>
</html>
<%@ include file="../bottom.jsp"%>