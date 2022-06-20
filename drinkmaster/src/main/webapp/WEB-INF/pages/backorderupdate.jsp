<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div class="row justify-content-center">
  <h2>更新訂單</h2>
</div>
<br>
<div class="container">


<div class="row justify-content-center" >

<div>
<form:form class="form" method="post" action="${contextRoot}/backend/order/update" modelAttribute="orderBean">
<form:hidden path="orderId"/>
  訂單日期<form:label path="createTime"></form:label>
  <form:input path="createTime" /><br><br>
  地&emsp;&emsp;址<form:label path="orderAddress"></form:label>
  <form:input path="orderAddress" /><br><br>
  電&emsp;&emsp;話<form:label path="orderPhone"></form:label>
  <form:input path="orderPhone" /><br><br>
  狀&emsp;&emsp;態<form:label path="orderStatus"></form:label>
  <form:input path="orderStatus" /><br><br>
  總&ensp;金&ensp;額<form:label path="totalPrice"></form:label>
  <form:input path="totalPrice" /><br><br>
  
 
  <br><br>
  <div class="row justify-content-center">
  <input type="submit" name="submit" value="更新訂單">&emsp;
  <input type ="button" onclick="history.back()" value="回到上一頁"></input>
  </div>
  </form:form>



</div>

</div>
</div>



<jsp:include page="layout/footer.jsp" />