<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.dao.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/static/pages/head.jsp"%>
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
<%@ include file="/static/pages/footer.jsp"%>