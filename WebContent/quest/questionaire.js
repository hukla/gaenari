$(function () {
        $.ajaxSetup({
            contentType: 'application/x-www-form-urlencoded;charset=UTF-8',
            type: "post"
        });
        
        
        function getBrdreqList() {
            $.ajax({
                url: "/gaenari/brdreqSelect.do",
                dataType: "json",
                data: "brdno="+$('.explore-search-results').data('brdno'),
                success: function (data) {
                    //alert(data);
                	
                	var list = data.brdtoList;
                	
                	if(data.brdtoList != 'empty') {
                	
	                    $("#reqbrd_list tr:gt(0)").remove();
	                    
	                    $.each(data.brdtoList, function (index, item) {
	                    	var brdreq = item; //alert(brdreq);
	                        
	                    	var line = $('<tr>');
	                    	
	                    	line.append($('<td>').html(index+1))
	                    		.append($('<td>').html(brdreq.doginfo+"마리"))
	                    		.append($('<td>').html('<a href="#">결과 확인</a>'))
	                    		.append($('<td>').html(brdreq.point))
	                    		.append($('<td>').html(brdreq.address));
	                    	
	                    	if (true) {
	                        	line.append($('<td>').attr('id', 'reqSend').append($("<input type='button' class='btn btn-yellow' value='수락하기' id='send' name='" + $(this).find("drno").text() + "'>")));
	                        } else {
	                        	line.append('<td>수락됨</td>');
	                        }
	                        //alert(line);
	                        $('#reqbrd_list tr:eq(0)').after(line);
	                    });
                	}
                    
                },
                error: function (data) {
                	alert($('.explore-search-results').data('brdno'));
                    alert(data + ' => 에러 발생');
                }
            }); // ajax 끝
        } // getBrdreqReq() 함수 끝
        
        getBrdreqList();
    });

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