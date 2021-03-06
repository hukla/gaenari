/**
 * 작성자 : 이수진
 * 작성일 : 2014-06-09
 * 내용 : 유기견 입양 게시판 ajax
 * 
 * 수정자 : 이수진
 * 수정일 : 2014-06-10
 * 내용 : 사진 클릭하면 원래 사진이 뜨도록 구현
 */
$(function(){
	$.ajaxSetup({
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
		type:"post"
	});
	
	function getAdogList() {
		$.ajax({
			url: "/gaenari/adpBoardList.do",
			dataType: "xml",
			success: function(data) {
				$('.explore-search-results').empty();
				var bc="";
				
				$(data).find('item').each(function (index){
					bc += "<div class='board-container'>";
					bc += "<div class='mfboard-card'>";
					bc += "<div class='mfboard-card-background'>";
					bc += "<div class='mfboard-card-image-wrapper'>";
					bc += "<a class='mfboard-card-image' href='/gaenari/adpBoardView.do?abrdno="+$(this).find("abrdno").text()+
							"' data-original='"+$(this).find("picPath").text()+
							"' style='display: block; background-image: url("+$(this).find("picPath").text()+");'></a>";
					bc += "</div>";
					bc += "<div class='mfboard-card-content'>";
					bc += "<div class='mfboard-card-title'>";
					bc += "<a href='/gaenari/adpBoardView.do?abrdno="+$(this).find("abrdno").text()+"'>"+$(this).find("title").text()+"</a>";
					bc += "</div>";
					bc += "<div class='mfboard-card-author'>";
					bc += "ON "+$(this).find("wrdate").text();
					bc += "</div> </div> </div> </div> </div>"
				});	
				
				//alert(table);
				$('.explore-search-results').html(bc);
			},
			error: function(data) {alert(data+' => 에러 발생');}
			
		});
	}
	getAdogList();
	
	$("#datepicker").datepicker();

});

function checkValid() {
	var func = window.document.boardWriteForm; // 제목과 글 내용이 비면 넘어가지 않도록 하는 함수
	if (func.userid.value == "") {
		alert("세션이 종료되었습니다. 다시 로그인해주세요.");
		location.href = "/gaenari/login.do";
	}
	if (func.title.value == "") {
		alert("제목을 입력해 주세요.");
		return false;
	}
	if (func.brdcontent.value == "") {
		alert("내용을 입력해 주세요.");
		return false;
	}
	return true;
}
function popupOpen(result,brdno) {
	var popUrl = null;
	if(result=='true'){
		popUrl = "image/board/defaultDog.jpg";
	}else{
		popUrl = "image/board/" + brdno + ".jpg"; //팝업창에 출력될 페이지 URL
	}
    var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
    window.open(popUrl, "", popOption);
}
function checkQuest(brdno,abrdno){
	location.href="/gaenari/qualif.do?type=a&brdno="+brdno+"&abrdno="+abrdno;
}
function checkBrdStatus(brdno){
	var newwindow;
	var url = "/gaenari/brdreqList.do?brdno="+brdno+"&type=a";
	
	newwindow = window.open(url, '입양신청 확인 페이지','height=600,width=660,scrollbars=yes');
	if(window.focus){
		newwindow.focus;
	}
}