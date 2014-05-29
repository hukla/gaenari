$(document).ready(function() {

	$.ajaxSetup({
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',type:"post"
	});
	
	$('#id').keyup(function() {
		//$("span").html($('#id').val());
		$.ajax({
			url : "/gaenari/idCheck.do",
			dataType : "text",
			data : "id="+$('#id').val(),
			success : function(data) {
				$("span").html(data);
			},
			error : function(data) {
				alert(data + '=> 에러발생');
			}
		});
	});

});