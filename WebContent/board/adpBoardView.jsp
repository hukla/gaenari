<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%@ include file="/static/pages/head.jsp"%>
<body>
	<div id="wrapper">
            <%@ include file="/static/pages/header.jsp"%>
            <div id="content">
                <%@ include file="/static/pages/menubar.jsp"%>
                <div class="container">
                <div id="mboard-view-form">
                    <div class="mboard-info-header">
                        <div class="mboard-dog-name">${requestScope.resultContent.title}</div>
                    </div>
                    <div class="mboard-info-main">
                        <div class="left-part" style="background-image: url('${requestScope.picPath}');"></div>
                        <div class="right-part">
                            <div class="part-header">
                                <div class="part-header-title">${requestScope.resultContent.title}</div>
                            </div>
                        </div>
                    </div>
                    <div class="mboard-info-bottom">
                        <div class="content-container">
                            <div class="mboard-info-content">
                                <div class="mboard-info-content-text">
                                    ${requestScope.resultContent.brdcontent}
                                </div>
                                <center>
								<input class="btn btn-yellow" type=button value="입양하기" onclick='checkQuest()'>
								</center>                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="/static/pages/footer.jsp"%>
        </div>
    </body>
</html>