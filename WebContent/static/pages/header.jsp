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
							<button type='button' class='btn btn-yellow header-user-menu'>로그인</button>
							<button type='button' class='btn btn-yellow header-user-menu'>회원가입</button>
						</div>
						<div class="modal fade hide" id="login-modal">
							<div class="modal-dialog modal-dialog-small">
								<div class="modal-content">
									<div class="modal-header">
										<div class="modal-title">로그인</div>
										<div class="modal-header-menu">
											<span class="modal-close modal-close-by-cancel"> × </span>
										</div>
									</div>
									<div class="modal-body">
										<form class="login-form auth-form form-container"
											method="post" action="/account/login/">
											<input type="hidden" name="csrfmiddlewaretoken"
												value="slAgQVF14E8Pc9v4jMgcOMcmxZ0dZO3l"> <input
												type="hidden" name="redirect_to" value="/"> <input
												type="email" name="email" class="input-block input-larger"
												placeholder="이메일"> <input type="password"
												name="password" class="input-block input-larger"
												placeholder="비밀번호"> <input type="submit"
												class="btn input-block" value="로그인"> <a
												class="btn btn-dark-blue input-block"
												href="/account/social/login/facebook/?next=/"
												data-no-instant=""> 페이스북 계정으로 로그인</a>
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