<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<h1>新增評價</h1>


<div class="container">


<div class="row justify-content-center">
<div class="col-9">
	<h1>新增訊息頁面</h1>
<div class="card">
  <div class="card-header">
    請輸入新留言
  </div>
  <div class="card-body">
  
  <form:form class="form" method="post" action="${contextRoot}/backend/comment/insert" modelAttribute="commentBean">
  
<div class="form-group">
	
	<form:textarea path="userId" class="form-control" />
	<form:textarea path="storeId" class="form-control" />
	<form:textarea path="productId" class="form-control" />
	<form:textarea path="score" class="form-control" />
	<form:textarea path="scoreType" class="form-control" />
	<form:textarea path="content" class="form-control" />
	
</div>    
    
    <input type="submit" name="submit" value="新增訊息	">
  
  </form:form>
  
  </div>
</div>
</div>
</div>

<div class="row justify-content-center">
<div class="col-9">

<div class="card">
  <div class="card-header">
    最新留言(時間) <fmt:formatDate pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss EEEE" value="${lastestComment.createTime}" />
  </div>
  <div class="card-body">
  
	<c:out value="${lastestComment.content}"></c:out>
  
  </div>
</div>
</div>
</div>


</div>


<jsp:include page="layout/footer.jsp" />