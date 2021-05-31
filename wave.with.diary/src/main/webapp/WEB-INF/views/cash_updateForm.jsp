<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>가계부 수정하기</title>
<!-- 구역나누기 -->
<style>


/*메인세션 내부*/
#content>#main_section>#main_section_table {
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
            <div id="wd_logo"></div>
            <div id="profile"></div>
            <div id="friend"></div>
        </aside>
        <section id="main_section" style="overflow: scroll;">
        	<div id="main_section_table">
        			<form action="update" method="post">
		<input type="hidden" name="num" value="${dto.num}" />
					<!-- general form elements disabled -->
					<div class="card card-warning" id="update_table">
						<div class="card-header">
							<h3 class="card-title">가계부 수정</h3>
						</div>
						<div class="card-body">
                <div class="form-group" align="left">
                  <label for="exampleInputBorder">작성자</label>
                  <input type="text" value="${member.nickname }" class="form-control form-control-border" id="exampleInputBorder" readonly="readonly">
                </div>
                <div class="form-group" align="left">
                  <label for="exampleInputBorderWidth2">지출일</label>
                  <input type="text" class="form-control form-control-border border-width-2" id="datepicker" name="chdate" value="${dto.chdate}" required="required">
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
                  <label for="exampleSelectBorderWidth2">결재수단</label>
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
        </section>

        <aside id="right_aside">
            <div class="tab_item">
                <p class="item"><a href="#">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F70febc41-cd9f-441e-bc84-38c284190b45%2Flogo.png?table=block&id=0cdf4e9c-85ce-48a4-85b4-9c6e36fd885d&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=2400&userId=&cache=v2"
                        alt="WD로고" width="30" height="30" 
                        />
                </a></p>
                <p class="item"><a href="#">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F281cbe2e-ad53-430a-bd66-e9b407a1749f%2Fdiary_(2).png?table=block&id=a65df81c-6382-4ba4-b9ad-f7544896fd87&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
                        alt="다이어리" width="30" height="30" 
                        />
                </a></p>

                <p class="item"><a href="/diary/cash/listpage">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F34ff4e78-cc69-49e3-b417-3f6fcf0cf29e%2Fwallet.png?table=block&id=50a765fc-3846-498a-bc64-8346b9f44bd0&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2" 
                        alt="가계부" width="30" height="30" />
                </a></p>

                <p class="item"><a href="#">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe1357e10-c87a-442c-a749-f28e687e9918%2Freading.png?table=block&id=67ad5d48-93b2-42b9-8af9-f9616e336b51&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
                        alt="스터디" width="30" height="30" />
                </a></p>
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