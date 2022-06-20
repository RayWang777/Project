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
<script type="text/javascript" src="${contextRoot}/js/lib/knockout-3.1.0.js"></script>
<script type="text/javascript" src="${contextRoot}/js/lib/awesomeRating.knockout.min.js"></script>

<script src="${contextRoot}/js/lib/awesomeRating.min.js"></script>
<style type="text/css">
/* font-face{font-family:'FontAwesome';src:url('../fonts/fontawesome-webfont.eot?v=4.3.0');src:url('../fonts/fontawesome-webfont.eot?#iefix&v=4.3.0') format('embedded-opentype'),url('../fonts/fontawesome-webfont.woff2?v=4.3.0') format('woff2'),url('../fonts/fontawesome-webfont.woff?v=4.3.0') format('woff'),url('../fonts/fontawesome-webfont.ttf?v=4.3.0') format('truetype'),url('../fonts/fontawesome-webfont.svg?v=4.3.0#fontawesomeregular') */
/* .fa-star:before{content:"\f005"}.fa-star-o:before{content:"\f006"}.fa-star-half-o:before{content:"\f123"} */
/* .fa-star-half-full:before.fa-star-half-empty:before.fa-star-half:before{content:"\f089"} */
html, body { 
 	width: 100%; 
	margin: 0; 
 	padding: 0; 
 } 

 div.awesomeRating { 
 	font-size: 4em; 
	padding: 1em 0em; 
 	text-align: center; 
 } */

 div.awesomeRatingValue { 
 	font-size: 2em; 
	padding: 1em 0em; 
 	text-align: center; 
} 
</style>



<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>所有評價</h1>


<div class="container">


<c:forEach  var="comment" items="${page.content}">

<div class="row justify-content-center">
<div class="col-9">

<div class="card">
  <div class="card-header">
		<c:out value="${comment.storeBean.storeName}"></c:out>
  </div>
  <div class="card-body">
  	<c:out value="${comment.userBean.userName}"></c:out>
  	<br/>
  	<div class="awesomeRating" data-bind=" awesomeRating: rating, awesomeRatingOptions: options" ></div>
 	<div class="scores" ><c:out value="${comment.score}"></c:out></div>
<script type="text/javascript">
		$(function() {
			var model = {
				rating : ko.observable("${comment.score}"),
				options : {
					values: ["1.0", "2.0", "3.0", "4.0", "5.0"],
					targetSelector: 'span.awesomeRatingValue'
				}
			};

			ko.applyBindings(model);
		});
	</script>


<%--  	${comment.score} --%>
 	
 	<div class="awesomeRatingValue">
		<span class="awesomeRatingValue" data-bind="text: &#39;Value: &#39; + rating()">Value: E</span>
	</div>
 	
 	
 	<span class="awesomeRatingValue"></span>
	<br/>
	<c:out value="${comment.content}"></c:out>
	<br/>
	(時間) <fmt:formatDate pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss EEEE" value="${comment.createTime}" />
	<div class="edit-link">
		<a href="${contextRoot}/backend/comment/editComment?commentid=${comment.commentId}"><button class="btn btn-primary">編輯</button></a>
		<a onclick="return confirm('真的要刪除嗎?')" href="${contextRoot}/backend/comment/delete?commentid=${comment.commentId}"><button class="btn btn-danger">刪除</button></a>
	</div>
	
  
  </div>
</div>
</div>
</div>

</c:forEach>

<div class="row justify-content-center">
	<div class="col-9">
		<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
		
		<c:choose>
			<c:when test="${page.number != pageNumber-1}" >
			
				<a href="${contextRoot}/backend/comment/all/?p=${pageNumber}" > <c:out value="${pageNumber}" /></a>
			
			</c:when>
		
			<c:otherwise>
				<c:out value="${pageNumber}" />
			</c:otherwise>	
		
		</c:choose>
		
		<c:if test="${page.totalPages != pageNumber}">
			|
		</c:if>
			
		
		</c:forEach>

	</div>
</div>


</div>



<jsp:include page="layout/footer.jsp" />


</body>
</html>