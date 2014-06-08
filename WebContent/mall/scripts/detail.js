/**
 *
 */
function popupOpen(itemno) {
    var popUrl = "mall/img/" + itemno + ".jpg"; //팝업창에 출력될 페이지 URL
    var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
    window.open(popUrl, "", popOption);
}
// 수량 추가
function qty_add(x) {
    var res = parseInt(document.itemlist.ct_qty.value) + parseInt(x);
    if (res > 0) {
        document.itemlist.ct_qty.value = res;
    }
}
// 수량 키보드 입력 예외 처리
function qty_keyup() {
    if (parseInt(document.itemlist.ct_qty.value) < 0) {
        document.itemlist.ct_qty.value = 1;
    }
}
$(function () {
    // selected되면 값을 hidden에 저장
    $('#target_sel').blur(function () {
        $('#cntr_name').val($('#target_sel option:selected').text());
        //alert($('#cntr_name').val());
    });
    // user type에 따라 submit action 다르게 하기
    $('#item_list').submit(function () {
        // 기부 대상 선택하지 않으면 에러메시지 출력
        //alert($('#target_sel option:selected').val());
        if ($('#target_sel option:selected').val() == 0) {
            alert("기부할 대상을 선택해주세요!");
            return false;
        }
        //alert($('input[name=usertype]').val());
        if ($('input[name=usertype]').val() == 0) {
            $('#item_list').prop('action', '/gaenari/donnate.do');
            alert($('#item_list').prop('action').val());
            return true;
        } else if ($('input[name=usertype]').val() > 0) {
            $('#item_list').prop('action', '/gaenari/mallRequest.do');
            return true;
        } else if ($('input[name=usertype]').val() < 0) {
            var newwindow;
            var url = "/gaenari/itemUpdateForm.do?itemno=" + $('input[name=selectedItemNo]').val();
            newwindow = window.open(url, '상품 상세 정보 수정 페이지', 'height=550,width=660');
            if (window.focus) {
                newwindow.focus;
            }
        } else {
            alert("로그인해주세요!");
        }
        $('#item_list').submit();
    });
});