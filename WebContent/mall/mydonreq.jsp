<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/frame.jsp" %>
<%@ include file="/mall/menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 기부 내역 확인 페이지</title>
</head>
<body>
<table width='80%'>
	<tr>
		<td>
			<font size='8'><strong>나의 요청 내역</strong></font>
		</td>
	</tr>
	<tr>
		<td>
			<table id='my_donreq_list'>
				<tr>
					<td>#</td>
					<td>상품명</td>
					<td>가격</td>
					<td>수량</td>
					<td>마감여부</td>
				</tr>
				<tr>
					<td colspan='6'>로딩중...</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

<script>
$(function(){
	$.ajaxSetup({
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
		type:"post"
	});
	
	function getMyDonList() {
		$.ajax({
			url: "/gaenari/getMyDonList.do",
			dataType: "xml",
			success: function(data) {
				//alert("success");
				$("#my_donreq_list tr:gt(0)").remove();
				var table="";
				
				$(data).find('donreq').each(function (index){
					table += "<tr>";
					table += "<td>"+$(this).find("drno").text()+"</td>";
					table += "<td>"+$(this).find("itemname").text()+"</td>";
					table += "<td>"+$(this).find("price").text()+"</td>";
					table += "<td>"+$(this).find("qty").text()+"</td>";
					if($(this).find("sent").text() == 'Y') {
						table += "<td><font color='red'><strong>마감됨</strong></font></td>";	
					} else {
						table += "<td><input type='button' name='"+$(this).find("drno").text()+"'id='term_req' value='요청 마감'></td>";	
					}
					table += "</tr>";
				});
				
				$('#my_donreq_list tr:eq(0)').after(table);
			},
			error: function(data) { alert(data+' => 에러 발생');}
			
		});// ajax 끝
	}// getMyDonList() 함수 끝
	
	// 마감하기 버튼 클릭시
	$(document).on('click',"#term_req", function(){
		$.ajax({
			url: "/gaenari/sendDonreq.do",
			dataType: "text",
			data: "drno="+$(this).attr("name"),
			success: function(data) {
				if(data > 0) {
					alert('마감처리되었습니다.');
					getDonList();
				} else {
					alert('마감되지 않았습니다');
				}
			},
			error: function(data) { alert(data+' => 에러 발생');}
		});// ajax 끝
	}); // 마감하기 버튼 처리 끝
	
	getMyDonList();
	
});

</script>
</html>