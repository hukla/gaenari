<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ include file="/frame.jsp" %> --%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
div#panel {
float: left;
margin-left:20px;
width: 800px;	
}
div#alert{
width:460px;
height:50px;
}

</style>
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
	function deleteDiary(brdno){
		if(confirm("삭제하시겠습니까?")){
			alert("삭제되었습니다.");
			location.href="/gaenari/deleteDiary.do?brdno="+brdno;
		}else{
			return;
		}
	}
</script>
<body>
<div id="tb">
	<div class="panel panel-default" id="panel" style="width: 97%">
		<div class="panel-heading">
			<table width="100%">
				<tr>
					<td width="70%"><h3 class="panel-title">제목:
							${requestScope.oneDiary.title}</h3></td>
					<td width="30%" align="right">${requestScope.oneDiary.wrdate}
						<c:if test="${requestScope.oneDiary.wrdate eq sessionScope.today}">
							<font color="blue">[오늘입니다]</font>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
		<div class="panel-body">
			<table width="100%">
				<tr>
					<td width="60%" height="50">
						<div class="alert alert-success" id="alert">
							<font size="3">${requestScope.oneDiary.wrdate}&nbsp;&nbsp;&nbsp;${requestScope.user.userid}님의 기분 : <img src="${requestScope.oneDiary.mood}" height="18px"> </font> 
						</div>
					</td>
					<c:if test="${requestScope.oneDiaryImg != null}">
						<td rowspan="2" width="40%" style="vertical-align: top;">
							<img src="${requestScope.oneDiaryImg}" width="300">
						</td>
					</c:if>
				</tr>
				<tr>
					<td style="text-align: left; vertical-align: top;">
						${requestScope.oneDiary.brdcontent}
					</td>
				</tr>
			</table>
		</div>
		<div class="panel-footer">
			<table width="100%">
				<tr>
					<td align="center" height="40">
						<ul class="pager">
							<li><a href="/gaenari/diaryDetail.do?index=${requestScope.index -1}&userid=${requestScope.user.userid}">Previous</a></li>
							<c:if test="${requestScope.user.userid eq sessionScope.userid }">
								<li><a href="/gaenari/updateFormDiary.do?brdno=${requestScope.oneDiary.brdno}&userid=${requestScope.user.userid}">수정하기</a></li>
								<li><a href="#" onclick="deleteDiary('${requestScope.oneDiary.brdno}')">삭제하기</a></li>
							</c:if>
							<li><a href="/gaenari/diaryDetail.do?index=${requestScope.index +1}&userid=${requestScope.user.userid}">Next</a></li>
						</ul>
					</td>
				</tr>
			</table>
		</div>
	</div>
	</div>
</body>
</html>
<%-- <%@ include file="/bottom.jsp"%> --%>