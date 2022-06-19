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
 	<c:out value="${comment.score}"></c:out>
	<br/>
	<c:out value="${comment.content}"></c:out>
	<br/>
	(時間) <fmt:formatDate pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss EEEE" value="${comment.createTime}" />
	<div class="edit-link">
		<a href="${contextRoot}/comment/editComment?commentid=${comment.commentId}"><button class="btn btn-warning">編輯</button></a>
		<a onclick="return confirm('真的要刪除嗎?')" href="${contextRoot}/comment/delete?commentid=${comment.commentId}"><button class="btn btn-danger">刪除</button></a>
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