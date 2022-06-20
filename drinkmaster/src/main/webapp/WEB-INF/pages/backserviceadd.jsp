<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<div class="container">
<div class="row justify-content-center">
<div class="col-6">
 <h1>意見回饋</h1>
<form:form class="form" method="post" action="${contextRoot}/postMessage" modelAttribute="workMessages">
<div class="form-group">
    <label for="exampleFormControlInput1">暱稱</label>
    <input type="text" class="form-control" id="FormControlInput1">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlInput1">Email信箱</label>
    <input type="email" class="form-control" id="FormControlInput2" placeholder="name@example.com">
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect1">品牌</label>
    <select class="form-control" id="FormControlSelect1">
      <option>清心</option>
      <option>50嵐</option>
      <option>可不可</option>
      <option>龜記</option>
      <option>麻古</option>
    </select>
  </div>
  <div class="form-group">
    <label for="exampleFormControlInput1">門市</label>
    <input type="text" class="form-control" id="FormControlInput3" placeholder="信義分店">
  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">意見回饋</label>
    <form:textarea path="answer" class="form-control"/>
    
     <input type="submit" name="submit" value="送出回饋">
     
  </div>
</form:form>
</div>
</div>
</div>
<br/>

