<%@page import="model.dto.BoardDTO"%>
<%@ include file="/frame.jsp"%>
<%@ include file="menu1.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>유기견 입양 게시판</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<SCRIPT language=javascript>
	function checkValid() {
		var func = window.document.boardWriteForm; // 제목과 글 내용이 비면 넘어가지 않도록 하는 함수
		if (func.userid.value == "") {
			alert("세션이 종료되었습니다. 다시 로그인해주세요.");
			location.href="/gaenari/login.do";
		}
		if (func.title.value == "") {
			alert("제목을 입력해 주세요.");
			return false;
		}
		if (func.brdcontent.value == "") {
			alert("글 내용을 입력해 주세요.");
			return false;
		}
		return true;
	}
</SCRIPT>
</head>
<body>
		<form name="boardWriteForm" method="post" action="adpBoardWrite.do"
		 enctype="multipart/form-data" onSubmit='return checkValid()'>

		<input type="hidden" name="command" value="adpBoardWrite">

		<table align="center" cellpadding="5" cellspacing="2" width="600"
			border="1">

			<tr>
				<td width="1220" height="20" colspan="2">
					<p align="center">
						<font size="3"><b>유기견 입양 게시판 글작성</b></font>
					</p>
				</td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">작성자</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type="text" name="userid"
							size="30" value="${sessionScope.user.userid}" disabled="disabled">
					</span></b></td>
					
			</tr>
			<tr>
				<td width="450" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">제 목</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=text name="title"
							size="50"></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">내 용</span></b>
					</p>
				</td>
				<td width="200" height="20"><b><span
						style="font-size: 9pt;"> <textarea name="brdcontent" cols="60"
								rows="7"></textarea></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">사 진 첨 부</span></b>
					</p>
				</td>
				<td width="200" height="20"><b><span
						style="font-size: 9pt;"> <input type="file" name="uploadFile" size="29" value="사진 업로드"><br/>
						</span></b></td>
			</tr>
			<tr>
				<td width="450" height="20" colspan="2" align="center"><b><span
						style="font-size: 9pt;"> <input type=submit value=글쓰기>
							<input type=reset value=다시쓰기></span></b></td>
			</tr>
		</table>

	</form>

	<div align=center>
		<span style="font-size: 9pt;"><a href="/gaenari/adpBoardMain.do">
		<input type="submit" value="리스트로 돌아가기"></a></span>
	</div>
</body>
</html>
<%@ include file="../bottom.jsp"%>