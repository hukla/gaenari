<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<div id="header">
		<div class="container visible">
			<a href="./">
			<img class="logo"
				src="/gaenari/static/images/logo.png" /></a>
			<c:choose>
				<c:when test="${sessionScope.userid == null}">
				<div class="header-user-menu-container not-login">
					<div class="btn-group header-user-menu not-login"> 
	                        <a href="#" class="btn btn-yellow" data-toggle="modal" data-target="#login-modal">로그인</a>
	                        <a href="#" class="btn btn-yellow" data-toggle="modal" data-target="#signup-modal">가입하기</a>
	                </div>
	                <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
	                    <div class="modal-dialog">
	                    	<div class="modal-content">
	                        	<div class="modal-header">
	                            	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                            	<div class="modal-title">로그인</div>
	                           	</div>
	                            <div class="modal-body">
	                            	<form class="form-signin" action="home.do" method="post">
										<input name="userid" type="text" class="form-control" placeholder="아이디" autofocus> <br>
										<input name="pwd" type="password" class="form-control" placeholder="비밀번호">
										<label class="checkbox"> 
											<input type="checkbox" value="remember-me">기억하겠습니다.</label>
										<button class="btn btn-lg btn-yellow btn-block" type="submit">로그인</button>
										<button type="button" class="btn-yellow fb-login-button btn btn-lg btn-block">FACEBOOK 계정으로 로그인</button>
										<div id="login" align="center" class="fb-login-button" data-max-rows="1" data-size="xlarge" data-show-faces="false" data-auto-logout-link="false" scope="email"></div>
									</form>
	                            </div>
	                        </div>
	                    </div>
					</div>
					<div class="modal fade" id="signup-modal"> 
						<div class="modal-dialog"> 
							<div class="modal-content"> 
								<div class="modal-header"> 
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<div class="modal-title"> 가입하기 </div>
								</div> 
                                <div class="modal-body"> 
								  <div class="signup-select"> 
                                    <a class="left-part plain-a" href="#" onclick="fbjoin()" data-no-instant=""> 
											<div class="image"> <img src="/gaenari/static/images/facebook-icon.png"/> </div> 
											<div class="title"> 페이스북 계정으로 가입하기 </div> 
										</a> 
										<a class="right-part plain-a" href="/gaenari/join.jsp"> 
											<div class="image"> <img src="/gaenari/static/images/user-icon.png"/> </div> 
											<div class="title"> 그냥 가입하기 </div> 
										</a> 
									</div> 
								</div> 
							</div> 
						</div> 
					</div> 
				</div>
				</c:when>
				<c:otherwise>
					<div class="header-user-menu-container">
						<!--드롭다운!!!!-->
						<div class="dropdown">
							<span class="btn btn-yellow header-user-menu dropdown-toggle" data-toggle="dropdown"> 
								<span class="header-user-info">
									<div class="header-user-menu-image profile-image" style=" background-image: url(${sessionScope.user.img}); "></div>
								</span>
								<span class="header-user-fullname">${sessionScope.userid}님</span> 
							</span>
							<div class="dropdown-menu" style="top: 73px; right: 0px;">
								<div class="header-user-menu-tip"></div>
								<div class="header-user-menu-list">
									<ul class="header-user-menu-list-info">
										<li>
											<c:choose>
          										<c:when test="${not empty sessionScope.sender}">
          											<c:choose>	
          												<c:when test="${fn:length(sender) > 1}">
          													<div class="info-value"><a href="#" onclick="friendsNews()">${fn:length(sender)}명</a></div>
															<div class="info-title">친구요청</div>
          												</c:when>
          												<c:when test="${fn:length(sender) == 1}">
          													<c:forEach items="${sessionScope.sender}" var="snder">
          														<div class="info-value"><a href="#" onclick="friendsNews()"><img src="${snder.img}" width="30px"></a></div>
																<div class="info-title">${snder.userid}님<br>친구요청</div>
          													</c:forEach>
          												</c:when>
          												<c:otherwise>
          													<div class="info-value">0명</div>
															<div class="info-title">친구요청</div>
          												</c:otherwise>
          											</c:choose>
          										</c:when>
          										<c:otherwise>
          											<div class="info-value">0명</div>
													<div class="info-title">친구요청</div>
          										</c:otherwise>
          									</c:choose>
										</li>
										<li>
											<c:choose>
												<c:when test="${sessionScope.todayPlan != null}">
													<c:choose>
														<c:when test="${fn:length(todayPlan) > 0}">
															<div class="info-value"><a href="#" onclick="todayPlan()">${fn:length(todayPlan)}개</a></div>
															<div class="info-title">오늘 일정</div>
														</c:when>
														<c:otherwise>
															<div class="info-value">0개</div>
															<div class="info-title">오늘 일정</div>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<div class="info-value">0개</div>
													<div class="info-title">오늘 일정</div>
												</c:otherwise>
											</c:choose>
										</li>
										<li>
											<div class="info-value small">${sessionScope.user.point }</div>
											<div class="info-title">마일나리</div>
										</li>
									</ul>
									<ul class="header-user-menu-tools">
										<li><a href="#" onclick="getUserinfo()">개인정보수정</a></li>
										<li><a href="/gaenari/login.do" class="header-logout pointer">로그아웃</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!--드롭다운 끝-->
				</c:otherwise>
			</c:choose>
		</div>
	</div>
