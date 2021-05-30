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
                <p id="info">가입해주셔서 감사합니다! <br> 이메일 인증시 회원가입이 완료됩니다.</p>

            </div>
            <div id="cell_6"></div>
            <div id="cell_7"></div>
            <div id="cell_8"></div>
            <div id="cell_9"></div>
        </section>
    </div>

</body>
</html>