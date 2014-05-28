<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/frame.jsp" %>
<%@ include file="/mall/menu.jsp"%>
<!-- 
	2014-05-27 수정 장재희
	db가져오기 ajax로 변경
 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 관리 페이지</title>
</head>
<body>

<table>
<tr>
	<td width="600px">
	<!-- 상품 관리 테이블 -->
	<table id="item_mgt">
		<tr>
			<td colspan="6"><font size="8"><strong>상품 관리</strong></font></td>
		</tr>
		<!-- <tr>
			<td colspan="6"><button id="refresh">새로 고침</button></td>
		</tr> -->
		<tr>
			<td>#</td>
			<td>상품명</td>
			<td>상품가격</td>
			<td>수량</td>
			<td>수정하기</td>
			<td>삭제하기</td>
		</tr>
		<tr>
			<td colspan="6" align="center">로딩중...</td>
		</tr>
	</table>
	<!-- 상품 관리 테이블 끝 -->
	</td>
	<td width="600px">
	<!-- 기부 관리 테이블 -->
	<table id="don_mgt">
		<tr>
			<td colspan="6"><font size="8"><strong>기부 관리</strong></font></td>
		</tr>
		<!-- <tr>
			<td colspan="6"><button id="refresh">새로 고침</button></td>
		</tr> -->
		<tr>
			<td>#</td>
			<td>기부자</td>
			<td>기부 대상</td>
			<td>상품명</td>
			<td>수량</td>
			<td>배송하기</td>
		</tr>
		<tr>
			<td colspan="6" align="center">로딩중...</td>
		</tr>
	</table>
	<!-- 기부 관리 테이블 끝-->
	</td>
</tr>
<tr>
	<td width="600px">
	<!-- 기부 요청 관리 테이블 -->
	<table id="donreq_mgt">
		<tr>
			<td colspan="6"><font size="8"><strong>기부 요청 관리</strong></font></td>
		</tr>
		<tr>
			<td>#</td>
			<td>요청자</td>
			<td>요청센터명</td>
			<td>상품명</td>
			<td>수량</td>
			<td>요청 마감하기</td>
		</tr>
		<tr>
			<td colspan="6" align="center">로딩중...</td>
		</tr>
	</table>
	<!-- 기부 요청 테이블 끝-->
	</td>
	<td width='600px'>
	암것도없지ㅓㄹㅇ
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
	
	function getDonList() {
		$.ajax({
			url: "/gaenari/getDonList.do",
			dataType: "xml",
			success: function(data) {
				//alert("success");
				$("#don_mgt tr:gt(1)").remove();
				var table="";
				
				$(data).find('donreq').each(function (index){
					table += "<tr>";
					table += "<td>"+$(this).find("drno").text()+"</td>";
					table += "<td>"+$(this).find("userid").text()+"</td>";
					table += "<td>"+$(this).find("targetcntr").text()+"</td>";
					table += "<td>"+$(this).find("itemname").text()+"</td>";
					table += "<td>"+$(this).find("qty").text()+"</td>";
					if($(this).find("sent").text() == 'N') {
						table += "<td id='reqSend'>"+"<input type='button' value='배송하기' id='send' name='"
						+$(this).find("drno").text()+"'>"+"</td>";	
					} else {
						table += "<td>배송 완료</td>";	
					}
					table += "</tr>";
				});
				
				$('#don_mgt tr:eq(1)').after(table);
			},
			error: function(data) { alert(data+' => 에러 발생');}
			
		});// ajax 끝
	}// getDonReq() 함수 끝
	
	function getItemList() {
		$.ajax({
			url: "/gaenari/itemList.do",
			dataType: "xml",
			success: function(data) {
				//alert("success");
				$("#item_mgt tr:gt(1)").remove();
				var table="";
				
				$(data).find('item').each(function (index){
					table += "<tr>";
					table += "<td>"+$(this).find("itemno").text()+"</td>";
					table += "<td>"+$(this).find("itemname").text()+"</td>";
					table += "<td>"+$(this).find("price").text()+"</td>";
					table += "<td>"+$(this).find("qty").text()+"</td>";
					table += "<td>"+"<div class='delmod' onclick='modifyItem("+$(this).find("itemno").text()+")'>수정하기</div>"+"</td>";
					table += "<td>"+"<div class='delmod' onclick='deleteItem("+$(this).find("itemno").text()+")'>삭제하기</div>"+"</td>";
					table += "</tr>";
				});
				
				table += "<tr><td colspan='6' align='center'><button onclick='insertItem()'>상품 등록하기</button></td></tr>"
				
				$('#item_mgt tr:eq(1)').after(table);
			},
			error: function(data) { alert(data+' => 에러 발생');}
			
		});// ajax 끝
	}// getItemList() 함수 끝
	
	function getDonReqList() {
		$.ajax({
			url: "/gaenari/getDonreqList.do",
			dataType: "xml",
			success: function(data) {
				//alert("success");
				$("#donreq_mgt tr:gt(1)").remove();
				var table="";
				
				$(data).find('donreq').each(function (index){
					table += "<tr>";
					table += "<td>"+$(this).find("drno").text()+"</td>";
					table += "<td>"+$(this).find("userid").text()+"</td>";
					table += "<td>"+$(this).find("cntrname").text()+"</td>";
					table += "<td>"+$(this).find("itemname").text()+"</td>";
					table += "<td>"+$(this).find("qty").text()+"</td>";
					if($(this).find("sent").text() == 'N') {
						table += "<td id='reqSend'>"+"<input type='button' value='요청마감하기' id='send' name='"
						+$(this).find("drno").text()+"'>"+"</td>";	
					} else {
						table += "<td>요청마감</td>";	
					}
					table += "</tr>";
				});
				
				$('#donreq_mgt tr:eq(1)').after(table);
			},
			error: function(data) { alert(data+' => 에러 발생');}
			
		});// ajax 끝
	}// getDonReq() 함수 끝
	
	// 배송하기 버튼 클릭시
	$(document).on('click',"#send", function(){
		$.ajax({
			url: "/gaenari/sendDonreq.do",
			dataType: "text",
			data: "drno="+$(this).attr("name"),
			success: function(data) {
				if(data > 0) {
					alert('배송처리되었습니다.');
					getDonList();
				} else {
					alert('배송되지 않았습니다');
				}
			},
			error: function(data) { alert(data+' => 에러 발생');}
		});// ajax 끝
	}); // 배송하기 버튼 처리 끝
	
	// '수정하기', '삭제하기' mouseover event 
	$(document).on('mouseover', '.delmod', function(){
		$(this).css("text-decoration","underline");
	}); // '수정하기', '삭제하기' mouseover event 끝
	
	// '수정하기', '삭제하기' mouseleave event 
	$(document).on('mouseleave', '.delmod', function(){
		$(this).css("text-decoration","none");
	}); // '수정하기', '삭제하기' mouseleave event 끝
	
	$("#refresh").click(function(){
		window.location.reload();
	});

	getDonList();
	getDonReqList();
	getItemList();
	
});

</script>

<script type="text/javascript">
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
</script>

</html>