<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.wave.withdiary.file.WDFileUtils"%>
<% 
	request.setCharacterEncoding("utf-8");
	WDFileUtils wdfile = new WDFileUtils();
	String logo = wdfile.WD_LOGO;
	String update_link = wdfile.update_link;
	String diary_link = wdfile.diary_link;
	String cash_link = wdfile.cash_link;
	String study_link = wdfile.study_link;
	String logout = wdfile.logout;
	String friend = wdfile.friend;
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>가계부 수정하기</title>
<!-- 메인틀 CSS -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/layout/main_layout.css" />">
<style>
/*메인세션 내부*/
#content>#main_section>#main_div>#main_section_table {
	padding-top:20px;
	width: 900px;
	display: flex;
	justify-content: center;
}
/*폼 테이블*/
#update_table{
	width: 450px;
}
</style>
<!-- 테이블 -->
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<c:url value="/resources/cashbook/plugins/fontawesome-free/css/all.min.css"/>">
<!-- Theme style -->
<link rel="stylesheet"
	href="<c:url value="/resources/cashbook/dist/css/adminlte.min.css"/>">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
	<div id="content">
		<aside id="left_aside">
			<!-- 왼쪽 상단 로고 -->
			<div id="wd_logo">
				<img
					src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4fdf03a0-151a-4395-8691-56170ce26f19%2F___(3).png?table=block&id=f1ba2b23-7901-4f61-8d20-286c09e128c7&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=3600&userId=&cache=v2"
					id="wd_logo_img" />
			</div>
			<!-- 프로필 영역: 프로필 사진, 닉네임, 소개 -->
			<div id="profile">
				<br>
				<table align="center" width="180" id="profile_table">
					<!--프로필 사진-->
					<tr height="100">
						<td align="center"><img
							src="${contextPath}/download?email=${vo.email}&profile_img=${vo.profile_img }"
							id="profile_img" /><br></td>
					</tr>
					<!--닉네임-->
					<tr height="35">
						<td align="center"><b>${vo.nickname }</b></td>
					</tr>
					<!--소개-->
					<tr height="80">
						<td>
							<div id="profile_intro">${vo.profile }</div>
						</td>
					</tr>

				</table>
			</div>

			<!-- 친구 영역: 친구 프로필 사진, 닉네임 -->
			<div id="friend">

				<br>

				<!-- 친구 공간의 아이콘+이름: 정렬 편의를 위해 테이블 사용-->
				<table align="center">
					<tr>
						<!-- 아이콘 -->
						<td><img
							src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fce878c8a-ddf1-4645-b29e-c899a83d8a2d%2F3314439.png?table=block&id=3bc61806-a0a4-4340-90d4-c9d4751a3d7e&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
							width="30" height="30" /></td>
						<!-- 친구목록 글자 -->
						<td>
							<p id="friends_text">Friends</p>
						</td>
					</tr>
				</table>

				<div id="friendList">
					<table>

						<c:forEach var="list" items="${friendList }">
							<tr>
								<c:choose>
									<c:when
										test="${not empty list.profile_img && list.profile_img!='null' }">
										<td><img
											src="${contextPath}/download?email=${list.email}&profile_img=${list.profile_img }"
											class="fr_preview" /><br></td>
									</c:when>
									<c:otherwise>
										<td><img
											src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7a72114e-dc29-4856-b320-93d279fd9ede%2Fuser.png?table=block&id=679fd6fa-b188-4d55-8887-b5b14c74c259&width=1020&userId=&cache=v2"
											width="30" height="30" /></td>
									</c:otherwise>
								</c:choose>
								<td class="friend_name"><a class="friend_link" href="${contextPath}/friend/diary?fcode=${list.memberCode}">${list.nickname }</a></td>
							</tr>
						</c:forEach>

					</table>
				</div>
			</div>
		</aside>
        <section id="main_section">
        	<div id="main_div" style="overflow: scroll;">
        	<div id="main_section_table">
        			<form action="update" method="post">
		<input type="hidden" name="num" value="${dto.num}" />
					<!-- general form elements disabled -->
					<div class="card card-warning" id="update_table">
						<div class="card-header">
							<h3 class="card-title">가계부 수정</h3>
						</div>
						<div class="card-body">
