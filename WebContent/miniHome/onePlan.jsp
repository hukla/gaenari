<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ include file="/frame.jsp" %> --%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/gaenari/dupcheck.js"></script>
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
<title>미니홈피 일정 상세보기</title>

<!-- 
작성자: 최성훈
작성일: 2014-04-23
작성내용: 일정 제목의 링크를 클릭하여 일정의 상세보기가 가능하다.
		  메인페이지 이동할 때 url패턴으로 action 통해서 가도록 수정
		  우상단에 일정 전체보기 버튼,
		  하단에 수정하기 삭제하기 버튼
		  
수정: 최성훈
수정일: 2014-05-14
내용: 이전 글, 다음 글 보기 기능 추가

수정: 최성훈
수정일: 2014-05-21
내용: 이전 글, 다음 글 보기 기능 오류 수정완료(전체 리스트에서 index로 이동하도록 수정)

수정: 최성훈
수정일: 2014-05-22
내용: 글 삭제기능 javascript 추가

수정: 최성훈
수정일: 2014-05-27
수정내용: 	내 홈피, 친구홈피 방문의 경우를 나누기 위해 a태그 접근시 꼭
			requestScope의 userid를 지니고 가게함.
			
			친구홈피에 방문하는 경우, 수정, 삭제 기능을 이용하지 못 하도록 함.
			
			일기 수정중에 미니홈페이지 메뉴기능 이용이 불가능 했던 오류 수정
 -->
</head>
<script type="text/javascript">
	function deletePlan(brdno){
		if(confirm("삭제하시겠습니까?")){
			alert("삭제되었습니다.");
			location.href="/gaenari/deletePlan.do?brdno="+brdno;
		}else{
			return;
		}
	}
</script>
<body>
	<div class="panel panel-default" id="panel">
		<div class="panel-heading">
			<table width="100%">
				<tr>
					<td width="80%"><h3 class="panel-title">제목:
							${requestScope.onePlan.title} <font color="blue" size="2">[${requestScope.dog.dogname} - ${requestScope.type}]</font></h3></td>
					<td width="20%" align="right">${requestScope.onePlan.wrdate}
						<c:if test="${requestScope.onePlan.wrdate eq sessionScope.today}">
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
						<div class="alert alert-warning" id="alert">
							<font size="3">${requestScope.onePlan.wrdate}&nbsp;&nbsp;&nbsp;${requestScope.onePlan.ploc}에서의 일정</font> 
						</div>
					</td>
					<c:if test="${requestScope.dog != null}">
						<td rowspan="2" width="40%">
							<img src="${requestScope.dog.dogimg}" width="300"><br>
							<h3 align="center">${requestScope.dog.dogname}(이)의 일정입니다.</h3> 
						</td>
					</c:if>
				</tr>
				<tr>
					<td style="text-align: left; vertical-align: top;">
						${requestScope.onePlan.brdcontent}
					</td>
				</tr>
				<tr>
					<td>
					<c:if test="${requestScope.user.userid == sessionScope.userid}">
						<c:choose>
							<c:when test="${requestScope.onePlan.flag == 0}">
								일정을 마치셨습니까? <button class="btn btn-default" id="plncheck" name="${requestScope.onePlan.brdno}">확인</button>
							</c:when>
							<c:otherwise>
								완료된 일정입니다.
							</c:otherwise>
						</c:choose>
					</c:if>
					</td>
				</tr>
			</table>
		</div>
		<div class="panel-footer" id="panel-footer">
			<table width="100%">
				<tr>
					<td align="center" height="20">
					<!-- 14-05-14 성훈 추가: 이전 글, 다음 글 보기 -->
					<!-- 14-05-16 01:03 성훈추가 이전글,다음글 해결하고싶다 -->
					<!-- 14-05-21 성훈 수정: 이전 글, 다음 글 index로 이동, 수정, 삭제추가 -->
					<ul class="pager">
						<li><a href="/gaenari/planDetail.do?index=${requestScope.index +1}&userid=${requestScope.user.userid}">Previous</a></li>
						<c:if test="${requestScope.user.userid eq sessionScope.userid }">
							<li><a href="/gaenari/updateFormPlan.do?brdno=${requestScope.onePlan.brdno}&userid=${requestScope.user.userid}">수정하기</a></li>
							<li><a href="#" onclick="deletePlan('${requestScope.onePlan.brdno}')">삭제하기</a></li>
						</c:if>
						<li><a href="/gaenari/planDetail.do?index=${requestScope.index -1}&userid=${requestScope.user.userid}">Next</a></li>
					</ul>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
<%-- <%@ include file="/bottom.jsp"%> --%>