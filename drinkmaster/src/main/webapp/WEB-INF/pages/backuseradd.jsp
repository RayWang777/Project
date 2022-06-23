<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div class="row justify-content-center">
</div>

<div class="container">

<h2 class="mb-4" style="text-align: center; margin-top: 20px" >${usersave}</h2>

<div class="row justify-content-center">

<div>
   <form:form class="form" method="post" action="${contextRoot}/backend/user/insert" modelAttribute="user" enctype="multipart/form-data">
   	<form:hidden path="userId" id="userId"/>
       <form:label path="userName">姓&emsp;&emsp;名</form:label>
       <form:input path="userName" class="form-control"/><br><br>
       帳&emsp;&emsp;號<form:label path="userAccount"/>
       <form:input path="userAccount" class="form-control"/><br><br>
       密&emsp;&emsp;碼<form:label path="userPassword"/>
       <form:input path="userPassword" class="form-control"/><br><br>
       地&emsp;&emsp;址<form:label path="userAddress"/>
       <form:input path="userAddress" class="form-control"/><br><br>       
       手&emsp;&emsp;機<form:label path="phone"/>
       <form:input path="phone" class="form-control"/><br><br>
       性&emsp;&emsp;別<form:label path="gender"/>
       <form:input path="gender" class="form-control"/><br><br>
       生&emsp;&emsp;日<form:label path="birthday"/>
       <form:input path="birthday" class="form-control"/><br><br>
       創建日期<form:label path="createdate"/>
       <form:input path="createdate" class="form-control" disabled="true" /><br><br>
       職&emsp;&emsp;權<form:label path="role"/>
       <form:input path="role" class="form-control"/><br><br>
       
		<div class="mb-4">
			<label for="reallogo" class="form-label">Logo</label>
			<input name="reallogo" class="form-control" type="file"
				id="reallogo" onchange="preview()" />
			<span id=firmLogoSp><c:url value="${errors.userPhoto}"/></span>
		</div>
	
		<div class="mb-3"style="text-align: center;">
			<img id="logo" src="<c:url value="/backend/user/${user.userId}/photo"/>" width="100px" height="100px" />
			<c:if test="${user.userId!=null}">
			<img id="oldlogo" src="<c:url value="/backend/user/${user.userId}/photo"/>"width="100px" height="100px"/>
			</c:if>
		</div>
       
       
       <div class="row justify-content-center">
       	<input type="submit" class="btn btn-success" value='<c:out value="${usersave}"/>'>
       </div>
   </form:form>
</div>
</div>
</div>

<script type="text/javascript">

$(function(){
	$('#logo').hide();
});

function preview() {
	logo.src=URL.createObjectURL(event.target.files[0]);
	if ( (event.target.files[0].type).startsWith("image")){
		$('#oldlogo').hide();
		$('#logo').show();
	} 
}

</script>

<jsp:include page="layout/footer.jsp" />