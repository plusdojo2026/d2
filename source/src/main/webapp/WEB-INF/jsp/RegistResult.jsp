<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main>
	<h1>
		<c:out value="${result.title}" />
	</h1>
	<hr>
	<p>
		<c:out value="${result.message}" />
	</p>
	<c:if test="${fn:contains(result.backTo, '/d2/LoginServlet')}">
		<a href="${result.backTo}">ログインページへ戻る</a>
	</c:if>
	<c:if test="${fn:contains(result.backTo, '/d2/JobSelectServlet')}">
		<a href="${result.backTo}"> ホームへ戻る</a>
	</c:if>
	<c:if test="${fn:contains(result.backTo, '/d2/NewRegistServlet')}">
		<a href="${result.backTo}"> 新規登録へ戻る</a>
	</c:if>
	</main>
</body>
</html>