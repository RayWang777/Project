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

<h1 style="text-align:center">訂單詳情</h1>


<div class="container">


<br/>

<br/>


<table class="table table-hover"
		style="width: 100%; table-layout: fixed;">
		<thead>
			<tr>
				<th scope="col" style="text-align: center;"></th>
				<th scope="col" style="text-align: center;">商品名稱</th>
				<th scope="col" style="text-align: center;">數量</th>
				<th scope="col" style="text-align: center">甜度</th>
				<th scope="col" style="text-align: center;">溫度</th>
				<th scope="col" style="text-align: center;">金額</th>
				
			</tr>
		</thead>
		<tbody>

			<c:forEach  var="orderItems" items="${page.content}" >
				<tr scope="row">
				<td class="align-middle" style="text-align: center;">
				</td>
					<td class="align-middle" style="text-align: center;">
						<c:out value="${orderItems.productBean.productName}"></c:out>
					</td>
					<td class="align-middle" style="text-align: center;">
					<c:out value="${orderItems.quantity}"></c:out>
					</td>
					

					<td class="align-middle" style="text-align: center;"><c:out value="${orderItems.sweet}"></c:out></td>
					<c:choose>
      				<c:when test="${orderItems.coldhot=='冷'}">
      				<td class="align-middle" style="color: blue;font-weight: bold;text-align: center;">
      				<c:out value="冷"/></td>
      				</c:when>
      				<c:when test="${orderItems.coldhot=='熱'}">
      				<td class="align-middle" style="color: red;font-weight: bold;text-align: center;">
     				<c:out value="熱"/></td>
      				</c:when>
      				</c:choose>
					
					
					<td class="align-middle" style="text-align: center;"><c:out value="${orderItems.price}"></c:out></td>
      				<td class="align-middle" style="text-align: center;">
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<br>
<input type ="button" onclick="history.back()" value="回到上一頁"></input><br>
</div>
<br>

<div class="row justify-content-center" style="font-size: x-large;">
  <c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
   <c:choose>
   <c:when test="${page.number!=pageNumber-1}">
   <a href="${contextRoot}/backend/orderItems/findAll?s=${pageNumber}"> <c:out value="${pageNumber}" /> </a>
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


<jsp:include page="layout/footer.jsp" />


</body>
</html>