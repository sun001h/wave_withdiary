<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.wave.withdiary.member.MemberVO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
#content>#main_section>#main_section_table {
	padding-top: 20px;
	width: 900px;
	display: flex;
	justify-content: center;
}
/*테이블 폼*/
#detail_table{
	width: 450px;
}
/*줄바꿈속성*/
#breaking {
word-break: break-all;
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
<form role="form" method="post" autocomplete="off">
		<input type="hidden" id="page" name="page" value="${cri.page }"
			readonly="readonly"> <input type="hidden" id="perPageNum"
			name="perPageNum" value="${cri.perPageNum }" readonly>
	</form>
		<div id="main_section_table">
			<div class="row">
				<!-- left column -->
					<!-- Input addon -->
					<div class="card card-info" id="detail_table">
						<div class="card-header">
							<h3 class="card-title">지출 정보</h3>
						</div>
						<div class="card-body">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">
									<i class="fas fa-user"></i>
									</span>
								</div>
								<input type="text" class="form-control"
									value="${member.nickname}" readonly>
							</div>

							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">
									<i class="far fa-calendar-alt"></i>
									</span>
								</div>
								<input type="text" class="form-control" value="${dto.chdate }" readonly="readonly">
							</div>

							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">
									<i class="fas fa-file-invoice-dollar"></i>
									</span>
								</div>
								<input type="text" class="form-control" value="${dto.history }" readonly="readonly">
							</div>

							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">
									<i class="fas fa-clipboard-list"></i>
									</span>
								</div>
								<input type="text" class="form-control"
									value="${dto.ctdto.consumption_typename}" readonly="readonly">
							</div>

							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
									<i class="fas fa-dollar-sign"></i>
									</span>
								</div>
								<input type="text" class="form-control" value="<fmt:formatNumber value="${dto.money}"
												pattern="#,###" />" readonly>
							</div>

							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">
									<i class="far fa-credit-card"></i>
									</span>
								</div>
								<input type="text" class="form-control"
									value="${dto.dto.classificationName}" readonly="readonly">
							</div>

							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">
									<i class="far fa-file"></i>
									</span>
								</div>
								<input type="text" class="form-control" value="${dto.memo}" readonly="readonly"
								id="breaking">
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
	</section>

        <aside id="right_aside">
            <div class="tab_item">
                <p class="item"><a href="#">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F70febc41-cd9f-441e-bc84-38c284190b45%2Flogo.png?table=block&id=0cdf4e9c-85ce-48a4-85b4-9c6e36fd885d&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=2400&userId=&cache=v2"
                        alt="WD로고" width="30" height="30" 
                        />
                </a></p>
                <p class="item"><a href="#">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F281cbe2e-ad53-430a-bd66-e9b407a1749f%2Fdiary_(2).png?table=block&id=a65df81c-6382-4ba4-b9ad-f7544896fd87&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
                        alt="다이어리" width="30" height="30" 
                        />
                </a></p>

                <p class="item"><a href="/diary/cash/listpage">
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