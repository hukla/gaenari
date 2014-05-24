<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="2014-05-03:장재희:제품 상세 정보 페이지"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품 상세 정보 페이지</title>
</head>
<body>
	<!-- 제품 상세 정보 테이블 시작 -->
	<table width=950 cellpadding=0 cellspacing=0 align=center valign='top' border=0>
		<tr>
			<td>
				<form name="itemlist" method=post action="#" onsubmit="return submitSel()">
				<input type="hidden" name="selectedItemNo" value="${selectedItem.itemno }">
				<table align="center" width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<!--상품 이미지-->
							<td>
								<table width="380" cellpadding=0 cellspacing=0>
								  	<tr>
								    	<td colspan=3 align=center valign="middle">
											<table cellpadding=0 cellspacing=0 bgcolor=#E4E4E4>
												<tr>
									  		  	<td>
									  		  		<!-- popup TODO -->
								                	<a href="javascript:popupOpen(${selectedItem.itemno})"><img id='${selectedItem.itemno}' src='mall/img/${selectedItem.itemno}_s.jpg' width='350' height='350' border='0' align='absmiddle'></a>
								              	</td>
												</tr>
											</table>
										</td>
								  	</tr>
								  	<tr>
								    	<td height=10 colspan=3 valign="middle"/>
								    	<!-- 큰 이미지와 작은 이미지 사이 공백 -->
								  	</tr>
								  	<!--작은이미지 시작-->
								  	<tr>
								    	<td align="center">
								    		<a href="javascript:popupOpen(${selectedItem.itemno})">
								       		<img id='middle1' src='mall/img/${selectedItem.itemno}_s.jpg' border=0 width=80 height=80 style='border: 2px solid #E4E4E4;' ></a>
								    	</td>
								  	</tr>
								  	<!--작은이미지 끝-->
								</table>
							</td>
							<!-- 상품 이미지 끝 -->
							<!-- 상품 정보 시작 -->			
							<td valign="top" width=520 align=center cellpadding=0 cellspacing=0>
								<!-- 상품명 시작 -->
								<table width=500 valign="top" cellpadding=0 cellspacing=0>
									<tr>
										<td valign=top>
											<span style='font-size: 18px; font-family: 돋움; line-height: 130%;'>
												<strong><!-- 상품명 -->${selectedItem.itemname}</strong>
											</span>
										</td>
									</tr>
									<tr>
										<td height=5></td>
									</tr>
									<tr>
										<td colspan="3" height="2" bgcolor="#97c7e4"></td><!-- 상품명 밑에 밑줄 -->
									</tr>
								</table>
								<!-- 상품명 끝 -->
								
								<!-- 상품 정보 시작 -->
								<table width=500 cellpadding=0 cellspacing=0>
									<colgroup width=120></colgroup>
									<colgroup width=20></colgroup>
									<colgroup width=360></colgroup>
									<!-- 소비자 가격 시작 -->
									<tr height=25>
										<td width="110" height="27" bgcolor="#FFFFFF" class="list2">
											<img src='mall/img/dot_n.gif'> 소비자가격
										</td>
										<td width=33 align=center bgcolor="#FFFFFF">
											<img src='mall/img/line_dot4.gif'>
										</td>
										<td bgcolor="#FFFFFF">
											<table border=0 cellspacing=0 cellpadding=0>
												<tr valign="middle">
													<td width="219" valign="middle">&nbsp;
														<b> <font color="#777777">\</font>
															<font style="font-size: 14px;"><fmt:formatNumber value="${selectedItem.price}"/></font>
														</b>
														<input type=hidden name=disp_cust_amount size=12 style='text-align: left; background-color: E7F2FB; border: none; border-width: 0px; font-weight: bold; width: 90px; color: #777777; text-decoration: line-through;' readonly value='40,000'>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<!-- 소비자 가격 끝 -->
									<!-- 적립 개나리 포인트 시작 -->
									<tr height=25>
										<td width="115" height="27" bgcolor="#FFFFFF" class="list2">
											<img src='mall/img/dot_n.gif'> 적립포인트
										</td>
										<td width=33 align=center bgcolor="#FFFFFF">
											<img src='mall/img/line_dot4.gif'>
										</td>
										<td bgcolor="#FFFFFF">&nbsp;&nbsp;
											<img src='mall/img/btn_point.png' align='absmiddle' width="20" height="relative">&nbsp;
											<span id="gnr_point" style="border-width: 0px; font-weight: bold; font-family: Geneva; color: #666666;"><fmt:formatNumber maxFractionDigits="0" value="${selectedItem.price * 0.05}"/></span>
											<input type="hidden" name="gnr_point" value="${selectedItem.price * 0.05}"> 
										</td>
									</tr>
									<!-- 적립 개나리 포인트 끝 -->
									<!-- 기부 수량 시작 -->
									<tr height=25>
										<td width="115" height="27" bgcolor="#FFFFFF" class="list3">
											<img src='mall/img/dot_n.gif'> 기부수량
										</td>
										<td width=33 align=center bgcolor="#FFFFFF">
											<img src='mall/img/line_dot4.gif'>
										</td>
										<td bgcolor="#FFFFFF">&nbsp;&nbsp; 
											<input type=text name='ct_qty' value='1' size=5 maxlength=5 class='ed' autocomplete='off' style='text-align: center;' onkeyup='qty_keyup()'>
												<img src='mall/img/qty_control.gif' border=0 align=absmiddle usemap="#qty_control_map"> 개 
													<map name="qty_control_map">
														<area shape="rect" coords="0, 0, 10, 9" href="javascript:qty_add(+1);">
														<area shape="rect" coords="0, 10, 10, 19" href="javascript:qty_add(-1);">
													</map>
										</td>
									</tr>
									<!-- 기부 수량 끝 -->
									<!-- 기부 대상 시작 -->
									<tr>
										<td width="115" height="27" bgcolor="#FFFFFF" class="list3">
											<img src='mall/img/dot_n.gif'> 기부 대상
										</td>
										<td width=33 align=center bgcolor="#FFFFFF">
											<img src='mall/img/line_dot4.gif'>
										</td>
										<td bgcolor="#FFFFFF">&nbsp;&nbsp; 
											<select name="don_target">
												<option value="0">기부할 센터 선택</option>
												<c:forEach items="${sessionScope.centerList}" var="cntr">
												<option value="${cntr.cntrno}">${cntr.cntrname }</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<!-- 기부 대상 끝 -->
									<!-- 밑줄 시작 -->
									<tr>
										<td colspan=3 height=1 bgcolor='#d6d6d6'></td>
									</tr>
									<!-- 밑줄 끝 -->
							</table>
							<!-- 상품 정보 끝 -->
							<!-- 구매하기 버튼 시작 -->
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td height=65 width="126">
									<input type="hidden" name="usertype" id="usertype" value="${sessionScope.user.usertype }">
									<c:choose>
										<c:when test="${sessionScope.user.usertype == 0}">
											<button onclick="donnate()">기부하기</button>
										</c:when>
										<c:when test="${sessionScope.user.usertype == -1 }">
											<input type="submit" value="상품 정보<br/>수정하기">
										</c:when>
										<c:otherwise>
											<input type="submit" value="요청하기">
										</c:otherwise>
									</c:choose>
									</td>
								</tr>
							</table>
							<!-- 구매하기 버튼 끝 -->
							
						</td>
						<!-- 상품 정보 테이블 끝 -->
						<td width="1" bgcolor="#FFFFFF"></td>
					</tr>
					<tr>
						<td colspan="4" height="1" bgcolor="#FFFFFF"></td>
					</tr>
				</table>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan=2 height=20></td>
		</tr>
		</table>
		<!-- 상단 제품 상세 정보 테이블 끝 -->
		
		<br>
		<br>
		
		<!-- 상세정보 제목 테이블 시작 -->
		<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td>
				상세정보
				</td>
			</tr>
		</table>
		<!-- 상세정보 제목 테이블 끝 -->
		<!-- 상품설명 시작 -->
		<div id='item_explan' style='display: block;'>
			<table width=100% align="center" cellpadding=0 cellspacing=0>
				<tr>
					<td style='padding: 15px'>
						${selectedItem.itemdetail}						
					</td>
				</tr>
			</table>
		</div> 
		<!-- 상품설명 끝 -->
