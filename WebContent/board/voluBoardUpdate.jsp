<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자원봉사 구해요!</title>
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
	if (func.vhour.value == "") {
		alert("봉사시간을 입력해 주세요.");
		return false;
	}
	return true;
}
</script>
</head>
<body>
<table border="1" width="1350" height="630">
		<tr>
			<td colspan="2" height="20%">
				<h3>${sessionScope.user.username}님 접속중:D</h3>
				<hr color="gray">
			</td>
		</tr>
		<tr>
			<td width="17%" height="80%">
				<table border="1" align="center" width="203" cellpadding="40">
				
				<!-- 페이지 왼편 서브메뉴(자원봉사, 펫 도우미) -->
				
					<tr>
						<td><a href="/gaenari/control?command=voluBoardList">자원 봉사</a></td>
					</tr>
					<tr>
						<td><a href="/gaenari/control?command=ptBoardList">펫 도우미</a></td>
					</tr>
				</table>
			</td>
			<td rowspan="2" width="83%" height="80%">
				<br><br>
				<form name="boardWriteForm" method="post" action="control"
		onSubmit='return checkValid()'>
		<input type=hidden name="command" value="voluBoardUpdate">

		<table align="center" cellpadding="5" cellspacing="2" width="600"
			border="1">

			<tr>
				<td width="1220" height="20" colspan="2">
					<p align="center">
						<font size="3"><b>게시글 수정</b></font>
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
							size="50" value="${requestScope.resultContent.title}"></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">작 성 내 용</span></b>
					</p>
				</td>
				<td width="200" height="20"><b><span
						style="font-size: 9pt;"> <textarea name="brdcontent" cols="60"
								rows="7">${requestScope.resultContent.brdcontent}</textarea></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size:9pt;">봉 사 시 간</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
				style="font-size: 9pt;"><input type="text" name="vhour" size="50" value="${requestScope.resultContent.vhour}">
				</span></b>
			</tr>
			<tr>
				<td width="450" height="20" colspan="2" align="center"><b><span
						style="font-size: 9pt;"> <input type=submit value=수정하기>
							<input type=reset value=다시쓰기></span></b></td>
			</tr>
		</table>
	<input type="hidden" name="vbrdno" value="${requestScope.resultContent.vbrdno}">
	</form>
				
	<div align=center>
		<span style="font-size: 9pt;"><a href="/gaenari/control?command=voluBoardList">
		<input type="submit" value="리스트로 돌아가기"></a></span>
	</div>
	</table>
</body>
</html>