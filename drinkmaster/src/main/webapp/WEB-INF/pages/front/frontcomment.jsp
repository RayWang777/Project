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

<style>

div.awesomeRating {
	font-size: 2em;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1 style="text-align:center">評論區</h1>


<div class="container">


<div class="row justify-content-center">
<div class="col-9">
<!--    <span style="font-size: 1.5em">評論</span> -->
  </div>
  
  			<div class="row row-cols-3 row-cols-md-3 g-4">
  				<c:forEach var="storecomment" items="${commentStore}" >
  			
  				
				<div class="col">
					<div class="card h-100">
  						<div class="card-body">
						    <c:out value="${storecomment.storeName}"></c:out>
						    <input value="${storecomment.storeId}" style="display: none">
						    <h6 class="card-subtitle mb-2 text-muted">-------------------</h6>
						    <a href="${contextRoot}/front/comment/all?storeid=${storecomment.storeId}" class="card-link">去評分</a>
						    <a href="#" class="card-link">去購買</a>
						</div>
					</div>
				</div>
  				
  		
  				</c:forEach>
  			
  			</div>
  
	
  </div>
</div>


<jsp:include page="layout/footer.jsp" />



</body>
</html>