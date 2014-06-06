/**
 * 작성자 : 장재희
 * 작성일 : 2014-06-07
 * 내용 : 유기견 신고 게시판 ajax
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
					bc += "<a href='/gaenari/missingBoardView.do?mbrdno="+$(this).find("mbrdno").text()+"'>실종 장소 : "+$(this).find("mloc").text()+"<br>";
					bc += "실종 날짜 : "+$(this).find("mdate").text()+"</a>";
					bc += "</div>";
					bc += "<div class='mfboard-card-author'>";
					bc += "ON "+$(this).find("mdate").text();
					bc += "</div> </div> </div> </div> </div>";
				});	
				
				//alert(table);
				$('.explore-search-results').html(bc);
			},
			error: function(data) {alert(data+' => 에러 발생');}
			
		});
	}
	getMdogList();
});