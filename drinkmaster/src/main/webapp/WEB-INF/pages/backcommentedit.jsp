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

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>修改評價</h1>


<div class="container">

<div class="row justify-content-center">
<div class="col-9">
	<h1>更新評論頁面</h1>
<div class="card">
  <div class="card-header">
    請輸入想更新的評論
  </div>
  <div class="card-body">
  
  <form:form class="form" method="post" modelAttribute="comment" enctype="multipart/form-data" >
  
  <form:input path="commentId" type="hidden"/>
  <form:input path="createTime" type="hidden"/>
  
  
  userid<form:input path="userBean" class="form-control" />
	storeid<form:input path="storeBean" class="form-control" />
	productid<form:input path="productBean" class="form-control" />
	score<form:input id="score1" path="score" class="form-control" style="pointer-events: none" />
	
	<div id="scores" class="awesomeRating"></div>
	<div class="awesomeRatingValue" style="display:none"></div>
	<script type="text/javascript">
	
		$("#scores").click(function(){
			
			var test = $(".awesomeRatingValue").val();
			console.log(test);
			$("#score1").attr("value",test);
			
		});
		
		var test1 = "";
		window.onload=(function(){
			 test1 = $("#score1").val();
			 console.log(test1);
		
	
		$(".awesomeRating").awesomeRating({
			
			valueInitial: test1,
			values: ["1.0", "2.0", "3.0", "4.0", "5.0"],
			targetSelector: "div.awesomeRatingValue"
			
		});
	
		});
	</script>
	
	
	<form:input path="scoreType" class="form-control" />
	content<form:input path="content" class="form-control" />
  
  	<input id="commentPhoto1" name="commentPhoto1"  type="file" class="form-control" onchange="preview()"/>
    
    <img id="image" src="" width="100px" height="100px" />
				<c:if test="${comment.commentPhoto!=null}">
					<img id="oldImage" src="${comment.commentPhoto}" width="100px" height="100px" />
				</c:if>
    
    <br/>
    <input type="submit" name="submit" value="更新">
  
  </form:form>
  
  
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

</div>


<jsp:include page="layout/footer.jsp" />



</body>
</html>