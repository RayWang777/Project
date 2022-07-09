<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<style>
span{
	color: #ae0000;
}
</style>
<div class="row justify-content-center">
</div>

<div class="container">

<h2 class="mb-4" style="text-align: center; margin-top: 20px" >新增訂單細項</h2>

<div class="row justify-content-center">

<div>
   <form:form class="form" method="post" id="orderform" action="${contextRoot}/backend/orderItems/insert2" modelAttribute="orderItems">
<form:hidden path="orderItemId"/>
		<label >訂單編號</label>
					<form:select id="selectorderId" path="orderBean.orderId">

						<form:options items="${addorders}" itemLabel="orderId"
							itemValue="orderId" />
					</form:select><br><br>
					<form:hidden path="orderId" value="${orderItems.orderBean.orderId}" />
					
		<label >商品名稱</label>
					<form:select id="selectproducts" path="productBean.productId">

						<form:options items="${addproducts}" itemLabel="productName"
							itemValue="productId" id="productoption"/>
					</form:select><br><br>
					<form:hidden path="productId" value="${orderItems.productBean.productId}" />
  <form:label path="quantity">數&emsp;&emsp;量</form:label>
  <form:input path="quantity" id="quantity"/><br>
  <span id="result1" style="color: red; font-size: 14px;padding-left: 65px;"></span>
  <br>
  <form:label path="sweet">甜&emsp;&emsp;度</form:label>
  <form:select path="sweet" >
  <form:option value="無糖">無糖</form:option>
  <form:option value="微糖">微糖</form:option>
  <form:option value="少糖">少糖</form:option>
  <form:option value="半糖">半糖</form:option>
  <form:option value="正常">正常</form:option>
  </form:select><br><br>
 
  <form:label path="coldhot">冷&emsp;&emsp;熱</form:label>
  <form:select path="coldhot" >
  <form:option value="冷">冷</form:option>
  <form:option value="熱">熱</form:option>
  </form:select><br><br>

  <form:label path="price">金&emsp;&emsp;額</form:label>
  <form:input path="price" id="price"/><br>
  <span id="result2" style="color: red; font-size: 14px;padding-left: 65px;"></span>
  <br>
  

  
 <br><br>
  <div class="row justify-content-center">
  <a href="${contextRoot}/backend/orderItems/insert">
  <button type="submit" id="ordersubmit" class="btn btn-primary btn-sm"  name="submit"  onclick="return confirm('確定要新增嗎?')" >確認</button></a>&emsp;  
  
  <button type="button" id="closebutton" class="btn btn-outline-dark btn-sm" data-dismiss="modal" aria-label="Close" >取消</button>
  <br>
    </div>
  </form:form>
  <br>
  <button style="margin-left:210px; margin-bottom: 100px; text-align: center; width: 100px;" class="btn btn-secondary btn-sm" onclick="fast()">一鍵輸入</button>
</div>
</div>
</div>

<script type="text/javascript">

function fast() {
	let quantity = document.getElementById("quantity");
	let price = document.getElementById("price");
// 	let price = document.getElementById("price");
// 	let userId = document.getElementById("userId");
// 	let storeId = document.getElementById("storeId");
// 	let substatus = document.getElementById("substatus");
	
	quantity.value=("30");
	price.value=("900");
// 	price.value=("900");
// 	userId.value=("2");
// 	storeId.value=("2");
// 	substatus.value=("待付款");
}



$(function(){
	var a=false;
    var b=false;
	$("#quantity").blur(function(){
        if($(this).val().length == 0) {
            $("#result1").html("數量不為空");
            a=false;
        }
            else{
                $("#result1").html("");
                a=true;
            }
        })
    })	
	$("#price").blur(function(){
        if($(this).val().length == 0) {
            $("#result2").html("金額不為空");
            b=false;
        }
            else{
                $("#result2").html("");
                b=true;
            }
        })
    $("#aftersubmit").click(function() {
            if(a && b == true){           	
            	return true;
            }
            else{
                alert("有信息填寫錯誤");
                return false;
            }
        });
        
$(function(){
	
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