<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<c:set var="userId" value="1"></c:set>
<div class="row justify-content-center">
  <h2>更新</h2>
</div>
<br>
<div class="container">


<div class="row justify-content-center" >

<div>
<form:form class="form" method="post" action="${contextRoot}/backend/orderItems/update" modelAttribute="orderItems">
<form:hidden path="orderItemId"/>
<label for="selectorderId">訂單編號</label>
					<form:select id="selectorderId" path="orderBean.orderId">

						<form:options items="${addorders}" itemLabel="orderId"
							itemValue="orderId" />
					</form:select><br><br>
					<form:hidden path="orderId" value="${orderItems.orderBean.orderId}" />
					
<label for="selectproducts">商品名稱</label>
					<form:select id="selectproducts" path="productBean.productId">

						<form:options items="${addproducts}" itemLabel="productName"
							itemValue="productId" id="productoption"/>
					</form:select><br><br>
					<form:hidden path="productId" value="${orderItems.productBean.productId}" />

  金&emsp;&emsp;額<form:label path="price"></form:label>
  <form:input path="price" /><br><br>
  數&emsp;&emsp;量<form:label path="quantity"></form:label>
  <form:input path="quantity" /><br><br>

  
 
  <br><br>
  <div class="row justify-content-center">
  <input type="submit" name="submit" value="更新" onclick="return confirm('確定要更新嗎?')">&emsp;
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


$('#selectorderId').click(function() {

		var selected = $('#selectorderId').val()
		console.log(selected)
		$('#orderId').val(selected);

	})

	

$('#selectproducts').click(function() {

		var selected = $('#selectproducts').val()
		console.log(selected)
		$('#productId').val(selected);

	})
	


	
	
});




</script>

<jsp:include page="layout/footer.jsp" />