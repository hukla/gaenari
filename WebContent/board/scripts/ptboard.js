/**
 * 작성자: 장재희
 * 작성일: 2014-06-07
 * 내용: 펫 도우미 게시판 js파일
 */
function send() {
	if (document.requestForm.command.value != "")
		return true;
	else
		return false;
}
function ptDelete(ptbrdno) {
	if(confirm("삭제하시겠습니까?")) {
		location.href = "/gaenari/ptBoardDelete.do?ptbrdno=" + ptbrdno;
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
	if (func.worktype.value == "") {
		alert("작업종류를 입력해 주세요.");
		return false;
	}
	if (func.workloc.value == "") {
		alert("작업장소를 입력해 주세요.");
		return false;
	}
	if (func.workhour.value == "") {
		alert("작업시간을 입력해 주세요.");
		return false;
	}
	return true;
}

$(function() {
    $( "#datepicker" ).datepicker();
  });