<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 페이지</title>
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
<form action="study/update" method="post">
<h2 align="center">스터디 일정 수정</h2>
<input type="hidden" name="studyNO" value="${vo.studyNO }" />
<%-- <input type="hidden" name="writer" value="${vo.writer }" />
<input type="hidden" name="studyDate" value="${vo.studyDate }" />
<input type="hidden" name="memberCode" value="${vo.memberCode }" /> --%>
<table align="center" border="1">
	<tr>
		<th>과목</th>
		<td><input type="text" name="subject" value="${vo.subject }" /></td>
	</tr>
	<tr>
		<th>공부내용</th>
		<td><input type="text" name="content" value="${vo.content }" /> </td>
	</tr>
	<tr>
		<th>공부시간</th>
		<td><input type="text" class="timepicker" name="studyTime" value="${vo.studyTime }" min="00:00" max="24:00" required /></td>
	</tr>
</table>
	<input type="submit" value="작성완료" />
	<a href="study/list">리스트로 돌아가기</a>
</form>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>