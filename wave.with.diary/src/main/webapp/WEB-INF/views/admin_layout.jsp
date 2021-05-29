<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<%@page import="com.wave.withdiary.file.WDFileUtils"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("utf-8");
	WDFileUtils wdfile = new WDFileUtils();
	String logo = wdfile.WD_LOGO;
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
            margin: 0 auto;
            /* 수평 레이아웃 구성 */
            overflow: hidden;
        }

        #content > #left_aside {
            float: left;
            width: 200px;
            height: 600px;
            background-color: mediumaquamarine;
        }

        #content > #main_section {
            float: left;
            width: 850px;
            height: 600px;
            background-color: blanchedalmond;
        }

        #content > #right_aside {
            float: left;
            width: 50px;
            height: 600px;
            background-color: mediumaquamarine;
        }

        .tab_item {
            text-align: center;
        }

        #content > #left_aside > #wd_logo {
            float: left;
            width: 200px;
            height: 50px;
            background-color: red;
        }

        #content > #left_aside > #profile {
            float: left;
            width: 200px;
            height: 250px;
            background-color: yellow;
        }

        #content > #left_aside > #friend {
            float: left;
            width: 200px;
            height: 300px;
            background-color: purple;
        }

    </style>

</head>
<body>
    <div id="content">
        <aside id="left_aside">
            <div id="wd_logo"></div>
            <div id="profile"></div>
            <div id="friend"></div>
        </aside>

        <section id="main_section">
            <h1>메인 섹션</h1>
            <p>메인 섹션 </p>
        </section>

        <aside id="right_aside">
            <div class="tab_item">
                <p class="item"><a href="#">
                    <img src="<%=logo %>"
                    alt="WD로고" width="30" height="30" 
                        />
                </a></p>
                <p class="item"><a href="#">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F281cbe2e-ad53-430a-bd66-e9b407a1749f%2Fdiary_(2).png?table=block&id=a65df81c-6382-4ba4-b9ad-f7544896fd87&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
                        alt="다이어리" width="30" height="30" 
                        />
                </a></p>

                <p class="item"><a href="#">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F34ff4e78-cc69-49e3-b417-3f6fcf0cf29e%2Fwallet.png?table=block&id=50a765fc-3846-498a-bc64-8346b9f44bd0&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2" 
                        alt="가계부" width="30" height="30" />
                </a></p>

                <p class="item"><a href="#">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe1357e10-c87a-442c-a749-f28e687e9918%2Freading.png?table=block&id=67ad5d48-93b2-42b9-8af9-f9616e336b51&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
                        alt="스터디" width="30" height="30" />
                </a></p>
            </div>
        </aside>
    </div>

</body>
</html>