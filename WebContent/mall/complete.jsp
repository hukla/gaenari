<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>완료 페이지</title>

</head>
<body>
<H1>${operation } 완료 하였습니다!</H1>
<button id="close">창 닫기</button>
</body>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
	$(function(){
		$("#close").click(function(){
			opener.location.reload();
			self.close();
		});
	});
</script>
</html>