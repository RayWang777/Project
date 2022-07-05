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


/*                背景滿版     */
                    html { 
            			height: 100%; 
     					} 
                    body {
                        background-image: url("<c:url value="/images/cold_drink_juice_promotion_image.jpg"/>");
                        background-repeat: no-repeat;
                        background-attachment:fixed;
                        background-position: 50% 40%;
                        background-size: 100% 120%;
                    }
/*                背景滿版    */

                    .swiper-container {
                        width: 830px;
                        height: 370px;
                    }
                </style>


<meta charset="UTF-8">
<title>評論區</title>
</head>
<body>
<br>
<br>
<br>
<h1 style="text-align:center">評論區</h1>


<div class="container">


<div class="row justify-content-center">
<div class="col-9">
<!--    <span style="font-size: 1.5em">評論</span> -->
  </div>
  					
  			<div class="row row-cols-3 row-cols-md-5 g-5 ">
  				<c:forEach var="firmcomment" items="${firm}" >
  			
				<div class="col">
					<div class="card h-100" style="margin: auto;width:200px;background-color:transparent; border: 0">
  						<div class="card-body" style="cursor: pointer;" onclick="window.location.href='${contextRoot}/front/comment/storecomment?commentfirmid=${firmcomment.firmId}'">
  							<img class="card-img-top" src="http://localhost:8081/drinkmaster/front/firm/${firmcomment.firmId}/photo" style="width: 150px; height: 150px ;display:block; margin:auto; border-radius: 150px"/><br/>
						    <div style="text-align: center; font-size:large; " >${firmcomment.firmName}</div>
						    <input value="${firmcomment.firmId}" style="display: none">
<!-- 						    <h3 class="card-subtitle mb-2 text-muted">-------------------</h3> -->
						    
						    
						    
<%-- 						    <a href="${contextRoot}/front/comment/all?storeid=${firmcomment.storeId}" class="card-link"><button type="button" class="btn btn-outline-primary">去評分</button></a> --%>
<%-- 						    <a href="${contextRoot}/front/productmenu?id=${firmcomment.storeId}" class="card-link"><button type="button" class="btn btn-outline-success">去購買</button></a> --%>
						</div>
					</div>
				</div>
  				
  				</c:forEach>
  				</div>
  			
  
	
  </div>
</div>
<br><br><br>

<script type="text/javascript">
	
	$(function(){
		
	});

</script>

<br/><br/><br/>

<jsp:include page="layout/footer.jsp" />



</body>
</html>