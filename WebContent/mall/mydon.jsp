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
                                <div class="explore-info-title">나의 기부 내역</div>
                                <div class="explore-info-description">기부해주셔서 감사합니다. 행복한 하루되세요!
                                </div>
                            </div>
                        </div>
                        <div class="explore-search-results">
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-danger" id="mydon-pgbar" role="progressbar" aria-valuetransitiongoal="100" style="width:100%">
                                	<span>기부를 많이 하셨군요! 잠시만 기다려 주세요.</span>
                                </div>
                            </div>
                            <table id='my_don_list' class="table table-hover .table-condensed">
                                <tr>
                                    <th>번호</th>
                                    <th>상품명</th>
                                    <th>기부 대상</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>지불 금액</th>
                                    <th>배송 여부</th>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- //상품 리스트 -->
                </div>
            </div>
            <%@ include file="/static/pages/footer.jsp" %>
        </div>
    </body>
    <script src="/gaenari/mall/scripts/mydon.js"></script>
</html>