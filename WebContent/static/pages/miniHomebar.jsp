<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--메뉴바 시작-->
<style>
.navbar-inverse {
    background-color: #8D8D8D;
    border-color: #8D8D8D;
}
.nav {
    list-style: none outside none;
    font-family: 나눔고딕;
    font-size: 15px;
    line-height: 4.3;
}
.navbar-inverse .navbar-nav > li > a {
    color: #FECC00;
    line-height: 1.99;
}
.navbar-inverse .navbar-nav > .open > a, .navbar-inverse .navbar-nav > .open > a:hover, .navbar-inverse .navbar-nav > .open > a:focus {
    color: #FFF;
    background-color: #737373;
}
h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
    font-weight: 500;
    line-height: 2.1;
}
.container {
    max-width: 1100px;
}
</style>
<div class="navbar navbar-inverse navbar-fixed-top" id="menubar">
    <div class="container">
        <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
            <ul class="nav navbar-nav">
            	<li>
                    <h4><a href="/gaenari/miniHome.do?userid=${sessionScope.userid}"><img src="${sessionScope.user.img}" width="40px" class="img-rounded"></a>
                    	<c:choose>
                    		<c:when test="${sessionScope.userid == requestScope.user.userid}">
                    			${sessionScope.userid}님 홈페이지입니다.
                    		</c:when>
                    		<c:otherwise>
                    			${requestScope.user.userid}님 홈페이지 방문중입니다.
                    		</c:otherwise>
                    	</c:choose>
                    </h4>
                </li>
           		<li>
                    <h4>&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.toYear}년 ${sessionScope.toMonth}월 ${sessionScope.toDate}일</h4> 
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">오늘의 일정<b class="caret"></b></a>
                    <c:choose>
						<c:when test="${sessionScope.plans eq 1}">
							<ul class="dropdown-menu">
								<li>
									<a href="/gaenari/planDetail.do?brdno=${sessionScope.todayPlan[0].brdno}&userid=${sessionScope.user.userid}">[${sessionScope.todayPlan[0].title}]입니다.
									<c:choose>
										<c:when test="${sessionScope.todayPlan[0].flag == 0}">
											<span class="label label-default">미완료</span> 
										</c:when>
										<c:otherwise>
											<span class="label label-info">완료</span> 
										</c:otherwise>
									</c:choose>
									</a>
								</li>
							</ul>
						</c:when>
					<c:when test="${sessionScope.plans > 1}">
						<ul class="dropdown-menu">
                    		<c:forEach items="${sessionScope.todayPlan}" var="plan">
                    			<li>
                    				<a href="/gaenari/planDetail.do?brdno=${plan.brdno}&userid=${sessionScope.userid}">
                    					${plan.title}
                    					<c:choose>
										<c:when test="${plan.flag == 0}">
											<span class="label label-info">미완료</span> 
										</c:when>
										<c:otherwise>
											<span class="label label-default">완료</span> 
										</c:otherwise>
									</c:choose>
                    				</a>
                    			</li>
                   			</c:forEach>
                   		</ul>
					</c:when>
					<c:otherwise>
						<ul class="dropdown-menu">
							<li><small>등록된 일정이 없습니다.</small></li>
						</ul>
					</c:otherwise>
				</c:choose>
                </li>
                <li style="position:absolute;right:30px;">
                <table>
                	<tr><td>
                    ${sessionScope.userid}님의 친구목록</td><td><select class="btn btn-default" id="frndHome">
                    	<option selected="selected">친구를 선택하세요</option>
                    	<c:forEach items="${sessionScope.myFriends}" var="friend">
                    		<option value="${friend.userid}">${friend.userid}</option>
                    	</c:forEach>
                    </select>
                    </td>
                    </tr>
                </table>
                  </li>
            </ul>
        </nav>
    </div>
</div>
<!-- 메뉴바 끝 -->
<script type="text/javascript">
$(function(){
	$("#frndHome").change(function(){
		location.href="/gaenari/miniHome.do?userid="+$("#frndHome").val();
	});
});
</script>