<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/header.jsp"></jsp:include>


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
	<div class="container px-4 px-lg-5 mt-5">
		<div id="showfirm"
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">


<c:forEach items="${stores}" var="store" >
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Product image-->
					<img class="card-img-top"
						src="http://localhost:8081/drinkmaster/front/productmenu?id=${store.firmBean.firmId}" alt="..." />
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder"><c:out value="${thisFirm.firmName}"/></h5>
							<h5 class="fw-bolder"><c:out value="${store.storeName}"/></h5>
							<!-- Product price-->
							${store.openTime}<br/>
							${store.storeAddress}
						</div>
					</div>
					<!-- Product actions-->

				</div>
			</div>

</c:forEach>



		</div>
	</div>
</section>

<script type="text/javascript">
        
        $(function(){
        	
//         	$('#showfirm').children().remove(); 
        	 
//         	$.ajax({
//         		url:'http://localhost:8081/drinkmaster/front/firm/all',
//         		method:'GET',
//         		dataType: 'json',
//         	    success: function(result){

//         	    	   $('#list_table_json tr td').remove()
//         	           console.log(result)
//         	           msg_data = ''
//         	           $.each(result, function(index, value){
//         	        	   console.log(index);
//         	        	   console.log(value);
      
//         	        	   msg_data += ' <div class="col mb-5">'
//         	        	   msg_data += '  <div class="card h-100">'
//                                <!-- Product image-->
//         	        	   msg_data += '    <img class="card-img-top" src="'+ value.firmPic +'" /> '
//                                <!-- Product details-->
//         	        	   msg_data += '  <div class="card-body p-4">'
//         	        		   msg_data += '  <div class="text-center">'
//                                        msg_data += '   <h5 class="fw-bolder">'+value.firmName+'</h5>'
//                                         msg_data += '     $40.00 - $80.00'
//                                        msg_data += '  </div>'
//                                    		   msg_data += '   </div>'
//                                msg_data += '  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">'
//                             	   msg_data += '      <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="localhost:8081/drinkmaster/front/store/'+value.firmId+'">店家一覽</a></div>'
//                             		   msg_data += '   </div>'
//                             			   msg_data += '  </div>'
//                             				   msg_data += '   </div>'
//         	        	         	           })
//         	        	   $('#showfirm').append(msg_data)    	
        	      	 
//         	     },
//         	     error:function(err){
//         	       console.log(err)
//         	     }
//         	})
        	
        })
        
        
        
//         $(document).ready(function(){
//   $('#submitBtn').click(function(){
//     var inputText = document.getElementById('myMessage').value;
//     var dtoObject = {"msg" : inputText};
//     var dtoJsonString= JSON.stringify(dtoObject)

  
        
        </script>


<jsp:include page="layout/footer.jsp"></jsp:include>