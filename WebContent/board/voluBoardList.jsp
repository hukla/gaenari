<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="model.dao.UserDAO"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/static/pages/head.jsp"%>
        <script src="/gaenari/board/scripts/mboard.js"></script>
	</head>
	<body>
		<div id="wrapper">
            <%@ include file="/static/pages/header.jsp"%>
            <div id="content">
                <%@ include file="/static/pages/menubar.jsp"%>
                <div class="container">
                    <!--TODO-->
                    <div id="ptboard-list-container">
                        <div class="ptboard-list-header">
                            <div class="ptboard-info">
                                <div class="ptboard-info-title">자원봉사</div>
                                <div class="ptboard-info-description">유기견 보호센터에 도움의 손길을 주세요!</div>
                            </div>
                            <div class="ptboard-options-wrapper">
                                <a class="btn btn-yellow write-btn" href="/gaenari/board/voluBoardWrite.jsp" onclick="return checkUser()">글쓰기</a>
                            </div>
                        </div>
					<table class="table ptboard-list">
						<tr>
							<td class="ptboard-list-head ptboard-loc">봉사장소</td>
                            <td class="ptboard-list-head ptboard-title">제목</td>
                            <td class="ptboard-list-head ptboard-time">봉사날짜</td>
                            <td class="ptboard-list-head ptboard-cntr" style="width:100px;">센터명</td>
                            <td class="ptboard-list-head ptboard-writer">작성</td>
                        </tr>
                        <!-- 글 레코드 시작 -->
                        <c:choose>
    						<c:when test="${not empty requestScope.tenVolu}">
							<c:forEach items="${requestScope.tenVolu}" var="volu" varStatus="status">
								    <tr>
								    	<td class="ptboard-loc">
                                            <div class="ptboard-loc-content">${requestScope.centerLoc[status.index]}</div>
                                        </td>
								    	<td class="ptboard-title">
                                        	<a class="ptboard-title-content" href="/gaenari/control?command=voluBoardView&vbrdno=${volu.vbrdno}">
                                                ${volu.title}</a>
                                        </td>
                                        <td class="ptboard-time">
                                        	<div class="ptboard-time-content">
                                                	<c:choose>
	                                                	<c:when test="${fn:contains(volu.vhour, '!split!')}">
		                                                	<c:set var="workdate" value="${fn:split(volu.vhour, '!split!')}" />
		                                                	${workdate[0]}
	                                                	</c:when>
	                                                	<c:otherwise>
	                                                	${volu.vhour}
	                                                	</c:otherwise>
	                                               	</c:choose>
                                        	</div>
                                        </td>
                                        <td class="ptboard-cntr" style="width:100px;" align="center">
                                                <div class="ptboard-loc-content">${requestScope.center[status.index]}</div>
                                        </td>
                                        <td class="ptboard-writer">
                                                <div class="ptboard-writer-author">${volu.userid}</div>
                                                <div class="ptboard-writer-date">${volu.wrdate}</div>
                                        </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="5" style="text-align:center;font-size:15px;font-weight:bold;color:gray;">등록된 자원봉사가 없습니다.</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                            <!-- 글 레코드 끝 -->
						    <tr>
                               <td colspan="5" class="ptboard-list-pages">
                                    <c:choose>
                                        <c:when test="${not empty requestScope.pageCount}">
                                            <ul class="pagination">
                                                <c:choose>
                                                    <c:when test="${requestScope.pageNumber-1 > 0}">
                                                        <li><a href="control?command=voluBoardList&pageNumber=${requestScope.pageNumber-1}">«</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li><a href="#">«</a></li>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:forEach begin="1" end="${requestScope.pageCount}" var="cnt">
                                                    <c:choose>
                                                        <c:when test="${cnt eq requestScope.pageNumber}">
                                                            <li class="active">
                                                                <a href="control?command=voluBoardList&pageNumber=${cnt}">
                                                                ${cnt}<span class="sr-only">(current)</span>
                                                                </a>
                                                            </li>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li><a href="control?command=voluBoardList&pageNumber=${cnt}">${cnt}</a></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                                <c:choose>
                                                    <c:when test="${requestScope.pageNumber+1 < requestScope.pageCount+1}">
                                                        <li><a href="control?command=voluBoardList&pageNumber=${requestScope.pageNumber+1}">»</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li><a href="#">»</a></li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </ul>
                                        </c:when>
                                    </c:choose>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!--TODO-->
            </div>
        </div>
        <%@ include file="/static/pages/footer.jsp"%>
        </div>
    </body>
<script language="javascript">
function checkUser(){
	if(<%=UserDAO.logCheck((String)session.getAttribute("userid")).getUsertype()%>!=0){
		return true;
    }else{
		alert('센터 회원만 글 작성이 가능합니다.');
		return false;
	}
}

</script>
</html>