<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="2014-05-03:장재희:기부몰 메인 페이지"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기부몰 메인 페이지</title>
</head>
<body>
	<h1 align="center">사랑을 나누세요</h1>
	<h2 align="right"><a href="../control?command=itemList&url=mall/manage.jsp"><button>관리하기</button></a></h2>
	<hr>

	<!--상품 리스트 스타일-->
	<style>
		#item_list {
			width: 945px;
			text-align: center;
			vertical-align: middle;
		}
		
		#item_list ul {
			width: 945px;
			border: 0;
			margin: 0;
			outline: 0;
			padding: 0;
			list-style: none;
		}
		
		#item_list ul li {
			width: 20%;
			height: 270px;
			vertical-align: baseline;
			overflow: hidden;
			display: inline;
			float: left;
			text-align: center;
		}
	</style>
	<!--//상품 리스트 스타일-->
	<!-- 상품 리스트 -->
	<table>
	<tr>
		<td>
			<div id="item_list">
				<ul>
		            <!-- 가져오기 반복문 -->
					<c:forEach items="${itemList}" var="item" >
						<li>
							<table width="150" border="0" cellspacing="0" cellpadding="0">
								<!-- 상품 이미지 -->
			                	<tr>
			                		<td align="center" valign="middle">
			                	  		<a href='../control?command=getItem&itemno=${item.itemno}&url=mall/detail.jsp'><img id='${item.itemno}_s' src='img/${item.itemno}_s.jpg' width='160' height='160' border='0' align='absmiddle'></a>
			                  		</td>
			                	</tr>
			                	<!--상품명-->
            					<tr align="center">
            						<td height="35" class="item_name">
            							<a href='../control?command=getItem&itemno=${item.itemno}&url=mall/detail.jsp'>${item.itemname }</a>
            						</td>
            					</tr>
            					<!--가격 및 마일리지-->
					            <tr>
					              <td align="center">
						              <span class="item_price">${item.price }</span>
						              <span class="item_mileage">${item.price * 0.05}</span>
					              </td>
					            </tr>
					            <!--기부하기-->
		            			<tr>
		            				<td align="center">
										<button value="기부하기">기부하기</button>
									</td>
								</tr>
							</table>
						</li>
		            </c:forEach>
		            <!-- //가져오기 반복문 -->
		          </ul>
			</div>
		</td>
	</tr>
	</table>
	<!-- //상품 리스트 -->
</html>