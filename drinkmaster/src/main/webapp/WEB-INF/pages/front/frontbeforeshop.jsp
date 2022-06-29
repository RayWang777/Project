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
<form:form class="form" method="post" action="${contextRoot}/front/editproduct" modelAttribute="productBean">
<form:hidden path="productId"/>
	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:50px">商品</th>
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
									<div class="col-sm-2 hidden-xs"><img style="width: 150px;" src="<c:url value="/images/珍奶.jpg"/>" alt="..." class="img-responsive"/></div>
									<div class="col-sm-10">
										
										
									</div>
								</div>
							</td>
							<td style="font-size: 18px;"><form:input path="productName" /></td>
							
							<td data-th="Price"><form:input path="price" style="width:50px"/></td>
							<td data-th="Quantity">
								<input type="number" class="form-control text-center" value="1">
							</td>
							<td data-th="Product">
							<select id="sugar">
							<option>無糖</option>
							<option>微糖</option>
							<option>少糖</option>
							<option>半糖</option>
							<option>正常</option>
							</select>							
							</td>
							
							<td data-th="Product">
							<select id="coldhot">
							<option>冷</option>
							<option>熱</option>
							</select>							
							</td>
							<td data-th="Subtotal" class="text-center"><form:input path="price" style="width:100px" /></td>
							<td class="actions" data-th="">
<!-- 								<button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button> -->
<%-- 								<a onclick="return confirm('確定要刪除嗎?')"  href="${contextRoot}/shopcar/before/deleteproduct?id=${productBean.productId}"> --%>
								<button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>
<!-- 								</a>								 -->
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr class="visible-xs">
<!-- 						備註:折扣碼前的價格 -->
							<td class="text-center"><strong>Total <form:input path="price" style="width:100px" /></strong></td>
						</tr>
						<tr>
							<td><a href="#" class="btn btn-warning">
							<i class="fa fa-angle-left"></i> 
							&thinsp;回上一頁</a></td>
							<td></td>
							<td></td>
							<td colspan="2" class="hidden-xs"></td>
							
<!-- 							備註:折扣碼後的價格 -->
							<td class="hidden-xs text-center"><strong>Total $<form:input path="price" style="width:100px" /></strong></td>
							<td colspan="2"><a href="#" class="btn btn-success btn-block">加到購物車&thinsp;<i class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
				</table>
				</form:form>
</div>
</body>
<script type="text/javascript">
$(function(){
	
	
})
</script>

<script src="<c:url value="/js/lib/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/lib/jquery.min.js"/>"></script>

<jsp:include page="layout/footer.jsp"></jsp:include>