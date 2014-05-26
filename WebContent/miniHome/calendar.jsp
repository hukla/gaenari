<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="frame.jsp" %>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Microsoft FrontPage 4.0">
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="/gaenari/bootstrap/css/bootstrap.min.css">
<title>미니홈피 달력</title>

<!-- 
 수정: 최성훈
 수정일: 2014-04-25
 내용: 달력 UI 추가(td 틀에 맞추고 날짜 클릭하도록 함. 다른기능 없음... 추가할 예정)

 수정: 최성훈
 수정일: 2014-05-24
 내용: 	기존 미리보기에서 방명록 미리보기 삭제, 일정과 일기는 달력 날짜 버튼 클릭으로
 		해당 날짜의 일기, 일정 제목만 최대 5개씩 출력해주기
 -->


<style>
td {text-decoration:none; }
font {text-decoration:none; line-height:130%;}
A:link,A:active,A:visited{text-decoration:none;color:'#333333';}
A:hover {text-decoration:none; color:'ff9900'}
</style>
<link rel="STYLESHEET" type="text/css" href="board_style.css">
<SCRIPT LANGUAGE="JavaScript">

     var monthName=new Array("1월","2월","3월","4월","5월","6월","7월",
     "8월","9월","10월","11월","12월")
     var monthDays=new Array(31,28,31,30,31,30,31,31,30,31,30,31)
     var now=new Date();
     var nowd=now.getDate();
     var nowm=now.getMonth();
     var nowy=now.getYear()+1900;
     function showCalendar(day,month,year)
     {
  if ((year%4==0||year%100==0)&&(year%400==0)) monthDays[1]=29; else monthDays[1]=28 //leap year test
  var firstDay=new Date(year,month,1).getDay()
  var calStr="<table border=0 cellpadding=5 cellspacing=1 align=center bgcolor=#CCCCCC>"

  calStr+="<tr bgcolor=white><td colspan=7>"

  calStr+="<table border=0 cellpadding=0 cellspacing=0 align=center width=700  height=100>"
  calStr+="<td><font size='6'><a href='javascript:;' onClick='nowm--; if (nowm<0) { nowy--; nowm=11; } showCalendar(nowd,nowm,nowy)' title='이전 월'> <<</a></font></td>"
  calStr+="<td align=center><font size='6'>"+monthName[month].toUpperCase()+" "+year+"년</font></td>"
  calStr+="<td align=right><font size='6'><a href='javascript:;'  onClick='nowm++; if (nowm>11) { nowy++; nowm=0; } showCalendar(nowd,nowm,nowy)' title='다음 월'> >></a></font></td>"
  calStr+="</tr></table>"

  calStr+="</td></tr>"  

  calStr+="<tr align=center bgcolor='#336666'>"
  calStr+="<th><font color='red' size='6'>일</font></th>"
  calStr+="<th><font color='white' size='6'>월</font></th>"
  calStr+="<th><font color='white' size='6'>화</font></th>"
  calStr+="<th><font color='white' size='6'>수</font></th>"
  calStr+="<th><font color='white' size='6'>목</font></th>"
  calStr+="<th><font color='white' size='6'>금</font></th>"
  calStr+="<th><font color='#66CCFF' size='6'>토</font></th>" 
  calStr+="</tr>"  

  var dayCount=1

  calStr+="<tr bgcolor=white>"

  for (var i=0;i<firstDay;i++) calStr+="<td> "  //공백
  for (var i=0;i<monthDays[month];i++)
  {



  if(dayCount==nowd) {
  calStr+="<td align=center bgcolor='#DFE7DE'><font size='6'><b>" // 오늘 날짜일때 배경색 지정,글자 진하게

  } else {

  calStr+="<td align=center><font size='6'>"  // 오늘 날짜가 아닐때 배경색 지정
  }

  calStr+="<a href='/gaenari/control?command=calendar&userid=${requestScope.user.userid}&date="+dayCount+"&month="+(nowm+1)+"&year="+nowy+"'>" // 링크설정

  calStr+=dayCount++   // 날짜
  
  calStr+="</a>"

  if(dayCount==nowd) {

  calStr+="</b>" // 오늘 날짜일때 글자 진하게

  } else {

  calStr+=""  // 오늘 날짜가 글자 진하게 안함
  }
        calStr+="</font>"
   if ((i+firstDay+1)%7==0&&(dayCount<monthDays[month]+1)) calStr+="<tr bgcolor=white>"
  }
  var totCells=firstDay+monthDays[month]
  for (var i=0;i<(totCells>28?(totCells>35?42:35):28)-totCells;i++) calStr+="<td> "
  calStr+="</table><BR>"
  calendar.innerHTML=calStr
     }
//-->
</SCRIPT>
</head>
<!-- 
작성자: 최성훈
작성목적: 날짜별 일정, 일기 정보를 한 눈에 보기 쉽도록 한다.
작성내용: 달력의 년,월을 선택할 수 있고 그에 따른 달력페이지를 볼 수 있다.
		  해당 날짜를 클릭하면 비동기식으로 오른편에 해당 날짜의
		  일정과 일기의 제목, 방명록 작성자등을 확인할 수 있다.
		  우상단엔 일기게시판과 일정게시판으로 이동하는 버튼이 있다.
		  
수정: 최성훈
수정일: 2014-04-23
수정내용: 미리보기의 방명록, 일기, 일정 모두 글 하나씩 볼 수있도록 링크 걸어놓음
		  메인페이지 이동할 때 url패턴으로 action 통해서 가도록 수정
 
 -->
</head>
<body>
	<table border="1" align="center" width="80%" height="100%">
		<tr>
			<td rowspan="3" width="70%">
				<SPAN ID=calendar STYLE="position: relative;"></SPAN> 
				<script language="JavaScript" type="text/JavaScript">
					showCalendar(nowd,nowm,nowy);
				</script></td>
			<!-- <td>
				<div align="center">
					<input type="button" onclick="location.href='/gaenari/planList.do'" value="일정게시판">
					&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="button" onclick="location.href='/gaenari/diaryList.do'" value="일기게시판">
				</div>
			</td> -->
			<td width="30%">
				<h3>일정</h3> <c:choose>
					<c:when test="${not empty requestScope.plist}">
						<c:forEach items="${requestScope.plist}" var="plan">
							<a href="/gaenari/control?command=planDetail&brdno=${plan.brdno}">
								<h4>${plan.title}- ${plan.wrdate}</h4>
							</a>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h4>등록된 일정이 없습니다.</h4>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>
				<h3>일기</h3> <c:choose>
					<c:when test="${not empty requestScope.dlist}">
						<c:forEach items="${requestScope.dlist}" var="diary">
							<a href="/gaenari/control?command=diaryDetail&brdno=${diary.brdno}">
								<h4>${diary.title}- ${diary.wrdate}</h4>
							</a>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h4>등록된 일기가 없습니다.</h4>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
</body>
</html>