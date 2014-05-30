/**
 * 작성: 최성훈
 * 작성일: 2014-05-28
 * 내용: 아이디중복체크 비동기화통신이용
 * 
 * 추가: 2014-05-29,최성훈
 * 내용: 친구검색결과 얻어오고, 결과정보(user정보미리보기)확인 기능
 */
$(document).ready(function() {

	$.ajaxSetup({
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',type:"post"
	});
	
	$("#btn").click(function(){
		$.ajax({
			url:"/gaenari/searchFriends.do",
			dataType: "xml",
			data: $("#inForm").serialize(),
			success: function (data){
				
				$("#listTable tr:gt(0)").remove();
				var table="";
				
				$(data).find('user').each(function (index){
					table+="<tr>"
					table+="<td>"+$(this).find("username").text()+"</td>"
					table+="<td>"+$(this).find("userid").text()+"</td>"
					table+="<td>"+$(this).find("dogname").text()+"</td>"
					table+="<td>"+$(this).find("dogkind").text()+"</td>"
					table+="<td>"+$(this).find("address").text()+"</td>"
					table+="<td id='sendReq'><input type='button' value='정보보기' id='getinfo'" +
							" name='"+$(this).find("userid").text()+"'></td>"
					table+="</tr>"
				})
				$("#listTable tr:eq(0)").after(table);
			},
			error: function (data){alert(data+'=>에러발생');}
		});
	})
	
	
	$("table").on("click",'#getinfo',function(){
		$.ajax({
			url : "/gaenari/getfriendInfo.do",
			dataType : "text",
			data : "userid="+$(this).attr("name"),
			success : function(data) {
				$("#display").load("/gaenari/userinfo.do","userid="+data);
			},
			error : function(data) {
				alert(data + '=> 에러발생');
			}
		});
	})
	
	$("table").on("click",'#btn2',function(){
		$.ajax({
			url : "/gaenari/getfriendInfo.do",
			dataType : "text",
			data : "userid="+$(this).attr("name"),
			success : function(data) {
				$("#display").unload();
			},
			error : function(data) {
				alert(data + '=> 에러발생');
			}
		});
	})
	
	
	
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