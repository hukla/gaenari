<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/static/pages/head.jsp"%>
        <script src="/gaenari/board/scripts/aboard.js"></script>
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
                                    <div class="explore-info-title">애견 입양</div>
                                    <div class="explore-info-description">사랑스런 가족의 일원이 될 강아지를 입양하세요!</div>
                                </div>
                                <div class="explore-options-wrapper">
                                    <a class="btn btn-yellow write-btn" href="/gaenari/board/adpBoardWrite.jsp">글쓰기</a>
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