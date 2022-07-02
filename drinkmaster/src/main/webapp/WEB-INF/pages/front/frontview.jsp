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
                                        <a href="<c:url value="/front/firm/${top3[1].firmBean.firmId}"/>"><img class="card-img-top" src="<c:url value="/backend/firm/${top3[1].firmBean.firmId}/photo"/>" alt="..." style="width: 250px;height: 250px;"/></a>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- firmName-->
                                                <h5 class="fw-bolder">${top3[1].firmBean.firmName}</h5>
                                                <!-- storeName-->
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
                                        <a href="<c:url value="/front/firm/${top3[0].firmBean.firmId}"/>"><img class="card-img-top" src="<c:url value="/backend/firm/${top3[0].firmBean.firmId}/photo"/>" alt="..." style="width: 250px;height: 250px;"/></a>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- firmName-->
                                                <h5 class="fw-bolder">${top3[0].firmBean.firmName}</h5>
                                                <!-- storeName-->
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
                                        <a href="<c:url value="/front/firm/${top3[2].firmBean.firmId}"/>"><img class="card-img-top" src="<c:url value="/backend/firm/${top3[2].firmBean.firmId}/photo"/>" alt="..." style="width: 250px;height: 250px;"/></a>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- firmName-->
                                                <h5 class="fw-bolder">${top3[2].firmBean.firmName}</h5>
                                                <!-- storeName-->
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
                        	<div class="col mb-5" style="text-align: center;">
								<h5><b style="font-size: xx-large;">附近店家</b></h5>                        	
                        	</div>
                            <div id="showstore"  class="row gx-4 gx-lg-10 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                            
                            
                            
                                <div class="col mb-5">
                                    <div class="card h-100">
                                        <!-- Product image-->
                                        <img class="card-img-top" src="<c:url value="/images/top3/please.jpg"/>"  alt="..." />
                                        <!-- Product details-->
                                    </div>
                                </div>
                               
                            </div>
                        </div>
                    </section>
  <!-- 附近店家 -->
  
<script src="<c:url value="/js/key.js"/>"></script>

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
                  <!-- 附近店家 -->
                  
                  <script type="text/javascript">
                  
                  window.onload=  navigator.geolocation.getCurrentPosition(successCallback);
                  
                  function localstores1(lat,lng){
                	  
             		 console.log(lat)
             		 console.log(lng)
             		 
             		 
             	 $('#showstore').children().remove(); 
             		 
             			var serchLocalStoreStr = {"lat": lat , "lng": lng};
                  		var storeJsonString= JSON.stringify(serchLocalStoreStr);
             		 
             		 
             		 
                  	 
                  	$.ajax({
                  		url:'http://localhost:8081/drinkmaster/front/localstore',
                  		method:'POST',
                  		contentType: 'application/json',
                  		dataType: 'json',
                  		data: storeJsonString,
                  	    success: function(result){

                 	           
                  	    	   msg_data = ''
                  	           $.each(result, function(index, value){
                  	        	   
                  	        	   console.log(index);
                  	        	   console.log(value);
                  	        	   
                  	        	msg_data +=    '<div class="col mb-5">'
                  	        	msg_data +=  '<div class="card h-100">'
                                       <!-- Product image-->
                  	        	msg_data +='<a href="http://localhost:8081/drinkmaster/front/productmenu?id='+value.storeId+'">'
                                msg_data +=      '<img class="card-img-top" src="http://localhost:8081/drinkmaster/backend/firm/'+value.firmId+'/photo" alt="..." />'
                                msg_data += '</a>'
                                
                                       <!-- Product details-->
                                msg_data +=       '<div class="card-body p-4">'
                                msg_data +=           '<div class="text-center">'
                                               <!-- Product name-->
                                msg_data +=    '<h5 class="fw-bolder">'+value.storeName+'</h5>'
                                               <!-- Product price-->
                                msg_data +=           '</div>'
                                msg_data +=       '</div>'
                                       <!-- Product actions-->
                                msg_data +=       '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">'
                                msg_data +=           '<div class="text-center">'+value.storeAddress+'</div>'
                                msg_data +=           '<div class="text-center">'+value.storePhone+'</div>'
                                msg_data +=       '</div>'
                                msg_data +=   '</div>'
                                msg_data += '</div>'                  	        	   
                             })
                  	         $('#showstore').append(msg_data)    	
                  	      	 
                  	     },
                  	     error:function(err){
                  	       console.log(err)
                  	     }
                  	})
                  	
                      		 
             		 
             	 }
                  
                  function successCallback(position){  
                      var lat = position.coords.latitude;  
                      var lng = position.coords.longitude;  
                    	 localstores1(lat,lng);
                  } 
                  
                              
                  
              </script>
      <!-- 附近店家 -->
                </body>

                <jsp:include page="layout/footer.jsp"></jsp:include>