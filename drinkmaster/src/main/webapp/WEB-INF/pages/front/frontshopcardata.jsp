<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/header.jsp"></jsp:include>


<head>
<meta charset="utf-8" />
<title>輸入資料</title>
<link rel="stylesheet" href="<c:url value="/css/lib/bootstrap.min.css"/>"/>
<link rel="stylesheet" href="<c:url value="/css/lib/font-awesome.min.css"/>"/>

<style type="text/css">
/* .table>tbody>tr>td, .table>tfoot>tr>td{ */
/*     vertical-align: middle; */
/* } */
/* @media screen and (max-width: 600px) { */
/*     table#cart tbody td .form-control{ */
/* 		width:20%; */
/* 		display: inline !important; */
/* 	} */
/* 	.actions .btn{ */
/* 		width:36%; */
/* 		margin:1.5em 0; */
/* 	} */
	
/* 	.actions .btn-info{ */
/* 		float:left; */
/* 	} */
/* 	.actions .btn-danger{ */
/* 		float:right; */
/* 	} */
	
/* 	table#cart thead { display: none; } */
/* 	table#cart tbody td { display: block; padding: .6rem; min-width:320px;} */
/* 	table#cart tbody tr td:first-child { background: #333; color: #fff; } */
/* 	table#cart tbody td:before { */
/* 		content: attr(data-th); font-weight: bold; */
/* 		display: inline-block; width: 8rem; */
/* 	} */
	
	
	
/* 	table#cart tfoot td{display:block; } */
/* 	table#cart tfoot td .btn{display:block;} */
	
/* } */

</style>
</head>




<body>
<div class="container">

<div class="row justify-content-center">
</div>

<div class="container">

<h2 class="mb-4" style="text-align: center; margin-top: 20px" >確認資料</h2>

<div class="row justify-content-center">

<div >
<form action="${contextRoot}/front/shopcar/confirmOrder" method="post">
<p style="text-align: center;"> 

姓名:&thinsp;<input type="text" value="${canSeeUser.userName}" ><br><br>
電話:&thinsp;<input type="text" name="shopcarphone"><br><br>
地址:&thinsp;<input type="text" value="${canSeeUser.userAddress}" name="shopcaraddress"><br><br>
<input type="hidden" value="${shopcarBuy.productName}" name="shopcarname">
<input type="hidden" value="${shopcarBuy.price}" name="shopcarprice">
<input type="hidden" value="${shopcarBuy.quantity}" name="shopcarquantity">
<input type="hidden" value="${shopcarBuy.sweet}" name="shopcarsweet">
<input type="hidden" value="${shopcarBuy.coldhot}" name="shopcarcoldhot">
<input type="hidden" value="${shopcarBuy.totalPrice}" name="shopcartotalPrice">
<button type="submit">送出</button> 

</p>
</form>
</div>
</div>
</div>






<br>



</div>
</body>

<script type="text/javascript">

</script>

<script src="<c:url value="/js/lib/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/lib/jquery.min.js"/>"></script>

<jsp:include page="layout/footer.jsp"></jsp:include>