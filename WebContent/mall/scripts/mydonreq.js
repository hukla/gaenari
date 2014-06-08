/**
 *
 */
$(function () {
    $.ajaxSetup({
        contentType: 'application/x-www-form-urlencoded;charset=UTF-8',
        type: "post"
    });

    function getMyDonList() {
        $.ajax({
            url: "/gaenari/getMyDonList.do",
            dataType: "xml",
            success: function (data) {
                //alert("success");
            	
            	var progressbar = $('#mydonreq-pgbar');
                var datalength = $(data).find('listlength').text();
                var progress = 100 / datalength;
            	
                $("#my_donreq_list tr:gt(0)").remove();
                var table = "";
                $(data).find('donreq').each(function (index) {
                    progressbar.css('width', progress * (index + 1) + '%');

                    table += "<tr>";
                    table += "<td>" + (index+1) + "</td>";
                    table += "<td>" + $(this).find("itemname").text() + "</td>";
                    table += "<td>" + $(this).find("price").text() + "</td>";
                    table += "<td>" + $(this).find("qty").text() + "</td>";
                    if ($(this).find("sent").text() == 'Y') {
                        table += "<td><font color='red'><strong>마감됨</strong></font></td>";
                    } else {
                        table += "<td><input type='button' name='" + $(this).find("drno").text() + "'id='term_req' class='btn btn-yellow' value='요청 마감하기'></td>";
                    }
                    table += "</tr>";
                });
                $('#my_donreq_list tr:eq(0)').after(table);
            },
            error: function (data) {
                alert(data + ' => 에러 발생');
            }
        }); // ajax 끝
    } // getMyDonList() 함수 끝
    // 마감하기 버튼 클릭시
    $(document).on('click', "#term_req", function () {
        $.ajax({
            url: "/gaenari/sendDonreq.do",
            dataType: "text",
            data: "drno=" + $(this).attr("name"),
            success: function (data) {
                if (data > 0) {
                    alert('마감처리되었습니다.');
                    getDonList();
                } else {
                    alert('마감되지 않았습니다');
                }
            },
            error: function (data) {
                alert(data + ' => 에러 발생');
            }
        }); // ajax 끝
    }); // 마감하기 버튼 처리 끝
    getMyDonList();
});