</body>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
		function popupOpen(itemno){
			var popUrl = "mall/img/"+itemno+"_s.jpg";	//팝업창에 출력될 페이지 URL
			var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
		}
		
		// 수량 추가
		function qty_add(x) {
			var res = parseInt(document.itemlist.ct_qty.value) + parseInt(x);
			if(res > 0) {
				document.itemlist.ct_qty.value = res;
			}
		}
		
		// 수량 키보드 입력 예외 처리
		function qty_keyup() {
			if(parseInt(document.itemlist.ct_qty.value) < 0) {
				document.itemlist.ct_qty.value=1;
			}
		}
		
		function donnate() {
			document.itemlist.action = "control?command=donnate";
			document.itemlist.submit();
		}
		
		/*
		function submitSel() {
			var usertype = document.getElementById("usertype");
			var action = document.itemlist.action;
			
			if(usertype == 0) {
				action = "control?command=donnate";
				return true;
			} else if(usertype == -1) {
				action = "control?command=itemUpdateForm&itemno="+itemno; // TODO 새 창을 열고 싶은데...!!!
				return true;
			} else {
				action = "";
				return true;
			}
			
			return false;
		}*/
	</script>
<!-- 상품정보 소셜네트워크로 보내기
							<table border="0" cellspacing="0" cellpadding="0" align="center">
								<tr>
									<td height=25>
										<a href="http://twitter.com/home/?status=%5BANF%5D+%ED%94%84%EB%A6%AC%EB%AF%B8%EC%97%84+%EC%96%91%EA%B3%A0%EA%B8%B0+%28%EB%9E%A828%29+7.5kg+++http%3A%2F%2Fohdog.co.kr%2Fshop%2Fitem.php%3Fit_id%3D1201077495" target="_blank">
											<img src="http://www.ohdog.co.kr/shop/img/item/btn_sns01.gif" height="25" border="0" alt="twitter로 보내기">
										</a>
									</td>
									<td>
										<a href="http://www.facebook.com/sharer.php?u=http%3A%2F%2Fohdog.co.kr%2Fshop%2Fitem.php%3Fit_id%3D1201077495&t=%5BANF%5D+%ED%94%84%EB%A6%AC%EB%AF%B8%EC%97%84+%EC%96%91%EA%B3%A0%EA%B8%B0+%28%EB%9E%A828%29+7.5kg"
										target="_blank">
											<img src="http://www.ohdog.co.kr/shop/img/item/btn_sns02.gif" height="25" border="0" alt="facebook으로 보내기">
										</a>
									</td>
									<td>
										<a href="http://yozm.daum.net/api/popup/prePost?sourceid=41&link=http%3A%2F%2Fohdog.co.kr%2Fshop%2Fitem.php%3Fit_id%3D1201077495&prefix=%5BANF%5D+%ED%94%84%EB%A6%AC%EB%AF%B8%EC%97%84+%EC%96%91%EA%B3%A0%EA%B8%B0+%28%EB%9E%A828%29+7.5kg"
										target="_blank">
											<img src="http://www.ohdog.co.kr/shop/img/item/btn_sns03.gif" height="25" alt="요즘으로 보내기" border="0">
										</a>
									</td>
									<td>
										<a href='http://me2day.net/posts/new?new_post[body]=%5BANF%5D+%ED%94%84%EB%A6%AC%EB%AF%B8%EC%97%84+%EC%96%91%EA%B3%A0%EA%B8%B0+%28%EB%9E%A828%29+7.5kg+++++++["%EC%98%A4%EB%8F%84%EA%B7%B8":http%3A%2F%2Fohdog.co.kr%2Fshop%2Fitem.php%3Fit_id%3D1201077495+]&new_post[tags]=%EC%83%81%ED%92%88+%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0+%3A+ANF+-+%5BANF%5D+%ED%94%84%EB%A6%AC%EB%AF%B8%EC%97%84+%EC%96%91%EA%B3%A0%EA%B8%B0+%28%EB%9E%A828%29+7.5kg+'
										target="_blank">
											<img src="http://www.ohdog.co.kr/shop/img/item/btn_sns04.gif" height="25" border="0" alt="Me2Day로 보내기">
										</a>
									</td>
								-->
								<!--  북마크추가 
									<td>
										<a href="http://bookmark.naver.com/post?ns=1&title=%5BANF%5D+%ED%94%84%EB%A6%AC%EB%AF%B8%EC%97%84+%EC%96%91%EA%B3%A0%EA%B8%B0+%28%EB%9E%A828%29+7.5kg&url=http://ohdog.co.kr/shop/item.php?it_id=1201077495"
										target="_blank">
										<img src="http://www.ohdog.co.kr/shop/img/item/btn_sns05.gif" alt="네이버로 북마크 하기"
															height="25" border="0">
										</a>
									</td>
									<td>
										<a href="https://www.google.com/bookmarks/mark?op=add&title=%5BANF%5D+%ED%94%84%EB%A6%AC%EB%AF%B8%EC%97%84+%EC%96%91%EA%B3%A0%EA%B8%B0+%28%EB%9E%A828%29+7.5kg&bkmk=http://ohdog.co.kr/shop/item.php?it_id=1201077495"
												target="_blank">
											<img src="http://www.ohdog.co.kr/shop/img/item/btn_sns06.gif" alt="구글로 북마크 하기"
															height="25" border="0">
										</a>
									</td>
								</tr>
							</table> 
							//상품정보 소셜네트워크로로 보내기
							-->
</html>