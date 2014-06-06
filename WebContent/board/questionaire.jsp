<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/frame.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Questionaire check!</title>
<script language=javascript>
function checkQuest(){
	alert('checkQuest 실행');
	if(<%=request.getAttribute("result").toString().equals("t")%>){
		alert('if문 실행');
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
</head>
<body>
[<%=request.getAttribute("result").toString().equals("t")%>]
</body>
</html>