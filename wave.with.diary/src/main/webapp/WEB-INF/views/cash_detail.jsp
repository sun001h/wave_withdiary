<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.wave.withdiary.member.MemberVO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="com.wave.withdiary.file.WDFileUtils"%>
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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>가계부 상세보기</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<c:url value="/resources/cashbook/plugins/fontawesome-free/css/all.min.css"/>">
<!-- Theme style -->
<link rel="stylesheet"
	href="<c:url value="/resources/cashbook/dist/css/adminlte.min.css"/>">
<style>

/*메인세션내부*/
#content>#main_section>#main_div>#main_section_table {
	padding-top: 60px;
	width: 900px;
	display: flex;
	justify-content: center;
}
/*테이블 폼*/
#detail_table {
	width: 450px;
}
/*줄바꿈속성*/
#breaking {
	word-break: break-all;
}
</style>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/layout/main_layout.css" />">
</head>
<body>
	<div id="content">
		<aside id="left_aside">
			<!-- 왼쪽 상단 로고 -->
			<div id="wd_logo">
				<img
					src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4fdf03a0-151a-4395-8691-56170ce26f19%2F___(3).png?table=block&id=f1ba2b23-7901-4f61-8d20-286c09e128c7&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=3600&userId=&cache=v2"
					id="wd_logo_img" />
			</div>
			<!-- 프로필 영역: 프로필 사진, 닉네임, 소개 -->
			<div id="profile">
				<br>
				<table align="center" width="180" id="profile_table">
					<!--프로필 사진-->
					<tr height="100">
						<td align="center"><img
							src="${contextPath}/download?email=${vo.email}&profile_img=${vo.profile_img }"
							id="profile_img" /><br></td>
					</tr>
					<!--닉네임-->
					<tr height="35">
						<td align="center"><b>${vo.nickname }</b></td>
					</tr>
					<!--소개-->
					<tr height="80">
						<td>
							<div id="profile_intro">${vo.profile }</div>
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
						<td><img
							src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fce878c8a-ddf1-4645-b29e-c899a83d8a2d%2F3314439.png?table=block&id=3bc61806-a0a4-4340-90d4-c9d4751a3d7e&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
							width="30" height="30" /></td>
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
									<c:when
										test="${not empty list.profile_img && list.profile_img!='null' }">
										<td><img
											src="${contextPath}/download?email=${list.email}&profile_img=${list.profile_img }"
											class="fr_preview" /><br></td>
									</c:when>
									<c:otherwise>
										<td><img
											src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7a72114e-dc29-4856-b320-93d279fd9ede%2Fuser.png?table=block&id=679fd6fa-b188-4d55-8887-b5b14c74c259&width=1020&userId=&cache=v2"
											width="30" height="30" /></td>
									</c:otherwise>
								</c:choose>
								<td>${list.nickname }</td>
							</tr>
						</c:forEach>

					</table>
				</div>
			</div>
		</aside>
		<section id="main_section">
			<form role="form" method="post" autocomplete="off">
				<input type="hidden" id="page" name="page" value="${cri.page }"
					readonly="readonly"> <input type="hidden" id="perPageNum"
					name="perPageNum" value="${cri.perPageNum }" readonly>
			</form>
			<div id="main_div" style="overflow: scroll;">
				<div id="main_section_table">
					<div class="row">
						<!-- left column -->
						<!-- Input addon -->
						<div class="card card-info" id="detail_table">
							<div class="card-header">
								<h3 class="card-title">지출 정보</h3>
							</div>
							<div class="card-body">
