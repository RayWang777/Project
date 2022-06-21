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

<h1>新增評價</h1>


<div class="container">


<div class="row justify-content-center">
<div class="col-9">
	<h1>新增訊息頁面</h1>
<div class="card">
  <div class="card-header">
    請輸入新留言
  </div>
  <div class="card-body">
  
  <form:form class="form" method="post" action="${contextRoot}/backend/comment/insert" modelAttribute="commentBean">
  
<div class="form-group">
	
	userid<form:input path="userBean" class="form-control" />
	storeid<form:input path="storeBean" class="form-control" />
	productid<form:input path="productBean" class="form-control" />
	score<form:input path="score" class="form-control" />
	<div id=score class="awesomeRating"></div>
	<input class="awesomeRatingValue" />
	
	<script type="text/javascript">
	
		$("#score").awesomeRating({
			
			valueInitial: "$(".")",
			values: ["1.0", "2.0", "3.0", "4.0", "5.0"],
			targetSelector: "input.awesomeRatingValue"
		});
	
		console.log(${comment.score});
	</script>
	
	<form:input path="scoreType" class="form-control" />
	content<form:input path="content" class="form-control" />
	
</div>    
    
    <input type="submit" name="submit" value="新增訊息	">
  
  </form:form>
  
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