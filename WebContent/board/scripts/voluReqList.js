    $(function () {
        $.ajaxSetup({
            contentType: 'application/x-www-form-urlencoded;charset=UTF-8',
            type: "post"
        });
        
        
        function getVoluReqList() {
            $.ajax({
                url: "/gaenari/voluReqSelect.do",
                dataType: "json",
                data: "brdno="+$('.explore-search-results').data('brdno'),
                success: function (data) {
                    //alert(data);
                	
                	var list = data.brdtoList;
                	var size = data.brdtoList.length;
                	
                	if(data.brdtoList != 'empty') {
                	
	                    $("#reqbrd_list tr:gt(0)").remove();
	                    
	                    $.each(data.brdtoList, function (index, item) {
	                    	var brdreq = item; //alert(brdreq);
	                        
	                    	var line = $('<tr>');
	                    	
	                    	line.append($('<td>').html(size-index))
	                    		/* .append($('<td>').html(brdreq.name)) */
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
        } // getVoluReqList() 함수 끝
        
        getVoluReqList();
    });