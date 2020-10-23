<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:choose>

<c:when test="${not empty id }">
<h2>귀하의 ID는 ${id}입니다</h2>
</c:when>
<c:when test="${empty id }">
<h2>가입되지 않은 회원입니다.</h2>
</c:when>

</c:choose>
</body>
</html>