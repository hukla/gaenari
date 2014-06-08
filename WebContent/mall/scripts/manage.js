/**
 *
 */
$(function () {
    $.ajaxSetup({
        contentType: 'application/x-www-form-urlencoded;charset=UTF-8',
        type: "post"
    });
    
    var progressbar = $('#mgt-pgbar');
    
    function getDonList() {
        $.ajax({
            url: "/gaenari/getDonList.do",
            dataType: "xml",
            success: function (data) {
                //alert("success");
            	
            	 var datalength = $(data).find('listlength').text();
                 var progress = 100 / datalength;
            	
                $("#don_mgt tr:gt(0)").remove();
                var table = "";
                
                $(data).find('donreq').each(function (index) {
                	
                    progressbar.css('width', progress * (index + 1) + '%');
                	
                    table += "<tr>";
                    table += "<td>" + (index+1) + "</td>";
                    table += "<td>" + $(this).find("userid").text() + "</td>";
                    table += "<td>" + $(this).find("targetcntr").text() + "</td>";
                    table += "<td>" + $(this).find("itemname").text() + "</td>";
                    table += "<td>" + $(this).find("qty").text() + "</td>";
                    if ($(this).find("sent").text() == 'N') {
                        table += "<td id='reqSend'>" + "<input type='button' class='btn btn-yellow' value='배송하기' id='send' name='" + $(this).find("drno").text() + "'>" +
                            "</td>";
                    } else {
                        table += "<td>배송 완료</td>";
                    }
                    table += "</tr>";
                });
                $('#don_mgt tr:eq(0)').after(table);
            },
            error: function (data) {
                alert(data + ' => 에러 발생');
            }
        }); // ajax 끝
    } // getDonReq() 함수 끝
    function getItemList() {
        $.ajax({
            url: "/gaenari/itemList.do",
            dataType: "xml",
            success: function (data) {
                //alert("success");
            	 var datalength = $(data).find('listlength').text();
                 var progress = 100 / datalength;
            	
                $("#item_mgt tr:gt(0)").remove();
                var table = "";
                $(data).find('item').each(function (index) {
                    progressbar.css('width', progress * (index + 1) + '%');
                    table += "<tr>";
                    table += "<td>" + (index+1) + "</td>";
                    table += "<td>" + $(this).find("itemname").text() + "</td>";
                    table += "<td>" + $(this).find("price").text() + "</td>";
                    table += "<td>" + $(this).find("qty").text() + "</td>";
                    table += "<td>" + "<div class='delmod' onclick='modifyItem(" + $(this).find("itemno").text() + ")'>수정하기</div>" + "</td>";
                    table += "<td>" + "<div class='delmod' onclick='deleteItem(" + $(this).find("itemno").text() + ")'>삭제하기</div>" + "</td>";
                    table += "</tr>";
                });
                table += "<tr><td colspan='6' align='center'><button class='btn btn-yellow' onclick='insertItem()'>상품 등록하기</button></td></tr>"
                $('#item_mgt tr:eq(0)').after(table);
            },
            error: function (data) {
                alert(data + ' => 에러 발생');
            }
        }); // ajax 끝
    } // getItemList() 함수 끝
    function getDonReqList() {
        $.ajax({
            url: "/gaenari/getDonreqList.do",
            dataType: "xml",
            success: function (data) {
                //alert("success");
            	
            	 var datalength = $(data).find('listlength').text();
                 var progress = 100 / datalength;
            	
                $("#donreq_mgt tr:gt(0)").remove();
                var table = "";
                $(data).find('donreq').each(function (index) {
                	
                    progressbar.css('width', progress * (index + 1) + '%');

                    table += "<tr>";
                    table += "<td>" + (index+1) + "</td>";
                    table += "<td>" + $(this).find("userid").text() + "</td>";
                    table += "<td>" + $(this).find("cntrname").text() + "</td>";
                    table += "<td>" + $(this).find("itemname").text() + "</td>";
                    table += "<td>" + $(this).find("qty").text() + "</td>";
                    if ($(this).find("sent").text() == 'N') {
                        table += "<td id='reqSend'>" + "<input type='button' class='btn btn-yellow' value='요청마감하기' id='term_req' name='" + $(this).find("drno").text() + "'>" +
                            "</td>";
                    } else {
                        table += "<td>요청마감</td>";
                    }
                    table += "</tr>";
                });
                $('#donreq_mgt tr:eq(0)').after(table);
            },
            error: function (data) {
                alert(data + ' => 에러 발생');
            }
        }); // ajax 끝
    } // getDonReq() 함수 끝
    
    // 배송하기 버튼 클릭시
    $(document).on('click', "#send", function () {
        $.ajax({
            url: "/gaenari/sendDonreq.do",
            dataType: "text",
            data: "drno=" + $(this).attr("name"),
            success: function (data) {
                $('.manage-state').empty();
                
                var statemsg = "";
                
                if (data > 0) {
                	statemsg += "<div class='alert alert-warning alert-dismissable'>";
            		statemsg += "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>";
            		statemsg += "<strong>배송처리되었습니다.</strong>";
            		statemsg += "</div>";
                    getDonList();
                } else {
                	statemsg += "<div class='alert alert-warning alert-dismissable'>";
            		statemsg += "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>";
            		statemsg += "<strong>배송되지않았습니다.</strong>";
            		statemsg += "</div>";
                }
                
                $('.manage-state').html(statemsg);
            },
            error: function (data) {
                alert(data + ' => 에러 발생');
            }
        }); // ajax 끝
    }); // 배송하기 버튼 처리 끝
    
 // 마감하기 버튼 클릭시
    $(document).on('click', "#term_req", function () {
        $.ajax({
            url: "/gaenari/sendDonreq.do",
            dataType: "text",
            data: "drno=" + $(this).attr("name"),
            success: function (data) {
            	$('.manage-state').empty();
                
                var statemsg = "";
                
                if (data > 0) {
                	statemsg += "<div class='alert alert-warning alert-dismissable'>";
            		statemsg += "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>";
            		statemsg += "<strong>마감처리되었습니다.</strong>";
            		statemsg += "</div>";
                    getDonList();
                } else {
                	statemsg += "<div class='alert alert-warning alert-dismissable'>";
            		statemsg += "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>";
            		statemsg += "<strong>마감되지않았습니다.</strong>";
            		statemsg += "</div>";
                }
                
                $('.manage-state').html(statemsg);
            },
            error: function (data) {
                alert(data + ' => 에러 발생');
            }
        }); // ajax 끝
    }); // 마감하기 버튼 처리 끝
    
    // '수정하기', '삭제하기' mouseover event 
    $(document).on('mouseover', '.delmod', function () {
        $(this).css("text-decoration", "underline");
    }); // '수정하기', '삭제하기' mouseover event 끝
    // '수정하기', '삭제하기' mouseleave event 
    $(document).on('mouseleave', '.delmod', function () {
        $(this).css("text-decoration", "none");
    }); // '수정하기', '삭제하기' mouseleave event 끝
    $("#refresh").click(function () {
        window.location.reload();
    });
    getDonList();
    getDonReqList();
    getItemList();
});

// '삭제하기' 버튼 클릭시 호출되는 함수
function deleteItem(itemno) {
	var res = confirm("정말 삭제하시겠습니까?");
	var newwindow;
	var url = "/gaenari/rmItem.do?itemno="+itemno;
	if(res == true) {
		newwindow=window.open(url,'삭제 완료','height=150,width=400');
		if(window.focus) {
			newwindow.focus;			
		}
	}
	window.location.reload();
}// '삭제하기' 끝

// '수정하기' 버튼 클릭시 호출되는 함수
function modifyItem(itemno) {
	var newwindow;
	var url ="/gaenari/itemUpdateForm.do?itemno="+itemno;
	
	newwindow=window.open(url, '상품 상세 정보 수정 페이지', 'height=550,width=660');
	if(window.focus) {
		newwindow.focus;
	}
}// '수정하기' 끝

// '등록하기' 버튼 클릭시 호출되는 함수
function insertItem() {
	var newwindow;
	var url = "/gaenari/itemInsertForm.do";
	
	newwindow = window.open(url, '상품 등록 페이지', 'height=550,width=660');
	if(window.focus) {
		newwindow.focus;
	}
}// '등록하기' 끝