<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/frame.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>애견입양적합도테스트</title>
<script language="javascript">
function checkUpdate(){
	if(confirm('기존의 응답 결과가 있습니다.\n테스트를 다시 진행하시겠습니까?')){
		location.href="/gaenari/questionUpdateForm.do";
	}else{
		history.back();
	}
}
checkUpdate();
</script>
</head>
<body>
</body>
</html>