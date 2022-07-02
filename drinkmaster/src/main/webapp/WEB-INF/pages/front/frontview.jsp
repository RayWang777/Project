<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
                <jsp:include page="layout/header.jsp"></jsp:include>

       
                <style>
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

        

 <body>
 <header class="py-2"> 
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-button-next" style="margin-right: 15%"></div>
      <div class="swiper-button-prev" style="margin-left: 15%"></div>
       <c:forEach items="${swiperPic}" var="one">
                  <div class="swiper-slide" style="text-align: center;">
						<a href="http://localhost:8081/drinkmaster/front/firm/${one}"><img alt="" src="<c:url value="/backend/firm/banner/${one}"/>" width="1000" height="370"/></a>
				</div>
        </c:forEach>
      </div>
    
      <div class="swiper-pagination"></div>
<!--       <div class="swiper-scrollbar"></div> -->
    </div>
                    
</header>

                    <!-- Section-->
                    <section class="">
                    
                    
                    <!-- TOP3 -->
                      <div class="container px-4 px-lg-5 mt-0">
                            <div  class="row gx-4 gx-lg-10 row-cols-1 row-cols-md-1 row-cols-xl-1 justify-content-center">
                        		 <img alt="" src="<c:url value="/images/top3/besttop3.png"/>" style="width: 1000px;height: 200px;" >
                        	</div>	 
                        	
                        	
                        	<div  class="row gx-4 gx-lg-10 row-cols-2 row-cols-md-3 row-cols-xl-3 justify-content-center">
                        	
                        	<!-- card one -->
                        		  <div class="col mb-5" >
                                    <div class="card h-70" style="width: 250px;margin: auto;">
                                        <!-- Sale badge-->
                                        <div class="badge text-white position-absolute"
                                            style="top: 0.5rem; right: 0.5rem"><img alt="" src="<c:url value="/images/top3/top2.png"/>" style="width: 50px;height: 50px;background-color: transparent;" ></div>
                                        <!-- Product image-->
                                        <img class="card-img-top" src="<c:url value="/backend/firm/${top3[1].firmBean.firmId}/photo"/>" alt="..." style="width: 250px;height: 250px;"/>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- firmName-->
                                                <h5 class="fw-bolder">${top3[1].firmBean.firmName}</h5>
                                                <!-- storeName-->
                                                ${top3[1].storeName}
                                            </div>
                                        </div>
	                                    </div>
    	                            </div>
                               <!-- card two --> 
                   					  <div class="col mb-5">
                                    <div class="card h-70" style="width: 250px;margin: auto;">
                                        <!-- Sale badge-->
                                        <div class="badge text-white position-absolute"
                                            style="top: 0.5rem; right: 0.5rem"><img alt="" src="<c:url value="/images/top3/top1.png"/>" style="width: 50px;height: 50px;background-color: transparent;" ></div>
                                        <!-- Product image-->
                                        <img class="card-img-top" src="<c:url value="/backend/firm/${top3[0].firmBean.firmId}/photo"/>" alt="..." style="width: 250px;height: 250px;"/>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- firmName-->
                                                <h5 class="fw-bolder">${top3[0].firmBean.firmName}</h5>
                                                <!-- storeName-->
                                                ${top3[0].storeName}
                                            </div>
                                        </div>
	                                    </div>
    	                            </div>
                        		 
                        		 
                        		<!-- card three -->
                        		  <div class="col mb-5">
                                    <div class="card h-70" style="width: 250px;margin: auto;">
                                        <!-- Sale badge-->
                                        <div class="badge text-white position-absolute"
                                            style="top: 0.5rem; right: 0.5rem"><img alt="" src="<c:url value="/images/top3/top3.png"/>" style="width: 50px;height: 50px;background-color: transparent;" ></div>
                                        <!-- Product image-->
                                        <img class="card-img-top" src="<c:url value="/backend/firm/${top3[2].firmBean.firmId}/photo"/>" alt="..." style="width: 250px;height: 250px;"/>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- firmName-->
                                                <h5 class="fw-bolder">${top3[2].firmBean.firmName}</h5>
                                                <!-- storeName-->
                                                ${top3[2].storeName}
                                            </div>
                                        </div>
	                                    </div>
    	                            </div>
                        		
                        		
                        		<!-- card end --> 
                        	</div>	 
	                    </div>
 					  <!-- TOP3 END-->    
                    
                    
                    <!-- 附近店家 -->
                        <div class="container px-4 px-lg-5 mt-0">
                            <div  class="row gx-4 gx-lg-10 row-cols-2 row-cols-md-3 row-cols-xl-3 justify-content-center">
                            
                            
                            
                                <div class="col mb-5">
                                    <div class="card h-100">
                                        <!-- Product image-->
                                        <img class="card-img-top" src="<c:url value="/images/top3/besttop3.png"/>"  alt="..." />
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">Fancy Product</h5>
                                                <!-- Product price-->
                                                $40.00 - $80.00
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto"
                                                    href="#">View options</a></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col mb-5">
                                    <div class="card h-100">
                                        <!-- Sale badge-->
                                        <div class="badge bg-dark text-white position-absolute"
                                            style="top: 0.5rem; right: 0.5rem">Sale</div>
                                        <!-- Product image-->
                                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                                            alt="..." />
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">Special Item</h5>
                                                <!-- Product reviews-->
                                                <div class="d-flex justify-content-center small text-warning mb-2">
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                </div>
                                                <!-- Product price-->
                                                <span class="text-muted text-decoration-line-through">$20.00</span>
                                                $18.00
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto"
                                                    href="#">Add to cart</a></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col mb-5">
                                    <div class="card h-100">
                                        <!-- Sale badge-->
                                        <div class="badge bg-dark text-white position-absolute"
                                            style="top: 0.5rem; right: 0.5rem">Sale</div>
                                        <!-- Product image-->
                                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                                            alt="..." />
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">Sale Item</h5>
                                                <!-- Product price-->
                                                <span class="text-muted text-decoration-line-through">$50.00</span>
                                                $25.00
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto"
                                                    href="#">Add to cart</a></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col mb-5">
                                    <div class="card h-100">
                                        <!-- Product image-->
                                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                                            alt="..." />
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">Popular Item</h5>
                                                <!-- Product reviews-->
                                                <div class="d-flex justify-content-center small text-warning mb-2">
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                </div>
                                                <!-- Product price-->
                                                $40.00
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto"
                                                    href="#">Add to cart</a></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col mb-5">
                                    <div class="card h-100">
                                        <!-- Sale badge-->
                                        <div class="badge bg-dark text-white position-absolute"
                                            style="top: 0.5rem; right: 0.5rem">Sale</div>
                                        <!-- Product image-->
                                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                                            alt="..." />
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">Sale Item</h5>
                                                <!-- Product price-->
                                                <span class="text-muted text-decoration-line-through">$50.00</span>
                                                $25.00
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto"
                                                    href="#">Add to cart</a></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col mb-5">
                                    <div class="card h-100">
                                        <!-- Product image-->
                                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                                            alt="..." />
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">Fancy Product</h5>
                                                <!-- Product price-->
                                                $120.00 - $280.00
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto"
                                                    href="#">View options</a></div>
                                        </div>
                                    </div>
                                </div>
                                
                                
                                
                                
                                <div class="col mb-5">
                                    <div class="card h-100">
                                        <!-- Sale badge-->
                                        <div class="badge bg-dark text-white position-absolute"
                                            style="top: 0.5rem; right: 0.5rem">Sale</div>
                                        <!-- Product image-->
                                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                                            alt="..." />
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">Special Item</h5>
                                                <!-- Product reviews-->
                                                <div class="d-flex justify-content-center small text-warning mb-2">
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                </div>
                                                <!-- Product price-->
                                                <span class="text-muted text-decoration-line-through">$20.00</span>
                                                $18.00
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto"
                                                    href="#">Add to cart</a></div>
                                        </div>
                                    </div>
                                </div>
                                
                               
                                
                            </div>
                        </div>
                    </section>
  <!-- 附近店家 -->
  
