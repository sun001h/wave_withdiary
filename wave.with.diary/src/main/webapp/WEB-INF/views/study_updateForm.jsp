<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 페이지</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
        h1 {
        	color: rgb(91,200,172);
        }
 </style>
 
 <div class="container">
	<div class="row"> 
        <div class="col-md-12">
       <h1>스터디 일정 수정</h1>
       <br>
       <%-- 입력폼 --%>
       <form action="${contextPath}/study/update" method="post">
       <input type="hidden" name="studyNO" value="${vo.studyNO }" />
        <div class="table-responsive">
              <table id="mytable" class="table table-bordred table-striped">        
                   <tr>
                   <th>과목</th>
                   <td><input type="text" name="subject" value="${vo.subject }" /></td>
                   </tr>
                   <tr>
                   <th>공부한 내용</th>
                   <td><input type="text" name="content" value="${vo.content }" /> </td>
                   </tr>
                   <tr>
						<th>공부시간</th>
						<td><input type="text" class="timepicker" name="studyTime" value="${vo.studyTime }" min="00:00" max="24:00" required /></td>
				  </tr>
			</table>
		<input type="submit" value="작성완료" />
		<button><a href="${contextPath}/study/list">리스트로 돌아가기</a></button>
		</form>	
		</div>
	</div>
 </div>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>