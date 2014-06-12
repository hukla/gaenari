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
	if(<%=request.getAttribute("result").toString().equals("t")%>&&<%=request.getAttribute("result2").toString().equals("t")%>){
		if(confirm('입양 신청 시 애견 입양 적합도 테스트의 결과와\n신청자의 정보의 일부(마일나리,강아지 정보)가\n분양자에게 전송됩니다.\n신청을 진행할까요?')){
			var abrdno="${requestScope.abrdno}";
			var brdno="${requestScope.brdno}";
			var type="${requestScope.type}";
			location.href="/gaenari/brdreqInsert.do?brdno="+brdno+"&type="+type+"&abrdno="+abrdno;
			alert('신청이 완료되었습니다.');
		}else{
			alert('신청이 취소되었습니다.');
			history.back();
		}
	}else if(<%=request.getAttribute("result").toString().equals("f")%>){
		alert('애견 입양 적합도 테스트를 먼저 완료해 주세요!\n개인정보 페이지에서 작성 가능합니다.');
		history.back();
	}else if(<%=request.getAttribute("result2").toString().equals("f")%>){
		alert('마일나리가 300이상이어야 입양 신청이 가능합니다.\n마일나리는 미니홈피 글 작성이나 자원봉사/펫 도우미 참여로 획득할 수 있습니다.');
		history.back();
	}else{
		alert('입양 조건에 부합하지 않습니다.');
		history.back();
	}
	/* history.back(); */
}
checkQuest();
</script>
</html>
<%@ include file="/static/pages/footer.jsp"%>