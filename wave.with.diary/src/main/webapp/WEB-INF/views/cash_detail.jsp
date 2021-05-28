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
<title>가계부 상세보기</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<c:url value="/resources/cashbook/plugins/fontawesome-free/css/all.min.css"/>">
  <!-- Theme style -->
  <link rel="stylesheet" href="<c:url value="/resources/cashbook/dist/css/adminlte.min.css"/>">
</head>

<body>
 <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-6">
                <!-- Input addon -->
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">지출 정보</h3>
              </div>
              <div class="card-body">
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text">작성자</span>
                  </div>
                  <input type="text" class="form-control" value="${member.nickname}">
                </div>

                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text">작성일</span>
                  </div>
                  <input type="text" class="form-control" value="${dto.chdate }">
                </div>

                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text">내역</span>
                  </div>
                  <input type="text" class="form-control" value="${dto.history }">
                </div>

                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text">소비형식</span>
                  </div>
                  <input type="text" class="form-control" value="${dto.ctdto.consumption_typename}">
                </div>

                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="fas fa-dollar-sign"></i>
                    </span>
                  </div>
                  <input type="text" class="form-control" value="${dto.money}" onkeyup="inputNumberFormat(this)">
                  
                </div>

                <h5 class="mt-4 mb-2">With checkbox and radio inputs</h5>

                <div class="row">
                  <div class="col-lg-6">
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text">
                          <input type="checkbox">
                        </span>
                      </div>
                      <input type="text" class="form-control">
                    </div>
                    <!-- /input-group -->
                  </div>
                  <!-- /.col-lg-6 -->
                  <div class="col-lg-6">
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><input type="radio"></span>
                      </div>
                      <input type="text" class="form-control">
                    </div>
                    <!-- /input-group -->
                  </div>
                  <!-- /.col-lg-6 -->
                </div>
                <!-- /.row -->

                <h5 class="mt-4 mb-2">With buttons</h5>

                <p>Large: <code>.input-group.input-group-lg</code></p>

                <div class="input-group input-group-lg mb-3">
                  <div class="input-group-prepend">
                    <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
                      Action
                    </button>
                    <ul class="dropdown-menu">
                      <li class="dropdown-item"><a href="#">Action</a></li>
                      <li class="dropdown-item"><a href="#">Another action</a></li>
                      <li class="dropdown-item"><a href="#">Something else here</a></li>
                      <li class="dropdown-divider"></li>
                      <li class="dropdown-item"><a href="#">Separated link</a></li>
                    </ul>
                  </div>
                  <!-- /btn-group -->
                  <input type="text" class="form-control">
                </div>
                <!-- /input-group -->

                <p>Normal</p>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <button type="button" class="btn btn-danger">Action</button>
                  </div>
                  <!-- /btn-group -->
                  <input type="text" class="form-control">
                </div>
                <!-- /input-group -->

                <p>Small <code>.input-group.input-group-sm</code></p>
                <div class="input-group input-group-sm">
                  <input type="text" class="form-control">
                  <span class="input-group-append">
                    <button type="button" class="btn btn-info btn-flat">Go!</button>
                  </span>
                </div>
                <!-- /input-group -->
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            </div>
           </div>
          </div>
         </div>
        </section>
	<h1>가계부 상세보기</h1>
	<form role="form" method="post" autocomplete="off">
		<input type="hidden" id="page" name="page" value="${cri.page }" readonly="readonly"> 
		<input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum }" readonly="readonly">
	</form>
	<table border="1">
		<tr>
			<th>멤버코드</th>
			<td>${dto.memberCode}</td>
		</tr>
		<tr>
			<th>날짜</th>
			<td>${dto.chdate }</td>
		</tr>
		<tr>
			<th>지출내역</th>
			<td>${dto.history }</td>
		</tr>
		<tr>
			<th>분류</th>
			<td>${dto.ctdto.consumption_typename}</td>
		</tr>
		<tr>
			<th>금액</th>
			<td>${dto.money}</td>
		</tr>
		<tr>
			<th>소비형식</th>
			<td>${dto.dto.classificationName}</td>
		</tr>
		<tr>
			<th>비고</th>
			<td>${dto.memo}</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="수정"
				onclick="updateAccount(${dto.num})" /> 
				<input type="button" value="삭제" onclick="delAccount(${dto.num})" /> 
				<!-- <button type="button" id="accountList">목록</button> -->
				<input type="button" value="목록" onclick="accountList()" /> 
			</td>
		</tr>
	</table>
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
<script src="<c:url value="/resources/cashbook/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<!-- bs-custom-file-input -->
<script src="<c:url value="/resources/cashbook/plugins/bs-custom-file-input/bs-custom-file-input.min.js"/>"></script>
<!-- AdminLTE App -->
<script src="<c:url value="/resources/cashbook/dist/js/adminlte.min.js"/>"></script>
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