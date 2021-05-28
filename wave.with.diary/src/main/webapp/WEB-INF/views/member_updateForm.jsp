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
<title>프로필 수정</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

</head>
<body>
<h2 align="center">회원 프로필 수정</h2>
<form action="member/update" method="POST" enctype="multipart/form-data">
<input type="hidden" name="memberCode" value="${vo.memberCode }" />
<table align="center" border="1">
<tr>
	<th>이메일</th>
	<td><input type="text" name="email" value="${vo.email }" readonly /></td>
</tr>
<tr>
	<th>비밀번호</th>
	<td><input type="password" name="pwd" value="${vo.pwd }" /> </td>
</tr>
<tr>
	<th>출생연도</th>
	<td><input type="text" name="birthyear" value="${vo.birthyear }" readonly /></td>
</tr>
<tr>
	<th>생일</th>
	<td><input type="text" name="birthday" value="${vo.birthday }" readonly /></td>
</tr>
<tr>
	<th>별명</th>
	<td><input type="text" name="nickname" value="${vo.nickname }" /></td>
</tr>



		<c:choose>
		<c:when test="${not empty vo.profile_img && vo.profile_img!='null' }">
		
		<tr>
			<th>프로필사진</th>
			<td><input type="file" name="profile_img"
					onchange="readURL(this);" /></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type= "hidden" name="originalFileName" value="${vo.profile_img }" />
			<img
				src="download?email=${vo.email}&profile_img=${vo.profile_img }"
				id="preview" width="200" height="200"  /><br>
			</td>
		</tr>
		
		</c:when>

		<c:otherwise>
		
			<tr>
				<th>프로필사진</th>
				<td><input type="file" name="profile_img"
					onchange="readURL(this);" /></td>
			</tr>
			<tr>
				<td colspan="2">없음</td>
			</tr>

		</c:otherwise>
		</c:choose>



<tr>
	<th>성별</th>
	<td><input type="text" name="gender" value="${vo.gender }"  readonly /></td>
</tr>
<tr>
	<th>소개</th>
	<td><textarea cols="40" rows="10" name="profile">${vo.profile }</textarea></td>
</tr>
<tr>
    <td align="center" colspan="2">
        <input type="submit" value="수정" />
    </td>
</tr>
</table>
</form>
</body>
</html>