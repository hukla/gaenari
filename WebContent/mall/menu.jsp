<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table border="0" style='text-align: left' align='left' width="14%"
    height='100%' id="menu_bar">
    <tr>
        <td width="10%"></td>
        <td width="90%">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="/gaenari/mallMain.do">기부몰 메인</a></li>
                <c:if test="${sessionScope.user.usertype == 0}">
                    <li><a href="/gaenari/mallMyPage.do">나의 기부 내역</a></li>
                </c:if>
                <c:if test="${sessionScope.user.usertype > 0}">
                    <li><a href="/gaenari/mallMyPage.do">나의 기부 요청 내역</a></li>
                </c:if>
                <c:if test="${sessionScope.user.usertype == -1}">
                    <li><a href="/gaenari/mallManage.do">기부몰 관리하기</a></li>
                </c:if>
            </ul>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">${sessionScope.user.userid}님<br>안녕하세요!
        </td>
    </tr>
</table>