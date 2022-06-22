<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<div class="container">

<div class="row justify-content-center">
<div class="col-6">
  <h1>回覆意見頁面</h1>
<div class="card">
  <div class="card-header">
    請輸入想回覆的訊息
  </div>
  <div class="card-body">
  
  <form:form class="form" method="post" modelAttribute="msg">
  
  <form:input path="serviceId" type="hidden" />
  <form:input path="answerTime" type="hidden" />
  
  <div class="form-group">
  <form:textarea path="answer" value="clear" class="form-control"/>
  </div>
  
  <input type="submit" name="submit" class="btn btn-lg btn-primary" value="回覆">
 
  </form:form>
    
  </div>
</div>

</div>

</div>

</div>
<jsp:include page="layout/footer.jsp" />