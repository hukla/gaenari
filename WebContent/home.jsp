<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="frame.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GAENARI 홈페이지</title>
<!-- 
작성: 2014-05-25
작성자: 최성훈
내용: 개나리 웹페이지 메인페이지
 -->
<style type="text/css">
	.menu-about { width: 50px; height: 0px; position: relative; top: -220px; left: 0px; }
	.menu-about img { position: absolute; clip: rect(200px 1300px 450px 0px); }
</style>
</head>
<body>
	<table width="100%" height="500">
		<tr>
			<td colspan="3">
				<div class="menu-about" align="center">
					<img src="/gaenari/image/woman-335394.jpg"  width="1300"/>
				</div>
			</td>
		</tr>
		<colgroup>
			<col width="40%">
			<col width="20%">
			<col width="40%">
		</colgroup>
		<tr>
			<td style="text-align: center;vertical-align: middle;">
				<!-- <a href="addDog()">
					<img src="image/euriiiii.jpg" width="50" class="img-rounded">나의 개나으리 추가
				</a> -->
				<button onclick="addDog()">
					<img src="image/euriiiii.jpg" width="50" class="img-rounded">나의 개나으리 추가
				</button>
			</td>
				<td align="center"><a href="#">난?</a>
			</td>
				<td align="left"><a href="#">난이?</a>
			</td>
		</tr>
	</table>
</body>
<script type="text/javascript">
function addDog() {
	var newwindow;
	var url = "control?command=addDog&userid=${sessionScope.user.userid}";
	
	newwindow = window.open(url, '강아지등록 페이지', 'height=550,width=660');
	if(window.focus) {
		newwindow.focus;
	}
}
</script>
</html>
<%@ include file="bottom.jsp"%>