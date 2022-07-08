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



<div class="container">


<div class="row justify-content-center">
<div class="col-9">
	<h1 style="text-align:center">新增評論</h1>
<div class="card">
  <div class="card-header">
    請輸入新評論
  </div>
  <div class="card-body">
  
  <form:form class="form" method="post" action="${contextRoot}/backend/comment/insert" modelAttribute="commentBean" enctype="multipart/form-data">
  
<div class="form-group">
	
	使用者id<form:input id="commentuserid" path="userBean" class="form-control" />
	店家id<form:input id="commentstoreid" path="storeBean" class="form-control" />
	<form:input id="commentproductid" path="productBean" class="form-control" type="hidden"/>
	分數<form:input id="score1" path="score" class="form-control" style="pointer-events: none" />
	
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
	
	
	<form:input id="commentscoretypeid" path="scoreType" class="form-control"/>
	評論<form:input id="commentcontent" path="content" class="form-control" />
	
	<br/>
	
	<input id="commentPhoto1" name="commentPhoto1"  type="file" class="form-control" onchange="preview()" />

		<img id="image" src="" width="100px" height="100px" />
	<c:if test="${comment.commentId!=null}">
					<img id="oldImage" src="${comment.commentPhoto}" width="100px"
						height="100px" />
	</c:if>
	
	
</div>    
    
    <input type="submit" name="submit" value="新增訊息">&nbsp;&nbsp;<button onclick="add()">一鍵輸入</button>
    
  
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
	
	
	
	function add() {
		let commentuserid = document.getElementById("commentuserid");
		let commentstoreid = document.getElementById("commentstoreid");
		let commentcontent = document.getElementById("commentcontent");
		let commentproductid = document.getElementById("commentproductid");
		let commentscoretypeid = document.getElementById("commentscoretypeid");
		
		commentuserid.value=("10");
		commentstoreid.value=("1");
		commentcontent.value=("這家推");
		commentproductid.value=("44");
		commentscoretypeid.value=("10");
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