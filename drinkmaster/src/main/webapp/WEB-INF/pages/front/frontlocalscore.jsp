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

<style type="text/css">

  html { 
            			height: 100%; 
     					} 
                    body {
                        background-image: url("<c:url value="/images/coolbanner.jpg"/>");
                        background-repeat: no-repeat;
                        background-attachment:fixed;
                        background-position: 50% 40%;
                        background-size: 180% 140%;
                    }
 a:link
        {
            color: black;
            text-decoration:none
        }
        a:visited
        {
            color: black;
            text-decoration:none
        }
        a:hover
        {
            color: red;
        }
        a:active
        {
            color: black;
        }

</style>
</head>


 <body>
<!-- <header class="bg-dark py-5"> -->
<!-- 	<div class="container px-4 px-lg-5 my-5"> -->
<!-- 		<div class="text-center text-white"> -->
<!-- 			<h1 class="display-4 fw-bolder">Shop in style</h1> -->
<!-- 			<p class="lead fw-normal text-white-50 mb-0">With this shop -->
<!-- 				hompeage template</p> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </header> -->
<!-- Section-->
<section class="py-5">
 <div class="container px-4 px-lg-5 mt-0">
                        	<div class="col mb-5" style="text-align: center;">
								<h5><b style="font-size: xx-large;">附近店家</b></h5>                        	
                        	</div>
                     <div class="input-group mb-3">   	
                       <div class="col mb-3" style="text-align: center;"> 	
                      		<label  for="serchlocalfirmname">廠商名稱： </label><input type="text" id="localserchfirmname" value="${selectValue}">
                        </div>	
                          <div class="col mb-3" style="text-align: center;"> 	
                      		<label  for="localstoreavgscore">評價： </label><select id="localstoreavgscore" style="width: 190px;height: 30px;">
                      			<c:choose><c:when test="${selectValueAvg==0}"><option value="0" selected="true">全部</option></c:when><c:otherwise><option value="0">全部</option></c:otherwise></c:choose>                     		
                      			<c:choose><c:when test="${selectValueAvg==5}"><option value="5" selected="true">5星</option></c:when><c:otherwise><option value="5">5星</option></c:otherwise></c:choose>                     		
                      			<c:choose><c:when test="${selectValueAvg==4}"><option value="4" selected="true">4星以上</option></c:when><c:otherwise><option value="4">4星以上</option></c:otherwise></c:choose>                     		
                      			<c:choose><c:when test="${selectValueAvg==3}"><option value="3" selected="true">3星以上</option></c:when><c:otherwise><option value="3">3星以上</option></c:otherwise></c:choose>                     		
                      		</select>
                      		<input type="text" value="${selectValueAvg}" hidden="true" id="localAvg">
                        </div>	
                        
                        
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
                	 		console.log(localcounts);
//              		 console.log(lat)
//              		 console.log(lng)
             		 	var firmName = $('#localserchfirmname').val();
             		 	if(firmName == '全部') firmName='';
             		 	var avgscore = $('#localAvg').val();
              		 
             			var serchLocalStoreStr = {"lat": lat , "lng": lng ,"counts" : localcounts,"firmName" :firmName,"score": avgscore };
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

                  	        	msg_data +=    '<div class="col mb-4">'
                  	        	msg_data +=  '<div class="card h-70" style="background-color:transparent;border: 0">'
                  	        	msg_data +='<a href="http://localhost:8081/drinkmaster/front/productmenu?id='+value.storeId+'">'
                                msg_data +=      '<img class="card-img-top" src="http://localhost:8081/drinkmaster/backend/firm/'+value.firmId+'/photo" alt="..." style="border-radius:50%;border: 1px black solid; "/>'
                                msg_data += '</a>'
                                msg_data +=       '<div class="card-body p-4" style="color:#484891;border: 0">'
                                msg_data +=           '<div class="text-center">'
                                msg_data +=    '<h5 class="fw-bolder"><b>'+value.firmName+'&nbsp;&nbsp;&nbsp;&nbsp;'+value.storeName+'</B></h5>'
                                msg_data +=           '</div>'
//                                 msg_data +=       '</div>'
//                                 msg_data +=       '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">'
                                msg_data +=           '<div class="text-center">'+value.storeAddress+'</div><br>'
                                msg_data +=  '<div class="text-center">'+'<button class="btn btn-light">'+value.openTime+'</button><button class="btn btn-light">'+value.distance+'公里</button><button class="btn btn-light"><a href="${contextRoot}/front/comment/all?storeid='+value.storeId+'" class="card-link">評分:'+value.avgScore+'⭐</a></button></div><br>'
//                                 msg_data +=           '<div class="text-center">'+value.storePhone+'</div><br>'
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
        	var selectValueAvg = $('#localstoreavgscore').val(); 
        	location.href='http://localhost:8081/drinkmaster/front/localstoreScore?selectValue='+changeValue+'&avg='+selectValueAvg;
        })
        
        $('#localstoreavgscore').change(function change(){
        	var changeValue = $('#localserchfirmname').val(); 
        	var selectValueAvg = $('#localstoreavgscore').val();
        	$('#localAvg').val(selectValueAvg);
        	location.href='http://localhost:8081/drinkmaster/front/localstoreScore?selectValue='+changeValue+'&avg='+selectValueAvg;
        })
        
        
    
                  
        </script>

</body>

<jsp:include page="layout/footer.jsp"></jsp:include>