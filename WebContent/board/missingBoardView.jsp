<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                <div id="mboard-view-form">
                    <div class="mboard-info-header">
                        <div class="mboard-dog-name">${requestScope.resultContent.mname}를 찾습니다!</div>
                    </div>
                    <div class="mboard-info-main">
                    <% boolean result = request.getAttribute("picPath").toString().contains("default")?true:false;%>
                        <div class="left-part" style="background-image: url('${requestScope.picPath}');"
                        onclick="popupOpen('<%=result%>','${requestScope.resultContent.brdno}')"></div>
                        <div class="right-part">
                            <div class="part-header">
                                <div class="part-header-title">${requestScope.resultContent.title}</div>
                            </div>
                            <div class="part-line-gray">이름</div>
                            <div class="part-line">${requestScope.resultContent.mname}</div>
                            <div class="part-line-gray">나이</div>
                            <div class="part-line">${requestScope.resultContent.mage} 세</div>
                            <div class="part-line-gray">종류</div>
                            <div class="part-line">${requestScope.resultContent.mkind}</div>
                            <div class="part-line-gray">성별</div>
                            <div class="part-line">${requestScope.resultContent.mgender}</div>
                            <div class="part-line-gray">연락처</div>
                            <div class="part-line">${requestScope.resultContent.mcontact}</div>
                            <div class="part-line-gray">실종장소</div>
                            <div class="part-line">${requestScope.resultContent.mloc}</div>
                        </div>
                    </div>
                    <div class="mboard-info-bottom">
                        <div class="content-container">
                            <div class="mboard-info-content">
                                <div class="mboard-info-content-text">
                                    ${requestScope.resultContent.brdcontent}
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="right-part">
                    	<div class="mboard-info-bottom" style="text-align: right;">
                            <!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
                            <c:if test="${sessionScope.userid == requestScope.resultContent.userid}">
                            <input class="btn btn-yellow" type=button value="수정하기">
                            <input class="btn btn-yellow" type=button value="삭제하기">
                            </c:if>
                            <a class="btn btn-yellow" href="/gaenari/missingBoardMain.do">목록으로</a>
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="/static/pages/footer.jsp"%>
        </div>
    </body>
</html>
