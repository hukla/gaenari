<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.dto.UserDTO" %>
<%@ page import="model.dao.UserDAO" %>
<%@ page import="model.dao.TestDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/static/pages/head.jsp" %>
        <style type="text/css">
            body {
            background-color: white;
            }
            div#myCarousel {
            width: 100%;
            heigth: 300px;
            }
            div#container {
            width: 980px;
            float: left;
            margin-left: 8%;
            margin-top: 20px;
            }
            div#media{
            margin-top:20px;
            float: left;
            margin-left: 5%;
            width: 330px;
            height: 500px;
            background-color: darkkhaki; 
            border-top-left-radius: 5px; 
            border-top-right-radius: 5px; 
            border-bottom-left-radius: 5px; 
            border-bottom-right-radius: 5px;
            }
            div#siteInfo {
            margin-top:20px;
            margin-right: 5%;
            float: right;
            width: 680px;
            height: 80px;
            background-color: gray;
            border-top-left-radius: 5px; 
            border-top-right-radius: 5px; 
            border-bottom-left-radius: 5px; 
            border-bottom-right-radius: 5px;
            }
            div#thumb {
            float: left;/* 
            margin-left: 5%; */
            width: 50%;
           	height: 200px;
            }
            div#thumb2 {
            margin-top:20px;
            float: left;
            left:;
            width: 400px;
            }
            div#con {
            margin-top:20px;
            float: left;
            left:;
            width: 33%;
            height: 100%;
            }
            div#well{
            margin-top:15px;
            margin-right: 5%;
            float: right;
            width: 680px;
            height: 406px;
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
            <div class="container">
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
                
                <!-- 자원봉사 펫도우미 최신글 -->
				<div class="media" id="media">
					<a class="pull-left" href="#"> 
						<img class="media-object" src="/gaenari/image/dog9.jpg" width="130px">
					</a>
					<div class="media-body">
						<h5 class="media-heading">Mawoef aowgijoawrjglari awgjowagj
							awiw gi gwg jpwjgwairjawoef aowgijoawrjglari awgjowagj awiw gi
							gwg jpwjgwairjawoef aowgijoawrjglari awgjowagj awiw gi gwg
							jpwjgwairj
						</h5>
					</div>
					<a class="pull-left" href="#"> 
						<img class="media-object" src="/gaenari/image/dog9.jpg" width="130px">
					</a>
					<div class="media-body">
						<h5 class="media-heading">awoef aowgijoawrjglari awgjowagj
							awiw gi gwg jpwjgwairjawoef aowgijoawrjglari awgjowagj awiw gi
							gwg jpwjgwairjawoef aowgijoawrjglari awgjowagj awiw gi gwg
							jpwjgwairj
						</h5>
					</div>
				</div>
				<div id="siteInfo">
					<div class="col-sm-6 col-md-3" id="con">
                        <div class="panel panel-default" style="height: 60%; background-color: transparent;">
                        	fasdifw
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3" id="con">
                        <div class="panel panel-default" style="height: 60%; background-color: transparent;">
                        	fasdifw
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3" id="con">
                        <div class="panel panel-default" style="height: 60%; background-color: transparent;">
                        	fasdifw
                        </div>
                    </div>
				</div>
				<div class="well" id="well">
					
                    <div class="col-sm-6 col-md-3" id="thumb">
                        <div class="thumbnail">
                            <br><img src="/gaenari/image/board/${sessionScope.mdto.brdno}.jpg" width="200" class="img-rounded">
                            <div class="caption">
                                <h3>${sessionScope.mdto.mname}를 찾습니다!</h3>
                                <p>${sessionScope.mdto.title}</p>
                                <p>
                                    <a href="/gaenari/missingBoardView.do?mbrdno=${sessionScope.mdto.mbrdno}" class="btn btn-primary">봤어요</a> <a
                                        href="/gaenari/missingBoardMain.do" class="btn btn-default">다른신고보기</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <%
                        String img = null;
                        List<UserDTO> list = null;
                        List<UserDTO> imgUser = null;
                        UserDTO user = null;
                        int ran = 0;
                        	if(session.getAttribute("userid")==null){
                        		list = UserDAO.allUsers();
                        		imgUser = new ArrayList<UserDTO>();
                        		for(int i=0;i<list.size();i++){
                        			if(TestDAO.selectLastDiary(list.get(i).getUserno())!=null){
                        				if(TestDAO.selectLastDiary(list.get(i).getUserno()).getBrdcontent().split("!split!")[0]!=null){
                        					imgUser.add(UserDAO.selectOne(list.get(i).getUserno()));
                        				}
                        			}
                        		}
                        		ran = (int)(Math.random()*imgUser.size());
                        		user = UserDAO.selectOne(imgUser.get(ran).getUserno());
                        		request.setAttribute("randomUser", user);
                        		request.setAttribute("img", TestDAO.selectLastDiary(user.getUserno()).getBrdcontent().split("!split!")[0]);
                        	}
                        %>
                        
                        <div class="col-sm-6 col-md-3" id="thumb">
                        	<div class="thumbnail">
                        	    <br><img src="/gaenari/image/board/${sessionScope.mdto.brdno}.jpg" width="200" class="img-rounded">
                        	    <c:choose>
                                	<c:when test="${sessionScope.userid != null}">
                                    	<c:choose>
                                        	<c:when test="${requestScope.randomUser != null}">
                                            	<img src="${requestScope.checkImg}" width="100%">
                                                	${requestScope.checkCont}
                 							</c:when>
											<c:otherwise>친구정보가 없습니다.</c:otherwise>
                                        </c:choose>
                                    </c:when>
                                	<c:otherwise>
                                	</c:otherwise>
                                </c:choose>
                        	    <div class="caption">
                        	        <h3>${requestScope.randomUser.userid}님의 최근 게시물
                        	        	<c:choose>
                                   			<c:when test="${requestScope.randomUser !=null}">
                                       			<img src="${requestScope.randomUser.img}" width="30" class="img-rounded">
                                        		${requestScope.randomUser.userid}님의 최근 게시물
                                    		</c:when>
                                   			<c:otherwise>
                                    		</c:otherwise>
                                		</c:choose>
                        	        </h3>
                        	        <p>내용내용내용내용내용내용내용내용내용내용내용</p>
                        	        <p>
                        	        	<c:choose>
                                            <c:when test="${sessionScope.userid != null}">
                                                <c:choose>
                                                    <c:when test="${requestScope.randomUser != null}">
                                                        ${requestScope.checkCont}<br>
                                                        <a href="#" class="btn btn-primary" onclick="visitUser('${requestScope.randomUser.userid}')">방문하기</a>
                                                        <a href="/gaenari/home.do" class="btn btn-default">다른사람보기</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        친구정보가 없습니다.
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="/gaenari/home.do" class="btn btn-default">다른게시물보기</a>
                                            </c:otherwise>
                                        </c:choose>
                       		        </p>
                   	         	</div>
                        	</div>
                    	</div>
				</div>
            </div>
        </div>
        <%@ include file="/static/pages/footer.jsp"%>
    </body>
    <script type="text/javascript">
        function addDog() {
        	var newwindow;
        	var url = "/gaenari/addDog.do?userid=${sessionScope.user.userid}";
        
        	newwindow = window.open(url, '강아지등록 페이지',
        			'height=600,width=660,scrollbars=yes');
        	if (window.focus) {
        		newwindow.focus;
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
    </script>
</html>
