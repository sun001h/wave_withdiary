<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 추가 페이지</title>
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
	<h2>스터디 일정 작성</h2>
	<form action="insertResult" method="get">
	<div>
		멤버코드:
		<!-- value 값 수정 필요  WD2105040001-->
		<input type="text" name="memberCode" id="memberCode">
	</div>
	<div>
		과목 :
		<input name="subject" id="subject" size="20" placeholder="공부과목을 입력해주세요">
	</div>
	<div>
		내용 :
		<input name="content" id="content" size="20" placeholder="내용을 입력해주세요">
	</div>
	<div>
		공부 시간 :
		<!-- <input type="time"  id="studySTime" name="studySTime" value="00:00"><br> -->
		<!-- <input type="number" id="studyTime" name="studyTime" max=""value=""> -->
		<input type="text" class="timepicker" id="studyTime" name="studyTime" min="00:00" max="24:00" required>
	</div>
	<br>
		<input type="submit" value="입력완료" />
		<input type="reset" value="다시입력" />
	</form>
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>