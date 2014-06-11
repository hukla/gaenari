<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	td,th { text-align: center; vertical-align: center; font-family: "나눔고딕";}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/gaenari/bootstrap/js/bootstrap.min.js"></script>
<link href="/gaenari/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.9.1.min.js"></script>
<title>상태표시글</title>
</head>
<body>
	<table width="100%" align="center">
		<tr style="border: hidden;">
			<td>
				
				<table class="table" align="center">
					<colgroup>
					<col width="30%"><col width="70%">
					</colgroup>
					<tr>
						<th>상태표시글</th>
						<td>
							<form action="msgInput.do" method="post" id="msgForm">
								<input class="form-control" type="text" size="29" name="mainmsg">
								<input  type="hidden" name="userid" value="${sessionScope.userid}">
							</form>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button id="submit" class="btn btn-primary" data-toggle="button">입력</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button id="close" class="btn btn-default" data-toggle="button">닫기</button>
						</td>
					</tr>
				</table>
				
			</td>
		</tr>
	</table>
</body>
<script>
	$(function(){
		$("#close").click(function(){
			opener.location.reload();
			window.self.close();
		});
	});
	$(function(){
		$("#submit").click(function(){
			$("#msgForm").submit();
		});
	});
</script>
</html>