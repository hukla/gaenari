<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미니홈피 일기 수정하기</title>
<!-- 
작성자: 최성훈
작성일: 2014-05-21
작성내용: 일기 수정하기

수정: 2014-05-27, 최성훈	내용: 일기 수정중에 미니홈페이지 메뉴기능 이용이 불가능 했던 오류 수정
 -->
</head>
<body>
	<div id="tb">
	<table border="0" width="100%" height="100%" class="table">
		<tr>
			<td width="100%" align="center">
				<div class="row">
  				<div class="col-lg-15 col-lg-10">
    				<div class="thumbnail" style="width: 500px">
				<form action="/gaenari/updateDiary.do" method="post" enctype="multipart/form-data">
					<table border="0" class="table" width="100%" height="380" style="border:hidden; table-layout: fixed;">
						<colgroup>
							<col width="20%"><col width="80%">
						</colgroup>
						<tr>
							<td colspan="2"><h2>작성날짜 <small>${requestScope.oneDiary.wrdate}</small></h2></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;제목 : </td>
							<td>
								<input type="text" size="33" class="form-control" name="title" value="${requestScope.oneDiary.title}">
							</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;&nbsp;기분 : 
							<input type="radio" name="mood" value="/gaenari/image/joyful.png">&nbsp;<img src="/gaenari/image/joyful.png" height="17px">
							&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="radio" name="mood" value="/gaenari/image/love.png">&nbsp;<img src="/gaenari/image/love.png" height="15px">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="mood" value="/gaenari/image/angry.png">&nbsp;<img src="/gaenari/image/angry.png" height="17px">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="mood" value="/gaenari/image/sick.png">&nbsp;<img src="/gaenari/image/sick.png" height="17px">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="mood" value="/gaenari/image/thinking.png">&nbsp;<img src="/gaenari/image/thinking.png" height="17px"> 
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<textarea rows="5" cols="50" name="brdcontent" class="form-control" rows="3">${requestScope.brdcontent}</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2">
  								<input type="file" name="uploadFile" value="${requestScope.diaryImg}">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div align="center">
									<input type="hidden" name="brdno" value="${requestScope.oneDiary.brdno}"> 
									<input type="hidden" name="userid" value="${requestScope.user.userid}"> 
									<input type="submit" class="btn btn-success" value="수정하기"> 
									&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="reset" class="btn btn-default" value="취소하기"> 
									&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="button" class="btn btn-default" onclick="history.back()" value="뒤로가기">
								</div>
							</td>
						</tr>
					</table>
				</form>
				</div>
				</div>
				</div>
			</td>
		</tr>
	</table>
	</div>
</body>
<script type="text/javascript">
	var resultMood = "${requestScope.oneDiary.mood}";
	var mood = document.getElementsByName("mood");
	for (var i = 0; i < mood.length; i++) {
		if (mood[i].value == resultMood) {
			mood[i].checked = true;
		}
	}
</script>
</html>