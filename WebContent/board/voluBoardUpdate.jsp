<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.dto.BoardDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/static/pages/head.jsp"%>
        <script src="/gaenari/board/scripts/ptboard.js"></script>
    </head>
    <body>
        	<div id="wrapper">
            <%@ include file="/static/pages/header.jsp"%>
            <div id="content">
                <%@ include file="/static/pages/menubar.jsp"%>
                <div class="container">
                    <!-- TODO -->
                    <div id="ptboard-write-form">
                    <form name="boardWriteForm" method="post"
                            action="voluBoardUpdate.do"
                            onSubmit='return checkValid()'>
                            <input type="hidden" name="vbrdno" value="${requestScope.resultContent.vbrdno}">
                            <table class="table ptboard-write-table">
                                <tr>
                                    <td colspan="2">
                                        <div class="ptboard-write-table-title">자원봉사 요청 글 수정</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ptboard-write-table-head">
                                        <div class="ptboard-write-table-head-title">
                                            작성자
                                        </div>
                                    </td>
                                    <td><input type="text" class="form-control"
                                        name="userid" value="${sessionScope.user.userid}"
                                        disabled="disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ptboard-write-table-head">
                                        <div class="ptboard-write-table-head-title">
                                            제목
                                        </div>
                                    </td>
                                    <td> <input type=text name="title"
                                        class="form-control" value="${requestScope.resultContent.title}"></td>
                                </tr>
                                <tr>
                                    <td class="ptboard-write-table-head">
                                        <div class="ptboard-write-table-head-title">
                                            내용
                                        </div>
                                    </td>
                                    <td> <textarea name="brdcontent" class="form-control"
                                        cols="60" rows="7">${requestScope.resultContent.brdcontent}</textarea></td>
                                </tr>
                                                                <tr>
                                    <td class="ptboard-write-table-head">
                                        <div class="ptboard-write-table-head-title">
                                           봉사시간
                                        </div>
                                    </td>
                                    <td>
                                        <input type="text" name="vhour" id="datepicker" size="10">
                                        <input type="time" name="vhour2">
                                        <input type="time" name="vhour3">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan='2' class="ptboard-write-form-btn-group">
                                        <input type=submit class="btn btn-yellow ptboard-write-form-btn form-control" value=수정하기>
                                        <input type=reset class="btn btn-yellow ptboard-write-form-btn form-control" value=다시쓰기><br>
                                        <a class="btn btn-yellow ptboard-write-form-btn form-control" href="/gaenari/voluBoardList.do">목록으로
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <!-- TODO -->
                </div>
            </div>
            <%@ include file="/static/pages/footer.jsp"%>
        </div>
    </body>
</html>