<%@page import="model.dto.BoardDTO"%>
<%@page import="model.dto.PtBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/frame.jsp"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<SCRIPT language=javascript>
	function checkValid() {
		var func = window.document.boardWriteForm; // 제목과 글 내용이 비면 넘어가지 않도록 하는 함수
		if (func.title.value == "") {
			alert("제목을 입력해 주세요.");
			return false;
		}
		if (func.brdcontent.value == "") {
			alert("글 내용을 입력해 주세요.");
			return false;
		}
		if (func.worktype.value == "") {
			alert("작업종류를 입력해 주세요.");
			return false;
		}
		if (func.workloc.value == "") {
			alert("작업장소를 입력해 주세요.");
			return false;
		}
		if (func.workhour.value == "") {
			alert("작업시간을 입력해 주세요.");
			return false;
		}
		return true;
	}
</SCRIPT>
</head>
<body>
			<form name="boardWriteForm" method="post" action="../control?command=ptBoardWrite"
		onSubmit='return checkValid()'>

		<input type="hidden" name="command" value="ptBoardWrite">

		<table align="center" cellpadding="5" cellspacing="2" width="600"
			border="1">

			<tr>
				<td width="1220" height="20" colspan="2">
					<p align="center">
						<font size="3"><b>게시글 작성</b></font>
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
						<b><span style="font-size:9pt;">작업종류</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
				style="font-size: 9pt;"><input type="radio" name="worktype" value="산책" checked>산책
				<input type="radio" name="worktype" value="목욕">목욕
				<input type="radio" name="worktype" value="위탁">위탁
				</span></b>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size:9pt;">장소</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
				style="font-size: 9pt;">
				<select name="workloc">
					<option value="광진구">광진구</option>
					<option value="동대문구">동대문구</option>
					<option value="중랑구">중랑구</option>
					<option value="용산구">용산구</option>
					<option value="성동구">성동구</option>
					<option value="강북구">강북구</option>
					<option value="도봉구">도봉구</option>
					<option value="노원구">노원구</option>
					<option value="은평구">은평구</option>
					<option value="서대문구">서대문구</option>
					<option value="마포구">마포구</option>
					<option value="양천구">양천구</option>
					<option value="강서구">강서구</option>
					<option value="구로구">구로구</option>
					<option value="금천구">금천구</option>
					<option value="영등포구">영등포구</option>
					<option value="동작구">동작구</option>
					<option value="관악구">관악구</option>
					<option value="서초구">서초구</option>
					<option value="강남구">강남구</option>
					<option value="송파구">송파구</option>
					<option value="강동구">강동구</option>
					<option value="종로구">종로구</option>
					<option value="중구">중구</option>
					<option value="성북구">성북구</option>				
				</select>
				</span></b>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size:9pt;">작업시간</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
				style="font-size: 9pt;"><input type="datetime" name="workhour">
				<input type="time" name="workhour2">
				</span></b>
			</tr>
			<tr>
				<td width="450" height="20" colspan="2" align="center"><b><span
						style="font-size: 9pt;"> <input type=submit value=글쓰기>
							<input type=reset value=다시쓰기></span></b></td>
			</tr>
		</table>

	</form>

	<div align=center>
		<span style="font-size: 9pt;"><a href="/gaenari/control?command=ptBoardList">
		<input type="submit" value="리스트로 돌아가기"></a></span>
	</div>
	</table>
</body>
</html>
<%@ include file="../bottom.jsp"%>