<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <div class="row">
                        <div class="content-container">
                            <div class="explore-search-top">
                                <div class="explore-info">
                                    <div class="explore-info-title">유기견 신고</div>
                                    <div class="explore-info-description">애타게 찾고있는 가족들을 위해 유기견을 신고해주세요!</div>
                                </div>
                                <div class="explore-options-wrapper">
                                    <a class="btn btn-yellow write-btn" href="/gaenari/board/missingBoardWrite.jsp">글쓰기</a>
                                </div>
                            </div>
                            <div class="row boards explore-search-results"></div>
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="/static/pages/footer.jsp"%>
        </div>
    </body>
</html>