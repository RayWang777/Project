<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextRoot}/css/lib/front/styles.css" rel="stylesheet" />
</head>

<body>  
<nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="${contextRoot}/front/">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>
                        
                        
                        <button type="button" id="iwantserchfirm" class="btn btn-white" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap"><c:out value="找廠商"/></button>
                        
                    </ul>
<%--                     <form class="d-flex"> --%>
                        <a id="shopcar"  href="${contextRoot}/front/shopcar/">
                        <button class="btn btn-outline-dark" >
                        
                            <i class="bi-cart-fill me-1"></i>                         
                            購物車
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                        </a>
<%--                     </form> --%>
                </div>
            </div>
        </nav>
        <!-- Header-->
   <!-- -找廠商 -->
   
   <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
<!--       <div class="modal-header"> -->
<!--         <h5 class="modal-title" id="exampleModalLabel">請輸入廠商名稱</h5> -->
<!--         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
<!--       </div> -->
      <div class="modal-body">

          <div class="mb-3" style="text-align: center;">
            <label for="recipient-name" class="col-form-label">欲搜尋廠商</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          
          <div class="mb-3">
          
          
          <div id="showfirm"
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-3 justify-content-center">
          
            
            <div class="col mb-5">
				<div class="card h-100" style="width: 234px;">
					<!-- Product image-->
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
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
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">View options</a>
						</div>
					</div>
				</div>
			</div>
			
			
			 
            <div class="col mb-5">
				<div class="card h-100" style="width: 234px;">
					<!-- Product image-->
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
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
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">View options</a>
						</div>
					</div>
				</div>
			</div>
			
			
			 
            <div class="col mb-5">
				<div class="card h-100" style="width: 234px;">
					<!-- Product image-->
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
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
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">View options</a>
						</div>
					</div>
				</div>
			</div>
            
            
            
        			
	
           </div> 
            
            
          </div>
 
      </div>
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
<!--         <button type="button" class="btn btn-primary">Send message</button> -->
<!--       </div> -->
    </div>
  </div>
</div>
   
   <!-- 找廠商 -->
   
   
   
   
        <!-- Footer-->

        <script src="${contextRoot}/js/lib/jquery.min.js"></script>
		<script src="${contextRoot}/js/lib/jquery.nanoscroller.min.js"></script>
		<!-- nano scroller -->
		<script src="${contextRoot}/js/lib/menubar/sidebar.js"></script>
		<script src="${contextRoot}/js/lib/preloader/pace.min.js"></script>
        
        <!-- Bootstrap core JS-->
        <script src="${contextRoot}/js/lib/front/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${contextRoot}/js/lib/front/scripts.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script type="text/javascript">

	
	
        $(function(){
        	
        	$('#showfirm').children().remove(); 
        	 
        	$.ajax({
        		url:'http://localhost:8081/drinkmaster/front/firm/all',
        		method:'GET',
        		dataType: 'json',
        	    success: function(result){

        	    	   $('#list_table_json tr td').remove()
        	           console.log(result)
        	           msg_data = ''
        	           $.each(result, function(index, value){
        	        	   console.log(index);
        	        	   console.log(value);
      
        	        	   msg_data += ' <div class="col mb-5">'
        	        	   msg_data += '  <div class="card h-100">'
                               <!-- Product image-->
        	        	   msg_data += '    <img class="card-img-top" src="'+ value.firmPic +'" /> '
                               <!-- Product details-->
        	        	   msg_data += '  <div class="card-body p-4">'
        	        		   msg_data += '  <div class="text-center">'
                                       msg_data += '   <h5 class="fw-bolder">'+value.firmName+'</h5>'
                                        msg_data += '     $40.00 - $80.00'
                                       msg_data += '  </div>'
                                   		   msg_data += '   </div>'
                               msg_data += '  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">'
                            	   msg_data += '      <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="http://localhost:8081/drinkmaster/front/firm/'+value.firmId+'">店家一覽</a></div>'
                            		   msg_data += '   </div>'
                            			   msg_data += '  </div>'
                            				   msg_data += '   </div>'
        	        	         	           })
        	        	   $('#showfirm').append(msg_data)    	
        	      	 
        	     },
        	     error:function(err){
        	       console.log(err)
        	     }
        	})
        	
        	$('#iwantserchfirm').click(function(){
        		$('#recipient-name').val();
        	})

        	
        	
        	$('#recipient-name').keyup(function(){
        		
        		$('#showfirm').children().remove();
        		
        		var serchKey = $('#recipient-name').val();
        		
        		var firmserchobject = {"key": serchKey};
        		
        		var firmJsonString= JSON.stringify(firmserchobject)
        		
        		$.ajax({
        			url:'http://localhost:8081/drinkmaster/front/firm/serch',
            		method:'POST',
            		contentType: 'application/json', // 送過去的
            		dataType: 'json',
            		data: firmJsonString,
            	    success: function(result){

            	    	   $('#list_table_json tr td').remove()
            	           console.log(result)
            	           msg_data = ''
            	           $.each(result, function(index, value){
            	        	   console.log(index);
            	        	   console.log(value);
          
            	        	   msg_data += ' <div class="col mb-5">'
            	        	   msg_data += '  <div class="card h-100">'
                                   <!-- Product image-->
            	        	   msg_data += '    <img class="card-img-top" src="'+ value.firmPic +'" /> '
                                   <!-- Product details-->
            	        	   msg_data += '  <div class="card-body p-4">'
            	        		   msg_data += '  <div class="text-center">'
                                           msg_data += '   <h5 class="fw-bolder">'+value.firmName+'</h5>'
                                            msg_data += '     $40.00 - $80.00'
                                           msg_data += '  </div>'
                                       		   msg_data += '   </div>'
                                   msg_data += '  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">'
                                	   msg_data += '      <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="http://localhost:8081/drinkmaster/front/firm/'+value.firmId+'">店家一覽</a></div>'
                                		   msg_data += '   </div>'
                                			   msg_data += '  </div>'
                                				   msg_data += '   </div>'
            	        	         	           })
            	        	   $('#showfirm').append(msg_data)    	
            	      	 
            	     },
            	     error:function(err){
            	       console.log(err)
            	     }
            	})
        		
        		
            	
        		
        	})
        	
        	
			
	
	
			
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        })
        
        
        
//         $(document).ready(function(){
//   $('#submitBtn').click(function(){
//     var inputText = document.getElementById('myMessage').value;
//     var dtoObject = {"msg" : inputText};
//     var dtoJsonString= JSON.stringify(dtoObject)

  
        
        </script>
        
        <!-- Bootstrap core JS-->
<!--         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
        <!-- Core theme JS-->
<!--         <script src="js/scripts.js"></script> -->

