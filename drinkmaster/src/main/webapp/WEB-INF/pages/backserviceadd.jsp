<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<div class="container">


<div class="row justify-content-center">
<div class="col-9">
  <h1>意見回饋頁面</h1>
<div class="card">
  <div class="card-header">
    請輸入新訊息
  </div>
  <div class="card-body">
  
  <form:form class="form" method="post" action="${contextRoot}/postMessage" modelAttribute="workMessages">
  
  <div class="form-group">
  <form:textarea path="text" class="form-control"/>
  </div>
  
  <input type="submit" name="submit" value="新增訊息">
  
  </form:form>
    
  </div>
</div>

</div>

</div>

<p />

<div class="row justify-content-center">
  <div class="col-9">
   
  <div class="card">
    <div class="card-header">
      最新訊息(時間)  <fmt:formatDate pattern="yyyy 年 MM 月 dd 日 hh:mm:ss a EEEE" value="${lastestMsg.added}" />
    </div>
    <div class="card-body">
      <c:out value="${lastestMsg.text}" />
      
    </div>
  </div>
  
  </div>
  
  </div>

</div>

<jsp:include page="layout/footer.jsp" />