<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<%@page import="com.wave.withdiary.file.WDFileUtils"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% 
	request.setCharacterEncoding("utf-8");
	WDFileUtils wdfile = new WDFileUtils();
	String logo = wdfile.WD_LOGO;
	String update_link = wdfile.update_link;
	String diary_link = wdfile.diary_link;
	String cash_link = wdfile.cash_link;
	String study_link = wdfile.study_link;
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>메인 페이지</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="<c:url value="/resources/assets/css/main.css" />">
<noscript>
	<link rel="stylesheet" href="<c:url value="/resources/assets/css/noscript.css" />">
</noscript>
<script>
	function changeBg(color) {
		document.body.style.backgroundColor = color;
	}
</script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/layout/main_layout.css" />"
>

</head>
<body>
    <div id="content">
        <aside id="left_aside">
            <!-- 왼쪽 상단 로고 -->
            <div id="wd_logo">
                <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4fdf03a0-151a-4395-8691-56170ce26f19%2F___(3).png?table=block&id=f1ba2b23-7901-4f61-8d20-286c09e128c7&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=3600&userId=&cache=v2"
                    id="wd_logo_img" />
            </div>
            <!-- 프로필 영역: 프로필 사진, 닉네임, 소개 -->
            <div id="profile">
                <br>
                <table align="center" width="180" id="profile_table">
                    <!--프로필 사진-->
                    <tr height="100">
                        <td align="center">
                            <img
                            src="${contextPath}/download?email=${vo.email}&profile_img=${vo.profile_img }"
                            id="profile_img" /><br>
                        </td>
                    </tr>
                    <!--닉네임-->
                    <tr height="35">
                        <td align="center">
                            <b>${vo.nickname }</b>
                        </td>
                    </tr>
                    <!--소개-->
                    <tr height="80">
                        <td>
                            <div id="profile_intro">
                            ${vo.profile }
                            </div>
                        </td>
                    </tr>

                </table>
            </div>

            <!-- 친구 영역: 친구 프로필 사진, 닉네임 -->
            <div id="friend">
                
                <br>

                <!-- 친구 공간의 아이콘+이름: 정렬 편의를 위해 테이블 사용-->
                <table align="center">
                    <tr>
                        <!-- 아이콘 -->
                        <td>
                            <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fce878c8a-ddf1-4645-b29e-c899a83d8a2d%2F3314439.png?table=block&id=3bc61806-a0a4-4340-90d4-c9d4751a3d7e&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2" 
                            width="30" height="30" />
                        </td>
                        <!-- 친구목록 글자 -->
                        <td>
                            <p id="friends_text">Friends</p>
                        </td>
                    </tr>
                </table>

                <div id="friendList">
                    <table>
                    
					<c:forEach var="list" items="${friendList }">
						<tr>
							<c:choose>
							<c:when test="${not empty list.profile_img && list.profile_img!='null' }">
								<td><img
									src="${contextPath}/download?email=${list.email}&profile_img=${list.profile_img }"
									class="fr_preview" /><br></td>
							</c:when>
							<c:otherwise>
								<td><img 
									src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7a72114e-dc29-4856-b320-93d279fd9ede%2Fuser.png?table=block&id=679fd6fa-b188-4d55-8887-b5b14c74c259&width=1020&userId=&cache=v2"
									class="fr_preview" width="30" height="30" />
								</td>
							</c:otherwise>
							</c:choose>
							<td class="friend_name">${list.nickname }</td>
						</tr>
					</c:forEach>
                        
                    </table>
                </div>
            </div>
        </aside>

        <section id="main_section">
            <div id="main_div">

			<form name="form1" method="post" style="text-align: center;" action="${contextPath}/board/update">
			<input type="hidden" name="membercode" id="membercode" value="${boardvo.membercode}">
			<input type="hidden" name="d_articlenumber" value="${boardvo.d_articlenumber}">
				<div>
					<fmt:formatDate value="${boardvo.dateCreated}" pattern = "yyyy-MM-dd"/>
				</div>
				<div>
					
					<input name="title" id="title" size="60" style=" 
						background: #fafafa;     border: solid 2px #E5E5E5;
    					border-radius: 0.5em;" value="${boardvo.title}" placeholder="제목을 입력해주세요">
				</div>
				<div>
					
					<textarea name="content" id="content" rows="6" cols="80" style="width:540px;" placeholder="내용을 입력해주세요">${boardvo.content}</textarea>
				</div>

				<div style="width:650px; text-align: center;">
					<input type="submit" value="수정" style="padding:5px 35px; fontsize:10px;">
					<input type="button" value="삭제" style="padding:5px 35px; fontsize:10px;" onclick="location.href='${contextPath}/board/delete?d_articlenumber=${boardvo.d_articlenumber}'">
			
					<input type="button" value="목록" style="padding:5px 35px; fontsize:10px;" onclick="location.href='${contextPath}/board/list';">
				
			
			
			
				</div>
			</form>
			<c:if test="${param.clear == 'y'}">
			수정이 완료되었습니다.
			</c:if>



				<!-- 	Scripts -->
				<script src="<c:url value="/resources/assets/js/jquery.min.js " />"></script>
				<script src="<c:url value="/resources/assets/js/jquery.dropotron.min.js " />"></script>
				<script src="<c:url value="/resources/assets/js/jquery.scrolly.min.js " />"></script>
				<script src="<c:url value="/resources/assets/js/jquery.scrollex.min.js " />"></script>
				<script src="<c:url value="/resources/assets/js/browser.min.js " />"></script>
				<script src="<c:url value="/resources/assets/js/breakpoints.min.js " />"></script>
				<script src="<c:url value="/resources/assets/js/util.js " />"></script>
				<script src="<c:url value="/resources/assets/js/main.js " />"></script>



            </div>
        </section>

        <aside id="right_aside">
            <div class="tab_item">
                <p class="item"><a href="#">
                    <img src="<%=logo %>"
                    alt="WD로고" width="30" height="30" 
                        />
                </a></p>
                <p class="item"><a href="${contextPath}/<%=update_link %>">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2267d25b-3b2b-4527-b119-3bb7b6eb311d%2Fgrow.png?table=block&id=cabdd96d-0190-4353-bf4e-2071ae6f5a1f&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
                        alt="마이페이지" width="30" height="30" 
                        />
                </a></p>
                <p class="item"><a href="${contextPath}/<%=diary_link %>">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F281cbe2e-ad53-430a-bd66-e9b407a1749f%2Fdiary_(2).png?table=block&id=a65df81c-6382-4ba4-b9ad-f7544896fd87&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
                        alt="다이어리" width="30" height="30" 
                        />
                </a></p>

                <p class="item"><a href="${contextPath}/<%=cash_link %>">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F34ff4e78-cc69-49e3-b417-3f6fcf0cf29e%2Fwallet.png?table=block&id=50a765fc-3846-498a-bc64-8346b9f44bd0&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2" 
                        alt="가계부" width="30" height="30" />
                </a></p>

                <p class="item"><a href="${contextPath}/<%=study_link %>">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe1357e10-c87a-442c-a749-f28e687e9918%2Freading.png?table=block&id=67ad5d48-93b2-42b9-8af9-f9616e336b51&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
                        alt="스터디" width="30" height="30" />
                </a></p>

                <!-- 배경색 바꾸기 -->
                <div>
                    <!--주황-->
                    <a href="#" onclick="changeBg('rgb(255,226,183)')"><div class="bg_color" id="bg_color1"></div></a>
                    <!--노랑-->
                    <a href="#" onclick="changeBg('rgb(255,241,182)')"><div class="bg_color" id="bg_color2"></div></a>
                    <!--연두-->
                    <a href="#" onclick="changeBg('rgb(234,255,182)')"><div class="bg_color" id="bg_color3"></div></a>
                    <!--하늘-->
                    <a href="#" onclick="changeBg('rgb(184,222,255)')"><div class="bg_color" id="bg_color4"></div></a>
                    <!--보라-->
                    <a href="#" onclick="changeBg('rgb(232,234,255)')"><div class="bg_color" id="bg_color5"></div></a>
                    <!--분홍-->
                    <a href="#" onclick="changeBg('rgb(255,232,246)')"><div class="bg_color" id="bg_color6"></div></a>
                </div>
            </div>
        </aside>
    </div>

</body>
</html>