<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                                <div class="ptboard-info-title">펫 도우미</div>
                                <div class="ptboard-info-description">도움이 필요한 애견인들이 여기있어요.</div>
                            </div>
                            <div class="ptboard-options-wrapper">
                                <a class="btn btn-yellow write-btn" href="/gaenari/board/missingBoardWrite.jsp">글쓰기</a>
                            </div>
                        </div>
                        <table class="table ptboard-list">
                            <tr>
                                <td class="ptboard-list-head ptboard-type">종류</td>
                                <td class="ptboard-list-head ptboard-title">제목</td>
                                <td class="ptboard-list-head ptboard-time">도움 시간</td>
                                <td class="ptboard-list-head ptboard-loc">지역</td>
                                <td class="ptboard-list-head ptboard-writer">작성</td>
                            </tr>
                            <!-- 글 레코드 시작 -->
                            <c:choose>
                                <c:when test="${not empty requestScope.tenPt}">
                                    <c:forEach items="${requestScope.tenPt}" var="pt">
                                        <tr>
                                            <td class="ptboard-type">
                                                <c:choose>
                                                    <c:when test="${pt.worktype == '목욕'}">
                                                        <img src="/gaenari/static/images/bath-icon.png"/>
                                                    </c:when>
                                                    <c:when test="${pt.worktype == '산책'}">
                                                        <img src="/gaenari/static/images/dog-walk-icon.png"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="/gaenari/static/images/pet-sitting-icon.png"/>
                                                    </c:otherwise>
                                                </c:choose>
                                                <div class="ptboard-type-content">${pt.worktype}</div>
                                            </td>
                                            <td class="ptboard-title">
                                                <a class="ptboard-title-content" href="/gaenari/control?command=ptBoardView&ptbrdno=${pt.ptbrdno}">
                                                ${pt.title}</a>
                                            </td>
                                            <td class="ptboard-time">
                                                <div class="ptboard-time-content">
                                                	<c:choose>
	                                                	<c:when test="${fn:contains(pt.workhour, '!split!')}">
		                                                	<c:set var="workdate" value="${fn:split(pt.workhour, '!split!')}" />
		                                                	${workdate[0]}
	                                                	</c:when>
	                                                	<c:otherwise>
	                                                	${pt.workhour}
	                                                	</c:otherwise>
	                                               	</c:choose>
                                                </div>
                                            </td>
                                            <td class="ptboard-loc">
                                                <div class="ptboard-loc-content">${pt.workloc}</div>
                                            </td>
                                            <td class="ptboard-writer">
                                                <div class="ptboard-writer-author">${pt.userid}</div>
                                                <div class="ptboard-writer-date">${pt.wrdate}</div>
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
                                                        <li><a href="control?command=ptBoardList&pageNumber=${requestScope.pageNumber-1}">«</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li><a href="#">«</a></li>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:forEach begin="1" end="${requestScope.pageCount}" var="cnt">
                                                    <c:choose>
                                                        <c:when test="${cnt eq requestScope.pageNumber}">
                                                            <li class="active">
                                                                <a href="control?command=ptBoardList&pageNumber=${cnt}">
                                                                ${cnt}<span class="sr-only">(current)</span>
                                                                </a>
                                                            </li>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li><a href="control?command=ptBoardList&pageNumber=${cnt}">${cnt}</a></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                                <c:choose>
                                                    <c:when test="${requestScope.pageNumber+1 < requestScope.pageCount+1}">
                                                        <li><a href="control?command=ptBoardList&pageNumber=${requestScope.pageNumber+1}">»</a></li>
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
</html>