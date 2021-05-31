<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>글 목록</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css">
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>
<body>
	<%-- 	<c:if test="${sessionScope.MEMBERCODE !=null}"> --%>
	<button type="button" id="btnWrite" onclick="location.href='writeForm'">글쓰기</button>
	<%-- 	</c:if> --%>




	<!-- 	Carousel -->
	<section class="carousel">
		<div class="reel">
			<c:forEach var="board_list" items="${board_list}">
			<article>
				<div>

						<a href="#" class="image featured"><img src="images/pic01.jpg"></a>

						<header>
							<h3 class="etx">
								<a href="view?d_articlenumber=${list.d_articlenumber}">${list.title}</a>
							</h3>
						</header>
						<div class="etc">${list.content}<br><br></div>
						<p style="text-align: right;">
							<fmt:formatDate value="${list.dateCreated}" pattern="yyyy-MM-dd" />
						</p>
					
				</div>
			</article>
			</c:forEach>

<!-- <h2>게시글 목록(수정)</h2> -->
<%-- <%-- <c:if test="${sessionScope.MEMBERCODE !=null}"> --%> --%>
<%-- <button type="button" id="btnWrite" onclick="location.href='${contextPath}/board/writeForm'">글쓰기</button> --%>
<%-- <%-- </c:if> --%> --%>
<!-- <table border="1" width="600px"> -->
<!-- 	<tr> -->
<!-- 		<th>글번호</th> -->
<!-- 		<th>제목</th> -->
<!-- 		<th>회원번호</th> -->
<!-- 		<th>작성일</th> -->
<!-- 		<th>조회수</th> -->
<!-- 	</tr> -->
<%-- 	<c:forEach var="list" items="${list}"> --%>
<!-- 	<tr> -->
<%-- 		<td>${list.d_articlenumber}</td> --%>
<%-- 		<td><a href="${contextPath}/board/view?d_articlenumber=${list.d_articlenumber}">${list.title}</a></td> --%>
<%-- 		<td>${list.membercode}</td> --%>
<%-- 		<td>${list.dateCreated} --%>
<%-- 			<fmt:formatDate value="${list.dateCreated}" pattern="yyyy-MM-dd"/> --%>
<!-- 		</td> -->
<%-- 		<td>${list.viewcnt}</td> --%>
<!-- 	</tr> -->
<%-- 	</c:forEach> --%>
<!-- </table> -->


			<!-- 	Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>