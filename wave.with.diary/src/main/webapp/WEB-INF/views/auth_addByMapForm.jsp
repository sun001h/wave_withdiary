<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
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
	
	function fn_email(){
	    var email2 = $("#email3").val();
        $("#email2").val(email2);
	}
	
	function fn_overlapped(){
	    var _email = $("#email1").val() + "@" + $("#email2").val();
	    if(_email==''){
	        alert("email을 입력하세요");
	        return;
	    }

	    $.ajax({
	        type:"post",
	        async:false,  
	        url:"overlapped",
	        dataType:"text",
	        data: {email: _email},
	        success:function (data,textStatus){
	            if(data=='false'){
	                alert("사용할 수 있는 email입니다.");
	                $("#btnOverlapped").prop("disabled", true);
	                $("#email1").prop("disabled", true);
	                $("#email2").prop("disabled", true);
	                $("#email").val(_email);
	            }else{
	                alert("사용할 수 없는 email입니다.");
	            }
	        },
	        error:function(data,textStatus){
	            alert("에러가 발생했습니다.");
	        },
	        complete:function(data,textStatus){
	            //alert("작업을 완료 했습니다");
	        }
	    });
	}
		
</script>
</head>
<body>
	<form action="addByMap" method="POST" enctype="multipart/form-data">
		<table align="center" border="1">
			<tr>
				<th>이메일</th>
				<td>
				<input size="10px" type="text" name="email1" id="email1" /> @ 
				<input size="10px" type="text" name="email2" id="email2" />
				<select name="email3" id="email3" onChange="fn_email()" title="직접입력">
					<option value="">직접입력</option>
					<option value="gmail.com">gmail.com</option>
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
				</select>
				<input type="hidden" name="email" id="email"/>
				<input type="button" id="btnOverlapped" value="중복체크" onClick="fn_overlapped()" />
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" /></td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input type="date" name="bday" /></td>
			</tr>
			<tr>
				<th>별명</th>
				<td><input type="text" name="nickname" /></td>
			</tr>
			<tr>
				<th>프로필사진</th>
				<td><input type="file" name="profile_img"
					onchange="readURL(this);" /></td>
			</tr>
			<tr>
				<td colspan="2"><img id="preview" src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7a72114e-dc29-4856-b320-93d279fd9ede%2Fuser.png?table=block&id=679fd6fa-b188-4d55-8887-b5b14c74c259&width=1020&userId=&cache=v2" width="200"
					height="200" /></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="gender" value="U" />선택안함</label>
					<label><input type="radio" name="gender" value="F" />여</label>
					<label><input type="radio" name="gender" value="M" />남</label>
				</td>
			</tr>
			<tr>
				<th>소개</th>
				<td><textarea cols="40" rows="10" name="profile"></textarea></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="submit" value="가입" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>