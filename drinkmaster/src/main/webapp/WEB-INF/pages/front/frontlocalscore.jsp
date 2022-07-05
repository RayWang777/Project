<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/header.jsp"></jsp:include>


<title>飲君子DrinkMaster</title>

<head>



 <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.9.1.js"></script>
  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

</head>

 <body>
<header class="bg-dark py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="text-center text-white">
			<h1 class="display-4 fw-bolder">Shop in style</h1>
			<p class="lead fw-normal text-white-50 mb-0">With this shop
				hompeage template</p>
		</div>
	</div>
</header>
<!-- Section-->
<section class="py-5">
 <div class="container px-4 px-lg-5 mt-0">
                        	<div class="col mb-5" style="text-align: center;">
								<h5><b style="font-size: xx-large;">附近店家</b></h5>                        	
                        	</div>
                        	
                       <div class="col mb-3" style="text-align: center;"> 	
                      		<label  for="serchlocalfirmname">廠商名稱</label><input type="text" id="localserchfirmname" value="${selectValue}">
                        </div>	
                       
                            <div id="showstore"  class="row gx-4 gx-lg-10 row-cols-2 row-cols-md-3 row-cols-xl-3 justify-content-center">
                            
                            
                            
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



  <input type="text" id="localcounts" hidden="true" value="0">
  
   <script>
  $(function() {
    var availableTags = [ 
    	<c:forEach items="${firms}" var="firm" varStatus="s">
		"<c:out value="${firm.firmName}"/>"<c:if test="${!(s.last)}">,</c:if>
	</c:forEach>
    ];
    $( "#localserchfirmname" ).autocomplete({
      source: availableTags
    });
  });
  </script>
  
  
  
  
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
                    	  localstores1()
                  } 
                  
                  
                  function localstores1(){
//                   function localstores1(lat,lng){
                	  //利用input控制數量
                	    var localcounts = $('#localcounts').val();
                	 		localcounts++;
//              		 console.log(lat)
//              		 console.log(lng)
             		 	var firmName = $('#localserchfirmname').val();
             		 	if(firmName == '全部') firmName='';
             		 	
             			console.log(firmName)
             		 
             			var serchLocalStoreStr = {"lat": lat , "lng": lng ,"counts" : localcounts,"firmName" :firmName };
                  		var storeJsonString= JSON.stringify(serchLocalStoreStr);
                  		//回填input
                  		$('#localcounts').val(localcounts);
                  	 
                  	$.ajax({
                  		url:'http://localhost:8081/drinkmaster/front/localstorelike',
                  		method:'POST',
                  		contentType: 'application/json',
                  		dataType: 'json',
                  		data: storeJsonString,
                  	    success: function(result){
                  	    	   msg_data = ''
                  	           $.each(result, function(index, value){

                  	        	msg_data +=    '<div class="col mb-5">'
                  	        	msg_data +=  '<div class="card h-100">'
                  	        	msg_data +='<a href="http://localhost:8081/drinkmaster/front/productmenu?id='+value.storeId+'">'
                                msg_data +=      '<img class="card-img-top" src="http://localhost:8081/drinkmaster/backend/firm/'+value.firmId+'/photo" alt="..." />'
                                msg_data += '</a>'
                                msg_data +=       '<div class="card-body p-4">'
                                msg_data +=           '<div class="text-center">'
                                msg_data +=    '<h5 class="fw-bolder">'+value.storeName+'</h5>'
                                msg_data +=           '</div>'
                                msg_data +=       '</div>'
                                msg_data +=       '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">'
                                msg_data +=           '<div class="text-center">'+value.storeAddress+'</div>'
                                msg_data +=  '<div class="text-center">'+value.distance+'公里</div>'
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
                  
        <!-- 到底觸發事件 -->          
                  window.onscroll = function(localcounts){
                	  var scrollTop =  document.documentElement.scrollTop+ 0.5;
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

                  
        <!-- 搜尋切換事件 -->
        $('#localserchfirmname').change(function change(){
        	var changeValue = $('#localserchfirmname').val(); 
        	console.log(changeValue);
        	location.href='http://localhost:8081/drinkmaster/front/localstoreScore?selectValue='+changeValue;
        })
    
                  
        </script>

</body>

<jsp:include page="layout/footer.jsp"></jsp:include>