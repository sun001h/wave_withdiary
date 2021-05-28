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
<meta charset="UTF-8">
<title>글 목록</title>

</head>
<body>

<h2>게시글 목록(수정)</h2>
<%-- <c:if test="${sessionScope.MEMBERCODE !=null}"> --%>
<button type="button" id="btnWrite" onclick="location.href='board/writeForm'">글쓰기</button>
<%-- </c:if> --%>
<table border="1" width="600px">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>회원번호</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<c:forEach var="list" items="${list}">
	<tr>
		<td>${list.d_articlenumber}</td>
		<td><a href="board/view?d_articlenumber=${list.d_articlenumber}">${list.title}</a></td>
		<td>${list.membercode}</td>
		<td>${list.dateCreated}
			<fmt:formatDate value="${list.dateCreated}" pattern="yyyy-MM-dd"/>
		</td>
		<td>${list.viewcnt}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>