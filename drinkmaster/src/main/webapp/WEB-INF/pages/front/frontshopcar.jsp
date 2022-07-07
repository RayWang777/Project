<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/header.jsp"></jsp:include>


<head>
<meta charset="utf-8" />
<title>購物車</title>
<link rel="stylesheet" href="<c:url value="/css/lib/bootstrap.min.css"/>"/>
<link rel="stylesheet" href="<c:url value="/css/lib/font-awesome.min.css"/>"/>

<style type="text/css">
.table>tbody>tr>td, .table>tfoot>tr>td{
    vertical-align: middle;
}
@media screen and (max-width: 600px) {
    table#cart tbody td .form-control{
		width:20%;
		display: inline !important;
	}
	.actions .btn{
		width:36%;
		margin:1.5em 0;
	}
	
	.actions .btn-info{
		float:left;
	}
	.actions .btn-danger{
		float:right;
	}
	
	table#cart thead { display: none; }
	table#cart tbody td { display: block; padding: .6rem; min-width:320px;}
	table#cart tbody tr td:first-child { background: #333; color: #fff; }
	table#cart tbody td:before {
		content: attr(data-th); font-weight: bold;
		display: inline-block; width: 8rem;
	}
	
	
	
	table#cart tfoot td{display:block; }
	table#cart tfoot td .btn{display:block;}
	
}

</style>
</head>




<body>
<h1 style="text-align:center">我的購物車</h1>
<div class="container">
<form action="${contextRoot}/front/shopcar/writeData" method="post">
<%-- <input type="text" value="${shopcarBuy.storeId}">  --%>
<%-- <input type="hidden" value="${shopcarBuy.storeName}">  --%>
<%-- <form:form class="form" method="post" action="${contextRoot}/front/shopcar/buy" modelAttribute="shopcarBean"> --%>
<%-- 	<input type="text" value="${canSeeUser.userName}"> --%>

	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
<!-- 							<th scope="col"><label class="control control--checkbox"> -->
<!-- 							<input type="checkbox" class="js-check-all" /> -->
<!-- 							<div class="control__indicator"></div> -->
<!-- 							</label></th> -->
							<th style="width:150px;text-align: center;">店名</th>
							<th style="width:100px;text-align: center;">商品</th>
							<th style="width:30px;text-align: center;">單價</th>
							<th style="width:100px;text-align: center;">數量</th>
							<th style="width:30px;text-align: center;">甜度</th>
							<th style="width:30px;text-align: center;">冷熱</th>
							<th style="width:80px;text-align: center;" class="text-center">總金額</th>
							<th style="width:20px"></th>
						</tr>
					</thead>
					<tbody id="tbody">
					<c:forEach varStatus="vs" var="shopcarItems" items="${shopcarBuy}" >
						<tr scope="row" class="count">
						
<!-- 							<td class="align-middle"><label -->
<!-- 							class="control control--checkbox"><input type="checkbox" -->
<%-- 							id="check" value="<c:out value='${orderBean.orderId}'/>" --%>
<!-- 							style="margin-top: 20px;" /> -->
<!-- 							<div class="control__indicator"></div></label></td> -->
						
							<td style="font-size: 18px;text-align: center;">
							<input type="hidden" value="${shopcarItems.value.productId}" >
							<input type="text" id="storename" value="${shopcarItems.value.storeName}" style="text-align: center;border-style:none;" readonly="true">	
							</td>
							<td><input type="text" id="productname" value="${shopcarItems.value.productName}" style="text-align: center;border-style:none;" readonly="true"></td>
							<td data-th="Price" >
							<input type="text" id="price${vs.count}" value="${shopcarItems.value.price}" style="width:50px;text-align: center;border-style:none;" readonly="true">
							</td>
							<td data-th="Quantity">
								<input type="number" id="number${vs.count}" name="number" class="form-control text-center" value="${shopcarItems.value.quantity}" min="1" onkeyup="changeprice(event)" onclick="changeprice(event)">
							</td> 
							<td data-th="Price" >
							<input type="text" id="sugar" value="${shopcarItems.value.sweet}" style="width:50px;text-align: center;border-style:none;" readonly="true">
							</td>
							<td data-th="Price" >
							<input type="text" id="coldhot" value="${shopcarItems.value.coldhot}" style="width:50px;text-align: center;border-style:none;" readonly="true">
							</td>
							<td data-th="Subtotal" class="text-center" >
							<input type="text" id="totalprice${vs.count}" value="${shopcarItems.value.totalPrice}" style="width:100px;text-align: center;border-style:none;" readonly="true">
							</td>
							<td class="actions" data-th="">
<%-- 							<a href="${contextRoot}/front/shopcar/delete?productId=${shopcarItems.value.productId}"> --%>
							<button type="button" onclick="return del(event)" id="${shopcarItems.value.productId}" value="刪除" class="btn btn-danger btn-sm">刪除</button>
<!-- 							</a> -->
							</td>						
							

						</c:forEach>
					</tbody>
					<tfoot>
						<tr class="visible-xs">
