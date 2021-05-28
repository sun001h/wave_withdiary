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
</head>

<body>
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
		location.href="cash/updateForm?num="+num;
	}
	// 대화 alert(). confirm(), prompt()
	function delAccount(num){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href="cash/delete?num="+num;
		}
	}

	function accountList(){
		location.href="cash/listpage?"
			+"page=${cri.page}&perPageNum=${cri.perPageNum}";
	}

</script>
</body>
</html>