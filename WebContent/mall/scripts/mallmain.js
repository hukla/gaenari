/**
 *
 */
$(function () {
    $.ajaxSetup({
        contentType: 'application/x-www-form-urlencoded;charset=UTF-8',
        type: "post"
    });

    var progressbar = $('#mgt-pgbar');

    function getItemList() {
        $.ajax({
            url: "/gaenari/itemList.do",
            dataType: "xml",
            success: function (data) {
                var datalength = $(data).find('listlength').text();
                //alert(datalength);

                var progress = 100 / datalength;

                $('#item_list').empty();
                var table = "";
                $(data).find('item').each(
                    function (index) {
                        progressbar.css('width', progress * (index + 1) + '%');

                        table += "<li><form id='item' method='post'>";
                        table += "<input type='hidden' name='selectedItemNo' value='" +
                            $(this).find("itemno").text() + "'><input type='hidden' name='price' value='" +
                            $(this).find("price").text() + "'><input type='hidden' name='gnr_point' value='" +
                            (parseInt($(this).find("price").text()) * 0.05) + "'><input type='hidden' name='don_target'>";
                        table += "<input type='hidden' name='item_name' value='" + $(this).find('itemname').text() + "'><input type='hidden' name='cntrname'>";
                        table += "<div class='item-image'>";
                        table += "<a href='/gaenari/mallDetail.do?itemno=" +
                        	$(this).find("itemno").text() + "'><img class='item_img' id='img_1' src='/gaenari/mall/img/" +
                            $(this).find("itemno").text() + ".jpg' width='160' height='160' border='0' align='absmiddle'></a></div>";
                        table += "<div class='item-name'>";
                        table += "<a href='/gaenari/mallDetail.do?itemno=" +
                            $(this).find("itemno").text() + "'>" + $(this).find('itemname').text() + "</a></div>";
                        table += "<div class='item-price'>";
                        table += "<span style='color:#c33;font-weight:bold;'>\\ </span><span class='item_price'>" + $(this).find("price").text() + "</span>&nbsp; &nbsp;<span class='label gaenarige-label'> <img src='/gaenari/static/images/gaenarige-icon.png' height='10px'> " +
                            (parseInt($(this).find("price").text()) * 0.05) + "</span></div>";
                        table += "</li>";
                    });
                //alert(table);
                $('#item_list').html(table);
                $('.progress').attr('class', 'progress progress-striped');
            },
            error: function (data) {
                alert(data + ' => 에러 발생');
            }

        }); // ajax 끝
    } // getItemList() 함수 끝

    // user type에 따라 submit action 다르게 하기
    $(document).on(
        'submit',
        '#item',
        function () {

            if ($('input[name=usertype]').val() == 0) {

                if ($(this).find('select option:selected').val() == 0) {
                    alert("기부할 대상을 선택해주세요!");
                    return false;
                } else {
                    $(this).find('input[name=don_target]').val(
                        $(this).find('select option:selected')
                        .val());
                    $(this).find('input[name=cntrname]').val(
                        $(this).find('select option:selected')
                        .text());
                    alert($(this).find('input[name=cntrname]').val());
                }

                $(this).attr('action', '/gaenari/donnate.do');
                return true;

            } else if ($('input[name=usertype]').val() > 0) {
                $(this).attr('action', '/gaenari/mallRequest.do');
                return true;
            } else if ($('input[name=usertype]').val() < 0) {
                var newwindow;
                var url = "/gaenari/itemUpdateForm.do?itemno=" + $(this).find('input[name=selectedItemNo]')
                    .val();

                newwindow = window.open(url, '상품 상세 정보 수정 페이지',
                    'height=550,width=660');
                if (window.focus) {
                    newwindow.focus;
                }
            } else {
                alert("로그인해주세요!");
            }
        });

    getItemList();

    // 수량 입력 유효성 검사
    $(document).on('blur', '.ct_qty', function () {
        //alert($(this).val());
        if (parseInt($(this).val()) < 0) {
            alert('1보다 큰 값을 입력해주세요!');
            $(this).val(1);
            $(this).focus();
        }
    }); // 수량 입력 유효성 검사 끝

});