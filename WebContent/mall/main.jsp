<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <%@ include file="/static/pages/head.jsp" %>
    <body>
        <div id="wrapper">
            <%@ include file="/static/pages/header.jsp" %>
            <div id="content">
                <%@ include file="/static/pages/menubar.jsp" %>
                <div class="container">
                    <div class="aside-menu">
                        <%@ include file="menu.jsp" %>
                    </div>
                    <input type='hidden' name='usertype' value='0'>
                    <!-- 상품 리스트 -->
                    <div class="content-container" id="item-list-container">
                        <div class="explore-search-top">
                            <div class="explore-info">
                                <div class="explore-info-title">기부몰</div>
                                <div class="explore-info-description">유기견 센터에 사랑을 나눠주세요!
                                </div>
                            </div>
                        </div>
                        <div class="explore-search-results">
                            <div class="progress progress-striped">
                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuetransitiongoal="100"></div>
                            </div>
                            <ul id="item_list"></ul>
                        </div>
                    </div>
                    <!-- //상품 리스트 -->
                </div>
            </div>
            <%@ include file="/static/pages/footer.jsp" %>
        </div>
    </body>
    <script src="mall/scripts/mallmain.js"></script>
</html>