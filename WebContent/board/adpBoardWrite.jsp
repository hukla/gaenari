<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.dto.BoardDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/static/pages/head.jsp"%>
<script src="/gaenari/board/scripts/fboard.js"></script>
</head>
<body>
	<div id="wrapper">
		<%@ include file="/static/pages/header.jsp"%>
		<div id="content"><%@ include file="/static/pages/menubar.jsp"%>
			<div class="container">
				<!-- TODO -->
				<div id="mboard-write-form">
				<form name="boardWriteForm" method="post"
              action="adpBoardWrite.do" enctype="multipart/form-data"
              onSubmit='return checkValid()'>
              <input type="hidden" name="command" value="adpBoardWrite">
              <table class="table mboard-write-table">
                <tr>
                  <td colspan="2">
                    <div class="mboard-write-table-title">애견 입양 게시판 글 작성</div>
                  </td>
                </tr>
                <tr>
                  <td class="mboard-write-table-head">
                    <div class="mboard-write-table-head-title">
                      작성자
                    </div>
                  </td>
                  <td><input type="text" class="form-control"
                    name="userid" value="${sessionScope.user.userid}"
                    disabled="disabled">
                    </span></b>
                  </td>
                </tr>
                <tr>
                  <td class="mboard-write-table-head">
                    <div class="mboard-write-table-head-title">
                      제목
                    </div>
                  </td>
                  <td> <input type=text name="title"
                    class="form-control"></td>
                </tr>
                <tr>
                  <td class="mboard-write-table-head">
                    <div class="mboard-write-table-head-title">
                      내용
                    </div>
                  </td>
                  <td> <textarea name="brdcontent" class="form-control"
                    cols="60" rows="7"></textarea></td>
                </tr>
                <tr>
                  <td class="mboard-write-table-head">
                    <div class="mboard-write-table-head-title">
                      사진 첨부
                    </div>
                  </td>
                  <td> <input type="file"
                    name="uploadFile" class="form-control" value="사진 업로드"><br/>
                    <small>* 첨부파일은 5MB이상 등록할 수 없습니다.</small>
                  </td>
                </tr>
    			<tr>
                  <td colspan='2' class="mboard-write-form-btn-group">
                    <input type=submit class="btn btn-yellow mboard-write-form-btn form-control" value=글쓰기>
                    <input type=reset class="btn btn-yellow mboard-write-form-btn form-control" value=다시쓰기><br>
                    <a class="btn btn-yellow mboard-write-form-btn form-control" href="/gaenari/adpBoardMain.do">리스트로 돌아가기
                    </a>
                  </td>
                </tr>
              </table>
            </form></div>
					<!-- TODO -->
			</div>
		</div>
		<%@ include file="/static/pages/footer.jsp"%>
	</div>
</body>
</html>