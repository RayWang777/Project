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
<script src="${contextRoot}/js/lib/average-rating.min.js" type="text/javascript"></script>
<script src="${contextRoot}/js/lib/popper.min.js" type="text/javascript"></script>
<script src="${contextRoot}/js/lib/bootstrap.bundle.js" type="text/javascript"></script>



<style type="text/css">
.ratingBar {
  height: 30px;
}

#ratingBarOne {
  background-color: #ff6f31;
}

#ratingBarTwo {
  background-color: #ff9f02;
}

#ratingBarThree {
  background-color: #ffcf02;
}

#ratingBarFour {
  background-color: #88b131;
}

#ratingBarFive {
  background-color: #99cc00;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>所有評價</h1>


<div class="container">


<script>
const rating = [134055, 57472, 143135, 365957, 1448459]
average(rating)

console.log(average(rating));
</script>

<div id="ratingBarFive" class="ratingBar"></div>
<div id="ratingBarFour" class="ratingBar"></div>
<div id="ratingBarThree" class="ratingBar"></div>
<div id="ratingBarTwo" class="ratingBar"></div>
<div id="ratingBarOne" class="ratingBar"></div>



<select>
	<option selected>最新</option>
	<option>評分最高</option>
	<option>評分最低</option>
	<option>最早</option>

</select>


<!-- <div class="dropdown"> -->
<!--   <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-expanded="false"> -->
<!--     排序 -->
<!--   </button> -->
<!--   <div class="dropdown-menu" aria-labelledby="dropdownMenu2"> -->
<!--     <button class="dropdown-item" type="button">最新</button> -->
<!--     <button class="dropdown-item" type="button">評分最高</button> -->
<!--     <button class="dropdown-item" type="button">評分最低</button> -->
<!--     <button class="dropdown-item" type="button">評分最低</button> -->
<!--   </div> -->
<!-- </div> -->

<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-expanded="false">
    Dropdown
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
    <button class="dropdown-item" type="button">Action</button>
    <button class="dropdown-item" type="button">Another action</button>
    <button class="dropdown-item" type="button">Something else here</button>
  </div>
</div>




<script type="text/javascript">

	$()

</script>


<c:forEach  var="comment" items="${page}" >
<%-- <c:forEach  var="comment" items="${page.content}" > --%>

<div class="row justify-content-center">
<div class="col-9">

<div class="card">
  <div class="card-header">
		<c:out value="${comment.storeBean.storeName}"></c:out>
  </div>
  <div class="card-body">
  	<c:out value="${comment.userBean.userName}"></c:out>
  	<br/>
  	
  	
  	
  	<div style="pointer-events: none" id="scores${comment.commentId}" class="awesomeRating"></div>
	<div class="awesomeRatingValue"></div>
	<script type="text/javascript">
	
		$("#scores${comment.commentId}").awesomeRating({
			
			valueInitial: "${comment.score}",
			values: ["1.0", "2.0", "3.0", "4.0", "5.0"],
			targetSelector: "span.awesomeRatingValue"
		});
	
		console.log(${comment.score});
	</script>
	
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
<%-- 		<c:forEach var="pageNumber" begin="1" end="${page.totalPages}"> --%>
		
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${page.number != pageNumber-1}" > --%>
			
<%-- 				<a href="${contextRoot}/backend/comment/all/?p=${pageNumber}" > <c:out value="${pageNumber}" /></a> --%>
			
<%-- 			</c:when> --%>
		
<%-- 			<c:otherwise> --%>
<%-- 				<c:out value="${pageNumber}" /> --%>
<%-- 			</c:otherwise>	 --%>
		
<%-- 		</c:choose> --%>
		
<%-- 		<c:if test="${page.totalPages != pageNumber}"> --%>
<!-- 			| -->
<%-- 		</c:if> --%>
			
		
<%-- 		</c:forEach> --%>

	</div>
</div>


</div>



<jsp:include page="layout/footer.jsp" />


</body>
</html>