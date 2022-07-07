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

<br/><br/>

<h1 style="text-align:center">店家評論區</h1>


<div class="container">


<div class="row justify-content-center">
<!-- <div class="col-9"> -->
<!--    <span style="font-size: 1.5em">評論</span> -->
<form method="get" action="${contextRoot}/front/comment/storenamelike">
<br/><br/>

<a href="${contextRoot}/front/comment/firmcomment" ><button type="button" class="btn btn-outline-primary">回評論區</button></a>
<div style="text-align:right">


<c:forEach var="commentStore" items="${commentStore}">

	<input name="commentfirmid" value="${commentStore.firmBean.firmId}" style="display: none">

</c:forEach>
<input type="text" id="commentstorename" name="commentstorename"/>&nbsp;<button type="submit" class="btn btn-outline-success">搜尋</button>
 </div>
 
</form>
  <br/>
  <div class="dropdown" style="text-align:right">
  <button class="btn btn-black dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
    排序
  </button>
  <br/>
  <c:forEach var="commentStore" items="${commentStore}">
  
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
    <li><a class="dropdown-item" href="${contextRoot}/front/comment/storecomment?commentfirmid=${commentStore.firmBean.firmId}">全部</a></li>
    <li><a class="dropdown-item" href="${contextRoot}/front/comment/avgscoredesc?commentfirmid=${commentStore.firmBean.firmId}">評分最高</a></li>
    <li><a class="dropdown-item" href="${contextRoot}/front/comment/avgscoreasc?commentfirmid=${commentStore.firmBean.firmId}">評分最低</a></li>
  </ul>
  
  </c:forEach>
</div>

<!--   </div> -->
  <br/>
  			<div class="row row-cols-3 row-cols-md-4 g-5">
  				<c:forEach var="storecomment" items="${listcsdto}" >
  			
				<div class="col">
					<div class="card h-100" style="border: 3px solid yellow;  width: 300px ; height: 300px ; background-color:	#FFF8D7">
  						<div class="card-body">
<%-- 						    <h2 style="text-align:center"><c:out value="${storecomment.firmName}"></c:out></h2> --%>
							<img class="card-img-top" src="http://localhost:8081/drinkmaster/front/firm/${storecomment.firmId}/photo" style="width: 80px; height: 80px ;display:block; margin:auto; border-radius: 150px"/>
						    <input name="commentfirmid" value="${storecomment.firmId}" style="display: none">
						    <h5 style="text-align:center"><c:out value="${storecomment.storeName}"></c:out></h5>
						    <input value="${storecomment.storeId}" style="display: none">
<!-- 						    <h3 class="card-subtitle mb-2 text-muted">-------------------</h3> -->
						  	<h2 style="text-align:center"><c:out value="${storecomment.avgScore}"></c:out>&nbsp;(<c:out value="${storecomment.countScore}"></c:out>)</h2>
						  	<input id="newavg${storecomment.storeId}" value="" style="display: none"/>
						    
						    <c:choose>
						    <c:when test="${storecomment.avgScore == null}">
						    <h6 style="text-align:center">目前沒有評論~</h6>
						    </c:when>
						    <c:otherwise>
						    <br/>
						    </c:otherwise>
						    </c:choose>
						    
						    <div style="pointer-events:none ;text-align:center" id="scores${storecomment.storeId}" class="awesomeRating"></div>
							<div class="awesomeRatingValue" style="display:none"></div>
								<script type="text/javascript">
								
								$(function(){
									
									var avg = Math.trunc(${storecomment.avgScore})
									var avgscore = avg+".0"
									if(avgscore != "NaN.0"){
									$("#newavg${storecomment.storeId}").attr("value",avgscore);
									}			
									newavg = $("#newavg${storecomment.storeId}").val();
// 									alert(newavg);
								
								
									
								
								$("#scores${storecomment.storeId}").awesomeRating({
									
									
									valueInitial: newavg,
									values: ["1.0", "2.0", "3.0", "4.0", "5.0"],
									targetSelector: "div.awesomeRatingValue"
								});
								
							
								});
								
								</script>
						    <div style="text-align:center">
						    <a href="${contextRoot}/front/comment/all?storeid=${storecomment.storeId}" class="card-link"><button type="button" class="btn btn-outline-primary">去評分</button></a>
						    <a href="${contextRoot}/front/productmenu?id=${storecomment.storeId}" class="card-link"><button type="button" class="btn btn-outline-success">去購買</button></a>
							</div>
						</div>
					</div>
				</div>
  				
  				</c:forEach>
  				</div>
  			

	
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