<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/frame.jsp"%>
<%@ include file="menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유기견 제보 페이지</title>
</head>
<body>

	<center>
		<table border='0' cellspacing=3 cellpadding=20 width='600' id="fdog_table">
		    <tr>
			   	<td><div align="center">로딩중
				</div>
				</td>
			</tr>
		</table>
	</center>
	<div align=right>
		<span style="font-size:9pt;"><a href="/gaenari/board/findingBoardWrite.jsp">
		<input type="hidden" value=${id} name="id">
		<input type=submit value=글쓰기></a></span></div>
</body>
<style>
		#fdog_list {
			width: 945px;
			text-align: center;
			vertical-align: middle;
		}
		
		#fdog_list ul {
			width: 945px;
			border: 0;
			margin: 0;
			outline: 0;
			padding: 0;
			list-style: none;
		}
		
		#fdog_list ul li {
			width: 20%;
			height: 300px;
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
	
	function getFdogList() {
		$.ajax({
			url: "/gaenari/findingBoardList.do",
			dataType: "xml",
			success: function(data) {
				$('#fdog_table').empty();
				var table="";
				table += "<tr><td>";
				
				$(data).find('item').each(function (index){
					table += "<div id='fdog_list'>";
					table += "<ul>";
					table += "<li><form action='/gaenari/findingBoardView.do' method='post'>";
					table += "<input type='hidden' name='selectedBrdNo' value='"+$(this).find("brdno").text()+"'>";
					table += "<table>";
					table += "<tr>";
					
					// 이미지
					table += "<td align='center', valign='middle'><a href='/gaenari/findingBoardView.do?fbrdno="
							+$(this).find("fbrdno").text()+"'><img class='fdog_img' id='img_"+$(this).find("fbrdno").text()+
							"' src='"+$(this).find("picPath").text()+"' width='160' height='160' border='0' align='absmiddle'></a></td>";
				
					// 발견장소
					table += "<tr align='center'><td height='35' class='fdog_loc'><a href='/gaenari/findingBoardView.do?mbrdno="
						+$(this).find("fbrdno").text()+"'>"+"발견 장소: "+$(this).find("floc").text()+"</a></td></tr>";
				
					table += "</tr></table></form></li></ul></div>";
				});	
				
				table+="</td></tr></table>";
				//alert(table);
				$('#fdog_table').html(table);
			},
			error: function(data) {alert(data+' => 에러 발생');}
			
		});
	}
	getFdogList();
});
</script>

</html>
<%@ include file="../bottom.jsp"%>