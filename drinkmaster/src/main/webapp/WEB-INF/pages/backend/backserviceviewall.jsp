<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div class="container">
<div class="row justify-content-center">
 <div class="col-6">
<h1>意見編輯及刪除</h1>
</div>
</div>
</div>
<div class="container">

  <c:forEach var="workMessage" items="${page.content}">
     <div class="row justify-content-center">
  <div class="col-6">
   
  <div class="card">
 <div class="btn btn-info">
					UserID:
					 <c:out value="${workMessage.userBean.userId}" />
				</div>
				<br/>
				<div class="btn btn-info">
					姓名 :
					 <c:out value="${workMessage.userBean.userName}" />
				</div>
				<br/>
				<div class="btn btn-info">
					Email信箱 :
					<c:out value="${workMessage.userBean.userAccount}" />
				</div>
				<br/>
    <div class="btn btn-info">
      最新意見回饋(時間)  <fmt:formatDate
       pattern="yyyy 年 MM 月 dd 日 hh:mm:ss a EEEE" value="${workMessage.answerTime}" />
    </div>
    <div class="card-body">
      <c:out value="${workMessage.answer}" />
      <br/><br/>
      <div class="edit-link">
        <a href="${contextRoot}/backend/service/edit?serviceId=${workMessage.serviceId}"><button class="btn btn-info">編輯</button></a>
        <a onclick="return confirm('確認要刪除嗎?')"  href="${contextRoot}/backend/service/delete?serviceId=${workMessage.serviceId}"><button type="button" class="btn btn-danger">刪除</button></a>
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
        <a href="${contextRoot}/backend/service/viewall?p=${pageNumber}"><c:out value="${pageNumber}" /></a>
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
