<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
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

#dropdownMenuButton1{
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
<title>comment</title>
</head>
<body>




<div class="container">


<div class="row justify-content-center">
<div class="col-9">


<br/><br/><br/>


<h1 style="text-align:center">評論</h1>

<br/><br/><br/>

<div class="card" style="background-color:transparent; border: 0">
<c:forEach var="store" items="${arrayList}">
<a href="${contextRoot}/front/comment/storecomment?commentfirmid=${store.firmBean.firmId}" ><button type="button" class="btn btn-outline-primary">回店家評論區</button></a>
</c:forEach>
  <div class="card-body" >
  
 
  				<c:forEach var="store" items="${arrayList}">
  				
  					<div class="row justify-content-center">
						<div class="col-9" style="background-color: white ;  border: 3px solid red; border-radius: 50px">
						<img class="card-img-top" src="http://localhost:8081/drinkmaster/front/firm/${store.firmBean.firmId}/photo" style="width: 130px; height: 130px ;display:block; margin:0 10px; border-radius: 150px ;float: left; "/>
  						&nbsp;&nbsp;<span style="font-size: 1.5em ; text-align:center ">店家資訊</span><br/>
  						<input id="storeid" name="storeid" value="${store.storeId}" type="hidden" />
  						
  						&nbsp;&nbsp;店家 : <c:out value="${store.firmBean.firmName}" />&nbsp;<c:out value="${store.storeName}"  /><br/>
  						&nbsp;&nbsp;地址 : <c:out value="${store.storeAddress}"  /><br/>
  						&nbsp;&nbsp;電話 : <c:out value="${store.storePhone}"  /><br/>
  						&nbsp;&nbsp;營業時間 : <c:out value="${store.openTime}"  /><br/>

  		
  				
  						</div>
  					</div>
  				
  				</c:forEach>
  				
  				
  	<c:if test="${empty canSeeUser}">
  	
  	<br/>
  	
  				<div class="row justify-content-center">
				<div class="col-9">
  				
  				<a href="${contextRoot}/front/login" style="text-decoration:none">
  				<h3 style="color: red">登入後可評論~</h3>
  				</a>
				</div>
				</div>
  				
  	
  	
  	
  	
 	</c:if>
  
 	 <br/>
 	 
	<c:if test="${not empty canSeeUser}">
	
 <c:choose>
  	
  	<c:when test="${not empty findusId}">
  	

    <c:forEach  var="usercomment" items="${findusId}" >
  		
  		<div class="row justify-content-center">
<div class="col-9">

<div class="card">

<span style="font-size: 1.5em ; text-align:center ">你的評論</span>
  <div class="card-header">
		<c:out value="${usercomment.storeBean.storeName}"></c:out>
		<input id="commentstoreid" type="hidden" value="${usercomment.storeBean.storeId}"/>
  </div>
  <div class="card-body">
  	<c:out value="${usercomment.userBean.userName}"></c:out>
	<input id="commentuserid" type="hidden" value="${usercomment.userBean.userId}"/> 
  	<br/>
  	
<!--   	commentid -->
  	<input id="newcommentid" type="hidden" value="${usercomment.commentId}"/>    
  	
  	<div style="pointer-events: none" id="scores${usercomment.commentId}" class="awesomeRating"></div>
	<div class="awesomeRatingValue" style="display:none"></div>
	<script type="text/javascript">
	
		$("#scores${usercomment.commentId}").awesomeRating({
			
			valueInitial: "${usercomment.score}",
			values: ["1.0", "2.0", "3.0", "4.0", "5.0"],
			targetSelector: "span.awesomeRatingValue"
		});
	
		console.log(${usercomment.score});
		
		</script>
		
	
	
	<c:out value="${usercomment.content}"></c:out>
	
	<br/>
	
	<img src="${usercomment.commentPhoto}" style="width: 100px;heiget: 100px" />

	<br/>
	(時間) <fmt:formatDate pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss EEEE" value="${usercomment.createTime}" />
	
	
	
	
		
	
	
	
  		
  		
  		
<!--   		======================================== -->
  		
<button id="edit01" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal01" data-bs-whatever="@mdo">編輯</button>

<div class="modal fade" id="exampleModal01" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">修改評論</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div id="test000">
      
      
      </div>
      
      
    </div>
  </div>
</div>   



<!--   		======================================= -->

<a onclick="return confirm('真的要刪除嗎?')" href="${contextRoot}/front/comment/delete?commentid=${usercomment.commentId}&storeid=${usercomment.storeBean.storeId}"><button class="btn btn-danger">刪除</button></a>

  		
<%--   		<c:out value="${usercomment.userBean.userName}" /> --%>
  		
  		  </div>
</div>
</div>
</div>
  		
  		</c:forEach>
  		
  		

