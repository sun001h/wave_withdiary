<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구검색</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
    function fn_action() {
        var action = $("#action").val();
        document.searchFriend.action = action;
    }
</script>
</head>
<body>
<h2 align="center">친구 검색하기</h2>
<form name="searchFriend" id="searchFriend">
입력: <input type="text" name="value" />
<select name="action" id="action" onchange="fn_action()">
    <option value="searchByEmail">이메일</option>
    <option value="searchByName">별명</option>
</select><br>
<input type="submit" value="검색" />
</form>
</body>
</html>