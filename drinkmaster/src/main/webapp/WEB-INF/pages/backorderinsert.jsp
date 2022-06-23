<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div class="row justify-content-center">
  <h2>新增訂單</h2>
</div>
<br>
<div class="container">


<div class="row justify-content-center" >

<div>
<form:form class="form" method="post" action="${contextRoot}/backend/order/insert" modelAttribute="orderBean">
  訂單日期<form:label path="createTime"></form:label>
  <form:input path="createTime" /><br><br>
  地&emsp;&emsp;址<form:label path="orderAddress"></form:label>
  <form:input path="orderAddress" /><br><br>
  電&emsp;&emsp;話<form:label path="orderPhone"></form:label>
  <form:input path="orderPhone" /><br><br>
  狀&emsp;&emsp;態<form:label path="orderStatus"></form:label>
  <form:select id="orderStatus" style="width: 168px; height: 27px;" path="orderStatus">
  <form:option value="待付款">待付款</form:option>
  <form:option value="待出貨">待出貨</form:option>
  <form:option value="已出貨">已出貨</form:option>
  <form:option value="已取消">已取消</form:option>
  </form:select>
  <form:input id="substatus" path="orderStatus" /><br><br>
  總&ensp;金&ensp;額<form:label path="totalPrice"></form:label>
  <form:input path="totalPrice" /><br><br>
  
 
  <br><br>
  <div class="row justify-content-center">
  <input type="submit" name="submit" value="新增訂單" onclick="return confirm('確定要新增嗎?')">&emsp;
  <input type ="button" onclick="history.back()" value="回到上一頁"></input>
  </div>
  </form:form>



</div>

</div>
</div>

<script type="text/javascript">
$(function(){
	
$('#orderStatus').change(function(){
var valuesta = $('#orderStatus').val();
console.log(valuesta);
$('#substatus').val(valuesta);	
	
})	
	
});



</script>

<jsp:include page="layout/footer.jsp" />