<script>  
  window.onload=  navigator.geolocation.getCurrentPosition(successCallback);  
    function successCallback(position){  
        var lat = position.coords.latitude;  
        var long1 = position.coords.longitude;  
        console.log(lat);
        console.log(long1);
  
    }  
    
</script>  
  


<!-- 輪播 -->
                    <script>
                    
                    var swiper = new Swiper(".mySwiper", {
                    	 direction: 'horizontal',
                    	 autoplay : {
                    		 delay:2000,
                    		 stopOnLastSlide:false,
                    		 disableOnInteraction: false,
                    	 },
                    	 loop:true,
                    	 spaceBetween : '10px',

                    	 pagination:".swiper-pagination",
                    	 speed:100,
//                     	 effect:'fade',
                    	 effect:'flip',
                    	 
                    	 observer:true,//修改swiper自己或子元素時，自動初始化swiper
                    	 observeParents:true,//修改swiper的父元素時，自動初始化swiper
                    	 
                        pagination: {
                          el: ".swiper-pagination",
                          type: 'bullets',
                          clickable:true,
                        },
                        navigation: {
                          nextEl: ".swiper-button-next",
                          prevEl: ".swiper-button-prev",
                        },
                      });
                    

                    </script> 
                  <!-- 輪播結束 -->

                </body>

                <jsp:include page="layout/footer.jsp"></jsp:include>