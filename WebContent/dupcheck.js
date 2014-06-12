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
					table+="<td id='sendReq' align='center'>"+$(this).find("username").text()
						+"<br><div class='btn-group btn-group-xs'>"
						+"<input type='button' class='btn btn-default' value='정보보기' id='getget' name='"
						+$(this).find("userid").text()+"'><input type='button' class='btn btn-default' value='닫기' id='removeinfo' name='"+$(this).find("userid").text()+"'></div></td>"
					table+="<td>"+$(this).find("userid").text()+"</td>"
					table+="<td>"+$(this).find("email").text()+"</td>"
					table+="<td>"+$(this).find("address").text()+"</td>"
					table+="<td>"+$(this).find("dogage").text()+"마리 </td>"
					table+="</tr>"
					//<input type='button' class='btn btn-default' id='removeinfo' value='취소'>
				})
				$("#listTable tr:eq(0)").after(table);
			},
			error: function (data){alert('입력정보가 없습니다.');}
		});
	})
	$("table").on("click",'#getget',function(){
		$.ajax({
			url : "/gaenari/getfriendInfo.do",
			dataType : "text",
			data : "userid="+$(this).attr("name"),
			success : function(data) {
				$("#display").load("/gaenari/friendsinfo.do","userid="+data);
				
			},
			error : function(data) {
				alert(data + '=> 에러발생');
			}
		});
	})
	$("#btn2").click(function(){
		$.ajax({
			url:"/gaenari/searchFriends.do",
			dataType: "xml",
			data: $("#inForm").serialize(),
			success: function (data){
				
				$("#listTable tr:gt(0)").remove();
				var table="";
				$(data).find('user').each(function (index){
					table+="<tr>"
					table+="<td></td>"
					table+="<td></td>"
					table+="<td></td>"
					table+="<td></td>"
					table+="<td></td>"
					table+="<td id='sendReq'></td>"
					table+="</tr>"
				})
				$("#listTable tr:eq(0)").after(table);
				
			},
			error: function (data){alert('입력정보가 없습니다.');}
		});
	})
	$("#plncheck").click(function(){
		$.ajax({
			url:"/gaenari/checkPlan.do",
			dataType: "text",
			data: "brdno="+$(this).attr("name"),
			success: function (data){
				if(data>0){
					alert("마일나리가 3포인트 적립되었습니다.");
					location.href="/gaenari/planDetail.do?brdno="+$("#plncheck").attr("name")+"&milenari="+1+"&userid=${requestScope.user.userid}";
				}else{
					alert("일정이 완료되지 않았습니다.");
				}
			},
			error: function (data){alert(data+'=>에러발생');}
		});
	});
	//////////////////////////////////////////////////////////////////////////////////14-05-31 하던중
	$("#dogbtn").click(function(){
		$.ajax({
			url:"/gaenari/modDogname.do",
			dataType: "text",
			data: "dogname="+$(this).attr("name"),
			success: function (data){
				if(data>0){
					alert("변경되었습니다.");
				}else{
					alert("변경에 실패했습니다.");
				}
			},
			error: function (data){alert(data+'=>에러발생');}
		});
	})
	
	
	
	$("table").on("click",'#removeinfo',function(){
		$.ajax({
			url : "/gaenari/getfriendInfo.do",
			dataType : "text",
			data : "userid="+$(this).attr("name"),
			success : function(data) {
				$("#display").empty();
			},
			error : function(data) {
				alert(data + '=> 에러발생');
			}
		});
	})
	$("#here").click(function(){
		$.ajax({
			url : "/gaenari/getfriendInfo.do",
			dataType : "text",
			data : "userid="+$(this).attr("name"),
			success : function(data) {
				$("#display").load("/gaenari/friendsinfo.do","userid="+data);
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
