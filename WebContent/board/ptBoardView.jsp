<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/static/pages/head.jsp"%>
        <script src="/gaenari/board/scripts/ptboard.js"></script>
    </head>
    <body>
        <div id="wrapper">
        <%@ include file="/static/pages/header.jsp"%>
        <div id="content">
            <%@ include file="/static/pages/menubar.jsp"%>
            <div class="container">
                <!-- TODO -->
                <div id="ptboard-view-form">
                    <div class="ptboard-info-header">
                        <div class="ptboard-title">${requestScope.resultContent.title }</div>
                    </div>
                    <div class="ptboard-info-main">
                        <div class="left-part">
                            <div class="ptboard-info-content">
                                <div class="ptboard-info-content-title">
                                    내용
                                </div>
                                <div class="ptboard-info-content-text">
                                    ${requestScope.resultContent.brdcontent}
                                </div>
                            </div>
                        </div>
                        <div class="right-part">
                            <div class="part-header">
                                <div class="ptboard-type-container">
                                    <c:choose>
                                        <c:when test="${requestScope.resultContent.worktype == '목욕'}">
                                            <img class="ptboard-type-icon" src="/gaenari/static/images/bath-icon.png"/>
                                            <div class="ptboard-type-content">
		                                        목욕
		                                    </div>
                                        </c:when>
                                        <c:when test="${requestScope.resultContent.worktype == '산책'}">
                                            <img class="ptboard-type-icon" src="/gaenari/static/images/dog-walk-icon.png"/>
                                            <div class="ptboard-type-content">
		                                        산책
		                                    </div>
                                        </c:when>
                                        <c:otherwise>
                                            <img class="ptboard-type-icon" src="/gaenari/static/images/pet-sitting-icon.png"/>
                                            <div class="ptboard-type-content">
		                                        위탁
		                                    </div>
                                        </c:otherwise>
                                    </c:choose>
                                    
                                </div>
                                <div class="part-line-gray">작성자</div>
                                <div class="part-line">${requestScope.resultContent.userid}</div>
                                <div class="part-line-gray">작성시간</div>
                                <div class="part-line">${requestScope.resultContent.wrdate}</div>
                                <div class="part-line-gray">위치</div>
                                <div class="part-line">${requestScope.resultContent.workloc}</div>
                                <div class="part-line-gray">작업날짜</div>
                                <div class="part-line">${requestScope.workhour[0]}</div>
                                <div class="part-line-gray">작업시간</div>
                                <div class="part-line">${requestScope.workhour[1]} ~ ${requestScope.workhour[2]}</div>
                            </div>
                        </div>
                    </div>
                    <div class="ptboard-info-bottom">
                        <div class="content-container">
                            <!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
                            <form name="requestForm" method=post action="control" onsubmit="return send()">
                                <input type=hidden name="ptbrdno" value="${requestScope.resultContent.ptbrdno}">
                                <input type=hidden name="command" value="ptBoardUpdateForm">
                                <input type=hidden name="user" value="${sessionScope.userid}">
                                <input type=hidden name="writer" value="${requestScope.resultContent.userid}">
                                <input class="btn btn-yellow" type=submit value="수정하기">
                            </form>
                            <form name="requestDelete" method=post action="control" onsubmit="return send()">
                                <input type=hidden name="ptbrdno" value="19">
                                <input type=hidden name="command" value="ptBoardDelete">
                                <input type=hidden name="user" value="null">
                                <input type=hidden name="writer" value="lyuel             ">
                                <input class="btn btn-yellow" type=submit value="삭제하기" onclick="ptDelete(19)">
                            </form>
                        </div>
                    </div>
                    <!-- TODO -->
                </div>
            </div>
            <%@ include file="/static/pages/footer.jsp"%>
        </div>
    </body>
</html>
