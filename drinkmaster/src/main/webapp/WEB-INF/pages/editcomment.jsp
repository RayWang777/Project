<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<h1>修改評價</h1>


<div class="container">

<div class="row justify-content-center">
<div class="col-9">
	<h1>更新評論頁面</h1>
<div class="card">
  <div class="card-header">
    請輸入想更新的評論
  </div>
  <div class="card-body">
  
  <form:form class="form" method="post" modelAttribute="comment">
  
  <form:input path="commentId" type="hidden"/>
  <form:input path="createTime" type="hidden"/>
  

<div class="form-group">
	<form:textarea path="content" class="form-control" />
</div>    
    
    <input type="submit" name="submit" value="更新">
  
  </form:form>
  
  </div>
</div>
</div>
</div>

</div>


<jsp:include page="layout/footer.jsp" />