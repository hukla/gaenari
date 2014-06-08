<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <%@ include file="/static/pages/head.jsp"%>
    <body>
    	
        <div id="wrapper">
            <%@ include file="/static/pages/header.jsp"%>
            <div id="content">
                <%@ include file="/static/pages/menubar.jsp"%>
                <div class="container">
	                <div class="aside-menu">
	        			<%@ include file="menu.jsp" %>
	        		</div>
                    <div id="item-view-form">
                        <form name="itemlist" id="item_list" method='post'>
	                        <input type="hidden" name="selectedItemNo" value="${selectedItem.itemno }">
	                        <input type='hidden' name='item_name' value='${selectedItem.itemname}'>
							<input type=hidden name='price' value='${selectedItem.price}'>
	                        <input type="hidden" name="gnr_point" value="${selectedItem.price * 0.05}">
	                        <input type='hidden' name='cntrname' id='cntr_name' value=''>
	                        <input type="hidden" name="usertype" id="usertype" value="${sessionScope.user.usertype }">
                            <div class="item-info-header">
                                <div class="item-dog-name">${selectedItem.itemname}</div>
                            </div>
                            <div class="item-info-main">
                                <div class="left-part" style="background-image: url('mall/img/${selectedItem.itemno}.jpg');" onclick="popupOpen(${selectedItem.itemno})"></div>
                                <div class="right-part">
                                    <div class="part-header">
                                        <div class="part-header-title">
                                            <fmt:formatNumber value="${selectedItem.price}"/>
                                            원 &nbsp; 
                                            <div class='label gaenarige-label'>${selectedItem.price * 0.05}</div>
                                            <br><br>
                                            <c:choose>
                                                <c:when test="${sessionScope.user.usertype > 0}">
                                                    <input type="submit" class="btn btn-yellow" value="요청하기">
                                                </c:when>
                                                <c:when test="${sessionScope.user.usertype < 0}">
                                                    <input type="submit" class="btn btn-yellow" value="상품 정보 수정하기">
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="submit" class="btn btn-yellow" value="기부하기">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="part-line-gray">기부수량</div>
                                    <div class="part-line">
                                        <input type=text name='ct_qty' class="form-control qty" value='1'>
                                        <img src='mall/img/qty_control.gif' border=0 align=absmiddle usemap="#qty_control_map"> 개 
                                        <map name="qty_control_map">
                                            <area shape="rect" coords="0, 0, 10, 9" href="javascript:qty_add(+1);">
                                            <area shape="rect" coords="0, 10, 10, 19" href="javascript:qty_add(-1);">
                                        </map>
                                    </div>
                                    <c:if test="${sessionScope.user.usertype == 0}">
                                        <div class="part-line-gray">기부 대상</div>
                                        <div class="part-line">
                                            <select name="don_target" class="form-control" id="target_sel">
                                                <option value="0">기부할 센터 선택</option>
                                                <c:forEach items="${sessionScope.centerList}" var="cntr">
                                                    <c:set var="test" value="${':'}${cntr.cntrno}${':'}"/>
                                                    <c:choose>
                                                        <c:when test="${fn:contains(selectedItem.reqcntr, test)}">
                                                            <option value="${cntr.cntrno}" style="color:red;font-weight:bold;">${cntr.cntrname}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${cntr.cntrno}">${cntr.cntrname }</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </c:if>
                                </div></div>
                        </form>
                    <div class="item-info-bottom">
                        <div class="content-container">
                            <div class="item-info-content">
                                <div class="item-info-content-text">
                                    ${selectedItem.itemdetail}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        <%@ include file="/static/pages/footer.jsp"%>
        </div>
        </div>
    </body>
    <script src="mall/scripts/detail.js"></script>
</html>