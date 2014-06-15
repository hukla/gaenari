<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/static/pages/head.jsp" %>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<!-- 
작성: 2014-05-27
작성자: 최성훈
내용: 강아지 정보 등록하기
 -->
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
</head>
<body>
	<div id="header">
		<div class="container visible">
			<a href="./">
			<img class="logo"
				src="/gaenari/static/images/logo.png" /></a>
		</div>
	</div>
	<table width="62%" align="center">
		<tr>
			<th colspan='2' style='text-align:center;font-size:20px;background-color:#FC0;padding:10px;'>강아지 등록하기</th>
		</tr>
		<tr>
			<td>
				<form action="dogInsert.do" method="post" enctype="multipart/form-data" id="addDogForm">
				<table class="table" align="center">
					<colgroup>
					<col width="30%"><col width="70%">
					</colgroup>
					<tr>
						<th>강아지 이름</th>
						<td><input class="form-control" type="text" size="29" name="dogname"></td>
					</tr>
					<tr>
						<th>강아지 생일</th>
						<td><input class="form-control" type="text" size="29" id="datepicker" name="dogbirth"></td>
					</tr>
					<tr>
						<th>강아지 종류</th>
						<td>
							<select name="dogtype" class="btn btn-default">
								<option selected="selected" value="unchosen">강아지 종을 선택하세요</option>
                             				<option value="골든리트리버" >골든리트리버</option>
                             				<option value="그레이하운드" >그레이하운드</option>
                             				<option value="그레이트덴" >그레이트덴</option>
                             				<option value="그레이트피레니즈" >그레이트피레니즈</option>
                             				<option value="뉴펀들랜드" >뉴펀들랜드</option>
                             				<option value="닥스훈트" >닥스훈트</option>
                             				<option value="달마시안" >달마시안</option>
                             				<option value="도베르만" >도베르만</option>
                             				<option value="래브라도리트리버" >래브라도리트리버</option>
                             				<option value="라사압소" >라사압소</option>
                             				<option value="라이카" >라이카</option>
                             				<option value="롯드와일러" >롯드와일러</option>
                             				<option value="마르티즈" >마르티즈</option>
                             				<option value="마리노이즈" >마리노이즈</option>
                             				<option value="마스티프" >마스티프</option>
                             				<option value="미니핀" >미니핀</option>
                             				<option value="바셋하운드" >바셋하운드</option>
                             				<option value="버니즈마운틴독" >버니즈마운틴독</option>
                             				<option value="보더콜리" >보더콜리</option>
                             				<option value="보스턴테리어" >보스턴테리어</option>
                             				<option value="복서" >복서</option>
                             				<option value="볼조이" >볼조이</option>
                             				<option value="불독" >불독</option>
                             				<option value="불테리어" >불테리어</option>
                             				<option value="브러쉬그리폰" >브러쉬그리폰</option>
                             				<option value="브리탄" >브리탄</option>
                             				<option value="비글" >비글</option>
                             				<option value="비어디드콜리" >비어디드콜리</option>
                             				<option value="브숑프리제" >브숑프리제</option>
                             				<option value="베들링턴테리어" >베들링턴테리어</option>
                             				<option value="빠삐용" >빠삐용</option>
                             				<option value="사모예드" >사모예드</option>
                             				<option value="삽살이" >삽살이</option>
                             				<option value="세인트버나드" >세인트버나드</option>
                             				<option value="세퍼드" >세퍼드</option>
                             				<option value="샤페이" >샤페이</option>
                             				<option value="쉐틀랜드쉽독" >쉐틀랜드쉽독</option>
                             				<option value="슈나우저" >슈나우저</option>
                             				<option value="스코티쉬테리어" >스코티쉬테리어</option>
                             				<option value="스텐다드푸들" >스텐다드푸들</option>
                             				<option value="스피츠" >스피츠</option>
                             				<option value="시바견" >시바견</option>
                             				<option value="시베리안허스키" >시베리안허스키</option>
                             				<option value="시추" >시추</option>
                             				<option value="아메리카코카스파니엘" >아메리카코카스파니엘</option>
                             				<option value="오브차카" >오브차카</option>
                             				<option value="아리리쉬세타" >아리리쉬세타</option>
                             				<option value="아키타" >아키타</option>
                             				<option value="아프간하운드" >아프간하운드</option>
                             				<option value="알라스칸말라뮤트" >알라스칸말라뮤트</option>
                             				<option value="에어데일테리어" >에어데일테리어</option>
                             				<option value="엘크하운드" >엘크하운드</option>
                             				<option value="올드잉글리쉬쉽독" >올드잉글리쉬쉽독</option>
                             				<option value="와이마라너" >와이마라너</option>
                             				<option value="요크셔테리어" >요크셔테리어</option>
                             				<option value="웰시코르기" >웰시코르기</option>
                             				<option value="잉글리쉬세터" >잉글리쉬세터</option>
                             				<option value="잉글리쉬코카스파니엘" >잉글리쉬코카스파니엘</option>
                             				<option value="진돗개" >진돗개</option>
                             				<option value="찡" >찡</option>
                             				<option value="차우차우" >차우차우</option>
                             				<option value="치와와" >치와와</option>
                             				<option value="콜리" >콜리</option>
                             				<option value="킹찰스스파니엘" >킹찰스스파니엘</option>
                             				<option value="토이푸들" >토이푸들</option>
                             				<option value="퍼그" >퍼그</option>
                             				<option value="페키니즈" >페키니즈</option>
                             				<option value="포메라니안" >포메라니안</option>
                             				<option value="포인트" >포인트</option>
                             				<option value="폭스테리어" >폭스테리어</option>
                             				<option value="풍산개" >풍산개</option>
                             				<option value="프랜치불독" >프랜치불독</option>
                             				<option value="핏불테리어" >핏불테리어</option>
                             				<option value="화이트테리어" >화이트테리어</option>
                             				<option value="기타,특수견" >기타,특수견</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>강아지 사진</th>
						<td><input type="file" size="29" id="dogimg" name="dogimg"></td>
					</tr>
					<tr>
						<th>특징</th>
						<td><textarea class="form-control" rows="2" name="doginfo"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<button type="button" onclick="submit()" class="btn btn-yellow" data-toggle="button">등록하기</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button id="close" class="btn btn-default" data-toggle="button">닫기</button>
						</td>
					</tr>
				</table>
				</form>
			</td>
		</tr>
	</table>
</body>
<script>
	$(function(){
		$("#close").click(function(){
			opener.location.reload();
			self.close();
		});
	});
	function submit(){
		$("#addDogForm").submit();
	}
</script>
</html>