<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <!-- 본문 -->
    <style>
        #content { 
            /* 중앙 정렬 */
            width: 1100px;
            height: 600px;
            margin: 0 auto;
            /* 수평 레이아웃 구성 */
            overflow: hidden;
        }
        #content > #main_section {
            width: 1100px;
            height: 600px;
            display: grid;
            grid-template-columns: 350px 400px 350px;
            grid-template-rows: auto;
        }

        #loginForm {
            text-align: center;
        } 

        #loginForm > #name {
            font-size: 20px;
            text-align: center;
        }

        #email {
            border-radius: 5px;
            border: 1px solid rgb(212, 209, 202);
            width: 290px;
            height: 40px;
            margin: 2px;
            padding-left: 10px;
        }

        #pwd {
            border-radius: 5px;
            border: 1px solid rgb(212, 209, 202);
            width: 290px;
            height: 40px;
            margin: 2px;
            padding-left: 10px;
        }

        #login {
            border-radius: 5px;
            border: 1px none;
            width: 310px;
            height: 40px;
            margin: 2px;
            background-color: rgb(91,200,172);
            color: white;
        }
        
		#signup {
            margin: 10px auto;
            width: 290px;
            border-top: 1px dotted;
            padding: 10px;
        }

        #signup_text {
            float: right;
            font-size: 14px;
        }
        
		a:link {color: grey; text-decoration: none;}
        a:hover { color: rgb(91,200,172); text-decoration: underline;}
/*로그인창 페이드인*/
.fade-in-box {
  animation: fadein 3s;
  -moz-animation: fadein 3s; /* Firefox */
  -webkit-animation: fadein 3s; /* Safari and Chrome */
  -o-animation: fadein 3s; /* Opera */
}
@keyframes fadein {
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-moz-keyframes fadein { /* Firefox */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-webkit-keyframes fadein { /* Safari and Chrome */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-o-keyframes fadein { /* Opera */
    from {
        opacity:0;
    }
    to {
        opacity: 1;
    }
}
/*--------------------------------*/
    </style>
<title>로그인창</title>
<c:choose>
	<c:when test="${result=='loginFailed' }">
		<script>
	    window.onload=function(){
	      alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
	    }
	  </script>
	</c:when>
</c:choose>
</head>
<body>
    <div id="content" class="fade-in-box">
        <section id="main_section">
            <div id="cell_1"></div>
            <div id="cell_2"></div>
            <div id="cell_3"></div>
            <div id="cell_4"></div>
            <div id="cell_5">
                <form id="loginForm" action="${contextPath}/login" method="POST">
                    <p id="name"><img src="<%=login_logo %>"
                                    width="300" height="72" /></p>
                    <input type="text" name="email" id="email" placeholder=" 이메일" /><br> 
                    <input type="password" name="pwd" id="pwd" placeholder=" 비밀번호" /><br>
                    <br>
                    <input type="submit" value="로그인" id="login" />
                </form>
                <div id="signup">
                    <div id="signup_text">
                        <a href="${contextPath}/auth/addByMapForm">회원가입</a> | <a>비밀번호 찾기</a>
                    </div>
                </div>
            </div>
            <div id="cell_6"></div>
            <div id="cell_7"></div>
            <div id="cell_8"></div>
            <div id="cell_9"></div>
        </section>
    </div>
  <button >Hover me !</button>
</body>
</html>