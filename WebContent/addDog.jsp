<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="frame.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	td { text-align: center; vertical-align: center; }
	th { text-align: center; vertical-align: center;font-family: 서울한강체 }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<title>기르시는 강아지를 등록하세요</title>
<!-- 
작성: 2014-05-27
작성자: 최성훈
내용: 강아지 정보 등록하기
 -->
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
</head>
<body>
	<table width="60%" align="center">
		<tr>
			<td>
				<form action="dogInsert.do" method="post">
				<table class="table" align="center">
					<tr>
						<th>강아지 이름</th>
						<td><input type="text" size="29" name="dogname"></td>
					</tr>
					<tr>
						<th>강아지 생일</th>
						<td><input type="text" size="29" id="datepicker" name="dogbirth"></td>
					</tr>
					<tr>
						<th>강아지 종류</th>
						<td>
							<select name="dogtype" class="btn btn-default">
								<option selected="selected">강아지 종을 선택하세요</option>
								<option>진돗개</option>
								<option>풍산개</option>
								<option>삽살개</option>
								<option>부침개</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="등록하기">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="취소하기" id="close">
						</td>
					</tr>
				</table>
				</form>
			</td>
		</tr>
	</table>
</body>
<script>
	$(function(){
		$("#close").click(function(){
			opener.location.reload();
			self.close();
		});
	});
</script>
</html>
<%@ include file="bottom.jsp"%>