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
</head>
<body>
	<h1 align="center">스터디 정보 조회</h1>
	<table align="center" border="1">
		<tr align="center">
			<th>과목</th>
			<th>내용</th>
			<th>시간</th>
			<th></th>
		</tr>
		<c:forEach var="list" items="${list }">
			<tr align="center">
				<td>${list.subject }</td>
				<td>${list.content }</td>
				<td>${list.studyTime }</td>
				<td><a href="${contextPath}/study/view?studyNO=${list.studyNO }">상세보기</a></td>
			</tr>
		</c:forEach>
	</table>
	<form action="${contextPath}/study/insertForm" method="get">
		<input type="submit" value="일정추가" />
	</form>
</body>
</html>