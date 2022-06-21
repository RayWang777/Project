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
<br/>

<div class="container">

  <c:forEach var="workMessage" items="${page.content}">
     <div class="row justify-content-center">
  <div class="col-9">
   
  <div class="card">
    <div class="card-header">
      最新訊息(時間)  <fmt:formatDate pattern="yyyy 年 MM 月 dd 日 hh:mm:ss a EEEE" value="${workMessage.answerTime}" />
    </div>
    <div class="card-body">
      <c:out value="${workMessage.answer}" />
      
      <div class="edit-link">
        <a href="${contextRoot}/backend/serviceedit?serviceId=${workMessage.serviceId}"><button class="btn btn-info">編輯</button></a>
        <a onclick="return confirm('確認要刪除嗎?')"  href="${contextRoot}/backend/servicedelete?serviceId=${workMessage.serviceId}"><button class="btn btn-danger">刪除</button></a>
      </div>
      
    </div>
  </div>
  
  </div>
  
  </div>
  
  <br />
  </c:forEach>

 <div class="row justify-content-center">
  <div class="col-9">
   <c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
   
   <c:choose>
     <c:when test="${page.number != pageNumber-1}">
        <a href="${contextRoot}/message/all?p=${pageNumber}"><c:out value="${pageNumber}" /></a>
     </c:when>
   
     <c:otherwise>
       <c:out value="${pageNumber}" />
     </c:otherwise>
   </c:choose>
   
   <c:if test="${pageNumber != page.totalPages}">
   |
   </c:if>
     
   </c:forEach>
  </div>
 </div>

</div>
</body>
</html>
<jsp:include page="layout/footer.jsp" />
