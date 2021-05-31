<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
    <title>WITH DIARY</title>
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

        #name {
            text-align: center;
        }

        #info {
            font-size: 13px;
            color: grey;
            text-align: center;
        }

        a:link { color: grey; text-decoration: none;}
        a:hover { color: rgb(91,200,172); text-decoration: underline;}

    </style>

</head>
<body>
    <div id="content">
        <section id="main_section">
            <div id="cell_1"></div>
            <div id="cell_2"></div>
            <div id="cell_3"></div>
            <div id="cell_4"></div>
            <div id="cell_5">

                <p id="name"><img src="<%=login_logo %>" width="300" height="72" /></p>
                <p id="info" >이메일 인증이 완료되었습니다. <br> 
                    <a href="${contextPath}">로그인 하러 가기</a> </p>

            </div>
            <div id="cell_6"></div>
            <div id="cell_7"></div>
            <div id="cell_8"></div>
            <div id="cell_9"></div>
        </section>
    </div>

</body>
</html>