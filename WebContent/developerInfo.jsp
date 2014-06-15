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
                    <div align="center">
                    <img src="/gaenari/static/images/logoWhite.png" onclick="popUp()" align="center"><br>
                    </div>
                    <div class="explore-search-top" align="center" style="float: top;">
                        <div class="explore-info" style="float: inherit;">
                            <div class="explore-info-title"><h2 align="center">Project Gaena:ri</h2></div>
                            <table>
                            <tr><div class="explore-info-description"><td><h4>PM:Jaehee Jang</h4></td><td><h4 style="float: left;margin-left: 30px">공대여신</h4></td></div></tr>
                            <tr><div class="explore-info-description"><td><h4>PL:Sunghoon Choi</h4></td><td><h4 style="float: left;margin-left: 30px">건담덕후</h4></td></div></tr>
                            <tr><div class="explore-info-description"><td><h4>PD:Sujin Lee</h4></td><td><h4 style="float: left;margin-left: 30px">롤덕후</h4></td></div></tr>
                            <tr></tr><tr></tr><tr><div class="explore-info-description"><h5>문의사항은 admin@gaenari.com으로 연락주세요:)</h5></div></tr></table>
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