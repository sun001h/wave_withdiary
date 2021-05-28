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
<title>임시 메인 페이지</title>
</head>
<body>
<p align="center">이메일 인증이 완료되었습니다.</p>
<p align="center"><a href="${contextPath}/loginForm">로그인 하러 가기</a></p>
</body>
</html>