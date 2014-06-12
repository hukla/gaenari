<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/static/pages/head.jsp"%>
    </head>
    <body>
        <div id="wrapper">
            <div id="content">
                <div class="container">
                    <!--TODO-->
                    <div class="explore-search-top">
                        <div class="explore-info">
                            <div class="explore-info-title">신청자 정보확인</div>
                            <div class="explore-info-description">해당 자원봉사를 신청한 유저 목록입니다.</div>
                        </div>
                    </div>
                    <div class="explore-search-results" data-brdno="${requestScope.brdno}">
                        <table id="reqbrd_list" class="table .table-condensed">
                            <tr style="background-color:#FC0;">
                            	<th>신청자번호</th>
                            	<th>이름</th>
                                <th>마일나리</th>
                                <th>지역</th>
                                <th>수락하기</th>
                            </tr>
                            <!-- 글 레코드 시작 -->
                            <tr>
                                <td colspan="5" style="text-align:center;font-size:15px;font-weight:bold;color:gray;">자원봉사를 신청한 사람이 없습니다.</td>
                            </tr>
                            <!-- 글 레코드 끝 -->
                        </table>
                    </div>
                    <!--TODO-->
                </div>
            </div>
        </div>
    </body>
    <script>
    $(function () {
        $.ajaxSetup({
            contentType: 'application/x-www-form-urlencoded;charset=UTF-8',
            type: "post"
        });
        
        
        function getVoluReqList() {
            $.ajax({
                url: "/gaenari/voluReqSelect.do",
                dataType: "json",
                data: "brdno="+$('.explore-search-results').data('brdno'),
                success: function (data) {
                    //alert(data);
                	
                	var list = data.brdtoList;
                	
                	if(data.brdtoList[0] != 'empty') {
                	
	                    $("#reqbrd_list tr:gt(0)").remove();
	                    
	                    $.each(data.brdtoList, function (index, item) {
	                    	var brdreq = item; //alert(brdreq);
	                        
	                    	var line = $('<tr>');
	                    	
	                    	line.append($('<td>').html(index+1))
	                    		.append($('<td>').html(brdreq.name))
	                    		.append($('<td>').html(brdreq.point))
	                    		.append($('<td>').html(brdreq.address));
	                    	
	                    	if (true) {
	                        	line.append($('<td>').attr('id', 'reqSend').append($("<input type='button' class='btn btn-yellow' value='수락하기' id='send' name='" + $(this).find("drno").text() + "'>")));
	                        } else {
	                        	line.append('<td>수락됨</td>');
	                        }
	                        //alert(line);
	                        $('#reqbrd_list tr:eq(0)').after(line);
	                    });
                	}
                    
                },
                error: function (data) {
                	alert($('.explore-search-results').data('brdno'));
                    alert(data + ' => 에러 발생');
                }
            }); // ajax 끝
        } // getVoluReqList() 함수 끝
        
        getVoluReqList();
    });
    </script>
</html>