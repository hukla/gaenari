<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="2014-05-03:장재희:기부몰 메인 페이지"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/frame.jsp" %>
<%@ include file="/mall/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기부몰 메인 페이지</title>
</head>
<body>
	<h1 align="center">사랑을 나누세요</h1><!-- 기부몰 메인 배너 -->
	
	<hr>
	<input type='hidden' name='usertype' value='${sessionScope.user.usertype}'>
	<!-- 상품 리스트 -->
	<table id="item_table" width='86%' align='right'>
		<tr><td>로딩중</td></tr>
	</table>
	<!-- //상품 리스트 -->
	
</body>

<!--상품 리스트 스타일-->
	<style>
		#item_list {
			width: 945px;
			text-align: center;
			vertical-align: middle;
		}
		
		#item_list ul {
			width: 945px;
			border: 0;
			margin: 0;
			outline: 0;
			padding: 0;
			list-style: none;
		}
		
		#item_list ul li {
			width: 20%;
			height: 500px;
			vertical-align: baseline;
			overflow: hidden;
			display: inline;
			float: left;
			text-align: center;
		}
	</style>
<!--//상품 리스트 스타일-->

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

<script>
$(function(){
	$.ajaxSetup({
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
		type:"post"
	});
	
	function getItemList() {
		$.ajax({
			url: "/gaenari/itemList.do",
			dataType: "xml",
			success: function(data) {
				$('#item_table tr:eq(0)').remove();
				var table="";
				table += "<tr><td>";
				$(data).find('item').each(function (index){
					table += "<div id='item_list'>";
					table += "<ul>";
					table += "<li><form id='item' method='post'>";
					table += "<input type='hidden' name='selectedItemNo' value='"+$(this).find("itemno").text()+"'>";
					table += "<input type='hidden' name='price' value='"+$(this).find('price').text()+"'>";
					table += "<input type='hidden' name='gnr_point' value='"+(parseInt($(this).find("price").text())*0.05)+"'>";
					table += "<table>";
					table += "<tr>";
					
					// 상품이미지
					table += "<td align='center', valign='middle'><a href='/gaenari/mallDetail.do?itemno="
							+$(this).find("itemno").text()+"'><img class='item_img' id='img_"+$(this).find("itemno").text()
							+"' src='/gaenari/mall/img/"+$(this).find("itemno").text()+".jpg' width='160' height='160' border='0' align='absmiddle'></a></td>";
					
					//상품명
					table += "<tr align='center'><td height='35' class='item_name'><a href='/gaenari/mallDetail.do?itemno='"
							+$(this).find("itemno").text()+"'>"+$(this).find("itemname").text()+"</a></td></tr>";
					
					//가격 및 마일리지
					table += "<tr><td align='center'><font color='#777777'>\</font><span class='item_price'>"+$(this).find("price").text()+"</span>"
					+"&nbsp; &nbsp;<span class='item_mileage'><img src='/gaenari/mall/img/btn_point.png' align='absmiddle' width='10' height='relative'>&nbsp;"+(parseInt($(this).find("price").text())*0.05)+"</span></td></tr>";
					
					//수량
					table += "<tr><td bgcolor='#FFFFFF'>&nbsp;&nbsp;"+ 
					"<input type=text name='ct_qty' value='1' size=5 maxlength=5 class='ed' autocomplete='off' style='text-align: center;'>개"+ 
					"</td></tr>";
					
					//대상
					table +="<tr><td bgcolor='#FFFFFF'>&nbsp;&nbsp;"+ 
					"<select name='don_target' id='target_sel'>"+
					"<option value='0'>기부할 센터 선택</option>"+
					"<c:forEach items='${sessionScope.centerList}' var='cntr'>"+
					"<option value='${cntr.cntrno}'>${cntr.cntrname }</option>"+
					"</c:forEach>"+
					"</select></td></tr>";
					//기부하기
					table += "<tr><td align='center'>";
					//alert($('input[name=usertype]').val());
					if($('input[name=usertype]').val() > 0) {
						table += "<input type='submit' value='요청하기'>";
					} else if ($('input[name=usertype]').val() < 0) {
						table += "<input type='submit' value='상품 정보 수정하기'>";	
					} else {	
						table += "<input type='submit' value='기부하기'>"; 
					}
					table += "</td></tr></table>";
					table += "</form></li>";
					table += "</ul>";
					table += "</div>";
				});
				table+="</tr></td>";
				//alert(table);
				$('#item_table').html(table);
			},
			error: function(data) { alert(data+' => 에러 발생');}
			
		});// ajax 끝
	}// getItemList() 함수 끝
	
	// user type에 따라 submit action 다르게 하기
	$(document).on('submit', '#item', function(){
		if($('#target_sel option:selected').val() == 0) {
			alert("기부할 대상을 선택해주세요!");
			return false;
		}
		
		//alert($('input[name=usertype]').val());
		if($('input[name=usertype]').val() == 0) {
			$('#item').prop('action', '/gaenari/donnate.do');
			alert($('#item').prop('action').val());
			return true;
		} else if($('input[name=usertype]').val() > 0) {
			$('#item').prop('action', '/gaenari/mallRequest.do');
			return true;
		} else if($('input[name=usertype]').val() < 0){
			var newwindow;
			var url ="/gaenari/itemUpdateForm.do?itemno="+$('input[name=selectedItemNo]').val();
			
			newwindow=window.open(url, '상품 상세 정보 수정 페이지', 'height=550,width=660');
			if(window.focus) {
				newwindow.focus;
			}
		} else {
			alert("로그인해주세요!");
		}
	});
	
	
	getItemList();
	
	// 수량 입력 유효성 검사
	$(document).on('blur', '.ct_qty', function(){
		//alert($(this).val());
		if(parseInt($(this).val()) < 0) {
			alert('1보다 큰 값을 입력해주세요!');
			$(this).val(1);
			$(this).focus();
		}
	});// 수량 입력 유효성 검사 끝
	
});
</script>

</html>