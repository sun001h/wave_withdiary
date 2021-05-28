<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 내용 상세보기</title>
</head>
<body>
<form action="study/delete" method="post">
<table align="center" border="1">
	<tr>
		<th>과목</th>
		<th>공부내용</th>
		<th>공부시간</th>
	</tr>
	<tr>
		<th>${vo.subject}</th>
		<th>${vo.content}</th>
		<th>${vo.studyTime }</th>
	</tr>
</table>
<p align="center"><a href="study/updateForm?studyNO=${vo.studyNO }">수정하기</a></p>
<input type="submit" value="삭제" />
<a href="study/list">리스트로 돌아가기</a>
</form>
</body>
</html>
	