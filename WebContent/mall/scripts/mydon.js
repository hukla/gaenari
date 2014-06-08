/**
 * 
 */
$(function(){
	$.ajaxSetup({
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
		type:"post"
	});
	
    var progressbar = $('#mydon-pgbar');
	
	function getMyDonList() {
		$.ajax({
			url: "/gaenari/getMyDonList.do",
			dataType: "xml",
			success: function(data) {
				
                var datalength = $(data).find('listlength').text();
                var progress = 100 / datalength;

				$("#my_don_list tr:gt(0)").remove();
				var table="";
				
				$(data).find('donreq').each(function (index){
                    progressbar.css('width', progress * (index + 1) + '%');
					
					table += "<tr>";
					table += "<td>"+(parseInt(index)+1)+"</td>";
					table += "<td>"+$(this).find("itemname").text()+"</td>";
					table += "<td>"+$(this).find("targetcntr").text()+"</td>";
					table += "<td>"+$(this).find("price").text()+"</td>";
					table += "<td>"+$(this).find("qty").text()+"</td>";
					table += "<td>"+$(this).find("price").text() * $(this).find("qty").text() + "</td>";
					if($(this).find("sent").text() == 'N') {
						table += "<td><font color='red'><strong>배송 준비중</strong></font></td>";	
					} else {
						table += "<td>배송 완료</td>";	
					}
					table += "</tr>";
				});
				
				$('#my_don_list tr:eq(0)').after(table);
                $('.progress').remove();

			},
			error: function(data) { alert(data+' => 에러 발생');}
			
		});// ajax 끝
	}// getMyDonList() 함수 끝

	getMyDonList();
	
});