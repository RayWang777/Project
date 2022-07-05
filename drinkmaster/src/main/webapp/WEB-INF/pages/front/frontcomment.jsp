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

#dropdownMenuButton2{
	background-color: white;
	border: 1px solid gray;
	float:right;
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

<br/><br/><br/><br/>

<h1 style="text-align:center">評論區</h1>


<div class="container">


<div class="row justify-content-center">
<!-- <div class="col-9"> -->
<!--    <span style="font-size: 1.5em">評論</span> -->
<form method="get" action="${contextRoot}/front/comment/storenamelike">
<br/><br/>
<div style="text-align:right">

<%-- <a href="${contextRoot}/front/comment/storecomment?commentfirmid=${commentStore.firmId}"><button class="btn btn-outline-success">全部</button></a> --%>

<input type="text" id="commentstorename" name="commentstorename"/><button type="submit" class="btn btn-outline-success">搜尋</button>
 </div>
  <br/>
  <div class="dropdown" style="text-align:right">
  <button class="btn btn-black dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
    排序
  </button>
  <br/><br/><br/><br/>
<%--   <c:forEach var="store" items="${arrayList}"> --%>
  
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
    <li><a class="dropdown-item" href="">全部</a></li>
    <li><a class="dropdown-item" href="" >評分最高</a></li>
    <li><a class="dropdown-item" href="">評分最低</a></li>
  </ul>
  
<%--   </c:forEach> --%>
</div>

<!--   </div> -->
  
  			<div class="row row-cols-3 row-cols-md-3 g-4 ">
  				<c:forEach var="storecomment" items="${listcsdto}" >
  			
				<div class="col">
					<div class="card h-100 border-warning">
  						<div class="card-body">
						    廠商 : <c:out value="${storecomment.firmName}"></c:out><br/>
						    <input name="commentfirmid" value="${storecomment.firmId}" style="display: none">
						    店家 : <c:out value="${storecomment.storeName}"></c:out>
						    <input value="${storecomment.storeId}" style="display: none">
						    <h3 class="card-subtitle mb-2 text-muted">-------------------</h3>
						    
						    總平均 : <c:out value="${storecomment.avgScore}"></c:out>
						    <c:if test="${storecomment.avgScore == null}">
						    	目前沒有評論~
						    </c:if>
						    
						    <div style="pointer-events:none" id="scores${storecomment.storeId}" class="awesomeRating"></div>
							<div class="awesomeRatingValue" style="display:none"></div>
								<script type="text/javascript">
								
								
								
							
								$("#scores${storecomment.storeId}").awesomeRating({
									
									valueInitial: "${storecomment.avgScore}",
									values: ["1.0", "2.0", "3.0", "4.0", "5.0"],
									targetSelector: "div.awesomeRatingValue"
								});
							
								console.log(${usercomment.score});
								
								</script>
						    <br/>
						    
						    <a href="${contextRoot}/front/comment/all?storeid=${storecomment.storeId}" class="card-link"><button type="button" class="btn btn-outline-primary">去評分</button></a>
						    <a href="${contextRoot}/front/productmenu?id=${storecomment.storeId}" class="card-link"><button type="button" class="btn btn-outline-success">去購買</button></a>
						</div>
					</div>
				</div>
  				
  				</c:forEach>
  				</div>
  			
  </form>
	
  </div>
</div>

<script type="text/javascript">
	
	$(function(){
		
	});

</script>

<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

<jsp:include page="layout/footer.jsp" />



</body>
</html>