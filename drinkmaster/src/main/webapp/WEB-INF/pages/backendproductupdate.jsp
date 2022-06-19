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


<div class="row justify-content-center">

<div>
<form:form class="form" method="post" action="${contextRoot}/backend/updateproduct" modelAttribute="product">
  商品<form:label path="productName"></form:label>
  <form:input path="productName" /><br><br>
  價格 <form:label path="price"></form:label>
  <form:input path="price" /><br><br>
   店家<form:label path="storeId"></form:label>
  <form:input path="storeBean" type="readonly" /><br><br>
   溫度<form:label path="coldHot"></form:label>
  <form:input path="coldHot" /><br><br>
   狀態<form:label path="status"></form:label>
  <form:input path="status" />
  <form:label path="productImage"></form:label>
  <form:input path="productImage" type="hidden"/>
 <form:input path="productId" type="hidden"/>
 
  <br><br>
  <div class="row justify-content-center">
  <input type="submit" name="submit" value="更新訊息">
  </div>
  </form:form>



</div>

</div>
</div>



<jsp:include page="layout/footer.jsp" />