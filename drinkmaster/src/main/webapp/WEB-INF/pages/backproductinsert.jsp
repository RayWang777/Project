<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div class="row justify-content-center">
  <h2>新增商品</h2>
</div>
<div class="container">


<div class="row justify-content-center" >

<div>
<form:form class="form" method="post" enctype="multipart/form-data" action="${contextRoot}/backend/product/insert" modelAttribute="product">
  <form:label path="productName" >商品</form:label>
  <form:input type="text" path="productName" id="productName" /><br><br>
  <form:label path="price"> 價格</form:label>
  <form:input path="price" /><br><br>
   <form:label path="storeBean">店家</form:label>
  <form:input path="storeBean" /><br><br>
   <form:label path="coldHot">溫度</form:label>
  <form:input path="coldHot" /><br><br>
  <form:label path="status">狀態</form:label>
  <form:input path="status" />
  <form:label path="productImage"></form:label>
  <form:input path="productImage" type="hidden"/>
 
  <br><br>
  <div class="row justify-content-center">
  <input type="submit" name="submit" value="更新訊息">
  </div>
  </form:form>



</div>

</div>
</div>



<jsp:include page="layout/footer.jsp" />