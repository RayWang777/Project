<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<div class="container">

<div class="row justify-content-center">
<div class="col-9">
  <h1>更新意見回饋頁面</h1>
<div class="card">
  <div class="card-header">
    請輸入想更新的訊息
  </div>
  <div class="card-body">
  
  <form:form class="form" method="post" modelAttribute="msg">
  
  <form:input path="id" type="hidden" />
  <form:input path="added" type="hidden" />
  
  <div class="form-group">
  <form:textarea path="text" class="form-control"/>
  </div>
  
  <input type="submit" name="submit" value="更新">
  
  </form:form>
    
  </div>
</div>

</div>

</div>

</div>
<jsp:include page="layout/footer.jsp" />