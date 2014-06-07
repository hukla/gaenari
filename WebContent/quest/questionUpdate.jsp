<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="model.dto.QuestionaireDTO" %>
<%@ include file="/frame.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>애견 입양 적합도 테스트 수정</title>
<SCRIPT language=javascript>
	function checkValid() {
		var func = window.document.questionaire; // 제목과 글 내용이 비면 넘어가지 않도록 하는 함수
		if (func.no1.value == "" || func.no2.value == "" || func.no3.value == ""
			 || func.no4.value == "" || func.no5.value == "") {
			alert("문항에 빠짐없이 응답해 주세요.");
			return false;
		}else{
			return true;
		}
	}
</SCRIPT>
</head>
<body>
<form name="questionaire" method="post" action="/gaenari/control?command=questionUpdate" onSubmit='return checkValid()'>
<p>다음의 질문에 간단하게 대답해 주세요.<br><br><br>
1. 애완동물을 키운 경험이 있습니까?<br>
<%
	QuestionaireDTO qdto = null;
	qdto=(QuestionaireDTO)request.getAttribute("resultContent");
	String q1=qdto.getQ1();
	String q2=qdto.getQ2();
	String q3=qdto.getQ3();
	String q4=qdto.getQ4();
	String q5=qdto.getQ5();
%>
<input type="radio" name="no1" value="Y" <%=(q1.equals("Y")?"checked":"") %>>&nbsp; 예
<input type="radio" name="no1" value="N" <%=(q1.equals("N")?"checked":"") %>>&nbsp; 아니오<br>
2. 현재 거주하는 주거형태는?<br>
<input type="radio" name="no2" value="apt" <%=(q2.equals("apt")?"checked":"") %>>&nbsp; 아파트
<input type="radio" name="no2" value="house" <%=(q2.equals("house")?"checked":"") %>>&nbsp; 단독주택
<input type="radio" name="no2" value="room" <%=(q2.equals("room")?"checked":"") %>>&nbsp; 원룸<br>
3. 현재 동거하는 다른 애완동물이 있습니까?<br>
<input type="radio" name="no3" value="Y" <%=(q3.equals("Y")?"checked":"") %>>&nbsp; 예
<input type="radio" name="no3" value="N" <%=(q3.equals("N")?"checked":"") %>>&nbsp; 아니오<br>
4. 가족 중 애완동물에 알레르기가 있거나 싫어하는 사람이 있습니까?<br>
<input type="radio" name="no4" value="Y" <%=(q4.equals("Y")?"checked":"") %>>&nbsp; 예
<input type="radio" name="no4" value="N" <%=(q4.equals("N")?"checked":"") %>>&nbsp; 아니오<br>
5. 애완동물을 입양할 경제적/심리적 준비가 되었다고 생각합니까?<br>
<input type="radio" name="no5" value="Y" <%=(q5.equals("Y")?"checked":"") %>>&nbsp; 예
<input type="radio" name="no5" value="N" <%=(q5.equals("N")?"checked":"") %>>&nbsp; 아니오<br>
<br><br><br>응답해 주신 자료는 암호화되어 관리되며 입양 신청 시 분양자에게 전달됩니다.<br>
개인정보를 소중히 하는 개나리가 되겠습니다.<br><br><br></p>
<center><input type="submit" value="수정하기"><input type="button" value="닫기" onclick='window.close()'></center>
</form>
</body>
<script type="text/javascript">
var resultWorkType = document.getElementById("worktype");
var worktypes = document.getElementsByName("worktype");

for(var i = 0; i < worktypes.length; i++) {
	if(worktypes[i].value == resultWorkType.value) {
		worktypes[i].attr("checked").val("checked");
	}
}
// TODO
</script>
</html>
<%@ include file="../bottom.jsp"%>