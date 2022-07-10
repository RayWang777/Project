<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<c:set var="userId" value="1"></c:set>
<head>
<style type="text/css">


</style>
</head>
<div class="row justify-content-center" id="div">
  <h2 style="text-align: center; margin-top: 20px">取消訂單</h2>
</div>
<br>
<div class="container">


<div class="row justify-content-center" style="margin-left:500px; width:  700px">
<!-- <p style="margin:0 auto; width:  500px"> -->
<div >
<form:form class="form" method="post" action="${contextRoot}/front/order/update" modelAttribute="orderBean">
<form:hidden path="orderId"/>
  <form:input type="hidden" path="userBean.userId" readonly="true"/>
  <form:input type="hidden" path="storeBean.storeId" readonly="true"/><br><br>
  下單時間<form:label path="createTime" width="150px"></form:label>
  <form:input path="createTime" readonly="true" /><br><br>
  地&emsp;&emsp;址<form:label path="orderAddress"></form:label>
  <form:input path="orderAddress" readonly="true" width="200"/><br><br>
  電&emsp;&emsp;話<form:label path="orderPhone"></form:label>
  <form:input path="orderPhone" readonly="true"/><br><br>
  狀&emsp;&emsp;態<form:label path="orderStatus"></form:label>
  <select id="orderStatus" style="width: 168px; height: 27px;">
  <option value="-1">請選擇</option>
  <option value="已取消">取消</option>
  </select>
  <form:hidden id="substatus" path="orderStatus" /><br><br> 
  總&ensp;金&ensp;額<form:label path="totalPrice"></form:label>
  <form:input path="totalPrice" /><br><br>
  
 
  <br>
  <p style="margin-left: 40px;">
  <input type="submit" style="text-align: center;" name="submit" value="取消訂單" onclick="return confirm('與店家確認過後，決定要取消嗎?')">&emsp;
  <input type ="button" style="text-align: center;" onclick="history.back()" value="回到上一頁"></input>
  </p>
</form:form>

</div>

</div>
</div>

<script type="text/javascript">
function edit(event){
	  console.log(event.target.id)
var local = event.target.id;
	  
	 
Swal.fire({
title: '與店家確認過後，決定要取消嗎??',
icon: 'warning',
showCancelButton: true,
confirmButtonColor: '#dc3545',
cancelButtonColor: '#28a745',
confirmButtonText: '確認取消',
cancelButtonText: '&nbsp&nbsp返&nbsp&nbsp&nbsp&nbsp回&nbsp&nbsp',
reverseButtons: true

}).then((result) => {
if (result.isConfirmed) {
	  

	Swal.fire({
	  icon: 'success',
	  title: '訂單已取消',
	  showConfirmButton: false,
	  timer: 2000
	}).then( ()=>{
		
		document.location.href='${contextRoot}/front/order/update'
		
	})
}else if (result.isDenied) {
	    return false;
	  }
});
}	





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