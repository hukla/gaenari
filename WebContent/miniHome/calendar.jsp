<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ include file="/frame.jsp" %> --%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Microsoft FrontPage 4.0"><!-- 
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="/gaenari/bootstrap/css/bootstrap.min.css"> -->
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
h5{ font-family: "맑은 고딕"}
font {text-decoration:none; line-height:130%;}
A:link,A:active,A:visited{text-decoration:none;color:'#333333';}
A:hover {text-decoration:none; color:'ff9900'}
div#panelhead {
    height: 35px;
    padding: 1px;
    text-align: center;
}
.panel-info > .panel-heading {
    color: #6F8D52;
    background-color: #E4E7C5;
    border-color: #E4E7C5;
}
.panel-info {
    border-color: #E4E7C5;
}
h5 {
    font-family: "맑은 고딕";
    line-height: 10px;
}
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
     nowd="${requestScope.date}";
     nowm="${requestScope.month-1}";
     nowy="${requestScope.year}"
     function showCalendar(day,month,year)
     {
  if ((year%4==0||year%100==0)&&(year%400==0)) monthDays[1]=29; else monthDays[1]=28 //leap year test
  var firstDay=new Date(year,month,1).getDay()
  var calStr="<table border=0 cellpadding=5 cellspacing=1 class='table' align=center bgcolor=#CCCCCC style='border: hidden;height: 370px;'>"

  calStr+="<tr bgcolor=white><td colspan=7>"

  calStr+="<table border=0 cellpadding=0 cellspacing=0 align=center width='100%' style='border: hidden;'><tr>"
  calStr+="<td><font size='3'><a href='javascript:;' onClick='nowm--; if (nowm<0) { nowy--; nowm=11; } showCalendar(nowd,nowm,nowy)' title='이전 월'><img src='/gaenari/image/arrowhead7.png'></a></font></td>"
  calStr+="<td align=center><font size='5'>"+monthName[month].toUpperCase()+" "+year+"년</font></td>"
  calStr+="<td align=right><font size='3'><a href='javascript:;'  onClick='nowm++; if (nowm>11) { nowy++; nowm=0; } showCalendar(nowd,nowm,nowy)' title='다음 월'><img src='/gaenari/image/arrow487.png'></a></font></td>"
  calStr+="</tr></table>"

  calStr+="</td></tr>"  

  calStr+="<tr align=center bgcolor='#8D8D8D'>"
  calStr+="<td><font color='darkred' size='3'>일</font></td>"
  calStr+="<td><font color='white' size='3'>월</font></td>"
  calStr+="<td><font color='white' size='3'>화</font></td>"
  calStr+="<td><font color='white' size='3'>수</font></td>"
  calStr+="<td><font color='white' size='3'>목</font></td>"
  calStr+="<td><font color='white' size='3'>금</font></td>"
  calStr+="<td><font color='#66CCFF' size='3'>토</font></td>" 
  calStr+="</tr>"  

  var dayCount=1

  calStr+="<tr bgcolor=white>"

  for (var i=0;i<firstDay;i++) calStr+="<td> "  //공백
  for (var i=0;i<monthDays[month];i++)
  {


	 // "${requestScope.date}"
  if(dayCount==day) {
  calStr+="<td align=left bgcolor='#DFE7DE'><font size='3'><b>" // 오늘 날짜일때 배경색 지정,글자 진하게

  } else {
	  
  calStr+="<td align=left><font size='3'>"  // 오늘 날짜가 아닐때 배경색 지정
	/* calStr+="<td style='text-align: left;vertical-align: top;'><font size='4'>" */
  }
	
  calStr+="<a href='/gaenari/calendar.do?userid=${requestScope.user.userid}&date="+dayCount+"&month="+(parseInt(month)+1)+"&year="+nowy+"'>" // 링크설정
	//지운거 여깄다 (nowm+1)
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
 
수정: 최성훈
수정일: 2014-05-23
수정내용: 달력의 숫자를 클릭하면 그에 해당하는 일정과 일기 목록을 우측에서 미리보기
		  방명록미리보기는 제거하였음. 날짜와 관련된 정보 열람은 일기,일정 정도가 좋고
		  메인페이지에 최근 일기,일정, 방명록 미리보기가 있기 때문.
		  
수정: 최성훈
수정일: 2014-05-26
수정내용: 현재에 해당하는 월이 아닌 다른 월의 날짜를 클릭하면 정보는 전송은 되나 
		  달력UI가 다시 현재 월로 되돌아오는 문제점 해결, 
		  달력 상의 날짜 클릭시, 클릭된 날짜에 음영처리, bold 추가
 
 -->
</head>
<body>
	<table align="left"><tr><td width="900" align="center" height="400px">
	<table border="0" align="center" width="100%" height="100%">
		<tr style="line-height: 0px;">
			<td width="100%" colspan="2">
				<SPAN ID=calendar STYLE="position: relative;"></SPAN> 
				<script language="JavaScript" type="text/JavaScript">
					//showCalendar(nowd,nowm,nowy);
					showCalendar("${requestScope.date}","${requestScope.month-1}","${requestScope.year}");
				</script>
			</td>
		</tr>
		<tr>	
			<td width="50%" style="vertical-align: top;">
				<div class="panel panel-info">
					<div class="panel-heading" id="panelhead">
						<h5>일정</h5>
					</div>
					<div class="panel-body">
					<c:choose>
						<c:when test="${not empty requestScope.plist}">
							<c:forEach items="${requestScope.plist}" var="plan">
								<a href="/gaenari/planDetail.do?brdno=${plan.brdno}&userid=${requestScope.user.userid}">
									${plan.title}-${plan.wrdate}<br>
								</a>
							</c:forEach>
						</c:when>
						<c:otherwise>
							등록된 일정이 없습니다.
						</c:otherwise>
					</c:choose>
					</div>
				</div>
			</td>
			<td style="vertical-align: top;" width="50%">
				<div class="panel panel-info">
					<div class="panel-heading" id="panelhead">
						<h5>일기</h5> 
					</div>
					<div class="panel-body">
					<c:choose>
						<c:when test="${not empty requestScope.dlist}">
							<c:forEach items="${requestScope.dlist}" var="diary">
								<a href="/gaenari/diaryDetail.do?brdno=${diary.brdno}&userid=${requestScope.user.userid}">
									${diary.title}-${diary.wrdate}
								</a>
							</c:forEach>
						</c:when>
						<c:otherwise>
							등록된 일정이 없습니다.
						</c:otherwise>
					</c:choose>
					</div>
				</div>
			</td>
		</tr>
	</table>
	</td></tr></table>
</body>
</html>
<%-- <%@ include file="/bottom.jsp"%> --%>