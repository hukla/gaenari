<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/static/pages/head.jsp"%>
         <script src="/gaenari/quest/questionaire.js"></script>
    </head>
    <body>
        <div id="wrapper">
            <div id="content">
                <div class="container">
                    <!--TODO-->
                    <div class="explore-search-top">
                        <div class="explore-info">
                            <div class="explore-info-title">신청자 정보확인</div>
                            <div class="explore-info-description">해당 강아지 입양을 요청한 유저 목록입니다.</div>
                        </div>
                    </div>
                    <div class="explore-search-results" data-brdno="${requestScope.brdno}">
                        <table id="reqbrd_list" class="table .table-condensed">
                            <tr style="background-color:#FC0;">
                            	<th>신청자번호</th>
                                <th>강아지수</th>
                                <th>테스트결과</th>
                                <th>마일나리</th>
                                <th>지역</th>
                                <th>수락하기</th>
                            </tr>
                            <!-- 글 레코드 시작 -->
                            <tr>
                                <td colspan="5" style="text-align:center;font-size:15px;font-weight:bold;color:gray;">입양신청한 사람이 없습니다.</td>
                            </tr>
                            <!-- 글 레코드 끝 -->
                        </table>
                    </div>
                    <!--TODO-->
                </div>
            </div>
        </div>
    </body>
</html>