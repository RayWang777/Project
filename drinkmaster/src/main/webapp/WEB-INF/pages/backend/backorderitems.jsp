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
<c:choose>
	<c:when test="${userBean.role=='firm'}">
		<input type="hidden">
	</c:when>
	<c:when test="${userBean.role=='store'}">
<button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#exampleModal" data-whatever="">??????</button>&emsp;
	</c:when>
	<c:when test="${userBean.role=='admin'}">
	<button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#exampleModal" data-whatever="">??????</button>&emsp;
	</c:when>
	</c:choose>
</p>

<form action="${contextRoot}/backend/order/select" method="get">
		<div class="mb-3">
			<label for="select" class="form-label">??????</label> <input type="text"name="oid" id="select" placeholder="????????????" /> 

		<button type="submit" class="" style="border-color: gray;">??????</button>
		<c:out value="?????? ${page.totalElements } ?????????"></c:out>
		</div >
		
</form>		

<table class="table table-hover"style="width:100%;table-layout:fixed;">
  <thead>
    <tr>
      <th scope="col"><label class="control control--checkbox">
						<input type="checkbox" class="js-check-all" />
						<div class="control__indicator"></div>
	</label></th>
      <th scope="col">?????????</th>
      <th scope="col">????????????</th>
      <th scope="col">????????????</th>
      <th scope="col">??????</th>
      <th scope="col">??????</th>
      <th scope="col">??????</th>
      <th scope="col">??????</th>
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
      <c:when test="${orderItems.coldhot=='???'}">
      <td style="color: blue;font-weight: bold;">
      <c:out value="???"/></td>
      </c:when>
      <c:when test="${orderItems.coldhot=='???'}">
      <td style="color: red;font-weight: bold;">
      <c:out value="???"/></td>
      </c:when>
      </c:choose>
      <td><c:out value="${orderItems.price}"/></td>

      <td>
      <c:choose>
	<c:when test="${userBean.role=='firm'}">
		<input type="hidden">
	</c:when>
	<c:when test="${userBean.role=='store'}">
      <a href="${contextRoot}/backend/orderItems/edit?id=${orderItems.orderItemId}"><button class="btn btn-outline-primary btn-sm">??????</button></a>
     </c:when>
     <c:when test="${userBean.role=='admin'}">
     <a href="${contextRoot}/backend/orderItems/edit?id=${orderItems.orderItemId}"><button class="btn btn-outline-primary btn-sm">??????</button></a>
     </c:when>
     </c:choose>
<button onclick="return del(event)" id="${orderItems.orderItemId}" class="btn btn-outline-danger btn-sm">??????</button></td>
      </tr>
    </c:forEach>
    
 
  </tbody>
  
</table>


<div class="row justify-content-center" style="font-size: x-large;">
  <c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
   <c:choose>
   <c:when test="${page.number!=pageNumber-1}">
   <a href="${contextRoot}/backend/orderItems/findAll?o=${pageNumber}" style="color:#84C1FF"> <c:out value="${pageNumber}" /> </a>
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
        <h5 class="modal-title" id="exampleModalLabel">??????</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <br>
<form:form class="form" method="post" id="orderform" action="${contextRoot}/backend/orderItems/insert" modelAttribute="orderItems">
<form:hidden path="orderItemId"/>
		<label >????????????</label>
					<form:select id="selectorderId" path="orderBean.orderId">

						<form:options items="${addorders}" itemLabel="orderId"
							itemValue="orderId" />
					</form:select><br><br>
					<form:hidden path="orderId" value="${orderItems.orderBean.orderId}" />
					
		<label >????????????</label>
					<form:select id="selectproducts" path="productBean.productId">

						<form:options items="${addproducts}" itemLabel="productName"
							itemValue="productId" id="productoption"/>
					</form:select><br><br>
					<form:hidden path="productId" value="${orderItems.productBean.productId}" />
  <form:label path="quantity">???&emsp;&emsp;???</form:label>
  <form:input path="quantity" id="quantity"/><br>
  <span id="result1" style="color: red; font-size: 14px;padding-left: 65px;"></span>
  <br>
  <form:label path="sweet">???&emsp;&emsp;???</form:label>
  <form:select path="sweet" >
  <form:option value="??????">??????</form:option>
  <form:option value="??????">??????</form:option>
  <form:option value="??????">??????</form:option>
  <form:option value="??????">??????</form:option>
  <form:option value="??????">??????</form:option>
  </form:select><br><br>
 
  <form:label path="coldhot">???&emsp;&emsp;???</form:label>
  <form:select path="coldhot" >
  <form:option value="???">???</form:option>
  <form:option value="???">???</form:option>
  </form:select><br><br>

  <form:label path="price">???&emsp;&emsp;???</form:label>
  <form:input path="price" id="price"/><br>
  <span id="result2" style="color: red; font-size: 14px;padding-left: 65px;"></span>
  <br>
  

  
 <br><br>
  <div class="row justify-content-center">
  <a href="${contextRoot}/backend/orderItems/insert">
  <button type="submit" id="ordersubmit" class="btn btn-primary btn-sm"  name="submit"  onclick="return confirm('???????????????????')" >??????</button></a>&emsp;  
  
  <button type="button" id="closebutton" class="btn btn-outline-dark btn-sm" data-dismiss="modal" aria-label="Close" >??????</button>
  <br>
    </div>
  </form:form>
  <br>
  <button style="margin-left:210px; margin-bottom: 100px; text-align: center; width: 100px;" class="btn btn-secondary btn-sm" onclick="fast()">????????????</button>
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
// 	substatus.value=("?????????");
}



$(function(){
	var a=false;
    var b=false;
	$("#quantity").blur(function(){
        if($(this).val().length == 0) {
            $("#result1").html("???????????????");
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
            $("#result2").html("???????????????");
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
                alert("?????????????????????");
                return false;
            }
        });



function del(event){
	  console.log(event.target.id)
var local = event.target.id;
Swal.fire({
title: '???????????????????',
icon: 'warning',
showCancelButton: true,
confirmButtonColor: '#dc3545',
cancelButtonColor: '#28a745',
confirmButtonText: '????????????',
cancelButtonText: '&nbsp&nbsp???&nbsp&nbsp&nbsp&nbsp???&nbsp&nbsp',
reverseButtons: true

}).then((result) => {
if (result.isConfirmed) {
	  

	Swal.fire({
	  icon: 'success',
	  title: '???????????????',
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
	  modal.find('.modal-title').text('?????? ' + recipient)
	  modal.find('.modal-body input').val(recipient)
	})

	
	$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('?????? ' + recipient)
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