<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.dto.UserDTO" %>
<%@ page import="model.dao.UserDAO" %>
<%@ page import="model.dao.TestDAO" %>
<%@ page import="model.dto.DiaryDTO" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/static/pages/head.jsp" %>
        <style type="text/css">
body {
	background-color: white;
}

div#myCarousel {
	width: 96%;
	margin:0 auto;
}

div#container {
	width: 980px;
	float: left;
	margin-left: 8%;
	margin-top: 20px;
}

div#media {
	margin-top: 20px;
	float: left;
	margin-left: 5%;
	width: 330px;
	height: inherit;
	background-color: white;
	border-radius: 5px;
}

div#thumb {
float: left;
width: 50%;
height: 400px;
overflow-y: overlay;
}

div#con {
	margin-top: 20px;
	float: left;
	left:;
	width: 33%;
	height: 100%;
}

div#well {
	margin-top: 20px;
	margin-right: 5%;
	float: right;
	width: 680px;
	height: 406px;
}

.thumbnail>img, .thumbnail a>img {
margin-left: auto;
margin-right: auto;
height: 222px;
}
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
        <!-- 
            작성: 2014-05-25
            작성자: 최성훈
            내용: 개나리 웹페이지 메인페이지
            
            수정: 최성훈, 2014-06-04	내용: 안쓰는 주석 지우고 강아지 등록 팝업 크기조절
            수정: 이수진, 2014-06-07	내용: 유기견 광고 넣기
		수정: 이수진, 2014-06-10	내용: 유기견 광고 나오도록 수정
             -->
    </head>
    <body>
        <div id="wrapper">
        <%@ include file="/static/pages/header.jsp"%>
        <div id="content">
            <%@ include file="/static/pages/menubar.jsp"%>
            <div id="myCarousel" class="carousel slide" align="left" data-ride="carousel" data-interval="3000">
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <!-- 회전광고판 항목 -->
                    <div class="carousel-inner" align="left">
                        <div class="active item">
                            <img src="/gaenari/image/dog1.jpg" width="1500">
                            <div class="carousel-caption">
                                <div align="left">
                                    <h1>개나리 홈페이지에 오신 것을 환영합니다.</h1>
                                </div>
                                <p>애견 관련 세계 최대 포탈, GAENARI에 방문하신것을 환영합니다. 저희 개나리 서비스는 강아지와 내
                                    정보를 관리하고 다른 유저들과의 커뮤니티 활동은 물론 보다 높은 접근성으로 기부활동을 이끌어 생활의 편의와 공익을
                                    실현합니다.
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="/gaenari/image/dog9.jpg" width="1500">
                            <div class="carousel-caption">
                                <div align="left">
                                    <h1>커뮤니티와 내 홈페이지를 이용해보세요!</h1>
                                </div>
                                <p align="right">입양 신청과 기부가 가능한 마일나리를 획득할 수 있습니다.<br>마일나리는 개작은집에서의 일기/일정 작성,
                                친구 추가, 봉사 신청을 통해 획득 가능합니다.</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="/gaenari/image/dog6.jpg" width="1500">
                            <div class="carousel-caption">
                                <div align="center">
                                    <h1>기부몰에 방문하셔서<br>유기견들에게 사랑을 나눠주세요</h1>
                                </div>
                                <p align="center">기부금액의 일정비율을 마일나리로 적립할 수 있습니다.</p>
                            </div>
                        </div>
                    </div>
                    <!-- 회전광고판 탐색 -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                </div>
            <div class="container">
                

				<!-- 자원봉사 펫도우미 최신글 -->
				<div class="media" id="media">
					<div class="list-group">
					<a href="#" onclick="addDog()" class="list-group-item" style=" background-color: #FFCC00;border-color: #FFCC00;height:122px">
						<h4 class="list-group-item-heading"><img src="/gaenari/static/images/footprint.png" width="50px;"> 강아지등록</h4>
						<p class="list-group-item-text">개작은집에서 강아지와 함께 하는 일정과 일기를 편리하게 작성할 수 있도록 강아지를 등록해 주세요.</p>
					</a>
					</div>
					<div class="list-group">
					<a href="#" onclick="goQuest()"  class="list-group-item" style=" background-color: #FFCC00;border-color: #FFCC00;height:122px">
						<h4 class="list-group-item-heading"><img src="/gaenari/static/images/note.png" width="50px;"> 입양테스트</h4>
						<p class="list-group-item-text">애견 입양 적합 테스트를 시행합니다. 테스트 결과가 있고 마일나리가 300이상인 회원만 입양 신청이 가능합니다.</p>
					</a>
					</div>
					<div class="list-group">
					<a href="#" onclick="developer()" class="list-group-item" style=" background-color: #FFCC00;border-color: #FFCC00;height:122px">
						<h4 class="list-group-item-heading"><img src="/gaenari/static/images/developer.png" width="50px;"> 개발자정보</h4>
						<p class="list-group-item-text">개나리 프로젝트를 개발한 개발자정보입니다.</p>
					</a>
					</div>
				</div>
				
				<div class="well" id="well">
					
					<c:choose>
						<c:when test="${sessionScope.mdto != null}">
							<div class="col-sm-6 col-md-3" id="thumb">
								<div class="thumbnail" style="text-overflow: ellipsis;">
									<br>
									<img src="/gaenari/image/board/${sessionScope.mdto.brdno}.jpg"
										width="200px" class="img-rounded">
									<div class="caption">
										<h4>${sessionScope.mdto.mname}를찾습니다!</h4>
										<p>${sessionScope.mdto.title}</p>
										<p>
											<a href="/gaenari/missingBoardView.do?mbrdno=${sessionScope.mdto.mbrdno}" class="btn btn-primary">봤어요</a> 
											<a href="/gaenari/missingBoardMain.do" class="btn btn-default">다른신고보기</a>
										</p>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="col-sm-6 col-md-3" id="thumb">
								<div class="thumbnail" style="text-overflow: ellipsis;">
									<br>
									<img src="/gaenari/image/defaultDog.jpg"
										width="200px" class="img-rounded">
									<div class="caption">
										<h4>아무정보도 없습니다.</h4>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					<%
						String img = null;				
						List<UserDTO> list = null;
						List<UserDTO> imgUser = null;
						UserDTO user = null;
						DiaryDTO diary = null;
						int ran = 0;
						if (session.getAttribute("userid") == null) {	//세션의 유저정보가 없으면[로그인 상태가 아니면]
							list = UserDAO.allUsers();					//타입이 0인 일반유저를 모두 불러옴
							imgUser = new ArrayList<UserDTO>();	
							for (int i = 0; i < list.size(); i++) {		//모든 유저들을 for문 돌려서 다이어리DTO에 user마다의 마지막 일기를 저장
								diary = TestDAO.selectLastDiary(list.get(i).getUserno());
								if (diary != null) {					//다이어리 정보가 있는 user의 경우에
									if (diary.getBrdcontent().split("!split!")[0].trim().length() != 0) {	//마지막일기에 이미지가 등록되어있으면
										imgUser.add(list.get(i));
									}
								}		//결국 imgUser에는 마지막일기를 보유한 사람중에 그 일기에 이미지를 등록한 사람의 리스트가 저장된다.
							}
							ran = (int) (Math.random() * imgUser.size());	// 사람들 수 만큼 랜덤값을 얻어낸다.
							user = imgUser.get(ran);
							request.setAttribute("randomUser", user);
							request.setAttribute("img",TestDAO.selectLastDiary(user.getUserno()).getBrdcontent().split("!split!")[0]);
						}
					%>
					<div class="col-sm-6 col-md-3" id="thumb">
                     	<div class="thumbnail" style="text-overflow: ellipsis;"><br>
                     		<c:choose>
                     			<c:when test="${sessionScope.userid == null}"><!-- 로그인 안 된 상태 -->
									<img src="${requestScope.img}" width="200px" class="img-rounded">
									<div class="caption">
										<h4><img src="${requestScope.randomUser.img}" width="30" class="img-rounded">${requestScope.randomUser.userid}님의 최근 게시물</h4>
										<%-- <p>${sessionScope.mdto.title}</p> --%>
										<p>
											<a href="#" class="btn btn-primary" onclick="visitUser('${requestScope.randomUser.userid}')">정보보기</a>
                                            <a href="/gaenari/home.do" class="btn btn-default">다른사람보기</a>
										</p>
									</div>
								</c:when>
                     			<c:otherwise><!-- 로그인 된 상태 -->
                     				<c:choose>
                     					<c:when test="${requestScope.randomUser == null}"><!-- 친구 한 명도 없을 때 -->
											<img src="/gaenari/image/smalldog.jpg" width="200px" class="img-rounded">
											<div class="caption">
												<h4>등록된 친구가 없습니다.</h4>
												<p>개작은집에서 친구를 검색해보세요!</p>
												<p>
													<a href="/gaenari/friends.do?userid=${sessionScope.user.userid}" class="btn btn-info">검색하러가기</a>
												</p>
											</div>
                     					</c:when>
                     					<c:otherwise><!-- 친구 있을 때 -->
                     						<img src="${requestScope.checkImg}" width="200px" class="img-rounded">
											<div class="caption">
												<h4><img src="${requestScope.randomUser.img}" width="30" class="img-rounded">${requestScope.randomUser.userid}님의 최근 게시물</h4>
												<p>${requestScope.checkCont}</p>
												<p>
													<a href="#" class="btn btn-primary" onclick="visitUser('${requestScope.randomUser.userid}')">방문하기</a>
                                                    <a href="/gaenari/home.do" class="btn btn-default">다른사람보기</a>
												</p>
											</div>
                     					</c:otherwise>
                     				</c:choose>
                     			</c:otherwise>
                     		</c:choose>
                     	</div>
                    </div>
				</div>
            </div>
        </div>
        <%@ include file="/static/pages/footer.jsp"%>
       </div>
        
    </body>
    <script type="text/javascript">
        function addDog() {
        	var newwindow;
        	var userid = "${sessionScope.userid}";
        	var url = "/gaenari/addDog.do?userid="+userid;
        	if(userid==0){
        		alert("로그인 해주세요");
        	}else{
        		newwindow = window.open(url, '강아지등록 페이지','height=600,width=660,scrollbars=yes');
        		if (window.focus) {
        			newwindow.focus;
        		}
        	}
        }
        function visitUser(userid) {
        	var newwindow;
        	var url = "/gaenari/miniHome.do?userid="+userid;
        
        	newwindow = window.open(url, '미니홈페이지','height=570,width=1000,scrollbars=yes');
        	if (window.focus) {
        		newwindow.focus;
        	}
        }
        function goQuest(){
        	var userid="${sessionScope.userid}";
        	var newwindow;
        	var url = "/gaenari/questionform.do?userid="+userid;
        
        	if(userid==0){
        		alert("로그인 해주세요");
        	}else{
        		newwindow = window.open(url, '입양테스트','height=570,width=800,scrollbars=yes');
        	}
    	}
        function developer(){
        	var newwindow;
        	var url = "/gaenari/developerInfo.jsp";
        	newwindow = window.open(url, '개발자정보','height=580,width=420,scrollbars=yes');
        }
    </script>
</html>
