<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/frame.jsp"%>
<%@ include file="menu2.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="model.dto.VoluBoardDTO" %>
<%@ page import="model.dao.UserDAO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자원봉사 구해요/할래요!</title>
</head>
<body>

	<table align="center" border="1" cellpadding="5" cellspacing="2" width="80%">
				<colgroup>
						<col width="7%"/>
						<col width="60%"/>
						<col width="11%"/>
						<col width="15%"/>
						<col width="7%"/>
					</colgroup>
					<tr>
						<td>
							<p align="center"><font color="black"><b><span style="font-size:10pt;">글번호</span></b></font></p>
						</td>
						<td>
							<p align="center"><font color="black"><b><span style="font-size:10pt;">제 목</span></b></font></p>
						</td>
						<td>
							<p align="center"><font color="black"><b><span style="font-size:9pt;">작 성 자</span></b></font></p>
						</td>
						<td>
							<p align="center"><font color="black"><b><span style="font-size:9pt;">작 성 일</span></b></font></p>
						</td>
					</tr>
					    <c:choose>
    						<c:when test="${not empty requestScope.tenVolu}">
							<c:forEach items="${requestScope.tenVolu}" var="volu">
								    <tr>
								    	<td><p align="center">${volu.vbrdno}</p></td>
								        <td bgcolor="">
											<p><span style="font-size:9pt;">
											<a href="/gaenari/control?command=voluBoardView&vbrdno=${volu.vbrdno}">
											${volu.title}</a></span></p>
								        </td>
								        <td bgcolor="">
								            <p align="center"><span style="font-size:9pt;">
											${volu.userid}</span></p>
								        </td>
								        <td bgcolor="">
								            <p align="center"><span style="font-size:9pt;">
								            ${volu.wrdate}</span></p>
								        </td>
								    </tr>
						    </c:forEach>
						    <c:if test="${fn:length(tenVolu) < 10}">
								<c:forEach begin="1" end="${10-fn:length(tenVolu)}">
									<tr height="30">
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</c:forEach>
							</c:if>
						</c:when>
						<c:otherwise>
					    	<tr>
								<td colspan="3" align="center">등록된 자원봉사가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
						<tr height="30">
							<td colspan="4" align="center">
								<c:choose>
									<c:when test="${not empty requestScope.pageCount}">
										<ul class="pagination">
											<c:choose>
												<c:when test="${requestScope.pageNumber-1 > 0}">
													<li><a href="control?command=voluBoardList&pageNumber=${requestScope.pageNumber-1}">«</a></li>
												</c:when>
												<c:otherwise>
													<li><a href="#">«</a></li>
												</c:otherwise>
											</c:choose>
											<c:forEach begin="1" end="${requestScope.pageCount}" var="cnt">
												<c:choose>
													<c:when test="${cnt eq requestScope.pageNumber}">
														<li class="active">
															<a href="control?command=voluBoardList&pageNumber=${cnt}">
																${cnt}<span class="sr-only">(current)</span>
															</a>
														</li>
													</c:when>
													<c:otherwise>
														<li><a href="control?command=voluBoardList&pageNumber=${cnt}">${cnt}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
												<c:choose>
													<c:when test="${requestScope.pageNumber+1 < requestScope.pageCount+1}">
														<li><a href="control?command=voluBoardList&pageNumber=${requestScope.pageNumber+1}">»</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="#">»</a></li>
													</c:otherwise>
												</c:choose>
											</ul>
										</c:when>
										<c:otherwise>
											<div align="center">등록된 목록이 없습니다.</div>
										</c:otherwise>
									</c:choose>
	</table>
<hr>
<div align=right>
<span style="font-size:9pt;"><a href="/gaenari/board/voluBoardWrite.jsp"><input type="hidden" value=${id} name="id"><input type=submit value=글쓰기 onclick="return checkValid()"></a></span></div>
</body>
<script language="javascript">
function checkValid(){
	if(<%=UserDAO.logCheck((String)session.getAttribute("userid")).getUsertype()%>!=0){
		return true;
	}else{
		alert('센터 회원만 글 작성이 가능합니다.');
		return false;
	}
}
</script>
</html>
<%@ include file="../bottom.jsp"%>