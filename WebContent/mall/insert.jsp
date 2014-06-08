<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <%@ include file="/static/pages/head.jsp"%>
    <body>
        <div id="wrapper">
            <div id="content">
                <div class="container">
                    <form name="itemModify" method="post" action="control?command=insertItem" enctype="multipart/form-data">
                        <table class="table" id="insert-table" style="margin-top:10px;">
                            <tr>
                                <th colspan="2" style="text-align:center;font-size:20px;background-color:#fc0;border-radius:5px;">상품 등록</td>
                            </tr>
                            <tr>
                                <th>상품번호</th>
                                <td><input type="text" class="form-control" name="itemno" value="${requestScope.finalitemno}" disabled="disabled"></td>
                            </tr>
                            <tr>
                                <th>상품명</th>
                                <td><input type=text class="form-control" name="itemname"></td>
                            </tr>
                            <tr>
                                <th>상품 이미지 파일</th>
                                <td><input type="file" class="form-control" name="uploadFile" size="29" value="찾아보기"></td>
                            </tr>
                            <tr>
                                <th>내 용</th>
                                <td> <textarea class="form-control" name="itemdetail" cols="60"rows="7" ></textarea></td>
                            </tr>
                            <tr>
                                <th>소비자 가격</th>
                                <td><input type=text class="form-control" name="price" size="50"></td>
                            </tr>
                            <tr>
                                <th>수량</th>
                                <td><input type=text class="form-control" name="qty" size="50"></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align:center;">
                                    <input type=submit class="btn btn-yellow" align='center' value="등록하기">
                                    <input type=reset class="btn btn-yellow" align='center' value=다시쓰기>
                                    <input type='button' class="btn btn-yellow" id='close_btn' value='닫기'>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script src="/gaenari/mall/scripts/insert.js"></script>
</html>