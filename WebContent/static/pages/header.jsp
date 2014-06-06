<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<div id="header">
		<div class="container visible">
			<img class="logo"
				src="https://www.google.co.kr/images/srpr/logo11w.png" />
			<c:choose>
				<c:when test="${sessionScope.userid == null}">
				<div class="header-user-menu-container not-login">
					<div class="btn-group header-user-menu not-login"> 
	                        <a href="#" class="btn btn-yellow" data-toggle="modal" data-target="#login-modal">로그인</a>
	                        <a href="#" class="btn btn-yellow" data-toggle="modal" data-target="#signup-modal">가입하기</a>
	                </div>
	                <div class="modal fade modal-sm" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
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
										<button class="btn-yellow fb-login-button btn btn-lg btn-block" type="button">FACEBOOK 계정으로 로그인</button>
									</form>
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
							<span class="btn btn-yellow header-user-menu dropdown-toggle"
								data-toggle="dropdown"> <span class="header-user-info">
									<span class="header-user-menu-image glyphicon glyphicon-user"></span>
							</span> <span class="header-user-fullname">Jaehee Jang</span> <span
								class="pull-right header-user-menu-caret"> <i
									class="icon-carret-bottom"></i> <!--TODO-->
							</span>
							</span>
							<div class="dropdown-menu" style="top: 73px; right: 0px;">
								<div class="header-user-menu-tip"></div>
								<div class="header-user-menu-list">
									<ul class="header-user-menu-list-info">
										<li><div class="info-value">0</div>
											<div class="info-title">포인트</div></li>
										<li>
											<div class="info-value">0 초</div>
											<div class="info-title">총 학습시간</div>
										</li>
										<li>
											<div class="info-value small">14.06.05</div>
											<div class="info-title">마지막 접속일</div>
										</li>
									</ul>
									<ul class="header-user-menu-tools">
										<li><a href="/account/profile/"> <i
												class="icon-setting"></i> 설정
										</a></li>
										<li class="header-logout pointer"><i class="icon-unlock"></i>
											로그아웃</li>
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
</html>