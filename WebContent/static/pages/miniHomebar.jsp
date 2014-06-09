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
    font-size: 18px;
    line-height: 3.3;
}
.navbar-inverse .navbar-nav > li > a {
    color: #FECC00;
    line-height: 1.99;
}
.navbar-inverse .navbar-nav > .open > a, .navbar-inverse .navbar-nav > .open > a:hover, .navbar-inverse .navbar-nav > .open > a:focus {
    color: #FFF;
    background-color: #737373;
}
</style>
<div class="navbar navbar-inverse navbar-fixed-top" id="menubar">
    <div class="container">
        <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
            <ul class="nav navbar-nav">
                <li>
                    <h3>${sessionScope.toYear}년 ${sessionScope.toMonth}월 ${sessionScope.toDate}일</h3> 
                </li>
                <li class="dropdown"><!-- !!!!!!!!14-06-09!!!!!!!!!일정 세션에서 리퀘스트로 바꿔야된다! -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">오늘의 일정<b class="caret"></b></a>
                    	<c:choose>
							<c:when test="${sessionScope.plans eq 1}">
								<ul class="dropdown-menu">
									<li><a href="/gaenari/planDetail.do?brdno=${sessionScope.plan.brdno}&userid=${sessionScope.user.userid}">[ ${sessionScope.plan.title} ]입니다.</a> </li>
								</ul>
							</c:when>
							<c:when test="${sessionScope.plans > 1}">
								<ul class="dropdown-menu">
                    				<c:forEach items="${sessionScope.plans}" var="plan">
                    					<li><a href="#">${plan.title}</a></li>
                    				</c:forEach>
                    			</ul>
							</c:when>
							<c:otherwise>
								<ul class="dropdown-menu">
									<li><small>등록된 일정이 없습니다.</small></li>
								</ul>
							</c:otherwise>
						</c:choose>
                   
                    <c:if test="${sessionScope.plans > 1}">
                    	<ul class="dropdown-menu">
                    		<c:forEach items="${sessionScope.plans}" var="plan">
                    			<li><a href="#">${plan.title}</a></li>
                    		</c:forEach>
                    	</ul>
                    </c:if>
                </li>
                <li style="position:absolute;right:30px;">
                <table>
                	<tr><td>
                    내 친구들</td><td><select class="btn btn-default">
                    	<option selected="selected">친구를 선택하세요</option>
                    	<option>정동일</option>
                    	<option>정동이</option>
                    	<option>정동삼</option>
                    	<option>정동사</option>
                    	<option>정동오</option>
                    	<option>정동육</option>
                    	<option>정동칠</option>
                    	<option>정동팔</option>
                    	<option>정동구</option>
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