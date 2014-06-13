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
                    <div class="content-container" id="item-list-container">
                        <div class="explore-search-top">
                            <div class="explore-info">
                                <div class="explore-info-title">기부몰 관리하기</div>
                                <div class="explore-info-description">기부몰 관리하기 관리자 메뉴입니다.
                                </div>
                            </div>
                        </div>
                        <div class="explore-search-results" data-menuno="${requestScope.menuno}">
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-danger" id="mgt-pgbar" role="progressbar" aria-valuetransitiongoal="100" style="width:100%;">
                                	<span>페이지 로딩중입니다. 잠시만 기다려주세요!</span>
                                </div>
                            </div>
                            <c:choose>
                            <c:when test="${requestScope.menuno == 1}">
                            <table id='item_mgt' class="table table-hover .table-condensed">
                                <tr>
                                    <th>번호</th>
                                    <th>상품명</th>
                                    <th>상품가격</th>
                                    <th>수량</th>
                                    <th>수정하기</th>
                                    <th>삭제하기</th>
                                </tr>
                            </table>
                            </c:when>
                            <c:when test="${requestScope.menuno == 2}">
                            <!-- 기부 관리 테이블 -->
							<table id="don_mgt" class="table table-hover .table-condensed">
								<tr>
									<th>번호</th>
									<th>기부자</th>
									<th>기부 대상</th>
									<th>상품명</th>
									<th>수량</th>
									<th>배송하기</th>
								</tr>
							</table>
							<!-- 기부 관리 테이블 끝-->
                            </c:when>
                            <c:when test="${requestScope.menuno == 3}">
                            <!-- 기부 요청 관리 테이블 -->
							<table id="donreq_mgt" class="table table-hover .table-condensed">
								<tr>
									<th>번호</th>
									<th>요청자</th>
									<th>요청센터명</th>
									<th>상품명</th>
									<th>수량</th>
									<th>요청 마감하기</th>
								</tr>
							</table>
							<!-- 기부 요청 테이블 끝-->
                            </c:when>
                            <c:otherwise>
                            	<script type="text/javascript">alert("잘못된 접근입니다!");history.back();</script>
                            </c:otherwise>
                            </c:choose>
                            <div class="mall-action-state">
            	<div class="mall-action-state-text"></div>
            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="/static/pages/footer.jsp" %>
        </div>
    </body>
    <script src="/gaenari/mall/scripts/manage.js"></script>
</html>
