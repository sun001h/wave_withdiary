<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가계부 수정하기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<h1>가계부 수정하기</h1>
<form action="cash/update" method="post">
<input type="hidden" name="num" value="${dto.num}"/>
<table border="1">
	<tr>
		<th>날짜</th>
		<td><input type="text" id="datepicker" name="chdate" value="${dto.chdate}"required="required"/></td>
	</tr>
	<tr>
		<th>지출내역</th>
		<td><input type="text" name="history" value="${dto.history }" /></td>
	</tr>
	<tr>
		<th>분류</th>
		<td>
			<select class="category2" name="consumption_typecode">
				<option value="${dto.consumption_typecode}">선택</option>
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
		<td><input type="text" name="money" value="${dto.money }"/></td>
	</tr>
	<tr>
		<th>소비형식</th>
		<td>
			<select class="category1" name="classificationCode">
				<option value="${dto.classificationCode}">선택</option>
				<option value="100">현금</option>
				<option value="101">카드</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>비고</th>
		<td><input type="text" name="memo" value="${memo}"/></td>
	</tr>

	<tr>
		<td colspan="2">
			<input type="submit" value="수정완료"/>
			<input type="button" value="목록" onclick="accountList()"/>
			<input type="button" value="상세보기" onclick="detailAccount(${dto.num})"/>
		</td>
	</tr>
</table>
</form>
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
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
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
		location.href="cash/detail?num="+num;
	}

	function accountList(){
		//BOM --> Location객체 : 위치관련 객체
		location.href="cash/listpage";
	}

</script>
</body>
</html>