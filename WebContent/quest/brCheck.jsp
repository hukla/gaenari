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
function brCheck(){
	if(confirm('자원봉사를 신청하시겠습니까?')){
		var type="${requestScope.type}";
		var brdno="${requestScope.brdno}";
		var vbrdno="${requestScope.vbrdno}";
		location.href="/gaenari/brdreqInsert.do?brdno="+brdno+"&type="+type+"&vbrdno="+vbrdno;
		alert('신청이 완료되었습니다.');
	}else{
		alert('신청이 취소되었습니다.');
		history.back();
	}
}
brCheck();
</script>
</html>