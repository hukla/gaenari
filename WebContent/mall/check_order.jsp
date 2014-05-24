<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="2014-05-03:장재희:주문 확인"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 주문 리스트 시작 -->
<h2>주문 리스트</h2>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td bgcolor="#3d9bf1" height="2" colspan="8"></td>
	</tr>
	<tr bgcolor="#f0f8ff">
		<td width="10" height="35"></td>
		<td width="345" align="center" class="cart_point2"><strong>주 문 상 품</strong></td>
		<td width="95" align="center" class="cart_point2"><strong>판매가격</strong></td>
		<td width="95" align="center" class="cart_point2"><strong>주문수량</strong></td>
		<td width="95" align="center" class="cart_point2"><strong>적립금액</strong></td>
		<td width="95" align="center" class="cart_point2"><strong>주문합계</strong></td>
		<td width="40" align="center" class="cart_point2"><strong>삭제</strong></td>
	</tr>
	<tr>
		<td colspan="8" bgcolor="#c5c5c5" height="1"></td>
	</tr>
	<tr><td height="8" colspan="8"></td></tr>
	<tr>
		<td></td>
		<td>
			<!-- 상품명 -->
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="60" align="center"><a href='http://www.ohdog.co.kr/shop/item.php?it_id=1183376187' target=_top><img id='1183376187_s' src='http://www.ohdog.co.kr/data/item/1183376187_s' width='50' height='50' border='0' align='absmiddle'></a></td>
				<td style="text-align:left;">
					<b><a href='http://www.ohdog.co.kr/shop/item.php?it_id=1183376187' target=_top>ANF 퍼피 3kg</a></b>
									</td>
			</tr>
			</table>
		</td>
		<td valign="middle" align="center">
			<!-- 판매가 -->
			<strike>30,000원</strike><br>
			<b><font color=blue size=3>20,200원</font></b>
		</td>
		<td valign="middle" align="center">
			<!-- 수량 -->
			<b> <font size=3> 1 </font></b>
		</td>
		<td align="center">
			<!-- 적립 -->
            <img src="http://www.ohdog.co.kr/shop/payment/cart/cart_icon_p.gif" width="12" height="12"> <font color=red><b>0 원</b></font><br>
	  		<img src="http://www.ohdog.co.kr/shop/payment/cart/cart_icon_c.gif" width="12" height="12"> <font color=red><b>0 원</b></font></td>
		<td class="cart_css02" align="center">
			<!-- 합계 -->
			20,200 원
		</td>
		<td align="center">
			<!-- 삭제 -->
			<button>삭제</button>
		</td>
	</tr>
	<tr><td height="8" colspan="8"></td></tr>
	<tr>
		<td height="2" bgcolor="#3d9bf1" colspan="8"></td>
	</tr>
</table>

<div style="height:20px; overflow:hidden; width:100%;"></div>
<!-- 주문 리스트 끝 -->

<!-- 결제 정보 -->
<div class="cover_div">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td colspan="3" bgcolor="#E2E0E0" height="5"></td>
		</tr>	
		<tr>
			<td bgcolor="#E2E0E0" width="5"></td>
			<td width="99%">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="160" height="35" align="center">총 주문금액</td>
						<td></td>
						<td width="160" align="center">배송비</td>
						<td></td>
						<td width="160" align="center">총 구매금액</td>
					</tr>
					<tr>
						<td colspan="10" bgcolor="#c5c5c5" height="1"></td>
					</tr>
					<tr>
						<td height="57" align="center" class="cart_css1"><!-- 총 주문금액 --> 20,200 원</td>
						<td align="center"><img src="http://www.ohdog.co.kr/shop/img/cart_plus.gif" width="24" height="24"></td>
						<td align="center" class="cart_css1" id="sendcost_info"><!-- 배송비 -->2,500 원</td>
						<td align="center"><img src="http://www.ohdog.co.kr/shop/payment/cart/cart01_07.gif" width="24" height="24"></td>
						<td align="center">
							<p><font color=#ff0000 valign=top><b><label id="m_pay_amount"><!-- 총 구매 금액 -->0</label> 원</b></font></p>
						</td>
					</tr>
				</table>
			</td>
			<td bgcolor="#E2E0E0" width="5"></td>
		</tr>
		<tr>
			<td colspan="3" bgcolor="#E2E0E0" height="5"></td>
		</tr>
	</table>
</div>

<div style="height:20px; overflow:hidden; width:100%;"></div>
<!-- 결제 정보 끝 -->

<!-- 결제하기 버튼 시작 -->
<table align="center">
	<tr>
		<td height="20px"></td>
	</tr>
	<tr>
		<td><button>결제하기</button></td>
	</tr>
</table>
<!-- 결제하기 버튼 끝 -->
</body>
</html>