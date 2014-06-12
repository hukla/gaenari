<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/static/pages/head.jsp"%>
    </head>
    <body>
        <div id="wrapper">
            <div id="content">
                <div class="container">
                    <!--TODO-->
                    <!-- <div class="explore-search-top">
                        <div class="explore-info">
                            <div class="explore-info-title">개발자 정보확인</div>
                            <div class="explore-info-description">개나리 프로젝트를 개발한 개발자 정보입니다.</div>
                        </div>
                    </div> -->
                    <div align="center">
                    <img src="/gaenari/static/images/logoWhite.png" onclick="popUp()" align="center"><br>
                    </div>
                    <!-- <h2>Project Gae:nari</h2> -->
                    
                    <div class="explore-search-top" align="center" style="float: top;">
                        <div class="explore-info" style="float: inherit;">
                            <div class="explore-info-title"><h2 align="center">Project Gae:nari</h2></div>
                            <table>
                            <tr><div class="explore-info-description"><td><h4>PM:Jaehee Jang</h4></td><td><h4 style="float: left;margin-left: 30px">공대여신</h4></td></div></tr>
                            <tr><div class="explore-info-description"><td><h4>PL:Sunghoon Choi</h4></td><td><h4 style="float: left;margin-left: 30px">건담덕후</h4></td></div></tr>
                            <tr><div class="explore-info-description"><td><h4>PD:Sujin Lee</h4></td><td><h4 style="float: left;margin-left: 30px">롤덕후</h4></td></div></tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
<script language="javascript">
function popUp(){
	alert('개나리 프로젝트를 사랑해 주셔서 감사합니다!');
}
</script>
</html>