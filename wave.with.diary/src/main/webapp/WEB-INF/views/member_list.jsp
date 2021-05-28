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
<title>회원 정보 조회</title>
</head>
<body>
<h2 align="center">회원 정보 조회</h2>
<table align="center" border="1">
<tr align="center">
	<th>회원번호</th>
	<th>이메일</th>
	<th>비밀번호</th>
	<th>출생연도</th>
	<th>생일</th>
	<th>별명</th>
	<th>프로필사진</th>
	<th>성별</th>
	<th>소개</th>
</tr>

<!-- 여기 코드 추가 작업 예정입니다 -->
<c:forEach var="list" items="${list }">
	<tr>
		<td><a href="${contextPath}/adminprofile?memberCode=${list.memberCode }">${list.memberCode }</a></td>
		<td>${list.email }</td>
		<td>${list.pwd }</td>
		<td>${list.birthyear }</td>
		<td>${list.birthday }</td>
		<td>${list.nickname }</td>
		<td>${list.profile_img }</td>
		<td>${list.gender }</td>
		<td>${list.profile }</td>
	</tr>
</c:forEach>

</table>
</body>
</html>