/**
 * 작성자 : 장재희
 * 작성일 : 2014-06-07
 * 내용 : 유기견 신고 게시판 ajax
 * 
 * 수정자 : 이수진
 * 수정일 : 2014-06-10
 * 내용 : 사진 클릭하면 원래 사진이 뜨도록 구현
 * 
 */
$(function(){
	$.ajaxSetup({
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
		type:"post"
	});
	
	function getMdogList() {
		$.ajax({
			url: "/gaenari/missingBoardList.do",
			dataType: "xml",
			success: function(data) {
				$('.explore-search-results').empty();
				var bc="";
				
				$(data).find('item').each(function (index){
					bc += "<div class='board-container'>";
					bc += "<div class='mfboard-card'>";
					bc += "<div class='mfboard-card-background'>";
					bc += "<div class='mfboard-card-image-wrapper'>";
					bc += "<a class='mfboard-card-image' href='/gaenari/missingBoardView.do?mbrdno="+$(this).find("mbrdno").text()+
							"' data-original='"+$(this).find("picPath").text()+
							"' style='display: block; background-image: url("+$(this).find("picPath").text()+");'></a>";
					bc += "</div>";
					bc += "<div class='mfboard-card-content'>";
					bc += "<div class='mfboard-card-title'>";
					bc += "<a href='/gaenari/missingBoardView.do?mbrdno="+$(this).find("mbrdno").text()+"'>"+$(this).find("title").text()+"</a>";
					bc += "</div><div class='mfboard-card-author'>";
					bc += "<b>"+$(this).find("mloc").text()+"</b>에서 ON "+$(this).find("mdate").text();
					bc += "</div></div> </div> </div> </div>";
				});	
				
				//alert(table);
				$('.explore-search-results').html(bc);
			},
			error: function(data) {alert(data+' => 에러 발생');}
			
		});
	}
	getMdogList();
	
	$("#datepicker").datepicker();

});

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
	if (func.mloc.value == "") {
		alert("분실장소를 입력해 주세요.");
		return false;
	}
	if (func.mdate.value == "") {
		alert("분실날짜를 입력해 주세요.");
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