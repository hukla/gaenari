<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.dto.BoardDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/static/pages/head.jsp"%>
<script src="/gaenari/board/scripts/mboard.js"></script>
</head>
<body>
	<div id="wrapper">
		<%@ include file="/static/pages/header.jsp"%>
		<div id="content"><%@ include file="/static/pages/menubar.jsp"%>
			<div class="container">
				<!-- TODO -->
				<div id="mboard-write-form">
				<form name="boardWriteForm" method="post"
              action="missingBoardWrite.do" enctype="multipart/form-data"
              onSubmit='return checkValid()'>
              <input type="hidden" name="command" value="missingBoardWrite">
              <table class="table mboard-write-table">
                <tr>
                  <td colspan="2">
                    <div class="mboard-write-table-title">유기견 신고 게시판 글 작성</div>
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
                  </td>
                </tr>
                <tr>
                  <td class="mboard-write-table-head">
                    <div class="mboard-write-table-head-title">
                      분실장소
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
                  <td class="mboard-write-table-head">
                    <div class="mboard-write-table-head-title">
                      분실일
                    </div>
                  </td>
                  <td><input type="text" name="mdate"
                             id="datepicker" class="form-control"> </td>
                </tr>
                <tr>
                  <td class="mboard-write-table-head">
                    <div class="mboard-write-table-head-title">
                      연락처
                    </div>
                  </td>
                  <td><input type="text"
                             name="contact1" class="form-control contact"> <div class="contact-bar">&nbsp; - &nbsp;</div><input type="text"
                    name="contact2" class="form-control contact"><div class="contact-bar">&nbsp; - &nbsp;</div><input type="text"
                                                                                                           name="contact3" class="form-control contact"></td>
    </tr>
                <tr>
                  <td class="mboard-write-table-head">
                    <div class="mboard-write-table-head-title">
                      강아지 종류
                    </div>
                  </td>
                  <td><input type="text" name="mkind"
                             class="form-control"></td>
                </tr>
                <tr>
                  <td class="mboard-write-table-head">
                    <div class="mboard-write-table-head-title">
                      강아지 이름
                    </div>
                  </td>
                  <td><input type="text" name="mname"
                             class="form-control"></td>
                </tr>
                <tr>
                  <td class="mboard-write-table-head">
                    <div class="mboard-write-table-head-title">
                      강아지 성별
                    </div>
                  </td>
                  <td>
                        <select name="mgender" class="form-control">
                          <option value="여">암컷</option>
                          <option value="남">수컷</option>
                        </select>
                  </td>
                </tr>
                <tr>
                  <td class="mboard-write-table-head">
                    <div class="mboard-write-table-head-title">
                      강아지 나이
                    </div>
                  </td>
                  <td>
                        <select name="mage" class="form-control">
                          <option value="0">1살이하</option>
                          <option value="1">1살</option>
                          <option value="2">2살</option>
                          <option value="3">3살</option>
                          <option value="4">4살</option>
                          <option value="5">5살</option>
                          <option value="6">6살</option>
                          <option value="7">7살</option>
                          <option value="8">8살</option>
                          <option value="9">9살</option>
                          <option value="10">10살이상</option>
                        </select>
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
                  </td>
                </tr>
                <tr>
                  <td colspan='2' class="mboard-write-form-btn-group">
                    <input type=submit class="btn btn-yellow mboard-write-form-btn form-control" value=글쓰기>
                    <input type=reset class="btn btn-yellow mboard-write-form-btn form-control" value=다시쓰기><br>
                    <a class="btn btn-yellow mboard-write-form-btn form-control" href="/gaenari/missingBoardMain.do">리스트로 돌아가기
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