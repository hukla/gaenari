<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/frame.jsp"%>
<%@ include file="menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유기견을 찾습니다!</title>
</head>
<body>
	<center>
		<table border='0' cellspacing=3 cellpadding=20 width='600' id="mdog_table">
		    <tr>
			   	<td><div align="center">로딩중
				</div>
				</td>
			</tr>
		</table>
	</center>
		<span style="font-size:9pt;"><a href="/gaenari/board/missingBoardWrite.jsp">
		<input type="hidden" value=${id} name="id"><input type=submit value=글쓰기></a></span></div>
</body>
<style>
		#mdog_list {
			width: 945px;
			text-align: center;
			vertical-align: middle;
		}
		
		#mdog_list ul {
			width: 945px;
			border: 0;
			margin: 0;
			outline: 0;
			padding: 0;
			list-style: none;
		}
		
		#mdog_list ul li {
			width: 20%;
			height: 500px;
			vertical-align: baseline;
			overflow: hidden;
			display: inline;
			float: left;
			text-align: center;
		}
	</style>
	
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
$(function(){
	$.ajaxSetup({
		contentType:'application/x-www-form-urlencoded;charset=UTF-8',
		type:"post"
	});
	
	function getItemList() {
		$.ajax({
			url: "/gaenari/missingBoardList.do",
			dataType: "xml",
			success: function(data) {
				$('#mdog_table tr:eq(0)').remove();
				var table="";
				table += "<tr><td>";
				$(data).find('item').each(function (index){
					table += "<div id='mdog_list'>";
					table += "<ul>";
					table += "<input type='hidden' name='selectedBrdNo' value='"+$(this).find("brdno").text()+"'>";
					table += "<table>";
					table += "<tr>";
					
					// 상품이미지
					table += "<td align='center', valign='middle'><a href='/gaenari/missingBoardView.do?brdno="
							+$(this).find("brdno").text()+"'><img class='mdog_img' id='img_"+$(this).find("brdno").text()
							+"' src='/gaenari/image/board/"+$(this).find("itemno").text()+".jpg' width='160' height='160' border='0' align='absmiddle'></a></td>";
					
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
					"<select name='don_target'>"+
					"<option value='0'>기부할 센터 선택</option>"+
					"<c:forEach items='${sessionScope.centerList}' var='cntr'>"+
					"<option value='${cntr.cntrno}'>${cntr.cntrname }</option>"+
					"</c:forEach>"+
					"</select></td></tr>";
					//기부하기
					table += "<tr><td align='center'><input type='submit' value='기부하기'></td></tr>";
					table += "</table>"
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
<%@ include file="../bottom.jsp"%>