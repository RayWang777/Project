<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<c:set var="userId" value="1"></c:set>
<div class="row justify-content-center">
  <h2>更新訂單</h2>
</div>
<br>
<div class="container">


<div class="row justify-content-center" >

<div>
<form:form class="form" method="post" action="${contextRoot}/backend/order/update" modelAttribute="orderBean">
<form:hidden path="orderId"/>
<label for="selectuserId">使用者名稱</label>
					<form:select id="selectuserId" path="userBean.userId">

						<form:options items="${orderaddusers}" itemLabel="userName"
							itemValue="userId" />
					</form:select><br><br>
					<form:hidden path="userId" value="${ orderBean.userBean.userId}" />

<label for="selectstore">店家名稱</label>
					<form:select id="selectstore" path="storeBean.storeId">

						<form:options items="${orderaddstores}" itemLabel="storeName"
							itemValue="storeId" />
					</form:select><br><br>
					<form:hidden path="storeId" value="${orderBean.storeBean.storeId }" />
					

  建立時間<form:label path="createTime"></form:label>
  <form:input path="createTime" /><br><br>
  地&emsp;&emsp;址<form:label path="orderAddress"></form:label>
  <form:input path="orderAddress" /><br><br>
  電&emsp;&emsp;話<form:label path="orderPhone"></form:label>
  <form:input path="orderPhone" /><br><br>
<!--   <label for="selectstatus">狀&emsp;&emsp;態</label> -->
<%-- 					<form:select id="selectstatus" path="orderStatus"> --%>

<%-- 						<form:options items="${orderstatus}" itemLabel="orderStatus" --%>
<%-- 							itemValue="orderId" id="statusoption"/> --%>
<%-- 					</form:select><br><br> --%>
<%-- 					<form:hidden path="orderId" value="1" /> --%> 
  狀&emsp;&emsp;態<form:label path="orderStatus"></form:label>
  <select id="orderStatus" style="width: 168px; height: 27px;">
  <option value="-1">請選擇</option>
  <option value="待付款">待付款</option>
  <option value="待出貨">待出貨</option>
  <option value="已出貨">已出貨</option>
  <option value="已取消">已取消</option>
  </select>
  <form:hidden id="substatus" path="orderStatus" /><br><br> 
  總&ensp;金&ensp;額<form:label path="totalPrice"></form:label>
  <form:input path="totalPrice" /><br><br>
  
 
  <br><br>
  <div class="row justify-content-center">
  <input type="submit" name="submit" value="更新訂單" onclick="return confirm('確定要更新嗎?')">&emsp;
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

$('#selectuserId').click(function() {

		var selected = $('#selectuserId').val()
		console.log(selected)
		$('#userId').val(selected);

	})
	
$('#selectstore').click(function() {

		var selected = $('#selectstore').val()
		console.log(selected)
		$('#storeId').val(selected);

	})

	

$('#selectproducts').click(function() {

		var selected = $('#selectproducts').val()
		console.log(selected)
		$('#productId').val(selected);

	})
	


	
	
});




</script>

<jsp:include page="layout/footer.jsp" />