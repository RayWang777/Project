<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/header.jsp"></jsp:include>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

<title>店家菜單</title>

<style type="text/css" >

.aclass{
text-decoration: none;
color: black;


}
        
.liclass{
    list-style-type:none;
    font-family: monospace;
    font-size: x-large;
}

</style>
 
</head>
<body style="background-color: #F2FCFF;">

	<header class="py-2"> 
    <div class="swiper mySwiper" style=" background-color: #F1F7F6; margin-left: 100px; margin-right: 200px ; border-radius: 20px 20px 20px 20px; width: 90% ;height: 350px">
     				
      
       
                  <div   style=" float: left; width: 330px; height:350px   ">
                  <img alt="" src="<c:url value="/backend/firm/${store.firmBean.firmId}/photo"/>" style="width: 150px;height: 150px; margin-left: 100px; border-radius: 100px">
                  <div style="font-size: x-large; width: 400px; height: 200px; margin-top: 10px  ">
                  <ul ><li class="liclass" style="font-family:sans-serif;list-style-type:none; "> <b>店家名稱:</b>  <c:out value="${store.firmBean.firmName}"></c:out> <c:out value="${store.storeName}"></c:out> </li>
                  <li class="liclass">電話:&nbsp; <a class="aclass"  href="<c:out value='tel:${store.storePhone }'/>"><c:out value="${store.storePhone }"></c:out></a> </li>
                 <li class="liclass">地址:&nbsp;<a class="aclass" href='<c:url value="https://www.google.com/maps/place/${store.storeAddress}/@${store.latitude},${store.longitude},17z/"/>' target="_blank">${store.storeAddress}</a></li>
                 <li class="liclass">評分:<i class="fa-solid fa-star" style="color: #FCFF9C"></i></li>
                 <li class="liclass">營業時間:&nbsp;<c:out value="${store.openTime}"></c:out></li>
                  </ul>
                  
                  </div>
                  </div>
                  <div style="">
						<a href="http://localhost:8081/drinkmaster/front/firm/${store.firmBean.firmId}"><img style="float: right;" alt="" src="<c:url value="/backend/firm/banner/${store.firmBean.firmId}"/>" width="800px" height="370px"/></a>
				
        </div>
     
    
      
<!--       <div class="swiper-scrollbar"></div> -->
    </div>
                    
</header>

	<section class="py-2">
		<div class="container px-4 px-lg-0 mt-5">
			<div
				class="row gx-4 gx-lg-10 row-cols-1 row-cols-md-1 row-cols-xl-3 j">	
				<c:forEach var="categoryBean" items="${category}">
					<div class="col mb-5">
						<div class="card h-100"
							style="border: #ECECEC; padding: 10px; background-color: #F2FCFF;">
							<div>
								<h3 class="fw-bolder" style="color: #3C6FA1;">
									<c:out value="${categoryBean.productCategoryName }"></c:out>
								</h3>
							</div>
							<c:forEach var="productBean" items="${categoryBean.products}">
								<div
									style="font-size: large; border-bottom: 2px inset #C0C0C0; height: 52px;"
									class="align-middle">


									<a
										href="${contextRoot}/front/shopcar/before/editproduct?id=${productBean.productId}&sid=${store.storeId}"
										style="color: black; text-decoration: none;"> <c:if test="${productBean.productImage!=null}">

											<img src="${productBean.productImage}" style="width: 60px"
												height="50px" />
										</c:if>&nbsp;&nbsp; <b><c:out value="${productBean.productName}"></c:out></b>
										&nbsp;&nbsp; <c:if test="${productBean.status=='false' }">
											<i class="fa-solid fa-ban"
												style="color: red; font-size: xx-small;"></i>
										</c:if> <c:if
											test="${productBean.coldHot=='熱' || productBean.coldHot=='冷熱'}">
											<span
												style="position: absolute; right: 70px; margin-top: 10px; color: #FF4D00">
												<i class="fa-brands fa-hotjar" style="color: #FF4D00;"></i>
												<c:out value="${productBean.price}" />
											</span>
										</c:if> <c:if
											test="${productBean.coldHot=='冷' || productBean.coldHot=='冷熱'}">
											<span
												style="position: absolute; right: 10px; margin-top: 10px; color: #2894FF"><i
												class="fa-regular fa-snowflake" style="color: #2894FF"></i>
												<c:out value="${productBean.price}"></c:out></span>
										</c:if>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
				
			</div>
		</div>
	</section>
	<br>
	<br>
	<br>
	<br>
</body>
<jsp:include page="layout/footer.jsp"></jsp:include>