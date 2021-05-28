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
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>글 목록</title>
<script>
	function del(D_articleNumber) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='board/delete?D_articleNumber='+D_articleNumber;
		}
	}	
</script>
</head>
<body>
<h2>게시글 보기</h2>
<form name="form1" method="post" action="update">
<input type="hidden" name="d_articlenumber" value="${vo.d_articlenumber}">
	<div>
		작성일자 : <fmt:formatDate value="${vo.dateCreated}" pattern = "yyyyMMdd"/>
	</div>
	<div>
		조회수 : ${vo.viewcnt}
	</div>
	<div>
		제목
		<input name="title" id="title" size="80" value="${vo.title}" placeholder="제목을 입력해주세요">
	</div>
	<div>
		내용
		<textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요">${vo.content}</textarea>
	</div>
	<div>
		이름
		<input name="membercode" id="membercode" size="80" value="${vo.membercode}" placeholder="회원번호를 입력해주세요">
	</div>
	<div style="width:650px; text-align: center;">
		<input type="submit" value="수정" >
		<input type="button" value="삭제" onclick="location.href='board/delete?d_articlenumber=${vo.d_articlenumber}'">
<%-- 		<a href="delete?d_articlenumber=${view.d_articlenumber}">삭제</a> --%>
		<input type="button" value="목록" onclick="location.href='board/list';">
	
<!--  	<c:if test="${sessionScope.membercode == vo.membercode}">-->

<!--  	</c:if>-->
	</div>
</form>
<c:if test="${param.clear == 'y'}">
수정이 완료되었습니다.
</c:if>

</body>
</html>