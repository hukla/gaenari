<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.dao.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/static/pages/head.jsp"%>
</head>
<body>
</body>
<script language=javascript>
function checkQuest(){
	if(<%=request.getAttribute("result").toString().equals("t")%>){
		if(confirm('입양 신청 시 애견 입양 적합도 테스트의 결과가\n분양자에게 전송됩니다.\n신청을 진행할까요?')){
			alert('신청이 완료되었습니다.');
		}else{
			alert('신청이 취소되었습니다.');
		}
	}else{
		alert('애견 입양 적합도 테스트를 먼저 완료해 주세요!\n개인정보 페이지에서 작성 가능합니다.');
	}
	history.back();
}
checkQuest();
</script>
</html>