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

<h2 class="mb-4" style="text-align: center; " >確認資料</h2>

<div class="row justify-content-center">

<div id="div">

<form action="${contextRoot}/front/shopcar/confirmOrder" method="post">
<p style="margin:0 auto; width:  250px"> 
<input type="hidden" value="${canSeeUser.userId}" name="userId">
姓名:&thinsp;<input type="text" value="${canSeeUser.userName}" readonly="readonly"><br><br><br>
電話:&thinsp;<input type="text" name="shopcarphone" id="shopcarphone" value="${canSeeUser.phone}"><br>
<span id="result1" style="color: red; font-size: 16px;padding-left: 50px;"></span><br><br>

地址:&thinsp;<input type="text" value="${canSeeUser.userAddress}" name="shopcaraddress" id="shopcaraddress"><br>
<span id="result2" style="color: red; font-size: 16px;padding-left: 50px;"></span><br><br>


<c:forEach varStatus="vs" var="shopcarItems" items="${shopcarBuy}">
<input type="hidden" value="${shopcarItems.value.storeId}" name="storeId">
<input type="hidden" value="${shopcarItems.value.storeName}" name="storeName">
<input type="hidden" value="${shopcarItems.value.productId}" name="productId">

<input type="hidden" value="${shopcarItems.value.productName}" name="shopcarname">
<input type="hidden" value="${shopcarItems.value.price}" name="shopcarprice">
<input type="hidden" value="${shopcarItems.value.quantity}" name="shopcarquantity">
<input type="hidden" value="${shopcarItems.value.sweet}" name="shopcarsweet">
<input type="hidden" value="${shopcarItems.value.coldhot}" name="shopcarcoldhot">
<input type="hidden" value="${shopcarItems.value.totalPrice}" name="shopcartotalPrice">
</c:forEach>
<div style="text-align: center;">
<button type="submit" id="aftersubmit"  >送出訂單</button> 
</div>
</p>
</form>


</div>
</div>
</div>






<br>



</div>
</body>

<script type="text/javascript">
$(function(){
	var a=false;
    var b=false;
	$("#shopcarphone").blur(function(){
        if($(this).val().length == 0) {
            $("#result1").html("電話不為空");
            a=false;
        }
            else{
                $("#result1").html("");
                a=true;
            }
        })
    })	
	$("#shopcaraddress").blur(function(){
        if($(this).val().length == 0) {
            $("#result2").html("地址不為空");
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





</script>

<script src="<c:url value="/js/lib/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/lib/jquery.min.js"/>"></script>

<jsp:include page="layout/footer.jsp"></jsp:include>