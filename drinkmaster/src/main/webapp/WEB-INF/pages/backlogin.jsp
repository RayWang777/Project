<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<head>
<meta charset="UTF-8">
<title>飲君子後臺系統</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">



<link href="<c:url value="/css/lib/themify-icons.css"/>" rel="stylesheet">
<link href="<c:url value="/css/lib/menubar/sidebar.css"/>" rel="stylesheet">
<link href="<c:url value="/css/lib/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/css/style.css"/>" rel="stylesheet">




<style>
    li{
        font-size: large;
    }
</style>
</head>

<div class="login-form">
 <form:form class="form" method="post" action="${contextRoot}/backend/loginGo">
	<div class="mb-3">
		<label for="select" class="form-label">帳號</label>
		<input type="text" class="form-control" name="userAccount"/>
	</div>
	<div class="mb-3">
		<label for="select" class="form-label">密碼</label>
		<input type="text" class="form-control" name="userPassword"/>
	</div>
	<div class="mb-3">
	<button type="submit" class="btn btn-primary">登入</button>
	<a><button type="button" class="btn btn-light" style="margin-top: 10px">註冊</button></a>
	</div>
</form:form>
</div>



<jsp:include page="layout/footer.jsp" />