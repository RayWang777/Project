<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/header.jsp"></jsp:include>


<head>
<meta charset="utf-8" />
<title>訂購</title>
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
<div class="container" id="container">
<form:form class="form" method="post" action="${contextRoot}/front/shopcar/buy" modelAttribute="productBean">
<input type="hidden" value="${productBean.productId}" name="shopcarproductId">
<input type="text" value="${productCategoryBean.storeId}" name="shopcarstoreId">
	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:120px;text-align: center;" colspan="2">商品</th>
<!-- 							<th style="width:80px;text-align: center;"></th> -->
							<th style="width:80px;text-align: center;">單價</th>
							<th style="width:150px;text-align: center;">數量</th>
							<th style="width:30px;text-align: center;">甜度</th>
							<th style="width:30px;text-align: center;">冷熱</th>
							<th style="width:70px;text-align: center;" class="text-center">總金額</th>
							<th style="width:20px"></th>
							
						</tr>
					</thead>
					<tbody id="tbody">
						<tr>
							<td data-th="Product">
<!-- 								<div class="row"> -->
									<div class="col-sm-2 hidden-xs">
									<img src="${productBean.productImage}" style="width: 250px;height: 200px;text-align: center;" name="shopcarimg" /></div>
									<div class="col-sm-10">
										
										
									</div>
<!-- 								</div> -->
							</td>
							<td style="font-size: 18px;">
							<form:input id="productname" path="productName"  style="border-style:none;text-align: center;"  readonly="true"/>
<%-- 							<c:out value="${productBean.productName}"/> --%>
							</td>
							
							<td data-th="Price" >
<%-- 							<c:out value="${productBean.price}" /> --%>
							<form:input id="price" path="price" value="${productBean.price}" style="width:50px; border-style:none;text-align: center;"  readonly="true"/>
							</td>
							<td data-th="Quantity">
								<input type="number" id="number" name="number" class="form-control text-center" value="1" min="1">
							</td> 
							<td data-th="Product" style="text-align: center;">
							<select id="sugar" name="sugar" >
							<option value="無糖">無糖</option>
							<option value="微糖">微糖</option>
							<option value="少糖">少糖</option>
							<option value="半糖">半糖</option>
							<option value="正常">正常</option>
							</select>							
							</td>
							
							<td data-th="Product" style="text-align: center;">
							<select id="coldhot" name="coldhot">
							<option value="冷">冷</option>
							<option value="熱">熱</option>
							</select>							
							</td>
							<td data-th="Subtotal" class="text-center"  >
<%-- 							<c:out value="${productBean.price}"/> --%>
<%-- 							<form:input path="price" style="width:100px" readonly="true"/> --%>
								<input name="totalprice" id="totalprice" style="width:100px;text-align: center;border-style:none;" readonly="true"/>
							</td>
							
							<td class="actions" data-th="">
<!-- 								<button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button> -->
<%-- 								<a onclick="return confirm('確定要刪除嗎?')"  href="${contextRoot}/shopcar/before/deleteproduct?id=${productBean.productId}"> --%>
								<button id="delete" class="btn btn-danger btn-sm" onclick="return confirm('確定要刪除嗎?')"><i class="fa fa-trash-o"></i></button>
<!-- 								</a>								 -->
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td><a href="#" class="btn btn-warning" onclick="history.back()">
							<i class="fa fa-angle-left"></i> 
							&thinsp;回上一頁</a></td>
							<td></td>
							<td></td>
							<td colspan="2" class="hidden-xs"></td>
							
<!-- 							備註:折扣碼後的價格 -->
							<td colspan="2">
							<input type="submit" name="submit" value="加入購物車 >" class="btn btn-success btn-block">
<!-- 							<a href="#" class="btn btn-success btn-block"> -->
<!-- 							<i class="fa fa-angle-right"></i> -->
<!-- 							</a> -->
							</td>
						</tr>
					</tfoot>
				</table>
				</form:form>
</div>
</body>
<script type="text/javascript">


$(function(){
	
// 	var number = $('#number').val();
// 	$('#number').form-control(function(){				
//         var price = $('#price').val();      
//         var number = $('#number').val();
//         var totalprice = price*number;

// //         $('#totalprice').html(totalprice);  
//         $('#totalprice').attr('value',totalprice);
//     })


	$(document).ready(function(){
		var price = $('#price').val();      
        var number = $('#number').val();
        var totalprice = price*number;

        $('#totalprice').attr('value',totalprice);
		
	})	
	
	$('#tbody').mouseover(function(){
		$('#totalprice').css("background-color","rgb(218, 218, 218)");
		$('#price').css("background-color","rgb(218, 218, 218)");
		$('#productname').css("background-color","rgb(218, 218, 218)");
	})

	
	$('#tbody').mouseout(function(){
		$('#totalprice').css("background-color","white");
		$('#price').css("background-color","white");
		$('#productname').css("background-color","white");
	})
	
	$('#number').click(function(){				
        var price = $('#price').val();      
        var number = $('#number').val();
        var totalprice = price*number;

//         $('#totalprice').html(totalprice);  
        $('#totalprice').attr('value',totalprice);
    })
    
    $('#number').keyup(function(){				
        var price = $('#price').val();      
        var number = $('#number').val();
        var totalprice = price*number;

        $('#totalprice').attr('value',totalprice);       	
    })
    
    $('#delete').click(function(){				


        $('#cart').remove();    
        $(window).attr('location','${contextRoot}/front/');
    })
	
})
</script>

<script src="<c:url value="/js/lib/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/lib/jquery.min.js"/>"></script>

<jsp:include page="layout/footer.jsp"></jsp:include>