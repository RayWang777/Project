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

	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:150px;text-align: center;" colspan="2">商品</th>
<!-- 							<th style="width:80px;text-align: center;"></th> -->
							<th style="width:30px;text-align: center;">單價</th>
							<th style="width:100px;text-align: center;">數量</th>
							<th style="width:30px;text-align: center;">甜度</th>
							<th style="width:30px;text-align: center;">冷熱</th>
							<th style="width:80px;text-align: center;" class="text-center">總金額</th>
							<th style="width:20px"></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach varStatus="vs" var="shopcarItems" items="">
						<tr>
							<td data-th="Product">
									<div class="col-sm-2 hidden-xs">
									<img src="" style="width: 300px;text-align: center;" /></div>
									<div class="col-sm-10">
									
										
									</div>
							</td>
							<td style="font-size: 18px;">
								
							珍奶
<%-- 							<c:out value="${productBean.productName}"/> --%>
							</td>
							
							<td data-th="Price" >
							
							70
<%-- 							<c:out value="${productBean.price}"/> --%>
							</td>
							<td data-th="Quantity">
								<input type="number" id="number" name="number" class="form-control text-center" value="1" min="1">
							</td> 
							<td data-th="Product" style="text-align: center;">
							<select id="sugar">
							<option value="無糖">無糖</option>
							<option value="微糖">微糖</option>
							<option value="少糖">少糖</option>
							<option value="半糖">半糖</option>
							<option value="正常">正常</option>
							</select>							
							</td>
							<td data-th="Product" style="text-align: center;">
							<select id="coldhot">
							<option value="冷">冷</option>
							<option value="熱">熱</option>
							</select>							
							</td>
							<td data-th="Subtotal" class="text-center" id="totalprice" style="text-align: center;">
								70
<%-- 							<c:out value="${productBean.price}"/> --%>
<%-- 							<form:input path="price" style="width:100px" readonly="true"/> --%>
							</td>
							<td class="actions" data-th="">

								<button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>								
							</td>
						</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr class="visible-xs">
<!-- 						備註:折扣碼前的價格 -->
							<td class="text-center"><strong>Total 70</strong></td>
						</tr>
						<tr>
							<td><a href="#" class="btn btn-warning">
							<i class="fa fa-angle-left"></i> 
							&thinsp;繼續購買</a></td>
							<td colspan="2">折扣碼:&thinsp;<input type="text" ></td>
							<td  class="hidden-xs"></td>
							
<!-- 							備註:折扣碼後的價格 -->
							<td class="hidden-xs text-center"><span style="color:red;font-weight: bold;">折扣後&ensp;</span><strong>Total $60</strong></td>
							<td colspan="2"><a href="#" class="btn btn-success btn-block">確認訂單&thinsp;<i class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
				</table>
</div>
</body>

<script src="<c:url value="/js/lib/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/lib/jquery.min.js"/>"></script>

<jsp:include page="layout/footer.jsp"></jsp:include>