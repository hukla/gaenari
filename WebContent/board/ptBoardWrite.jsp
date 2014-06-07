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
                            action="missingBoardWrite.do" enctype="multipart/form-data"
                            onSubmit='return checkValid()'>
                            <input type="hidden" name="command" value="missingBoardWrite">
                            <table class="table ptboard-write-table">
                                <tr>
                                    <td colspan="2">
                                        <div class="ptboard-write-table-title">펫도우미 요청 글 작성</div>
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
                                        class="form-control"></td>
                                </tr>
                                <tr>
                                    <td class="ptboard-write-table-head">
                                        <div class="ptboard-write-table-head-title">
                                            장소
                                        </div>
                                    </td>
                                    <td>
                                        <select name="mloc" class="form-control">
                                            <option value="광진구">광진구</option>
                                            <option value="동대문구">동대문구</option>
                                            <option value="중랑구">중랑구</option>
                                            <option value="용산구">용산구</option>
                                            <option value="성동구">성동구</option>
                                            <option value="강북구">강북구</option>
                                            <option value="도봉구">도봉구</option>
                                            <option value="노원구">노원구</option>
                                            <option value="은평구">은평구</option>
                                            <option value="서대문구">서대문구</option>
                                            <option value="마포구">마포구</option>
                                            <option value="양천구">양천구</option>
                                            <option value="강서구">강서구</option>
                                            <option value="구로구">구로구</option>
                                            <option value="금천구">금천구</option>
                                            <option value="영등포구">영등포구</option>
                                            <option value="동작구">동작구</option>
                                            <option value="관악구">관악구</option>
                                            <option value="서초구">서초구</option>
                                            <option value="강남구">강남구</option>
                                            <option value="송파구">송파구</option>
                                            <option value="강동구">강동구</option>
                                            <option value="종로구">종로구</option>
                                            <option value="중구">중구</option>
                                            <option value="성북구">성북구</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ptboard-write-table-head">
                                        <div class="ptboard-write-table-head-title">
                                            작업종류
                                        </div>
                                    </td>
                                    <td class="ptboard-type">
                                        <div class="ptboard-type-container">
                                            <input type="radio" name="worktype" value="산책" checked>
                                            <img class="ptboard-type-icon" src="/gaenari/static/images/dog-walk-icon.png"/>
                                            <div class="ptboard-type-content">
                                                산책
                                            </div>
                                        </div>
                                        <div class="ptboard-type-container">
                                            <input type="radio" name="worktype" value="목욕">
                                            <img class="ptboard-type-icon" src="/gaenari/static/images/bath-icon.png"/>
                                            <div class="ptboard-type-content">
                                                목욕
                                            </div>
                                        </div>
                                        <div class="ptboard-type-container">
                                            <input type="radio" name="worktype" value="위탁">
                                            <img class="ptboard-type-icon" src="/gaenari/static/images/pet-sitting-icon.png"/>
                                            <div class="ptboard-type-content">
                                                위탁
                                            </div>
                                        </div>
                                    <td>
                                </tr>
                                <tr>
                                    <td class="ptboard-write-table-head">
                                        <div class="ptboard-write-table-head-title">
                                            작업시간
                                        </div>
                                    </td>
                                    <td>
                                        <input type="text" name="workhour" id="datepicker" size="10">
                                        <input type="time" name="workhour2">
                                        <input type="time" name="workhour3">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ptboard-write-table-head">
                                        <div class="ptboard-write-table-head-title">
                                            내용
                                        </div>
                                    </td>
                                    <td> <textarea name="brdcontent" class="form-control"
                                        cols="60" rows="7"></textarea></td>
                                </tr>
                                <tr>
                                    <td colspan='2' class="ptboard-write-form-btn-group">
                                        <input type=submit class="btn btn-yellow ptboard-write-form-btn form-control" value=글쓰기>
                                        <input type=reset class="btn btn-yellow ptboard-write-form-btn form-control" value=다시쓰기><br>
                                        <a class="btn btn-yellow ptboard-write-form-btn form-control" href="/gaenari/missingBoardMain.do">리스트로 돌아가기
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