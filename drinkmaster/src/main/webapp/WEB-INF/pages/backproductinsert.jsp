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
  <form:hidden path="productId" id="productId"/>
 
  <label  for="productName" >商品</label>
  <form:input type="text" path="productName" id="productName"  name="productName"/><br><br>
  <label for="price"> 價格</label>
  <form:input path="price" id="price" name="price" /><br><br>
   <label  for="productImage"> 圖片</label>
  <form:input  path="productImage" id="productImage" name="productImage" type="file" /><br><br>
   <label  for="storeBean" >店家</label>
  <form:input path="storeBean"  id="storeBean" name="storeBean"/><br><br>
   <label  for="coldHot">溫度</label>
  <form:input path="coldHot" id="coldHot" name="coldHot"/><br><br>
  <label for="status">狀態</label>
  <form:input path="status" id="status"  name="status"/>

 
  <br><br>
  <div class="row justify-content-center">
  <input type="submit" name="submit" value="更新訊息">
  </div>
  </form:form>



</div>

</div>
</div>



<jsp:include page="layout/footer.jsp" />