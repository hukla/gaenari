<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
h1,div{font-family: "맑은 고딕"}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/gaenari/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<script src="//code.jquery.com/jquery-1.9.1.min.js"></script>
<title>메시지 수정완료</title>
</head>
<body>
<h1 align="center">메시지 수정완료</h1>
<div align="center">
	메시지가 수정되었습니다.<br>
</div>
<div align="center"><button id="close" class="btn btn-default" data-toggle="button">닫기</button></div>
<script>
	$(function(){
		$("#close").click(function(){
			opener.location.reload();
			self.close();
		});
	});
</script>
</html>