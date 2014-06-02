<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/frame.jsp"%>
<%@ include file="menu1.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유기견 신고 페이지</title>
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
	<div align=right>
		<span style="font-size:9pt;"><a href="/gaenari/board/missingBoardWrite.jsp">
		<input type="hidden" value=${id} name="id">
		<input type=submit value=글쓰기></a></span></div>
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
	
	function getMdogList() {
		$.ajax({
			url: "/gaenari/missingBoardList.do",
			dataType: "xml",
			success: function(data) {
				$('#mdog_table').empty();
				var table="";
				table += "<tr><td>";
				
				$(data).find('item').each(function (index){
					table += "<div id='mdog_list'>";
					table += "<ul>";
					table += "<li><form action='/gaenari/missingBoardView.do' method='post'>";
					table += "<input type='hidden' name='selectedBrdNo' value='"+$(this).find("brdno").text()+"'>";
					table += "<table>";
					table += "<tr>";
					
					// 이미지
					table += "<td align='center', valign='middle'><a href='/gaenari/missingBoardView.do?mbrdno="
							+$(this).find("mbrdno").text()+"'><img class='mdog_img' id='img_"+$(this).find("mbrdno").text()+
							"' src='"+$(this).find("picPath").text()+"' width='160' height='160' border='0' align='absmiddle'></a></td>";
			
					// 장소/일시
					table += "<tr align='center'><td height='35' class='mdog_loc'><a href='/gaenari/missingBoardView.do?mbrdno="
						+$(this).find("mbrdno").text()+"'>"+"실종 장소: "+$(this).find("mloc").text()+"</a></td></tr>";
					table += "<tr align='center'><td height='35' class='mdog_date'><a href='/gaenari/missingBoardView.do?mbrdno="
						+$(this).find("mbrdno").text()+"'>"+"실종 날짜: "+$(this).find("mdate").text()+"</a></td></tr>";
				
					table += "</tr></table></form></li></ul></div>";
				});	
				
				table+="</td></tr></table>";
				//alert(table);
				$('#mdog_table').html(table);
			},
			error: function(data) {alert(data+' => 에러 발생');}
			
		});
	}
	getMdogList();
});
</script>

</html>
<%@ include file="../bottom.jsp"%>