<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
								<textarea rows="2" cols="53" class="form-control" placeholder="글을 작성해주세요" name="content" id="content"></textarea>
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
		<c:choose>
			<c:when test="${not empty requestScope.myList}">
				<c:forEach items="${requestScope.myList}" var="visitList">
				<tr>
					<td>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<a href="/gaenari/miniHome.do?userid=${visitList.userid}">
										<img width="30" src="${visitList.title}" class="img-rounded"> ${visitList.userid}
									</a>님의 글
								</h3>
							</div>
							<div class="panel-body">${visitList.brdcontent}</div>
							<div class="panel-footer">
								<div class="row">
									<div class="col-lg-12">
										<div class="input-group" align="right">
											<input type="hidden" id="getid" name="userid" value="${sessionScope.userid}"> 
											<input type="hidden" id="brdno" name="brdno" value="${visitList.brdno}">
											<input type="text" class="form-control" name="reply">
											<span class="input-group-btn">
												<button class="btn btn-default" type="button">입력</button>
											</span> 
										</div>
									</div>
								</div>
							</div>
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
	<!-- 내가 쓰는 곳 -->
	
	
	<!-- 방문객이 쓰는 곳 -->
	<table border="0" width="35%" height="100%" id="visitbook2">
		<c:if test="${requestScope.user.userid ne sessionScope.userid}">
		<tr>
			<td>
				<form action="/gaenari/writeVisit.do" method="post" id="visitForm">
					<input type="hidden" name="hostid" value="${requestScope.user.userid}"><!-- 홈피주인 userid -->
					<div class="jumbotron" id="writer">
						<div class="col-lg-12">
							<div class="input-group">
								<small>${requstScope.user.userid}님에게 방명록을 남겨보세요</small>
								<textarea rows="2" cols="53" class="form-control" placeholder="방명록을 작성해주세요" name="content" id="content"></textarea>
							</div><p>
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
		<c:choose>
			<c:when test="${not empty requestScope.yourList}">
			<c:forEach items="${requestScope.yourList}" var="visitList" varStatus="i">	
				<tr>
					<td>
						<form id="replyForm" method="post" action="/gaenari/reply.do">
						<div class="panel panel-success">
							<div class="panel-heading">
								<h3 class="panel-title">
									<a href="/gaenari/miniHome.do?userid=${visitList.userid}">
										<img width="30" src="${visitList.title}" class="img-rounded"> ${visitList.userid}
									</a>님의 글
								</h3>
							</div>
							<div class="panel-body">${visitList.brdcontent}</div>
							<div class="panel-footer">
								<div class="row">
									<div class="col-lg-12">
										<div class="input-group" align="right">
											<input type="hidden" id="getid" name="userid" value="${sessionScope.userid}"> 
											<input type="hidden" id="brdno" name="brdno" value="${visitList.brdno}">
											<input type="text" class="form-control" name="content">
											<input class="btn btn-default" type="submit" value="입력">
											<%-- <span class="input-group-btn">
												<button class="btn btn-default" type="button" onclick="doSubmit(${i.count})">입력</button>
											</span>  --%>
										</div>
									</div>
								</div>
								<c:if test="">
								
								
								</c:if>
							</div>
						</div>
						</form>
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
	<!-- <form action="/gaenari/reply.do" id="replyForm" method="post"> -->
	<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">Modal title</h4>
				</div>
				<div class="modal-body"><textarea rows="2" class="form-control" name="content" id="reply"></textarea></div>
				<div class="modal-footer">
					<input type="hidden" name="" value="">
					<button type="button" class="btn btn-success" id="modalclick">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>/.modal-content
		</div>/.modal-dialog
	</div>/.modal -->
	<!-- </form> -->
</body>
<script type="text/javascript">
function yourSubmit(){
	$("#visitForm").submit();

}
function mySubmit(){
	$("#myForm").submit();

}
/* function doSubmit(){
	$("#replyForm").submit();
	$("#replyForm").submit();
	
} */
/* function sendingUpdate() {
	document.secondForm.command.value = "updateFormDiary";
	document.secondForm.brdno = brdno;
	document.secondForm.submit();
}

$("#reply").click(function(){
	$("#replyForm").submit();
}) */
/* 
$("#reply").each(function(){
	$(this).click(function(){
		$.ajax({
			url:"/gaenari/reply.do",
			dataType: "text",
			data: $("#replyForm").serialize(),
			success: function (data){
				if(data>0){
					alert("전달되었습니다.");
				}else{
					alert("전달에 실패했습니다.");
				}
			},
			error: function (data){alert(data+'=>에러발생');}
		});
	})
}) */
/* 
function modalSubmit(){
	$('#myModal').modal('hide');
	$("#replyForm").submit();

} */
</script>
</html>
<%@ include file="/bottom.jsp"%>