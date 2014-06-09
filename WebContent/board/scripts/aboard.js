/**
 * 작성자 : 이수진
 * 작성일 : 2014-06-09
 * 내용 : 유기견 입양 게시판 ajax
 */
$(function(){
	$.ajaxSetup({
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
		type:"post"
	});
	
	function getMdogList() {
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
	getMdogList();
	
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