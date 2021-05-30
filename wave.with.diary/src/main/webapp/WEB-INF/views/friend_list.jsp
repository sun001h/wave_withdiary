<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" /> 
<html>
<head>
<title>친구목록</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#preview').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</head>
<body>
<h2 align="center">친구 목록 조회</h2>
<table align="center" border="1">
<tr align="center">
	<th>프로필사진</th>
	<th>별명</th>
	<th>소개</th>
</tr>

<c:forEach var="list" items="${list }">
	<tr>
		<c:choose>
		<c:when test="${not empty list.profile_img && list.profile_img!='null' }">
			<td><img
				src="${contextPath}/download?email=${list.email}&profile_img=${list.profile_img }"
				id="preview" width="30" height="30"  /><br></td>
		</c:when>
		<c:otherwise>
			<td><img 
				src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7a72114e-dc29-4856-b320-93d279fd9ede%2Fuser.png?table=block&id=679fd6fa-b188-4d55-8887-b5b14c74c259&width=1020&userId=&cache=v2"
				width="30" height="30" />
			</td>
		</c:otherwise>
		</c:choose>

		<td>${list.nickname }</td>
		<td>${list.profile }</td>
	</tr>
</c:forEach>

</table>
</body>
</html>