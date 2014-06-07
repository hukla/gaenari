/**
 * 
 */
function send() {
	if (document.requestForm.command.value != "")
		return true;
	else
		return false;
}
function ptDelete(ptbrdno) {
	if (confirm("삭제하시겠습니까?")) {
		location.href = "/gaenari/ptBoardDelete.do?ptbrdno=" + ptbrdno;
	} else {
		alert("삭제가 취소되었습니다.");
		return;
	}
}