<script type="text/javascript">
	
		
		
		$(document).ready(function(){
			  $('#edit01').click(function(){
			    var inputText = document.getElementById('newcommentid').value;
			    var dtoObject = {"commentId":inputText};
			    var dtoJsonString= JSON.stringify(dtoObject);
		
// 				alert(dtoJsonString);
// 				return;
		
						
			
		
			$.ajax({
				url:'http://localhost:8081/drinkmaster/front/comment/editComment',
	     		method:'POST',
	     		contentType:"application/json",
	     		dataType: 'json',
	     		data: JSON.stringify(dtoObject),
	     	    success: function(result){
	     	    	
	     	    	$('#test000').children().remove();

// 					console.log(result)					
// 					var score = result.score + 0.0;
// 					var ds = parseFloat(score);
					
	     	    	
// 	     	    	console.log(ds);
// 	     	    	return;
	     	    	
		     	    comment_data = ""
		     	    
		     	    	comment_data += '<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>'
		     	    	
		     	    	comment_data += '<form method="post" action="http://localhost:8081/drinkmaster/front/comment/editNewComment" enctype="multipart/form-data">'
		     	    	comment_data += '<input id="newcommentid" name="newcommentid" type="hidden" value="' + result.commentId + '"/>'
		     	    	comment_data +=	'<input id="commentuserid" type="hidden" value="' + result.userId + '"/>'
		     	    	comment_data +=	'<input id="commentstoreid" name="commentstoreid" type="hidden" value="' + result.storeId + '"/>'
		     	    	
		     	    	
		     	    	
		     	    	comment_data +=	'<input id="score1" name="score1" value="' + result.score + '" class="form-control" type="hidden" />'
		     	    	
		     	    	comment_data +=	'<div id="scores" class="awesomeRating"></div>'
		     	    	comment_data +=	'<div class="awesomeRatingValue" style="display:none"></div>'
		     	    	
		     	    	
		     	    	comment_data += '<textarea id="commentcontent" name="commentcontent" class="form-control" value="' + result.content + '">'+result.content+'</textarea>'
		     	    	comment_data += '<input id="commentPhoto1" name="commentPhoto1"  type="file" class="form-control" onchange="preview()" />'
		     	    	
		     	    	comment_data += '<img id="image" src="'+result.commentPhoto+'" width="100px" height="100px" />'
// 		     	    	comment_data +=	'<c:if test="${' + result.commentPhoto + '!=null}">'
		     	    	comment_data +=	'<img id="oldImage" src="' + result.commentPhoto + '" width="100px" height="100px"/>'
// 						comment_data += '</c:if>'
						
		     	    	
		     	    	comment_data +=	'<fmt:formatDate pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss EEEE" value="${result.createTime}" />'
		     	    	
		     	    	comment_data += '<input value="' + result.scoreType + '" class="form-control" type="hidden"/>'
		     	    		
		     	    	comment_data += '<div class="modal-footer">'
		     	    	comment_data += '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>'
		     	    	comment_data += '<button type="submit" name="submit" class="btn btn-primary">送出</button>'
		     	    	comment_data += '</div>'
		     	    	comment_data += '</form>'
// 		     	    		console.log(comment_data);
		     	    		
		     	    
		     	   
		     	   $('#test000').append(comment_data);
		     	   
		     	  var test1 = "";
	     	    	$(function(){
	     	   			 test1 = $("#score1").val();
	     	   			 console.log(test1);
// 	     	   			 alert("0000000");
	     	   		
	     	   	
	     	   		$(".awesomeRating").awesomeRating({
	     	   			
	     	   			valueInitial: test1,
	     	   			values: ["1.0", "2.0", "3.0", "4.0", "5.0"],
	     	   			targetSelector: "div.awesomeRatingValue"
	     	   			
	     	   		});
	     	   	
	     	   		});
	     	    	
	     	    	$("#scores").click(function(){
	     	   			
	     	   			var test = $(".awesomeRatingValue").val();
	     	   			console.log(test);
	     	   			$("#score1").attr("value",test);
	     	   		
	     	    	});
	     	    	
	     	    	$(function() {
	     	    		if(result.commentPhoto == null){
	     	    			$('#oldImage').hide();
	     	    		}
	     	    		
	     	   			$('#image').hide();
	     	   	});

	     	   	function preview() {
	     	   		image.src = URL.createObjectURL(event.target.files[0]);
	     	   		if ((event.target.files[0].type).startsWith("image")) {
	     	   			$('#oldImage').hide();
	     	   			$('#image').show();
	     	   		}
	     	   	}
	     	    
	     	    },
	     	 	error:function(err){
	     	       console.log(err);
	     	    }
	     	    
	     	    
	     	    
				
			});
			
		});
	});		
		
		
		
		
	 </script>	
  		

    
    
    </c:when>
  	
  	<c:otherwise>
  	


<div style="text-align:center"><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal0" data-bs-whatever="@mdo">撰寫評論</button></div>

<div class="modal fade" id="exampleModal0" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">新增評論</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form:form class="form" method="post" action="${contextRoot}/front/comment/insert" modelAttribute="commentBean" enctype="multipart/form-data">
          <div class="form-group">
<!-- 	userid -->
		<input id=sessionuserid name="sessionuserid" value="${canSeeUser.userId}" type="hidden" />
