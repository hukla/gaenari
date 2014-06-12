<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.dto.QuestionaireDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/static/pages/head.jsp"%>
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
	<div id="wrapper">
            <%@ include file="/static/pages/header.jsp"%>
            <div id="content">
                <%@ include file="/static/pages/menubar.jsp"%>
                <div class="container">
                    <!--TODO-->
                    <div id="ptboard-list-container">
                        <div class="ptboard-list-header">
                            <div class="ptboard-info" style="float: inherit;">
                                <div class="ptboard-info-title">애견 입양 적합도 테스트</div>
                                <div class="ptboard-info-description">애견 입양 적합도를 확인하기 위한 테스트입니다.</div>
                            </div>
                        </div>
  						<div class="ptboard-list">                
						<form name="questionaire" method="post" class="table ptboard-list" action="/gaenari/control?command=questionWrite" onSubmit='return checkValid()'>
		<p>다음의 질문에 간단하게 대답해 주세요.<br><br><br>
		1. 애완동물을 키운 경험이 있습니까?<br>
		<input type="radio" name="no1" value="Y">&nbsp; 예
		<input type="radio" name="no1" value="N">&nbsp; 아니오<br>
		2. 현재 거주하는 주거형태는?<br>
		<input type="radio" name="no2" value="apt">&nbsp; 아파트
		<input type="radio" name="no2" value="house">&nbsp; 단독주택
		<input type="radio" name="no2" value="room">&nbsp; 원룸<br>
		3. 현재 동거하는 다른 애완동물이 있습니까?<br>
		<input type="radio" name="no3" value="Y">&nbsp; 예
		<input type="radio" name="no3" value="N">&nbsp; 아니오<br>
		4. 가족 중 애완동물에 알레르기가 있거나 싫어하는 사람이 있습니까?<br>
		<input type="radio" name="no4" value="Y">&nbsp; 예
		<input type="radio" name="no4" value="N">&nbsp; 아니오<br>
		5. 애완동물을 입양할 경제적/심리적 준비가 되었다고 생각합니까?<br>
		<input type="radio" name="no5" value="Y">&nbsp; 예
		<input type="radio" name="no5" value="N">&nbsp; 아니오<br>
		<br><br><br>응답해 주신 자료는 암호화되어 관리되며 입양 신청 시 분양자에게 전달됩니다.<br>
		개인정보를 소중히 하는 개나리가 되겠습니다.<br><br><br></p>
		<center><input type="submit" value="제출하기"><input type="button" value="닫기" onclick='window.close()'></center>
		</form>
		</div>
	</body>
</html>
<%@ include file="/static/pages/footer.jsp"%>