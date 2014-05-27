<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../frame.jsp" %>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미니홈피 일기 상세보기</title>
<!-- 
작성자: 최성훈
작성일: 2014-04-23
작성내용: 일기 제목의 링크를 클릭하여 일기의 상세보기가 가능하다.
		  메인페이지 이동할 때 url패턴으로 action 통해서 가도록 수정
		  우상단에 일기 전체보기 버튼,
		  하단에 수정하기 삭제하기 버튼
		  
수정: 최성훈
수정일: 2014-05-14
내용: 이전 글, 다음 글 보기 기능 추가

수정: 최성훈
수정일: 2014-05-21
내용: 이전 글, 다음 글 보기 기능 오류 수정완료(전체 리스트에서 index로 이동하도록 수정)

수정: 최성훈
수정일: 2014-05-22
내용: 상세보기에서의 수정, 삭제 기능 javascript추가

수정: 최성훈
수정일: 2014-05-27
수정내용: 	내 홈피, 친구홈피 방문의 경우를 나누기 위해 a태그 접근시 꼭
			requestScope의 userid를 지니고 가게함.
			
			친구홈피에 방문하는 경우, 수정, 삭제 기능을 이용하지 못 하도록 함.
			
			일기 수정중에 미니홈페이지 메뉴기능 이용이 불가능 했던 오류 수정
 -->
</head>
<script type="text/javascript">
	function deleteCheck(){
		if(confirm("삭제하시겠습니까?")){
			document.requestForm.command.value="deleteDiary";
			document.requestForm.brdno=brdno;
			document.requestForm.submit();
		}else{
			document.requestForm.command.value="diaryDetail";
			document.requestForm.brdno=brdno;
			document.requestForm.submit();
		}
	}
</script>
<body>
	<table border="0" width="80%" height="480">
		<tr>
			<td>
				<table border="1" align="center" height="100%">
					<tr>
						<td align="center" height="7%" width="110">작성날짜</td>
						<td width="450" align="center">
							<div align="center">
								${requestScope.oneDiary.wrdate}
								<c:if
									test="${requestScope.oneDiary.wrdate eq sessionScope.today}">
									<font color="blue">[오늘입니다]</font>
								</c:if>
							</div>
						</td>
						<c:if test="${requestScope.oneDiaryImg != null}">
							<td rowspan="5" width="450">
								<div align="center">
									<img src="${requestScope.oneDiaryImg}" width="400">
								</div>
							</td>
						</c:if>
					</tr>
					<tr>
						<td align="center" height="7%">제목</td>
						<td>
							<div align="center">${requestScope.oneDiary.title}</div>
						</td>
					</tr>
					<tr>
						<td align="center" height="7%">기분</td>
						<td>
							<div align="center">${requestScope.oneDiary.mood}</div>
						</td>
					</tr>
					<tr>
						<!-- 14-05-13 성훈 수정 경우에 따라 사진 넣고 말고 하기 -->
						<td align="center" height="20%">내용</td>
						<td style="text-align: left; vertical-align: top;">
							${requestScope.oneDiary.brdcontent}</td>
					</tr>
					<tr>
						<!-- 14-05-14 성훈 추가: 이전 글, 다음 글 보기 -->
						<!-- 14-05-21 성훈 수정: 이전 글, 다음 글 index로 이동, 수정, 삭제하기 기능 -->
						<td align="center" colspan="2" height="7%">
							<form action="/gaenari/control" method="post" name="requestForm">
								<input type="button" onclick="location.href='/gaenari/control?command=diaryDetail&index=${requestScope.index - 1}&userid=${requestScope.user.userid}'" value="이전 글"> 
								&nbsp;&nbsp;&nbsp;&nbsp; 
								<c:if test="${requestScope.user.userid eq sessionScope.userid }">
									<input type="button" onclick="location.href='/gaenari/control?command=updateFormDiary&brdno=${requestScope.oneDiary.brdno}&userid=${requestScope.user.userid}'" value="수정하기">
									&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="hidden" name="command" value="">
									<input type="hidden" name="brdno" value="${requestScope.oneDiary.brdno}"> 
									<input type="submit" onclick="javascript:deleteCheck();" value="삭제하기">
									&nbsp;&nbsp;&nbsp;&nbsp; 
								</c:if>
								<input type="button" onclick="location.href='/gaenari/control?command=diaryDetail&index=${requestScope.index + 1}&userid=${requestScope.user.userid}'" value="다음 글">
							</form>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
<%@ include file="../bottom.jsp"%>