<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<table>
		<tr>
			<td colspan="6"><font size="8"><strong>상품 관리</strong></font></td>
		</tr>
		<tr>
			<td colspan="6"><button id="refresh">새로 고침</button></td>
		</tr>
		<tr>
			<td>#</td>
			<td>상품명</td>
			<td>상품가격</td>
			<td>수량</td>
			<td>수정하기</td>
			<td>삭제하기</td>
		</tr>
		<c:forEach items="${itemList}" var="item">
		<tr>
			<td>${item.itemno}</td>
			<td>${item.itemname}</td>
			<td>${item.price}</td>
			<td>${item.qty}</td>
			<td><div onclick="modifyItem(${item.itemno})" class="delmod">수정하기</div></td>
			<td><div onclick="deleteItem(${item.itemno})" class="delmod">삭제하기</div></td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="6"><button onclick="insertItem()">상품 등록하기</button></td>
		</tr>
	</table>
	<!-- 상품 관리 테이블 끝 -->
	</td>
	<td width="600px">
	<!-- 기부 관리 테이블 -->
	<table id="donreq_mgt">
		<tr>
			<td colspan="6"><font size="8"><strong>기부 관리</strong></font></td>
		</tr>
		<tr>
			<td colspan="6"><button id="refresh">새로 고침</button></td>
		</tr>
		<tr>
			<td>#</td>
			<td>기부자</td>
			<td>기부 대상</td>
			<td>상품명</td>
			<td>수량</td>
			<td>배송하기</td>
		</tr>
	</table>
	<!-- 기부 관리 테이블 끝-->
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
	
	function getDonReq() {
		$.ajax({
			url: "/gaenari/control?command=getDonreqList",
			dataType: "xml",
			success: function(data) {
				alert("success");
				$("#donreq_mgt tr:gt(2)").remove();
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
				
				$('#donreq_mgt tr:eq(2)').after(table);
			},
			error: function(data) { alert(data+' => 에러 발생');}
			
		});// ajax 끝
	}// getDonReq() 함수 끝
	
	$(document).on('click',"#send", function(){
		$.ajax({
			url: "/gaenari/control?command=sendDonreq",
			dataType: "text",
			data: "drno="+$(this).attr("name"),
			success: function(data) {
				if(data > 0) {
					alert('배송처리되었습니다.');
					getDonReq();
				} else {
					alert('배송되지 않았습니다');
				}
			},
			error: function(data) { alert(data+' => 에러 발생');}
		})
	})
	
	$("#refresh").click(function(){
		window.location.reload();
	});
	
	$(".delmod").mouseover(function(){
		$(this).css("text-decoration","underline");
	});
	
	$(".delmod").mouseleave(function(){
		$(this).css("text-decoration","none");
	});
	
	getDonReq();	
	
});

</script>

<script type="text/javascript">


function deleteItem(itemno) {
	var res = confirm("정말 삭제하시겠습니까?");
	var newwindow;
	var url = "control?command=rmItem&itemno="+itemno;
	if(res == true) {
		newwindow=window.open(url,'삭제 완료','height=150,width=400');
		if(window.focus) {
			newwindow.focus;			
		}
	}
	window.location.reload();
}

function modifyItem(itemno) {
	var newwindow;
	var url ="control?command=itemUpdateForm&itemno="+itemno;
	
	newwindow=window.open(url, '상품 상세 정보 수정 페이지', 'height=550,width=660');
	if(window.focus) {
		newwindow.focus;
	}
}

function insertItem() {
	var newwindow;
	var url = "control?command=itemInsertForm";
	
	newwindow = window.open(url, '상품 등록 페이지', 'height=550,width=660');
	if(window.focus) {
		newwindow.focus;
	}
}

</script>

</html>