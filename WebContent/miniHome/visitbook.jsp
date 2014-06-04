<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="model.dto.BoardDTO" %>
<%@ page import="model.dto.CommentDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="/frame.jsp" %>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

table#visitbook {
	float:left;
	left:;
}
table#visitbook2 {
	margin-left:20px;
	float:left;
	left:;
}
div#writer{
	background-color: #E9E9F7;
	
}
div#write{
	width:200px;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미니홈피 방명록</title>
</head>
<script src="/gaenari/dupcheck.js"></script>
<body>
<!-- 
작성자: 최성훈
작성일: 2014-04-21
작성내용: 메인페이지 이동할 때 url패턴으로 action 통해서 가도록 수정
		  상단의 방명록 작성란을 통해 방명록을 등록한다.
		  방명록이 등록되면 작성란 아래로 추가된다.
		  
수정: 2014-06-03, 최성훈	내용: 내가 방문객들에게 쓰는 포스트, 방문객이 남기는 방명록 포스트, 댓글기능 추가(진행중)
수정: 2014-06-03, 최성훈	내용: 출력오류수정, 댓글기능 구현완료
 -->
	<table border="0" width="35%" height="100%" id="visitbook">
		<c:if test="${requestScope.user.userid eq sessionScope.userid}">
		<tr>
			<td>
				<form action="/gaenari/writeVisit.do" method="post" id="myForm">
					<input type="hidden" name="hostid" value="${requestScope.user.userid}"><!-- 홈피주인 userid -->
					<div class="jumbotron" id="writer">
						<div class="col-lg-12">
							<div class="input-group">
								<small>방문객들에게 인사말 한 마디 해주세요</small>
								<textarea rows="2" cols="53" class="form-control" placeholder="글을 작성해주세요" name="content"></textarea>
							</div><p>
							<div align="right">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" onclick="mySubmit()">입력하기</button>
							</span>
							</div>
						</div>
					</div>
				</form>
			</td>
		</tr>
		</c:if>
		<%
			int midx=0;
			int mcnt=0;
			String mcount = null;
			List<ArrayList<CommentDTO>> mlist = ((List<ArrayList<CommentDTO>>)request.getAttribute("myComments"));
			ArrayList<BoardDTO> mclist = (ArrayList<BoardDTO>)request.getAttribute("myList");
		%>
		<c:choose>
			<c:when test="${not empty requestScope.myList}">
			
				<c:forEach items="${requestScope.myList}" var="visitList" varStatus="i">
				<c:set scope="request" var="mycount" value="${i.index}"/>
				<tr>
					<td>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<a href="/gaenari/miniHome.do?userid=${visitList.userid}">
										<img width="30" src="${visitList.title}" class="img-rounded"> ${visitList.userid}
									</a>님의 글 (${visitList.wrdate})
								</h3>
							</div>
							<div class="panel-body">${visitList.brdcontent}</div>
							<div class="panel-footer">
								<form method="post" action="/gaenari/reply.do">
									<input type="hidden" name="userid" value="${sessionScope.userid}"> 
									<input type="hidden" name="brdno" value="${visitList.brdno}">
									<input type="hidden" name="userno" value="${requestScope.user.userno}">
									<table width="100%">
										<tr>
											<td width="80%">
												<input type="text" class="form-control" name="brdcontent">
											</td>
											<td width="20%">
												<input class="btn btn-default" type="submit" value="입력">
											</td>
										</tr>
									</table>
								</form>
							</div>
							<!-- 댓글 forEach문 돌릴 곳 -->
							<%
								mcount = request.getAttribute("mycount").toString();
								mcnt = Integer.parseInt(mcount);
								request.setAttribute("mine", null);
								for(int i=0;i<mlist.size();i++){
									if(mclist.get(mcnt).getBrdno()==mlist.get(i).get(0).getPrmno()){
										request.setAttribute("mine", mlist.get(i));
									}
								}
							%>
							<c:if test="${not empty requestScope.mine}">
								<div class="panel-footer">
									<c:forEach items="${requestScope.mine}" var="mcomment">
										<small>${mcomment.userid} : ${mcomment.brdcontent} - ${mcomment.wrdate} ${mcomment.title}</small><p>
									</c:forEach>
								</div>
							</c:if>
						</div>
					</td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td>
						<div class="panel panel-success">
							<div class="panel-heading">
							</div>
							<div class="panel-body">작성된 글이 없습니다.</div>
						</div>
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<!-- 여기까진 내가 쓰는 곳 -->
	
	<!-- 방문객이 쓰는 곳 시작 -->
	<table border="0" width="35%" height="100%" id="visitbook2">
		<c:if test="${requestScope.user.userid ne sessionScope.userid}">
		<tr>
			<td>
				<form action="/gaenari/writeVisit.do" method="post" id="visitForm">
					<input type="hidden" name="hostid" value="${requestScope.user.userid}"><!-- 홈피주인 userid -->
					<div class="jumbotron" id="writer">
						<div class="col-lg-12">
							<div class="input-group">
								<small>${requestScope.user.userid}님에게 방명록을 남겨보세요</small>
								<textarea rows="2" cols="53" class="form-control" placeholder="방명록을 작성해주세요" name="content"></textarea>
							</div><p/>
							<div align="right">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" onclick="yourSubmit()">입력하기</button>
							</span>
							</div>
						</div>
					</div>
				</form>
			</td>
		</tr>
		</c:if>
			<%
			int idx=0;
			int cnt=0;
			String count = null;
			List<ArrayList<CommentDTO>> list = ((List<ArrayList<CommentDTO>>)request.getAttribute("yourComments"));
			ArrayList<BoardDTO> clist = (ArrayList<BoardDTO>)request.getAttribute("yourList");
			%>
		<c:choose>
			<c:when test="${not empty requestScope.yourList}">	
		
			<c:forEach items="${requestScope.yourList}" var="visitList" varStatus="i">	
				<c:set scope="request" var="count" value="${i.index}"/>
				<tr>
					<td>
						<div class="panel panel-success">
							<div class="panel-heading">
								<h3 class="panel-title">
									<a href="/gaenari/miniHome.do?userid=${visitList.userid}">
										<img width="30" src="${visitList.title}" class="img-rounded"> ${visitList.userid}
									</a>님의 글 (${visitList.wrdate})
								</h3>
							</div>
							<div class="panel-body">${visitList.brdcontent}</div>
							<div class="panel-footer">
								<form method="post" action="/gaenari/reply.do">
									<input type="hidden" name="userid" value="${sessionScope.userid}"> 
									<input type="hidden" name="brdno" value="${visitList.brdno}">
									<input type="hidden" name="userno" value="${requestScope.user.userno}">
									<table width="100%">
										<tr>
											<td width="80%">
												<input type="text" class="form-control" name="brdcontent">
											</td>
											<td width="20%">
												<input class="btn btn-default" type="submit" value="입력">
											</td>
										</tr>
									</table>
								</form>
							</div>
							<!-- 댓글 forEach문 돌릴 곳 -->
							<%
								count = request.getAttribute("count").toString();
								cnt = Integer.parseInt(count);
								request.setAttribute("yours", null);
								for(int i=0;i<list.size();i++){
									if(clist.get(cnt).getBrdno()==list.get(i).get(0).getPrmno()){
										request.setAttribute("yours", list.get(i));
									}
								}
							%>
							<c:if test="${not empty requestScope.yours}">
								<div class="panel-footer">
									<c:forEach items="${requestScope.yours}" var="ycomment">
										<small>[${ycomment.prmno}]${ycomment.userid}: ${ycomment.brdcontent} - ${ycomment.wrdate} ${ycomment.title}</small><p>
										<%-- <small>${ycomment.userid} : ${ycomment.brdcontent} - ${ycomment.wrdate} ${ycomment.title}</small><p> --%>
									</c:forEach>
								</div>
							</c:if>
						</div>
					</td>
				</tr>
			</c:forEach>
			</c:when>
			<c:otherwise> <!-- 게시글이 아예 없을 때 -->
				<tr>
					<td>
						<div class="panel panel-success">
							<div class="panel-heading"></div>
							<div class="panel-body">작성된 글이 없습니다.</div>
						</div>
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</body>
<script type="text/javascript">
function yourSubmit(){
	$("#visitForm").submit();
}
function mySubmit(){
	$("#myForm").submit();
}
</script>
</html>
<%@ include file="/bottom.jsp"%>