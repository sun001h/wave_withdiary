<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 정보 조회</title>
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
                   <th>상세보기</th>
                   </thead>
   				<tbody>
   				<c:forEach var="list" items="${list }">
        		<tr>
        		  	<td></td>
					<td>${list.subject }</td>
					<td>${list.content }</td>
					<td>${list.studyTime }</td>
				    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><a href="view?studyNO=${list.studyNO }"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></a></p></td>
				</tr>
			    </tbody>
			    </c:forEach>    
			</table>
		</div>
			<form action="${contextPath}/study/insertForm" method="get">
				<input type="submit" value="스터디 일정 추가" />
			</form>
		</div>	
	</div>
</div>

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