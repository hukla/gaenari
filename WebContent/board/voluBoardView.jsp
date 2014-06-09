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
                        <div class="ptboard-title">${requestScope.resultContent.title}</div>
                    </div>
					<div class="ptboard-info-main">
                        <div class="left-part">
                            <div class="ptboard-info-content">
                                <div class="ptboard-info-content-title">
                                </div>
                                <div class="ptboard-info-content-text">
                                    ${requestScope.resultContent.brdcontent}
                                </div>
                            </div>
                        </div>
                       			<div class="part-line-gray">작성자</div>
                                <div class="part-line">${requestScope.resultContent.userid}</div>
                                <div class="part-line-gray">작성시간</div>
               		            <div class="part-line">${requestScope.resultContent.wrdate}</div>
                                <%-- <div class="part-line-gray">위치</div>
                                <div class="part-line">${requestScope.resultContent.workloc}</div> --%>
                                <div class="part-line-gray">봉사날짜</div>
                                <div class="part-line">${requestScope.vhour[0]}</div>
                                <div class="part-line-gray">봉사시간</div>
                                <div class="part-line">${requestScope.vhour[1]} ~ ${requestScope.vhour[2]}</div>
                       </div>
                                          <div class="ptboard-info-bottom">
                        <div class="content-container">
                            <!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
                            <form name="requestForm" method=post action="control" onsubmit="return send()">
                                <input type=hidden name="vbrdno" value="${requestScope.resultContent.vbrdno}">
                                <input type=hidden name="command" value="voluBoardUpdateForm">
                                <input type=hidden name="user" value="${sessionScope.userid}">
                                <input type=hidden name="writer" value="${requestScope.resultContent.userid}">
                                <input class="btn btn-yellow" type=submit value="수정하기">
                            </form>
                            <form name="requestDelete" method=post action="control" onsubmit="return send()">
                                <input type=hidden name="vbrdno" value="${requestScope.resultContent.vbrdno}">
                                <input type=hidden name="command" value="voluBoardDelete">
                                <input type=hidden name="user" value="${sessionScope.userid}">
                                <input type=hidden name="writer" value="${requestScope.resultContent.userid}">
                                <input class="btn btn-yellow" type=submit value="삭제하기" onclick="voluDelete(${requestScope.resultContent.vbrdno})">
                            </form>
                          	<a class="btn btn-yellow" href="/gaenari/voluBoardList.do">목록으로
                            </a>
                        </div>
                    </div>
                    <!-- TODO -->
                </div>
            </div>
            <%@ include file="/static/pages/footer.jsp"%>
        </div>
    </body>
</html>