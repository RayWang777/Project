<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div class="row justify-content-center">
<h1>新增用戶</h1>
</div>

<div class="container">

<div class="row justify-content-center">

<div>
   <form:form class="form" method="post" action="${contextRoot}/backend/user/insertGo" modelAttribute="user">
       姓&emsp;&emsp;名<form:label path="userName"/>
       <form:input path="userName"/><br><br>
       帳&emsp;&emsp;號<form:label path="userAccount"/>
       <form:input path="userAccount"/><br><br>
       密&emsp;&emsp;碼<form:label path="userPassword"/>
       <form:input path="userPassword"/><br><br>
       地&emsp;&emsp;址<form:label path="userAddress"/>
       <form:input path="userAddress"/><br><br>
       大&ensp;頭&ensp;貼<form:label path="photo"/>
       <form:input path="photo"/><br><br>
       手&emsp;&emsp;機<form:label path="phone"/>
       <form:input path="phone"/><br><br>
       性&emsp;&emsp;別<form:label path="gender"/>
       <form:input path="gender"/><br><br>
       生&emsp;&emsp;日<form:label path="birthday"/>
       <form:input path="birthday"/><br><br>
       創建日期<form:label path="createdate"/>
       <form:input path="createdate"/><br><br>
       職&emsp;&emsp;權<form:label path="role"/>
       <form:input path="role"/><br><br>
       
       <div class="row justify-content-center">
       	<input type="submit" name="submit" value="新增商品">
       </div>
   </form:form>
</div>
</div>
</div>


<jsp:include page="layout/footer.jsp" />