<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<script>
	$(document).ready(function(){
		$("#btnUpdate").click(function(){
			var title = $("#title").val();
			var content = $("#content").val();
			var MEMBERCODE = $("#MEMBERCODE").val();
			if(title == ""){
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}
			if(content == ""){
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;
			}
			if(MEMBERCODE == ""){
				alert("회원번호를 입력하세요");
				document.form1.MEMBERCODE.focus();
				return;
			}
			document.form1.submit();
		
		
		});
	});

</script>
</head>
<body>

<h2>글 작성</h2>
<form name="form1" method="post" action="${contextPath}/board/insert">
	<div>
		제목
		<input name="title" id="title" size="80" placeholder="제목을 입력해주세요">
	</div>
	<div>
		내용
		<textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
	</div>
	<div>
		이름
		<input name="membercode" id="membercode" placeholder="회원번호를 입력해주세요">
	</div>
	<div style="width:650px; text-align: center;">

		<button type="submit" id="btnSave">저장</button>
		<button type="reset">취소</button>
	</div>
</form>
</body>
</html>