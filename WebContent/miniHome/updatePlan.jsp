<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정 수정하기</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
  <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>
</head>
<!-- 
작성: 2014-05-21
작성자: 최성훈
내용: 일정 수정하기

수정: 2014-05-27, 최성훈	내용: 일기 수정중에 미니홈페이지 메뉴기능 이용이 불가능 했던 오류 수정
 -->
<body>
<%-- 	<form action="/gaenari/updatePlan.do" method="post">
		<table border="0" width="80%" height="480">
			<tr>
				<td>
					<table border="1" align="center" width="50%" height="80%">
						<tr>
							<td width="15%" align="center" height="10%">오늘날짜</td>
							<td width="85%" align="center">
								<div align="center">${sessionScope.today}</div>
							</td>
						</tr>
						<tr>
							<td align="center" height="10%">제목</td>
							<td>
								<div align="center">
									<input type="text" name="title" value="${requestScope.onePlan.title}">
								</div>
							</td>
						</tr>
						<tr>
							<td align="center" height="10%">수행날짜</td>
							<td>
								<div align="center">
									<input type="text" id="datepicker" name="wrdate" value="${requestScope.date}">
								</div>
							</td>
						</tr>
						<tr>
							<td align="center" height="10%">장소</td>
							<td>
								<div align="center">
									<input type="text" name="ploc" value="${requestScope.onePlan.ploc}">
								</div>
							</td>
						</tr>
						<tr>
							<td align="center" height="40%">내용</td>
							<td>
								<div align="center">
									<textarea rows="10" cols="50" name="brdcontent" class="form-control" rows="3">${requestScope.onePlan.brdcontent}</textarea>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="hidden" name="brdno" value="${requestScope.onePlan.brdno}">
					<input type="hidden" name="userid" value="${requestScope.user.userid}">
					<input type="submit" value="수정하기">
					&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="reset" value="취소하기">
					&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="button" onclick="history.back()" value="뒤로가기">
				</td>
			</tr>
		</table>
	</form> --%>
	<div id="tb">
		<table border="0" width="100%" height="100%" class="table">
		<tr>
			<td width="100%" align="center">
		<div class="row">
  				<div class="col-lg-15 col-lg-10">
    				<div class="thumbnail" style="width: 500px">
				<form action="/gaenari/updatePlan.do" method="post">
					<table class="table" border="0" width="100%" height="380" style="border:hidden; table-layout: fixed;">
						<colgroup>
							<col width="20%"><col width="35%"><col width="45%">
						</colgroup>
						<tr>
							<td colspan="3"><h2>일정 수정하기</h2></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;제목 : </td>
							<td colspan="2">
								<input class="form-control" type="text" size="33" name="title" value="${requestScope.onePlan.title}">
							</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;선택 : </td>
							<td align="left">
							<select id="ploc" name="ploc" class="btn btn-default" style="width: 100%;">
									<option value="unchosen">지역</option>
									<option value=광진구">광진구</option>
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
							<td align="left">
							<select name="plandogno" id="myDog" class="btn btn-default" style="width: 100%;">
									<c:choose>
										<c:when test="${not empty requestScope.dog}">
											<option value="unchosen" selected="selected">강아지</option>
											<c:forEach items="${requestScope.dog}" var="dogs">
												<option value="${dogs.dogno}">${dogs.dogname}</option>
											</c:forEach>
										</c:when>
										<c:otherwise>
											기르시는 강아지가 없습니다.
										</c:otherwise>
									</c:choose>
								</select>
							</td>
							</tr>
							<tr><td> &nbsp;&nbsp;날짜 : </td>
							<td colspan="2"><input class="form-control" type="text" id="datepicker" name="date" value="${requestScope.onePlan.wrdate}"></td>
							</tr>
							<tr><td> &nbsp;&nbsp;내용: </td>
								<td colspan="2">
									<select id="pltype" name="plantype" class="btn btn-default">
										<option value="unchosen" selected="selected">일정 주제 선택</option>
										<option value="예방접종하기">예방접종하기</option>
										<option value="산책시키기">산책시키기</option>
										<option value="목욕시키기">목욕시키기</option>
										<option value="털깎기">털깎기</option>
										<option value="검진받기">검진받기</option>
										<option value="미용해주기">미용해주기</option>
										<option value="강아지학교보내기">강아지학교보내기</option>
										<option value="훈련시키기">훈련시키기</option>
										<option value="위탁하기">위탁하기</option>
										<option value="기타">기타</option>
									</select>
								</td>
							</tr>
							<tr><td colspan="3">
								<textarea rows="2" cols="50" name="brdcontent" class="form-control" rows="3">${requestScope.brdcontent}</textarea>
											<p/>
										</td>
						</tr>
						<tr>
							<td colspan="3">
								<div align="center">
									<input type="hidden" name="brdno" value="${requestScope.onePlan.brdno}">
									<input type="hidden" name="userid" value="${requestScope.user.userid}">
									<input type="submit" class="btn btn-success" value="수정하기">
									&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="reset" class="btn btn-default" value="취소하기">
									&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="button" class="btn btn-default" onclick="history.back()" value="뒤로가기">
								</div>
							</td>
						</tr>
					</table>
				</form>
				</div>
			</div>
		</div>
		</td>
		</tr>
		</table>
	</div>
</body>
<script type="text/javascript">
$(function(){
	$("#ploc").val("${requestScope.onePlan.ploc}").attr("selected", "selected");
	$("#myDog").val("${requestScope.onePlan.plandogno}").attr("selected", "selected");
	$("#pltype").val("${requestScope.plantype}").attr("selected", "selected");
});
</script>
</html>