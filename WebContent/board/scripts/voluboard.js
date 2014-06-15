/**
 * 작성자: 이수진
 * 작성일: 2014-06-09
 * 내용: 자원봉사 게시판 js파일
 * 		삭제되어 재생성
 */
function send() {
	if (document.requestForm.command.value != "")
		return true;
	else
		return false;
}
function voluDelete(vbrdno) {
	if(confirm("삭제하시겠습니까?")) {
		location.href = "/gaenari/voluBoardDelete.do?vbrdno=" + vbrdno;
	}else {
		alert("삭제가 취소되었습니다.");
		return false;
	}
}

function checkValid() {
	var func = window.document.boardWriteForm; // 제목과 글 내용이 비면 넘어가지 않도록 하는 함수
	if (func.userid.value == "") {
		alert("세션이 종료되었습니다. 다시 로그인해주세요.");
		location.href = "/gaenari/login.do";
		return false;
	}
	if (func.title.value == "") {
		alert("제목을 입력해 주세요.");
		return false;
	}
	if (func.brdcontent.value == "") {
		alert("글 내용을 입력해 주세요.");
		return false;
	}
	if (func.vhour.value == "") {
		alert("봉사시간을 입력해 주세요.");
		return false;
	}
	return true;
}

$(function() {
    $( "#datepicker" ).datepicker();
  });

function apply(brdno,vbrdno){
	location.href="/gaenari/brdreqCheck.do?type=v&brdno="+brdno+"&vbrdno="+vbrdno;
}
function checkBrdStatus(brdno){
	var newwindow;
	var url = "/gaenari/brdreqList.do?brdno="+brdno+"&type=v";
	
	newwindow = window.open(url, '봉사신청 확인 페이지','height=600,width=660,scrollbars=yes');
	if(window.focus){
		newwindow.focus;
	}
}