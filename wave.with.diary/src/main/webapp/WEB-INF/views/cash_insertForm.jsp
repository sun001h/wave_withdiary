<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가계부쓰기폼</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<c:url value="/resources/cashbook/plugins/fontawesome-free/css/all.min.css"/>">
  <!-- Theme style -->
  <link rel="stylesheet" href="<c:url value="/resources/cashbook/dist/css/adminlte.min.css"/>">

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<form action="insert" role="form" method="post">
 <section class="content">
      <div class="container">
        <div class="row" >
          <!-- left column -->
          <div class="col-md-6">
            <!-- general form elements -->
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">가계부 작성</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="form-group">
                  <label for="exampleInputBorder">작성자</label>
                  <input type="text" value="${member.nickname }" class="form-control form-control-border" id="exampleInputBorder" readonly="readonly">
                </div>
                <div class="form-group">
                  <label for="exampleInputBorderWidth2">지출일</label>
                  <input type="text" class="form-control form-control-border border-width-2" id="datepicker" name="chdate">
                </div>
                <div class="form-group">
                  <label for="exampleInputRounded0">지출내역</label>
                  <input type="text" name="history" class="form-control rounded-0" id="exampleInputRounded0" placeholder="ex)당구장 등..">
                </div>
                <div class="form-group">
                  <label for="exampleSelectBorder">소비형식</label>
                  <select class="custom-select form-control-border" id="exampleSelectBorder" name="consumption_typecode">
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
                <div class="form-group">
                  <label for="exampleInputRounded0">금액</label>
                  <input type="text" name="money" class="form-control rounded-0" id="exampleInputRounded0" placeholder="지출금액">
                </div>
                <div class="form-group">
                  <label for="exampleSelectBorderWidth2">소비형식</label>
                  <select class="custom-select form-control-border border-width-2" id="exampleSelectBorderWidth2" name="classificationCode">
					<option value="">선택</option>
					<option value="100">현금</option>
					<option value="101">카드</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="exampleInputRounded0">비고</label>
                  <input type="text" class="form-control rounded-0" id="exampleInputRounded0" name="memo" placeholder="Comment">
                </div>
                <input type="submit" value="등록" class="btn btn-default pull-rigth"/>
				<input type="button" value="목록" onclick="location.href='/withdiary/cash/listpage'" class="btn btn-default pull-rigth"/>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
           </div>
          </div>
         </div>
        </section>
        </form>
<%-- <form action="insert" role="form" method="post">
<table border="1">
	<tr>
		<th>멤버코드</th>
		<td><input type="text" value="${member.memberCode }" required="required" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>날짜</th>
		<td>
			<input type="text" id="datepicker" name="chdate" required="required"/>
		</td>
	</tr>
	<tr>
		<th>지출내역</th>
		<td><input type="text" name="history" required="required" /></td>
	</tr>
	<tr>
		<th>분류</th>
		<td>
			<select class="category2" name="consumption_typecode">
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
		</td>
	</tr>
	<tr>
		<th>금액</th>
		<td><input type="text" name="money" required="required"/></td>
	</tr>
	<tr>
		<th>소비형식</th>
				<td>
			<select class="category1" name="classificationCode">
				<option value="">선택</option>
				<option value="100">현금</option>
				<option value="101">카드</option>
			</select>
		</td>
	<tr>
		<th>비고</th>
		<td><input type="text" name="memo" /></td>
	</tr>
	<tr>
		<td colspan="7">
			<input type="submit" value="등록"/>
			<input type="button" value="목록" onclick="accountList()"/>
		</td>
	</tr>
</table>
</form> --%>
<script type="text/javascript">
$(function() {
    //input을 datepicker로 선언
    $("#datepicker").datepicker({
        dateFormat: 'yymmdd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트     
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
    });                    
    
    //초기값을 오늘 날짜로 설정
    $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
});
</script>
<!-- jQuery -->
<%-- <script src="<c:url value="/resources/cashbook/plugins/jquery/jquery.min.js"/>"></script> --%>
<!-- Bootstrap 4 -->
<script src="<c:url value="/resources/cashbook/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<!-- bs-custom-file-input -->
<script src="<c:url value="/resources/cashbook/plugins/bs-custom-file-input/bs-custom-file-input.min.js"/>"></script>
<!-- AdminLTE App -->
<script src="<c:url value="/resources/cashbook/dist/js/adminlte.min.js"/>"></script>
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