<!-- 						備註:折扣碼前的價格 -->
<%-- 							<td class="text-center" id="total"><strong>Total <c:out value="${shopcarBuy.totalPrice}"></c:out></strong></td> --%>
						</tr>
						<tr>
							<td><a href="${contextRoot}/front/" class="btn btn-warning">
							<i class="fa fa-angle-left"></i> 
							&thinsp;繼續購買</a></td>
							
							<td >總金額:&thinsp;<input type="text" name="totalpricedefore" id="totalpricedefore" style="width: 120px;" ></td>
							
							<td style="font-weight: bolder;">折扣碼:&thinsp;<input type="text" name="salescode" id="salescode" style="width: 120px;" ></td>
							<td "><span id="textsale" style="color:red;font-weight: bolder;"></span></td>
							
<!-- 							備註:折扣碼後的價格 -->
							<td class="hidden-xs text-center" colspan="3">
							<span style="color:red;font-weight: bold;">折扣後&ensp;</span>
							<strong>Total <input type="text" id="totalpricefinal" value="${shopcarItems.value.totalPrice}" style="width:100px;text-align: center;border-style:none;" readonly="true"></strong></td>
							<td colspan="3"><button type="submit" class="btn btn-success btn-block" onclick="return confirm('確定要結帳嗎?')">結帳&thinsp;<i class="fa fa-angle-right"></i></button></td>
						</tr>
					</tfoot>
				</table>
				</form>
<%-- 				</form:form> --%>
</div>
</body>

<script type="text/javascript">
$(document).ready(function(){
	  $('#salescode').keyup(function(){
	    var inputsalescode = $('#salescode').val();

	
	$.ajax({
		url:'http://localhost:8081/drinkmaster/backend/salecode/valied?saleCode='+inputsalescode,
		method:'GET',
// 		contentType:"application/x-www-form-urlencoded",
//		data: JSON.stringify(jsonsalescode),
		dataType: 'json',
	    success: function(data){
	    	
// 	    	console.log(data);
	    	$('#textsale').html(data+'折');

	    	
	    	if(inputsalescode == ""){
	    		$('#textsale').html('');
	    	}
	    	else if(data == 1.0){
				$('#textsale').html('折扣碼已過期');
			}else
			
	    	if(data > 1.0){
				$('#textsale').html('無此折扣碼');
			}
	    	
	    	
			},
			

   	   

	    	

	 	error:function(err){
	       console.log(err);
	    }
	    
	    
	    
		
	});
	
});
});	



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
		
		document.location.href='${contextRoot}/front/shopcar/delete?productId='+local;
		
	})
}else if (result.isDenied) {
	    return false;
	  }
});
}	


function changeprice(event){
// 	console.log(event.target)？
// 	number2
	var local = event.target.id.substring(6);
	var localpriceStr = "#price"+local;
	var totalpriceStr = "#totalprice"+local;
	var localPrice = $(localpriceStr).val();
	var totalPrice = localPrice * event.target.value;
	$(totalpriceStr).val(totalPrice);
	
    //利用標籤判斷數量 
    var loopTimes  = document.querySelectorAll('#sugar').length
    var TotalTotalPrice = 0;
    for(i=0;i<loopTimes;i++){
   	 var totalpriceOne = '#totalprice'+(i+1);
   	 console.log(totalpriceOne)
   	 
   	 var row = parseInt( $(totalpriceOne).val() );
   	 console.log(row)
   	 TotalTotalPrice+= row;
    }
//     console.log(TotalTotalPrice)
	$('#totalpricedefore').val(TotalTotalPrice);
		
}



$(function(){ 


	
	$('#number').click(function(){				
	 var s = 0;
	 var price = $('#price').val();      
     var number = $('#number').val();
     var totalprice = price*number;
     $('#totalprice').val(totalprice);
     
		s += price*number;
		$('#totalprice2').val(s);
	})
		
		
		
	function setTotal(){
	$('#cart').each(function(){
		var s = 0;
		s += $('#price').val()*$('#number').val();
	console.log(s);
 })
	}
	
})	
	
	
	
// 	$('#number').click(function(){				
// //         var price = $('#price').val();      
//         var number = $('#number').val();

// //         var totalprice = price*number;

// //         $('#totalprice').attr('value',totalprice);
//         setTotal();
//     })
    
//     $('#number').keyup(function(){				
//         var price = $('#price').val();      
//         var number = $('#number').val();
//         var totalprice = price*number;

//         $('#totalprice').attr('value',totalprice);  
//         setTotal();
//     })
    
//     function setTotal(){
// 	var s = 0;
// 	var price = $('#price').val();      
//  	var number = $('#number').val();
// 	$('#cart  td').each(function(){ 
// 		s += $('#price').val()*$('#number').val();
// 		parseInt($(this).find('input[id*=number]').val())*parseInt($(this).find('input[id*=price]').val());
		
		

				
// 	});
//     $('#totalprice2').val(s.toFixed(2)); 
	
// 	}

// 	setTotal();

    

    

    
// 	$('#number').click(function(){				
//         var price = $('#price').val();      
//         var number = $('#number').val();
//         var totalprice = price*number;

//         $('#total').html("<strong>Total " + totalprice + "</strong>");
//     })
    

// 	})
// })
</script>

<script src="<c:url value="/js/lib/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/lib/jquery.min.js"/>"></script>

<jsp:include page="layout/footer.jsp"></jsp:include>