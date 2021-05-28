<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>searchByEmail</title>
</head>
<body>

<h2 align="center">이메일 친구조회</h2>
<table align="center" border="1">
<tr align="center">
	<th>프로필사진</th>
	<th>별명</th>
	<th>소개</th>
</tr>

<c:forEach var="list" items="${list }">
	<tr>
		<td>${list.profile_img }</td>
		<td>${list.nickname }</td>
		<td>${list.profile }</td>
	</tr>
</c:forEach>

</table>

</body>
</html>