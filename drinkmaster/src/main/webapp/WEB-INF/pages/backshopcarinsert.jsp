<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div class="row justify-content-center">
  <h2>新增購物車</h2>
</div>
<br>
<div class="container">


<div class="row justify-content-center" >

<div>
<form:form class="form" method="post" action="${contextRoot}/backend/shopCar/insert" modelAttribute="shopCarBean">
  成立時間<form:label path="createTime"></form:label>
  <form:input path="createTime" /><br><br>
  數&emsp;&emsp;量<form:label path="productAmount"></form:label>
  <form:input path="productAmount" /><br><br>
  冰&emsp;&emsp;塊<form:label path="ice"></form:label>
  <form:input path="ice" /><br><br>
  甜&emsp;&emsp;度<form:label path="sweet"></form:label>
  <form:input path="sweet" /><br><br>
  狀&emsp;&emsp;態<form:label path="status"></form:label>
  <select id="carstatus" style="width: 168px; height: 27px;">
  <option value="false">未送出</option>
  <option value="true">已送出</option>
  </select>
  <form:input id="substatus" path="status" /><br><br>
  
 
  <br><br>
  <div class="row justify-content-center">
  <input type="submit" name="submit" value="新增購物車" onclick="return confirm('確定要新增嗎?')">&emsp;
  <input type ="button" onclick="history.back()" value="回到上一頁"></input>
  </div>
  </form:form>



</div>

</div>
</div>

<<script type="text/javascript">
$(function(){
	
$('#carstatus').change(function(){
var valuesta = $('#carstatus').val();
console.log(valuesta);
$('#substatus').val(valuesta);
	
	
})
	
	
});

</script>

<jsp:include page="layout/footer.jsp" />