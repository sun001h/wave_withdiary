<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필조회</title>
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
	<h2 align="center">프로필 조회</h2>

	<table align="center" border="1">
	
		<tr>
			<th>이메일</th>
			<td>${vo.email }</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>${vo.pwd }</td>
		</tr>
		<tr>
			<th>출생연도</th>
			<td>${vo.birthyear }</td>
		</tr>
		<tr>
			<th>생일</th>
			<td>${vo.birthday }</td>
		</tr>
		<tr>
			<th>별명</th>
			<td>${vo.nickname }</td>
		</tr>
		
		<c:choose>
		<c:when test="${not empty vo.profile_img && vo.profile_img!='null' }">
		
		<tr>
			<th>프로필사진</th>
			<td><img
				src="download?email=${vo.email}&profile_img=${vo.profile_img }"
				id="preview" width="200" height="200"  /><br></td>
		</tr>
		
		</c:when>

		<c:otherwise>
		
			<tr>
				<th>프로필사진</th>
				<td>없음</td>
			</tr>

		</c:otherwise>
		</c:choose>

		<tr>
			<th>성별</th>
			<td>${vo.gender }</td>
		</tr>
		<tr>
			<th>소개</th>
			<td>${vo.profile }</td>
		</tr>

	</table>
	<br>
	<p align="center">
		<a href="updateForm?memberCode=${vo.memberCode }">수정하기</a>
	</p>
</body>
</html>