<%-- 								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fas fa-user"></i>
										</span>
									</div>
									<input type="text" class="form-control"
										value="${member.nickname}" readonly>
								</div> --%>
								
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="far fa-calendar-alt"></i>
										</span>
									</div>
									<input type="text" class="form-control"
										value="${dto.chdate }" readonly>
								</div>

								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="fas fa-file-invoice-dollar"></i>
										</span>
									</div>
									<input type="text" class="form-control" value="${dto.history }"
										readonly="readonly">
								</div>

								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="fas fa-clipboard-list"></i>
										</span>
									</div>
									<input type="text" class="form-control"
										value="${dto.ctdto.consumption_typename}" readonly="readonly">
								</div>

								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="fas fa-dollar-sign"></i>
										</span>
									</div>
									<input type="text" class="form-control"
										value="<fmt:formatNumber value="${dto.money}"
												pattern="#,###" />"
										readonly>
								</div>

								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="far fa-credit-card"></i>
										</span>
									</div>
									<input type="text" class="form-control"
										value="${dto.dto.classificationName}" readonly="readonly">
								</div>

								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="far fa-file"></i>
										</span>
									</div>
									<input type="text" class="form-control" value="${dto.memo}"
										readonly="readonly" id="breaking">
								</div>
								<input type="button" value="수정"
									onclick="updateAccount(${dto.num})"
									class="btn btn-default pull-rigth" /> <input type="button"
									value="삭제" onclick="delAccount(${dto.num})"
									class="btn btn-default pull-rigth" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<aside id="right_aside">
			<div class="tab_item">
				<p class="item">
					<a href="#"> <img src="<%=logo%>" alt="WD로고" width="30"
						height="30" />
					</a>
				</p>
				<p class="item">
					<a href="${contextPath}/<%=update_link %>"> <img
						src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2267d25b-3b2b-4527-b119-3bb7b6eb311d%2Fgrow.png?table=block&id=cabdd96d-0190-4353-bf4e-2071ae6f5a1f&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
						alt="마이페이지" width="30" height="30" />
					</a>
				</p>
				<p class="item">
					<a href="${contextPath}/<%=diary_link %>"> <img
						src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F281cbe2e-ad53-430a-bd66-e9b407a1749f%2Fdiary_(2).png?table=block&id=a65df81c-6382-4ba4-b9ad-f7544896fd87&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
						alt="다이어리" width="30" height="30" />
					</a>
				</p>

				<p class="item">
					<a href="${contextPath}/<%=cash_link %>"> <img
						src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F34ff4e78-cc69-49e3-b417-3f6fcf0cf29e%2Fwallet.png?table=block&id=50a765fc-3846-498a-bc64-8346b9f44bd0&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
						alt="가계부" width="30" height="30" />
					</a>
				</p>

				<p class="item">
					<a href="${contextPath}/<%=study_link %>"> <img
						src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe1357e10-c87a-442c-a749-f28e687e9918%2Freading.png?table=block&id=67ad5d48-93b2-42b9-8af9-f9616e336b51&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
						alt="스터디" width="30" height="30" />
					</a>
				</p>

				<!-- 배경색 바꾸기 -->
				<div>
					<!--주황-->
					<a href="#" onclick="changeBg('rgb(255,226,183)')"><div
							class="bg_color" id="bg_color1"></div></a>
					<!--노랑-->
					<a href="#" onclick="changeBg('rgb(255,241,182)')"><div
							class="bg_color" id="bg_color2"></div></a>
					<!--연두-->
					<a href="#" onclick="changeBg('rgb(234,255,182)')"><div
							class="bg_color" id="bg_color3"></div></a>
					<!--하늘-->
					<a href="#" onclick="changeBg('rgb(184,222,255)')"><div
							class="bg_color" id="bg_color4"></div></a>
					<!--보라-->
					<a href="#" onclick="changeBg('rgb(232,234,255)')"><div
							class="bg_color" id="bg_color5"></div></a>
					<!--분홍-->
					<a href="#" onclick="changeBg('rgb(255,232,246)')"><div
							class="bg_color" id="bg_color6"></div></a>
				</div>
			</div>
		</aside>
	</div>


	<script type="text/javascript">
	function updateAccount(num){
		location.href="updateForm?num="+num;
	}
	// 대화 alert(). confirm(), prompt()
	function delAccount(num){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href="delete?num="+num;
		}
	}

	function accountList(){
		location.href="listpage?"
			+"page=${cri.page}&perPageNum=${cri.perPageNum}";
	}
</script>
	<!-- jQuery -->
	<%-- <script src="<c:url value="/resources/cashbook/plugins/jquery/jquery.min.js"/>"></script> --%>
	<!-- Bootstrap 4 -->
	<script
		src="<c:url value="/resources/cashbook/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
	<!-- bs-custom-file-input -->
	<script
		src="<c:url value="/resources/cashbook/plugins/bs-custom-file-input/bs-custom-file-input.min.js"/>"></script>
	<!-- AdminLTE App -->
	<script
		src="<c:url value="/resources/cashbook/dist/js/adminlte.min.js"/>"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<c:url value="/resources/cashbook/dist/js/demo.js"/>"></script>
	<!-- Page specific script -->
	<script>
$(function () {
  bsCustomFileInput.init();
});
</script>
	<script type="text/javascript">
function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
</script>
</body>
</html>