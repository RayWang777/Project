<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>


<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style type="text/css">
#orderform input:focus
{
	border-color:rgba(82, 168, 236, 0.8);
	outline:0;outline:thin dotted \9;
	-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);
	-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);
	box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);
	outline-style: none ;
	border-radius: 3px;
	padding: 14px 14px;
	font-family: "Microsoft soft";
	font-size: 14px;
	height: 25px;
	width: 350px;
}

#orderform input
{
 	outline-style: none ; 
    border: 1px solid #ccc;  
    border-radius: 3px; 
    padding: 14px 14px; 
    font-family: "Microsoft soft";
 	height: 25px; 
 	width: 350px; 
    outline: 0; 
/*     -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(0, 106, 255,.4); */
/*     box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(0, 106, 255,.4);  */
	font-size: 14px;
}

#orderform{
	margin-left: 25px;
}

#orderform label {
	font-size: 16px;
}

 #orderform #orderStatus{ 
	height: 25px; 
	width: 150px;
	font-size: 16px;
 } 
 
 #orderform #ordersubmit{ 
 	height: 30px; 
 	width: 60px; 
 	font-size: 16px; 
   	vertical-align: middle; 
   	line-height: 30px; 
   	padding:0px 8px; 
   	border-radius: 2px; 
   	border-color: #007BFF;
 } 
 
  #orderform #closebutton{ 
 	height: 30px; 
 	width: 60px; 
 	font-size: 16px; 
   	vertical-align: middle; 
   	line-height: 30px; 
   	padding:0px 8px; 
   	border-radius: 2px; 
 } 
 
 

#orderform select{
	height: 20px;
	width: 80px;
	border-color: black;
	border-radius: 2px;
}

#orderform #selectorderId{
	height: 20px;
	width: 80px;
	border-color: black;
	border-radius: 2px;
}

#orderform #selectproduct{
	height: 20px;
	width: 80px;
	border-color: black;
	border-radius: 2px;
}

#orderform #useridoption{ 
	height: 25px; 
	width: 150px;
	font-size: 16px;
 } 
 

</style>

</head>
<body>

<br>
<p>
<button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#exampleModal" data-whatever="">新增</button>&emsp;
</p>

<form action="${contextRoot}/backend/order/select" method="get">
		<div class="mb-3">
			<label for="select" class="form-label">搜尋</label> <input type="text"name="oid" id="select" placeholder="查詢編號" /> 

		<button type="submit" class="" style="border-color: gray;">查詢</button>
		<c:out value="查到 ${page.totalElements } 筆資料"></c:out>
		</div >
		
</form>		

<table class="table table-hover"style="width:100%;table-layout:fixed;">
  <thead>
    <tr>
      <th scope="col"><label class="control control--checkbox">
						<input type="checkbox" class="js-check-all" />
						<div class="control__indicator"></div>
	</label></th>
      <th scope="col">流水號</th>
      <th scope="col">訂單編號</th>
      <th scope="col">商品名稱</th>
      <th scope="col">數量</th>
      <th scope="col">甜度</th>
      <th scope="col">冷熱</th>
      <th scope="col">金額</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="orderItems" items="${page.content}">
    <tr scope="row">
					<td class="align-middle"><label
						class="control control--checkbox"><input type="checkbox"
							id="check" value="<c:out value='${orderItems.orderItemId}'/>"
							style="margin-top: 20px;" />
							<div class="control__indicator"></div></label></td>
    
      <th scope="row"><c:out value="${orderItems.orderItemId}"/></th>
      <td><c:out value="${orderItems.orderBean.orderId}"/></td>
      <td><c:out value="${orderItems.productBean.productName}"/></td>
      <td><c:out value="${orderItems.quantity}"/></td>
      <td><c:out value="${orderItems.sweet}"/></td>
      <c:choose>
      <c:when test="${orderItems.coldhot=='冷'}">
      <td style="color: blue;font-weight: bold;">
      <c:out value="冷"/></td>
      </c:when>
      <c:when test="${orderItems.coldhot=='熱'}">
      <td style="color: red;font-weight: bold;">
      <c:out value="熱"/></td>
      </c:when>
      </c:choose>
      <td><c:out value="${orderItems.price}"/></td>

      <td>
      <a href="${contextRoot}/backend/orderItems/edit?id=${orderItems.orderItemId}"><button class="btn btn-outline-primary btn-sm">編輯</button></a>
      <button onclick="return del(event)" id="${orderItems.orderItemId}" class="btn btn-outline-danger btn-sm">刪除</button></td>
      </tr>
    </c:forEach>
    
 
  </tbody>
  
</table>


<div class="row justify-content-center" style="font-size: x-large;">
  <c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
   <c:choose>
   <c:when test="${page.number!=pageNumber-1}">
   <a href="${contextRoot}/backend/orderItems/findAll?o=${pageNumber}"> <c:out value="${pageNumber}" /> </a>
   </c:when>
   <c:otherwise>
   <c:out value="${pageNumber}"></c:out>
   </c:otherwise>
   </c:choose> 
   <c:if test="${pageNumber!= page.totalPages}">
    &thinsp;| &thinsp;
   </c:if>
   </c:forEach>
   </div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">新增</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <br>
<form:form class="form" method="post" id="orderform" action="${contextRoot}/backend/orderItems/insert" modelAttribute="orderItems">
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
  <form:input path="quantity" /><br><br>
  
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
  <form:input path="price" /><br><br>
  

  
 <br><br>
  <div class="row justify-content-center">
  <a href="${contextRoot}/backend/orderItems/insert">
  <button type="submit" id="ordersubmit" class="btn btn-primary btn-sm"  name="submit"  onclick="return confirm('確定要新增嗎?')" >確認</button></a>&emsp;  
  
  <button type="button" id="closebutton" class="btn btn-outline-dark btn-sm" data-dismiss="modal" aria-label="Close" >取消</button>
  <br>
    </div>
  </form:form>
  <br>
      </div>
      </div>
      </div>
      


      
      
      

   


<script type="text/javascript">

function del(event){
	  console.log(event.target.id)
var local = event.target.id;
Swal.fire({
title: '確認要刪除嗎?',
icon: 'warning',
showCancelButton: true,
confirmButtonColor: '#dc3545',
cancelButtonColor: '#28a745',
confirmButtonText: '確認刪除',
cancelButtonText: '&nbsp&nbsp取&nbsp&nbsp&nbsp&nbsp消&nbsp&nbsp',
reverseButtons: true

}).then((result) => {
if (result.isConfirmed) {
	  

	Swal.fire({
	  icon: 'success',
	  title: '資料已移除',
	  showConfirmButton: false,
	  timer: 2000
	}).then( ()=>{
		
		document.location.href='${contextRoot}/backend/orderItems/delete?id='+local;
		
	})
}else if (result.isDenied) {
	    return false;
	  }
});
}	

$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('新增 ' + recipient)
	  modal.find('.modal-body input').val(recipient)
	})

	
	$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('新增 ' + recipient)
	  modal.find('.modal-body input').val(recipient)
	})


$('#ordersubmit').click(function() {
  $('#orderform').submit();
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


</body>

</html>
<script src="<c:url value="/js/lib/popper.min.js"/>"></script>
<script src="<c:url value="/js/lib/main.js"/>"></script>

<jsp:include page="layout/footer.jsp" />