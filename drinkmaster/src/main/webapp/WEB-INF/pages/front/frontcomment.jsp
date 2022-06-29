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

<h1>全部評價</h1>


<div class="container">


<div class="row justify-content-center">
<div class="col-9">
	<h1>全部訊息頁面</h1>
<div class="card">
  <div class="card-header">
<!--    <span style="font-size: 1.5em">評論</span> -->
  </div>
  <div class="card-body">
  
  
  	<c:if test="${empty userBean}">
  				登入後可評論~
 	</c:if>
  
  
	<c:if test="${not empty userBean}">
	
 <c:choose>
  	
  	<c:when test="${not empty findusId}">
  	

    <c:forEach  var="usercomment" items="${findusId}" >
  		
  		<div class="row justify-content-center">
<div class="col-9">

<div class="card">

<span style="font-size: 1.5em">你的評論</span>
  <div class="card-header">
		<c:out value="${usercomment.storeBean.storeName}"></c:out>
  </div>
  <div class="card-body">
  	<c:out value="${usercomment.userBean.userName}"></c:out>
  	<c:out value="${usercomment.userBean.userId}"></c:out>
  	<br/>
  	
  	
  	
  	<div style="pointer-events: none" id="scores${usercomment.commentId}" class="awesomeRating"></div>
	<div class="awesomeRatingValue"></div>
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
  		
  		
  		
<%--   		<c:out value="${usercomment.userBean.userName}" /> --%>
  		
  		  </div>
</div>
</div>
</div>
  		
  		</c:forEach>

    
    
    </c:when>
  	
  	<c:otherwise>
  	
  	<form:form class="form" method="post" action="${contextRoot}/front/comment" modelAttribute="commentBean" enctype="multipart/form-data">
  	
  		
  		 <input type="submit" name="submit" value="撰寫評論">
  		
  	</form:form>
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

<div class="row justify-content-center">
<div class="col-9">

<div class="card">
  <div class="card-header">
    最新留言(時間) <fmt:formatDate pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss EEEE" value="${lastestComment.createTime}" />
  </div>
  <div class="card-body">
  
	<c:out value="${lastestComment.content}"></c:out>
  
  </div>
</div>
</div>
</div>


</div>


<jsp:include page="layout/footer.jsp" />



</body>
</html>