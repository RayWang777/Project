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
<div class="container">
<form action="${contextRoot}/front/shopcar/writeData" method="post">
<%-- <input type="text" value="${shopcarBuy.storeId}">  --%>
<%-- <input type="hidden" value="${shopcarBuy.storeName}">  --%>
<%-- <form:form class="form" method="post" action="${contextRoot}/front/shopcar/buy" modelAttribute="shopcarBean"> --%>
<%-- 	<input type="text" value="${canSeeUser.userName}"> --%>

	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th scope="col"><label class="control control--checkbox">
							<input type="checkbox" class="js-check-all" />
							<div class="control__indicator"></div>
							</label></th>
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
					<c:forEach varStatus="vs" var="shopcarItems" items="${shopcarBuy}">
						<tr scope="row">
						
							<td class="align-middle"><label
							class="control control--checkbox"><input type="checkbox"
							id="check" value="<c:out value='${orderBean.orderId}'/>"
							style="margin-top: 20px;" />
							<div class="control__indicator"></div></label></td>
						
							<td style="font-size: 18px;text-align: center;">
							<input type="hidden" value="${shopcarItems.value.productId}" >
							<input type="text" id="productname" value="${shopcarItems.value.storeName}" style="text-align: center;border-style:none;" readonly="true">	
							</td>
							<td><input type="text" id="productname" value="${shopcarItems.value.productName}" style="text-align: center;border-style:none;" readonly="true"></td>
							<td data-th="Price" >
							<input type="text" id="price" value="${shopcarItems.value.price}" style="width:50px;text-align: center;border-style:none;" readonly="true">
							</td>
							<td data-th="Quantity">
								<input type="number" id="number" name="number" class="form-control text-center" value="${shopcarItems.value.quantity}" min="1">
							</td> 
							<td data-th="Price" >
							<input type="text" id="sugar" value="${shopcarItems.value.sweet}" style="width:50px;text-align: center;border-style:none;" readonly="true">
							</td>
							<td data-th="Price" >
							<input type="text" id="coldhot" value="${shopcarItems.value.coldhot}" style="width:50px;text-align: center;border-style:none;" readonly="true">
							</td>
							<td data-th="Subtotal" class="text-center" >
							<input type="text" id="totalprice" value="${shopcarItems.value.totalPrice}" style="width:100px;text-align: center;border-style:none;" readonly="true">
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
							<td colspan="2">折扣碼:&thinsp;<input type="text" ></td>
							
							
<!-- 							備註:折扣碼後的價格 -->
							<td class="hidden-xs text-center" colspan="3">
							<span style="color:red;font-weight: bold;">折扣後&ensp;</span>
							<strong>Total <input type="text" id="totalprice2" value="${shopcarItems.value.totalPrice}" style="width:100px;text-align: center;border-style:none;" readonly="true"></strong></td>
							<td colspan="3"><button type="submit" class="btn btn-success btn-block" onclick="return confirm('確定要結帳嗎?')">結帳&thinsp;<i class="fa fa-angle-right"></i></button></td>
						</tr>
					</tfoot>
				</table>
				</form>
<%-- 				</form:form> --%>
</div>
</body>

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
		
		document.location.href='${contextRoot}/front/shopcar/delete?productId='+local;
		
	})
}else if (result.isDenied) {
	    return false;
	  }
});
}	






$(function(){
	

// 	$('#tbody').mouseover(function(){
// 		$('#totalprice').css("background-color","rgb(218, 218, 218)");
// 		$('#price').css("background-color","rgb(218, 218, 218)");
// 		$('#productname').css("background-color","rgb(218, 218, 218)");
// 	})

	
// 	$('#tbody').mouseout(function(){
// 		$('#totalprice').css("background-color","white");
// 		$('#price').css("background-color","white");
// 		$('#productname').css("background-color","white");
// 	})
	
	
	$('#number').click(function(){				
        var price = $('#price').val();      
        var number = $('#number').val();
        var totalprice = price*number;

        $('#totalprice').attr('value',totalprice);
    })
    
    $('#number').keyup(function(){				
        var price = $('#price').val();      
        var number = $('#number').val();
        var totalprice = price*number;

        $('#totalprice').attr('value',totalprice);       	
    })
    
    $('#number').click(function(){				
        var price = $('#price').val();      
        var number = $('#number').val();
        var totalprice = price*number;

        $('#totalprice2').attr('value',totalprice);
    })
    
    $('#number').keyup(function(){				
        var price = $('#price').val();      
        var number = $('#number').val();
        var totalprice = price*number;

        $('#totalprice2').attr('value',totalprice);       	
    })
    
	$('#number').click(function(){				
        var price = $('#price').val();      
        var number = $('#number').val();
        var totalprice = price*number;

        $('#total').html("<strong>Total " + totalprice + "</strong>");
    })
    
    $('#number').keyup(function(){				
        var price = $('#price').val();      
        var number = $('#number').val();
        var totalprice = price*number;

        $('#total').html(totalprice);      	
    })
    
//     $('#delete').click(function(){				


//         $('#cart').remove();    
//         $(window).attr('location','${contextRoot}/front/');
//     })
	
})
</script>

<script src="<c:url value="/js/lib/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/lib/jquery.min.js"/>"></script>

<jsp:include page="layout/footer.jsp"></jsp:include>