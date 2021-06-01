<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 내용 상세보기</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
 <style>
        h1 {
        	color: rgb(91,200,172);
        }
 </style>
<form action="${contextPath}/study/delete" method="post">
<input type="hidden" name="studyNO" value="${dto.studyNO }" >
<div class="container">
	<div class="row"> 
        <div class="col-md-12">
        <h1>스터디 정보 조회</h1>
        <div class="table-responsive">
         <table id="mytable" class="table table-bordred table-striped">
    	  <thead id="tableHead">  
	 			<th></th>
                <th>과목</th>
                <th>공부한 내용</th>
                <th>공부한 시간</th>
    	 </thead>
    	 <tbody>
        		<tr>
        		  	<td></td>
					<th>${dto.subject}</th>
					<th>${dto.content}</th>
					<th>${dto.studyTime }</th>
				</tr>
		</tbody>
		</table>
		</div>
	</div>
</div>
<button ><a href="${contextPath}/study/updateForm?studyNO=${dto.studyNO }">수정</a></button>
<input type="submit" value="삭제" />
<button><a href="${contextPath}/study/list">리스트로 돌아가기</a></button>
</form>
<script type="text/javascript">
$(document).ready(function(){
	$("#mytable #checkall").click(function () {
	        if ($("#mytable #checkall").is(':checked')) {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", true);
	            });

	        } else {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", false);
	            });
	        }
	    });
	    
	    $("[data-toggle=tooltip]").tooltip();
	});
</script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
</body>
</html>
	