<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


 <form:form class="form" method="post" action="${contextRoot}/backend/loginGo">
	<div class="mb-3">
		<label for="select" class="form-label">帳號</label>
		<input type="text" class="form-control" name="userAccount"/>
	</div>
	<div class="mb-3">
		<label for="select" class="form-label">密碼</label>
		<input type="text" class="form-control" name="userPassword"/>
	</div>
	<button type="submit" class="btn btn-primary">送出</button>
</form:form>

<jsp:include page="layout/footer.jsp" />