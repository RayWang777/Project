<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div class="row justify-content-center">
 <div class="col-5">
<h1>意見回覆</h1>
</div>
</div>
<div class="container">

  <c:forEach var="workMessage" items="${page.content}">
     <div class="row justify-content-center">
  <div class="col-6">
   
  <div class="card">
    <div class="card-header">
      最新意見回饋(時間)  <fmt:formatDate pattern="yyyy 年 MM 月 dd 日 hh:mm:ss a EEEE" value="${workMessage.answerTime}" />
    </div>
    <div class="card-body">
      <c:out value="${workMessage.answer}" />
      <br/><br/>
      <div class="edit-link">
      
      <c:choose>
    	<c:when test="${workMessage.status=='ok'}">
        <button class="btn btn-secondary btn-lg" disabled>已回覆</button>
    	</c:when>
    	<c:otherwise>
        <a href="${contextRoot}/backend/service/postreply?serviceId=${workMessage.serviceId}"><button id="noreply" class="btn btn-lg btn-primary">未回覆</button></a>
    	</c:otherwise>
	  </c:choose>
        
      </div>   
    </div>
  </div>
  </div>
  </div>
  <br />
  </c:forEach>

 <div class="row justify-content-center">
  <div class="col-6">
   <c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
   
   <c:choose>
     <c:when test="${page.number != pageNumber-1}">
        <a href="${contextRoot}/backend/service/reply?p=${pageNumber}"><c:out value="${pageNumber}" /></a>
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
