<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="frame.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미니홈피 일기 수정하기</title>
<!-- 
작성자: 최성훈
작성일: 2014-05-21
작성내용: 일기 수정하기
 -->
</head>
<body>
<table border="0" width="100%" height="100%">
					<tr>
						<td width="100%" align="right">
							<input type="button" onclick="location.href='/gaenari/diaryList.do'"value="일기전체">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							<form action="/gaenari/updateDiary.do" method="post" enctype="multipart/form-data">
							<table border="1" align="center" width="50%" height="100%">
								<tr>
									<td align="center" height="7%"  width="15%">작성날짜</td>
									<td width="85%" align="center">
										<div align="center">
											<input type="text" value="${requestScope.oneDiary.wrdate}" disabled="disabled">
										</div>
									</td>
								</tr>
								<tr>
									<td align="center" height="7%">제목</td>
									<td>
										<div align="center">
											<input type="text" name="title" value="${requestScope.oneDiary.title}">
										</div>
									</td>
								</tr>
								<tr>
									<td align="center" height="7%">기분</td>
									<td>
										<div align="center">
											<c:choose>
												<c:when test="${requestScope.oneDiary.mood eq 'soso'}">
													좋음<input type="radio" name="mood" value="good">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													보통<input type="radio" name="mood" value="soso" checked="checked">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													구림<input type="radio" name="mood" value="bad">
												</c:when>
												<c:when test="${requestScope.oneDiary.mood eq 'bad'}">
													좋음<input type="radio" name="mood" value="good">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													보통<input type="radio" name="mood" value="soso">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													구림<input type="radio" name="mood" value="bad" checked="checked">
												</c:when>
												<c:otherwise>
													좋음<input type="radio" name="mood" value="good" checked="checked">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													보통<input type="radio" name="mood" value="soso">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													구림<input type="radio" name="mood" value="bad">
												</c:otherwise>
											</c:choose>
										</div>
									</td>
								</tr>
								<tr>
								<!-- 14-05-13 성훈 수정 경우에 따라 사진 넣고 말고 하기 -->
									<td align="center" height="20%">내용</td>
									<td>
										<div align="center">
											<input type="file" name="uploadFile" value="${requestScope.diaryImg}">
											<div align="center">
												<textarea rows="10" cols="50" name="brdcontent">${requestScope.brdcontent}</textarea>
											</div>
										</div>
									</td>
								</tr>
								<%-- 
								<tr>
									<td align="center" height="20%">내용</td>
									<td>
										<div align="center">${requestScope.oneDiary.brdcontent}</div>
									</td>
								</tr> --%>
								<tr>
									<!-- 14-05-14 성훈 추가: 이전 글, 다음 글 보기 -->
									<!-- 14-05-21 성훈 수정: 이전 글, 다음 글 index로 이동 -->
									<td align="center" colspan="2" height="7%">
										<input type="hidden" name="brdno" value="${requestScope.oneDiary.brdno}">
										<input type="submit" value="수정하기"> 
										&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="reset" value="취소하기">
										&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" onclick="history.back()" value="뒤로가기">
									</td>
								</tr>
							</table>
							</form>
						</td>
					</tr>
				</table>
</body>
</html>