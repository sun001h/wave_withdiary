<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 추가 페이지</title>
<!--부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<!-- 제이쿼리 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('input.timepicker').timepicker({
		    timeFormat: 'hh:mm',
		    interval: 10,
		    startTime: '00:00',
		    dynamic: false,
		    dropdown: true,
		    scrollbar: true
			});
	});
</script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
</head>
<body>
<style>
	#content>#main_section>#main_div>#main_section_table {
	padding-top:20px;
	width: 900px;
	display: flex;
	justify-content: center;
}
    h1 {
        	color: rgb(91,200,172);
        }
</style>
	<h1>스터디 일정 작성</h1>
	<br>
<%-- 입력 폼 --%>
<form action="${contextPath}/study/insertResult" method="post">
	<input type="hidden" name="memberCode" value="${dto.memberCode }" >
	<input type="hidden" name="writer" value="${dto.writer }">
	<div>공부과목 : 
	<input type="text" name="subject" size="25" placeholder="공부과목을 입력해주세요">
	</div>
	<br>
	<div>공부한 내용:
	<input type="text" name="content" size="25" placeholder="내용을 입력해주세요">
	</div>
	<br>
	<div>공부한 시간:
	<input type="text" autocomplete="off" class="timepicker" size="25" id="studyTime" name="studyTime" min="00:00" max="24:00" required>
	</div>
	<br>
	<input type="submit" class="btn btn-secondary mb-3" value="입력완료" />
	<input type="reset" class="btn btn-secondary mb-3" value="다시입력" />
	</form>
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>