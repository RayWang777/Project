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
<div class="container" id="container">
<form:form class="form" method="post" action="${contextRoot}/front/editproduct" modelAttribute="productBean">
<form:hidden path="productId"/>
	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:150px">商品</th>
							<th style="width:80px"></th>
							<th style="width:30px">單價</th>
							<th style="width:100px">數量</th>
							<th style="width:30px">甜度</th>
							<th style="width:30px">冷熱</th>
							<th style="width:70px" class="text-center">總金額</th>
							<th style="width:20px"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs"><img
						src="${productBean.productImage}" style="width: 150px" /></div>
									<div class="col-sm-10">
										
										
									</div>
								</div>
							</td>
							<td style="font-size: 18px;">
							<c:out value="${productBean.productName}"/>
<%-- 							<form:input path="productName"  readonly="true"/> --%>
							</td>
							
							<td data-th="Price" >
<%-- 							<c:out value="${productBean.price}"/> --%>
							<form:input id="price" path="price" value="${productBean.price}" style="width:50px"  readonly="true"/>
							</td>
							<td data-th="Quantity">
								<input type="number" id="number" name="number" class="form-control text-center" value="1" min="1">
							</td> 
							<td data-th="Product">
							<select id="sugar">
							<option value="無糖">無糖</option>
							<option value="微糖">微糖</option>
							<option value="少糖">少糖</option>
							<option value="半糖">半糖</option>
							<option value="正常">正常</option>
							</select>							
							</td>
							
							<td data-th="Product">
							<select id="coldhot">
							<option value="冷">冷</option>
							<option value="熱">熱</option>
							</select>							
							</td>
							<td data-th="Subtotal" class="text-center" id="totalprice">
							<c:out value="${productBean.price}"/>
<%-- 							<form:input path="price" style="width:100px" readonly="true"/> --%>
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
							<input type="submit" name="submit" value="加到購物車 >" class="btn btn-success btn-block">
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
	

	
	$('#number').click(function(){				
        var price = $('#price').val();      
        var number = $('#number').val();
        var totalprice = price*number;

        $('#totalprice').html(totalprice);       	
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