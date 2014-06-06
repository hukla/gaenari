<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/frame.jsp"%>
<%@ include file="menu1.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유기견 입양 페이지</title>
</head>
<body>
	<center>
		<table border='0' cellspacing=3 cellpadding=20 width='600' id="adog_table">
		    <tr>
			   	<td><div align="center">로딩중
				</div>
				</td>
			</tr>
		</table>
	</center>
	<div align=right>
		<span style="font-size:9pt;"><a href="/gaenari/board/adpBoardWrite.jsp">
		<input type="hidden" value=${id} name="id">
		<input type=submit value=글쓰기></a></span></div>
</body>
<style>
		#adog_list {
			width: 945px;
			text-align: center;
			vertical-align: middle;
		}
		
		#adog_list ul {
			width: 945px;
			border: 0;
			margin: 0;
			outline: 0;
			padding: 0;
			list-style: none;
		}
		
		#adog_list ul li {
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
	
	function getAdogList() {
		$.ajax({
			url: "/gaenari/adpBoardList.do",
			dataType: "xml",
			success: function(data) {
				$('#adog_table').empty();
				var table="";
				table += "<tr><td>";
				
				$(data).find('item').each(function (index){
					table += "<div id='adog_list'>";
					table += "<ul>";
					table += "<li><form action='/gaenari/adpBoardView.do' method='post'>";
					table += "<input type='hidden' name='selectedBrdNo' value='"+$(this).find("brdno").text()+"'>";
					table += "<table>";
					table += "<tr>";
					
					// 이미지
					table += "<td align='center', valign='middle'><a href='/gaenari/adpBoardView.do?abrdno="
							+$(this).find("abrdno").text()+"'><img class='adog_img' id='img_"+$(this).find("abrdno").text()+
							"' src='"+$(this).find("picPath").text()+"' width='160' height='160' border='0' align='absmiddle'></a></td>";
			
					table += "</tr></table></form></li></ul></div>";
				});	
				
				table+="</td></tr></table>";
				//alert(table);
				$('#adog_table').html(table);
			},
			error: function(data) {alert(data+' => 에러 발생');}
			
		});
	}
	getAdogList();
});
</script>

</html>
<%@ include file="../bottom.jsp"%>