<!-- 	storeid -->
	<form:input path="storeBean" name="storeBean" class="form-control" type="hidden" />
<%-- 	productid<form:input path="productBean" class="form-control" /> --%>
<!-- 	score -->
	<form:input id="score1" path="score" class="form-control" style="pointer-events: none" type="hidden"/>
	
	<div id="scores" class="awesomeRating"></div>
	<input class="awesomeRatingValue" style="display:none" required></input>
	<script type="text/javascript">
	
		$("#scores").click(function(){
			
			var test = $(".awesomeRatingValue").val();
			console.log(test);
			$("#score1").attr("value",test);
			
		});
		
	
		$(".awesomeRating").awesomeRating({
			
			valueInitial: "",
			values: ["1.0", "2.0", "3.0", "4.0", "5.0"],
			targetSelector: "input.awesomeRatingValue"
			
		});
	
		
	</script>
	
	
	<form:input path="scoreType" class="form-control" type="hidden"/>
	content<form:textarea path="content" class="form-control" />
	
	<br/>
	
	<input id="commentPhoto1" name="commentPhoto1"  type="file" class="form-control" onchange="preview()" />

		<img id="image" src="" width="100px" height="100px" />
	<c:if test="${comment.commentId!=null}">
					<img id="oldImage" src="${comment.commentPhoto}" width="100px"
						height="100px" />
	</c:if>
	
	
</div>

<!-- 			<button type="submit" name="submit" class="btn btn-primary">新增評論</button> -->
        
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
        <button type="submit" name="submit" class="btn btn-primary">新增評論</button>
      </div>
      </form:form>
      </div>
    </div>
  </div>
</div>
  		
  	</c:otherwise>
  	
  	</c:choose>
  	
  	    </c:if>
  

  
	<script type="text/javascript">
	
	$(function() {
		$('#image').hide();
	});

	function preview() {
		image.src = URL.createObjectURL(event.target.files[0]);
		if ((event.target.files[0].type).startsWith("image")) {
			$('#oldImage').hide();
			$('#image').show();
		}
	}
	
	</script>
  
  </div>
</div>
</div>
</div>


<br/>

<div class="row justify-content-center">
	<div class="col-9">

<div class="dropdown" style="text-align:right">
  <button class="btn btn-black dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    排序
  </button>
  <br/><br/>
  <c:forEach var="store" items="${arrayList}">
  
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    <li><a class="dropdown-item" href="${contextRoot}/front/comment/all?storeid=${store.storeId}">最新</a></li>
    <li><a class="dropdown-item" href="${contextRoot}/front/comment/scoredesc?storeid=${store.storeId}" >評分最高</a></li>
    <li><a class="dropdown-item" href="${contextRoot}/front/comment/scoreasc?storeid=${store.storeId}">評分最低</a></li>
    <li><a class="dropdown-item" href="${contextRoot}/front/comment/timeasc?storeid=${store.storeId}">最早</a></li>
  </ul>
  
  </c:forEach>
</div>

<br/><br/><br/>

</div>
</div>

<br/>
<c:forEach  var="comment" items="${page.content}" >

<div class="row justify-content-center">
<div class="col-9">

<div class="card border-warning">
  <div class="card-header">
		<c:out value="${comment.storeBean.storeName}"></c:out>
  </div>
  <div class="card-body">
  	<c:out value="${comment.userBean.userName}"></c:out>
  	<br/>
  	
  	
  	
  	<div style="pointer-events: none" id="scores2${comment.commentId}" class="awesomeRating"></div>
	<input class="awesomeRatingValue" style="display:none" required></input>
	<script type="text/javascript">
	
		$("#scores2${comment.commentId}").awesomeRating({
			
			valueInitial: "${comment.score}",
			values: ["1.0", "2.0", "3.0", "4.0", "5.0"],
			targetSelector: "input.awesomeRatingValue"
		});
	
		console.log(${comment.score});
	</script>
	
	<c:out value="${comment.content}"></c:out>
	
	<br/>
	
	<img src="${comment.commentPhoto}" style="width: 100px;heiget: 100px" />

	<br/>
	(時間) <fmt:formatDate pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss EEEE" value="${comment.createTime}" />
	
	
  
  </div>
</div>
</div>
</div>

<br/>

</c:forEach>

<div class="row justify-content-center" style="text-align: center;font-size:x-large; ;" >
	<div class="col-9">
	<span style=" background-color: white;">
		<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
		
		<c:choose>
			<c:when test="${page.number != pageNumber-1}" >
			
				<c:forEach var="store" items="${arrayList}">
				<a href="${contextRoot}/front/comment/all/?p=${pageNumber}&storeid=${store.storeId}"> <c:out value="${pageNumber}" /></a>
				</c:forEach>
			
			</c:when>
		
			<c:otherwise>
				<c:out value="${pageNumber}" />
			</c:otherwise>	
		
		</c:choose>
		
		<c:if test="${page.totalPages != pageNumber}">
			|
		</c:if>
			
		
		</c:forEach>
	</span>
	</div>
</div>


</div>


<jsp:include page="layout/footer.jsp" />



</body>
</html>