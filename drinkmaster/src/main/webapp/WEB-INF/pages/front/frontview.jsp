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
                        background-image: url("<c:url value="/images/water.png"/>");
                        background-repeat: no-repeat;
                        background-attachment:fixed;
                        background-position: 50% 0%;
                        background-size: 100% 130%;
                    }
/*                背景滿版    */

                    .swiper-container {
                        width: 830px;
                        height: 370px;
                    }
                </style>

        
<title>飲君子DrinkMaster</title>
 <body>
 <header class="py-2"> 
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-button-next" style="margin-right: 15%"></div>
      <div class="swiper-button-prev" style="margin-left: 15%"></div>
       <c:forEach items="${swiperPic}" var="one" end="5">
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
                    
                    <input type="text" id="localcounts" hidden="true" value="0"> <!-- hidden="true" -->
                    <!-- TOP3 -->
                      <div class="container px-4 px-lg-5 mt-3">
                            <div  class="row gx-4 gx-lg-10 row-cols-1 row-cols-md-1 row-cols-xl-1 justify-content-center col mb-5" style="text-align: center;">
                        		<h2 style="color: #0292F4;font-family: monospace;"><b>最多人購買品牌</b></h2>
                        	</div>	 
                        	
                        	
                        	<div  class="row gx-4 gx-lg-10 row-cols-2 row-cols-md-3 row-cols-xl-3 justify-content-center">
                        	
                        	<!-- card one -->
                        		  <div class="col mb-5" >
                                    <div class="card h-70" style="width: 250px;margin: auto;background-color:transparent;border: 0">
                                        <!-- Sale badge-->
                                        <div class="badge text-white position-absolute "
                                            style="top: 0.5rem; right: 2rem"><img alt="" src="<c:url value="/images/top3/top2.png"/>" style="width: 55px;height: 55px;background-color: transparent;margin-right: 30px;" ></div>
                                        <!-- Product image-->
                                        <div style="padding-left: 15px">
                                        <a href="<c:url value="/front/firm/${top3[1].firmBean.firmId}"/>"><img class="card-img-top"  src="<c:url value="/backend/firm/${top3[1].firmBean.firmId}/photo"/>" alt="..." style="width: 170px;height: 170px;border-radius: 120px;border:black 0.5px solid; "/></a>
                                        </div>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="">
                                                <!-- firmName-->
                                                <h5 class="fw-bolder" style="color:#76D3F4 ;margin-left: 40px">${top3[1].firmBean.firmName}</h5>
                                                <!-- storeName-->
                                            </div>
                                        </div>
	                                    </div>
    	                            </div>
                               <!-- card two --> 
                   					  <div class="col mb-5 justify-content-center">
                                    <div class="card h-70" style="width: 250px;margin: auto;background-color:transparent;border: 0">
                                        <!-- Sale badge-->
                                        <div class="badge text-white position-absolute"
                                            style="top: 0.0rem; right: 0.0rem"><img alt="" src="<c:url value="/images/top3/top1.png"/>" style="width: 66px;height: 66px;background-color: transparent;margin-right: 30px;" ></div>
                                        <!-- Product image-->
                                        <div style="padding-left: 15px">
                                        <a href="<c:url value="/front/firm/${top3[0].firmBean.firmId}"/>"><img class="card-img-top" src="<c:url value="/backend/firm/${top3[0].firmBean.firmId}/photo"/>" alt="..." style="width: 210px;height: 210px; border-radius: 120px; border:black 0.5px solid;"/></a>
                                        </div>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="" style="padding-left: 15px">
                                                <!-- firmName-->
                                                <h5 class="fw-bolder" style="color:#2C9FF4 ;margin-left: 50px"><b>${top3[0].firmBean.firmName}</b></h5>
                                                <!-- storeName-->
                                            </div>
                                        </div>
	                                    </div>
    	                            </div>
                        		 
                        		 
                        		<!-- card three -->
                        		  <div class="col mb-5 justify-content-center">
                                    <div class="card h-70" style="width: 250px;margin: auto;background-color:transparent;border: 0">
                                        <!-- Sale badge-->
                                        <div class="badge text-white position-absolute"
                                            style="top: 0.5rem; right: 4rem"><img alt="" src="<c:url value="/images/top3/top3.png"/>" style="width: 45px;height: 45px;background-color: transparent;margin-right: 30px;" ></div>
                                        <!-- Product image-->
                                        <div style="padding-left: 15px">
                                        <a href="<c:url value="/front/firm/${top3[2].firmBean.firmId}"/>"><img class="card-img-top" src="<c:url value="/backend/firm/${top3[2].firmBean.firmId}/photo"/>" alt="..." style="width: 140px;height: 140px; border-radius: 120px;border:black 0.5px solid;"/></a>
                                        </div>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="">
                                                <!-- firmName-->
                                                <h5 class="fw-bolder" style="color:#ABE1F4;margin-left: 10px; ">${top3[2].firmBean.firmName}</h5>
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
                  var localcounts = $('#localcounts').val();
                  window.onload=  navigator.geolocation.getCurrentPosition(successCallback);
                  $('#showstore').children().remove(); 
                  //最外層給全域變數讓經緯度能使用
                  var lat = 0;
                  var lng = 0;  
                  function successCallback(position){  
                		  lat = position.coords.latitude;  
                    	  lng = position.coords.longitude;  
                    	
                  } 
                  
                  
                  function localstores1(){
//                   function localstores1(lat,lng){
                	  //利用input控制數量
                	    var localcounts = $('#localcounts').val();
                	 		localcounts++;
                		if(localcounts == 5)return;
                		
             		 console.log(lat)
             		 console.log(lng)
             		 
             			var serchLocalStoreStr = {"lat": lat , "lng": lng ,"counts" : localcounts};
                  		var storeJsonString= JSON.stringify(serchLocalStoreStr);
                  		//回填input
                  		$('#localcounts').val(localcounts);
                  	 
                  	$.ajax({
                  		url:'http://localhost:8081/drinkmaster/front/localstore',
                  		method:'POST',
                  		contentType: 'application/json',
                  		dataType: 'json',
                  		data: storeJsonString,
                  	    success: function(result){
                  	    	   msg_data = ''
                  	           $.each(result, function(index, value){

                  	        	msg_data +=    '<div class="col mb-5">'
                  	        	msg_data +=  '<div class="card h-100 border-0" style="background-color:transparent;">'
                  	        	msg_data +='<a href="http://localhost:8081/drinkmaster/front/productmenu?id='+value.storeId+'" >'
                                msg_data +=      '<img class="card-img-top" src="http://localhost:8081/drinkmaster/backend/firm/'+value.firmId+'/photo" alt="..." style="border-radius:50%;border:black 0.5px solid;"/>'
                                msg_data += '</a>'
                                msg_data +=       '<div class="card-body p-4" style="background-color:#FFF3EE;border-radius:15px;">'
                                msg_data +=           '<div class="text-center">'
                                msg_data +=    '<h5 class="fw-bolder">'+value.storeName+'</h5>'
                                msg_data +=           '</div>'
//                                 msg_data +=       '</div>'
//                                 msg_data +=       '<div class="card-footer p-4 pt-0 border-top-0" style="background-color:#FFF3EE;">'
                                msg_data +=           '<div class="text-center">'+value.storeAddress+'</div>'
//                                 msg_data +=           '<div class="text-center"><button class="border-0 btn btn-white" style="background-color:transparent;"><a href="${contextRoot}/front/comment/all?storeid='+value.storeId+'" class="card-link"><b>評分:'+value.avgScore+'⭐</b></a></button></div>'
                                msg_data +=  '<div class="text-center">'+'<button class="border-0 btn btn-light" style="background-color:transparent;">'+value.openTime+'</button><button class="border-0 btn btn-light" style="background-color:transparent;">'+value.distance+'公里</button></div>'
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
                  
        <!-- 到底觸發事件 -->          
                  window.onscroll = function(localcounts){
                	  

                	  var scrollTop =  document.documentElement.scrollTop+0.5;
                	  

                	  var windowHeight =  document.documentElement.clientHeight;
                	  

                	  var scrollHeight = document.documentElement.scrollHeight;
                	  
                	  
                      console.log(scrollTop)
                      console.log(windowHeight)
                      console.log(scrollHeight)
                	  
                	  if(scrollTop+windowHeight >= scrollHeight){

                		  localstores1();
                		  
                	  }
                  }
        <!-- 到底觸發事件 -->     

                  
              </script>
              
      <!-- 附近店家 -->
                </body>

                <jsp:include page="layout/footer.jsp"></jsp:include>