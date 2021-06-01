<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@page import="com.wave.withdiary.file.WDFileUtils"%>
<% 
	request.setCharacterEncoding("utf-8");
	WDFileUtils wdfile = new WDFileUtils();
	String login_logo = wdfile.login_logo;
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
	
	function fn_overlapped(){
	    var _email = $("#email").val();
	    if(_email==''){
	        alert("email을 입력하세요");
	        return;
	    }

	    $.ajax({
	        type:"post",
	        async:false,  
	        url:"${contextPath}/auth/overlapped",
	        dataType:"text",
	        data: {email: _email},
	        success:function (data,textStatus){
	            if(data=='false'){
	                alert("사용할 수 있는 email입니다.");
	                $("#btnOverlapped").prop("disabled", true);
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
<style>
    #content { 
        /* 중앙 정렬 */
        width: 1100px;
        height: 600px;
        margin: 0 auto;
        /* 수평 레이아웃 구성 */
        overflow: hidden;
    }

    #content > #left_aside {
        float: left;
        width: 200px;
        height: 600px;

    }

    #content > #main_section {
        float: left;
        width: 700px;
        height: 600px;
    }

    #logo {
        text-align: center;
    }

    #content > #right_aside {
        float: left;
        width: 200px;
        height: 600px;
    }

    #form > div {
        float: left;
        width: 600px;
    }

    .left_td {
        width: 60px;
        overflow: hidden;
    }

    .textForm {
        border-radius: 5px;
        border: 1px solid rgb(212, 209, 202);
        width: 200px;
        height: 20px;
        margin: 2px;
    }

    textarea {
        border-radius: 5px;
        border: 1px solid rgb(212, 209, 202);
        padding-left: 5px;
        padding-right: 5px;
    }

    .request {
        font-size: 13.3px;
    }

    .radio {
        font-size: 13.3px;
        font-style: "Malgun-Gothic";
    }

    #form {
        margin-left: 35px;
    }

    #pwd, #nickname {
        width: 275px;
        padding-left: 5px;
    }

    #email {
        width: 201px;
        padding-left: 5px;
    }

    textarea {
        padding-left: 5px;
        padding-right: 5px;
    }

</style>

</head>
<body>
    <div id="content">
        <aside id="left_aside">
        </aside>
        <section id="main_section">
            <div id="logo"><img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4fdf03a0-151a-4395-8691-56170ce26f19%2F___(3).png?table=block&id=f1ba2b23-7901-4f61-8d20-286c09e128c7&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=3600&userId=&cache=v2"
                             width="300" height="72" /><br><br></div>
            <div id="form">
                <form action="${contextPath}/auth/addByMap" method="POST" enctype="multipart/form-data">
                    <table align="center">

                        <tr>
                            <td colspan="2">
                            <input type="text" name="email" id="email" class="textForm" placeholder="이메일" required="required" />
                            <input type="button" id="btnOverlapped" value="중복검사" onclick="fn_overlapped()" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="password" name="pwd" class="textForm" placeholder="비밀번호" id="pwd" required="required"/></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="text" name="nickname" class="textForm" placeholder="별명" id="nickname" required="required"/></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="request"><br>프로필 사진을 입력해주세요</td>
                        </tr>
                        <tr>
                            <td class="left_td" align="center"><img id="preview" src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7a72114e-dc29-4856-b320-93d279fd9ede%2Fuser.png?table=block&id=679fd6fa-b188-4d55-8887-b5b14c74c259&width=1020&userId=&cache=v2" 
                            width="50" height="50" /></td>
                            <td>　<input type="file" name="profile_img" onchange="readURL(this);" required="required" /></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="request" required="required"><br>생일을 입력해주세요</td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="date" name="bday" class="radio" required="required"/></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="request"><br>성별을 입력해주세요</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="radio"><input type="radio" name="gender" value="U" />선택안함</label>
                                <label class="radio"><input type="radio" name="gender" value="M" />남</label>
                                <label class="radio"><input type="radio" name="gender" value="F" />여</label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="request"><br>자신을 소개해 보세요</td>
                        </tr>
                        <tr>
                            <td colspan="2"><textarea cols="42" rows="2" name="profile" ></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="request"><br> 감사합니다!<br>
                                버튼을 눌러 가입을 완료해주세요!　　<input type="submit" value="가입하기" />
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </section>
        <aside id="right_aside">
        </aside>
    </div>
</body>
</html>