<%--                 <div class="form-group" align="left">
                  <label for="exampleInputBorder">작성자</label>
                  <input type="text" value="${member.nickname }" class="form-control form-control-border" id="exampleInputBorder" readonly="readonly">
                </div> --%>
                <div class="form-group" align="left">
                  <label for="exampleInputBorder">지출일</label>
                  <input type="text" class="form-control form-control-border" id="datepicker" name="chdate" value="${dto.chdate}" required="required">
                </div>
                <div class="form-group" align="left">
                  <label for="exampleInputRounded0">지출내역</label>
                  <input type="text" name="history" class="form-control rounded-0" id="exampleInputRounded0" value="${dto.history}" required="required">
                </div>
                <div class="form-group" align="left">
                  <label for="exampleSelectBorder">소비형식</label>
                  <select class="custom-select form-control-border" id="exampleSelectBorder" name="consumption_typecode" required="required">
					<option value="">선택</option>
					<option value="100">문화생활</option>
					<option value="101">교통비</option>
					<option value="102">간식</option>
					<option value="103">외식</option>
					<option value="104">생활용품</option>
					<option value="105">통신비</option>
					<option value="106">잡화</option>
					<option value="107">기타</option>
                  </select>
                </div>
                <div class="form-group" align="left">
                  <label for="exampleInputRounded0">금액</label>
                  <input type="text" name="money" class="form-control rounded-0" id="exampleInputRounded0" value="${dto.money}" required="required">
                </div>
                <div class="form-group" align="left">
                  <label for="exampleSelectBorderWidth2">결제수단</label>
                  <select class="custom-select form-control-border border-width-2" id="exampleSelectBorderWidth2" name="classificationCode" required="required">
					<option value="">선택</option>
					<option value="100">현금</option>
					<option value="101">카드</option>
                  </select>
                </div>
                <div class="form-group" align="left">
                  <label for="exampleInputRounded0">비고</label>
                  <input type="text" class="form-control rounded-0" id="exampleInputRounded0" name="memo" value="${dto.memo}">
                </div>
                <input type="submit" value="수정완료" class="btn btn-default pull-rigth"/> 
				<input type="button" value="상세보기" onclick="detailAccount(${dto.num})" class="btn btn-default pull-rigth"/>
			</div>
			</div>
		</form>
        	</div>
        	</div>
        </section>

		<aside id="right_aside">
			<div class="tab_item">
                <p class="item"><a href="#">
                    <img src="<%=logo %>"
                    alt="WD로고" width="30" height="30" 
                        />
                </a></p>
                <p class="item"><a href="${contextPath}/<%=update_link %>">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2267d25b-3b2b-4527-b119-3bb7b6eb311d%2Fgrow.png?table=block&id=cabdd96d-0190-4353-bf4e-2071ae6f5a1f&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
                        alt="마이페이지" width="30" height="30" 
                        />
                </a></p>
				<p class="item"><a href="${contextPath}/<%=friend %>">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ff1e81fb3-4de4-44db-9520-23e80e4f5750%2Fsearch.png?table=block&id=9d42d7b3-f4f1-4759-b743-97530e8d47fd&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=970798f8-31fd-4970-8ffd-c1c7f47f39b8&cache=v2" 
                    alt="친구찾기" width="30" height="30" />
                </a></p>
                
                <p class="item"><a href="${contextPath}/<%=diary_link %>">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F281cbe2e-ad53-430a-bd66-e9b407a1749f%2Fdiary_(2).png?table=block&id=a65df81c-6382-4ba4-b9ad-f7544896fd87&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
                        alt="다이어리" width="30" height="30" 
                        />
                </a></p>

                <p class="item"><a href="${contextPath}/<%=cash_link %>">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F34ff4e78-cc69-49e3-b417-3f6fcf0cf29e%2Fwallet.png?table=block&id=50a765fc-3846-498a-bc64-8346b9f44bd0&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2" 
                        alt="가계부" width="30" height="30" />
                </a></p>

                <p class="item"><a href="${contextPath}/<%=study_link %>">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe1357e10-c87a-442c-a749-f28e687e9918%2Freading.png?table=block&id=67ad5d48-93b2-42b9-8af9-f9616e336b51&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
                        alt="스터디" width="30" height="30" />
                </a></p>
                
				<p class="item"><a href="${contextPath}/<%=logout %>">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Faff8ec36-6a4d-4082-ad43-d898e83bbd3d%2Fexit.png?table=block&id=201b2c14-68a3-4e56-a15b-5f7c19f624f2&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=970798f8-31fd-4970-8ffd-c1c7f47f39b8&cache=v2" 
                    alt="로그아웃" width="30" height="30" />
                </a></p>

				<!-- 배경색 바꾸기 -->
				<div>
					<!--주황-->
					<a href="#" onclick="changeBg('rgb(255,226,183)')"><div
							class="bg_color" id="bg_color1"></div></a>
					<!--노랑-->
					<a href="#" onclick="changeBg('rgb(255,241,182)')"><div
							class="bg_color" id="bg_color2"></div></a>
					<!--연두-->
					<a href="#" onclick="changeBg('rgb(234,255,182)')"><div
							class="bg_color" id="bg_color3"></div></a>
					<!--하늘-->
					<a href="#" onclick="changeBg('rgb(184,222,255)')"><div
							class="bg_color" id="bg_color4"></div></a>
					<!--보라-->
					<a href="#" onclick="changeBg('rgb(232,234,255)')"><div
							class="bg_color" id="bg_color5"></div></a>
					<!--분홍-->
					<a href="#" onclick="changeBg('rgb(255,232,246)')"><div
							class="bg_color" id="bg_color6"></div></a>
				</div>
			</div>
		</aside>
    </div>
<script type="text/javascript">
// 날짜선택 
$(function() {
    //input을 datepicker로 선언
    $("#datepicker").datepicker({
        dateFormat: 'yymmdd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://download.seaicons.com/icons/paomedia/small-n-flat/24/calendar-icon.png" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
    });                    
    
});
</script>
	<script type="text/javascript">
	function detailAccount(num){
		location.href="detail?num="+num;
	}

	function accountList(){
		//BOM --> Location객체 : 위치관련 객체
		location.href="listpage";
	}
</script>

	<!-- jQuery -->
	<%-- <script src="<c:url value="/resources/cashbook/plugins/jquery/jquery.min.js"/>"></script> --%>
	<!-- Bootstrap 4 -->
	<script
		src="<c:url value="/resources/cashbook/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
	<!-- bs-custom-file-input -->
	<script
		src="<c:url value="/resources/cashbook/plugins/bs-custom-file-input/bs-custom-file-input.min.js"/>"></script>
	<!-- AdminLTE App -->
	<script
		src="<c:url value="/resources/cashbook/dist/js/adminlte.min.js"/>"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<c:url value="/resources/cashbook/dist/js/demo.js"/>"></script>
	<!-- Page specific script -->
	<script>
$(function () {
  bsCustomFileInput.init();
});
</script>
</body>
</html>