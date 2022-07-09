<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>

<link href="${contextRoot}/css/lib/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<link href="${contextRoot}/css/lib/awesomeRating.min.css" rel="stylesheet" type="text/css" media="all">
<link href="${contextRoot}/font/fontawesome-webfont.ttf" rel="stylesheet" type="text/css" media="all">
<link href="${contextRoot}/font/fontawesome-webfont.woff" rel="stylesheet" type="text/css" media="all">
<link href="${contextRoot}/font/fontawesome-webfont.woff2" rel="stylesheet" type="text/css" media="all">

<script src="${contextRoot}/js/lib/awesomeRating.min.js"></script>
<script src="${contextRoot}/js/lib/average-rating.min.js" type="text/javascript"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">


<style type="text/css">

#dropdownMenuButton1{
	background-color: white;
	border: 1px solid gray;
	float:right;
}

</style>

<meta charset="UTF-8">
<title>歷史訂單</title>
</head>
<body>

<h1 style="text-align:center">歷史訂單</h1>


<div class="container">


<br/>
<%-- <c:out value="有 ${page.totalElements } 筆資料"></c:out> --%>
<br/>
<div style="text-align: center;color: gray;">
<c:out value="查到 ${page.totalElements } 筆資料"></c:out>
</div><br>
<table class="table table-hover"
		style="width: 100%; table-layout: fixed;">
		<thead>
			<tr>
				<th style="width: 10px;">

				</th>
				<th scope="col" style="text-align: center;">店名</th>
				<th scope="col" style="width: 150px;text-align: center;">訂購時間</th>
				<th scope="col" style="width: 180px ; text-align:center">地址</th>
				<th scope="col" style="text-align: center;">電話</th>
				<th scope="col" style="text-align: center;">狀態</th>
				<th scope="col" style="text-align: center;">總金額</th>
				<th scope="col" style="text-align: center;">詳細</th>
				<th scope="col" style="text-align: center;">取消訂單</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach  var="order" items="${page.content}" >
				<tr scope="row">
					<td class="align-middle">
						<input type="hidden" value="<c:out value="${order.orderId}" />">
						<input type="hidden" value="<c:out value="${canSeeUser.userId}"/>" name="orderuserid">
<%-- 						<input type="hidden" vaule="${order.orderId}" name="id"> --%>
						</td>
					<td class="align-middle" style="text-align: center;">
					<c:out value="${order.storeBean.storeName}"></c:out>
					</td>
					<td class="align-middle" style="text-align: center;"><fmt:formatDate  value="${order.createTime}" pattern="yyyy-MM-dd HH:mm"/>
					</td>
					

					<td class="align-middle" style="text-align: center;"><c:out value="${order.orderAddress}"></c:out></td>
					<td class="align-middle" style="text-align: center;"><c:out value="${order.orderPhone}"></c:out></td>
					<c:choose>
					<c:when test="${order.orderStatus=='已出貨'}">
					<td class="align-middle" style="color: green;font-weight: bold;text-align: center;">
					<c:out value="已出貨" /></td>
					</c:when>
					<c:when test="${order.orderStatus=='已取消'}">
					<td class="align-middle" style="color: blue;font-weight: bold;text-align: center;">
					<c:out value="已取消" /></td>
					</c:when>
					<c:when test="${order.orderStatus=='待付款'}">
					<td class="align-middle" style="color: orange;font-weight: bold;text-align: center;">
					<c:out value="待付款" /></td>
					</c:when>
					<c:when test="${order.orderStatus=='待出貨'}">
					<td class="align-middle" style="color: red;font-weight: bold;text-align: center;">
					<c:out value="待出貨" /></td>
					</c:when>
					</c:choose>
					
					
					
					
					<td class="align-middle" style="text-align: center;"><c:out value="${order.totalPrice}"></c:out></td>
					<td class="align-middle" style="text-align: center;">
      				<a href="${contextRoot}/front/orderItems/findId?id=${order.orderId}">
      				<i class="tiny material-icons" >collections</i>
      				</a>
      				</td>
      				<td class="align-middle" style="text-align: center;">
      				<c:choose>
      				<c:when test="${order.orderStatus=='待付款'}">
      				<a href="${contextRoot}/front/order/edit?id=${order.orderId}"><button class="btn btn-danger btn-sm">取消</button></a>

					</c:when>
					</c:choose>
					</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
<div>


</div>

</div>
<div style="font-size: x-large; text-align: center;">
  <c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
   <c:choose>
   <c:when test="${page.number!=pageNumber-1}">
<!--    <div style="text-align: center;"> -->
   <a href="${contextRoot}/front/order/userOrder?o=${pageNumber}"> <c:out value="${pageNumber}" /> 
   </a>
<!--    </div> -->
   </c:when>
   <c:otherwise>
   <c:out value="${pageNumber}"></c:out>
   </c:otherwise>
   </c:choose> 
   <c:if test="${pageNumber!= page.totalPages }">
    &thinsp;| &thinsp;
   </c:if>
   </c:forEach>
   </div>
<script type="text/javascript">
function del(event){
	  console.log(event.target.id)
var local = event.target.id;
	  
	 
Swal.fire({
title: '與店家確認過後，決定要取消嗎?',
icon: 'warning',
showCancelButton: true,
confirmButtonColor: '#dc3545',
cancelButtonColor: '#28a745',
confirmButtonText: '確認取消',
cancelButtonText: '&nbsp&nbsp返&nbsp&nbsp&nbsp&nbsp回&nbsp&nbsp',
reverseButtons: true

}).then((result) => {
if (result.isConfirmed) {
	  

	Swal.fire({
	  icon: 'success',
	  title: '訂單已取消',
	  showConfirmButton: false,
	  timer: 2000
	}).then( ()=>{
	console.log( local+'&userId=${canSeeUser.userId}' )	
		document.location.href='${contextRoot}/front/order/delete?id='+local+'&userId=${canSeeUser.userId}';
		
	})
}else if (result.isDenied) {
	    return false;
	  }
});
}	

</script>


<jsp:include page="layout/footer.jsp" />


</body>
</html>