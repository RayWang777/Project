<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<!-- <p> -->


<%-- <a href="${contextRoot}/backend/service/postreply?status=ok"><button type="button" class="btn btn-outline-dark btn-sm">未回覆</button></a>&emsp; --%>
<%-- <a href="${contextRoot}/backend/service/postreply?serviceId='已回覆'"><button type="button" class="btn btn-outline-dark btn-sm">已回覆</button></a>&emsp; --%>

<!-- </p> -->



<table class="table table-hover" style="width:100%;table-layout:fixed;">
	<thead>
		<tr>
			<th scope="col">
			<label class="control control--checkbox">
				<input type="checkbox" class="js-check-all"/>
			</label>
			</th>
			<th scope="col">UserID</th>
			<th scope="col">姓名</th>
			<th scope="col">Email信箱</th>
			<th scope="col">意見內容</th>
			<th scope="col">意見回饋時間</th>
			<th scope="col" style="text-align: left;">功能</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="workMessage" items="${page.content}">
		<tr>
			<td class="align-middle">
			<label class="control control--checkbox">
				<input type="checkbox" id="check" value="<c:out value='${workMessage.userBean.userId}'/>"
					style="margin-top:20px;"/>
			</label>
			</td>
			<td class="align-middle"><div class="d-flex align-items-center">
				<a href="#"><c:out value="${workMessage.userBean.userId}"/></a>
			</div></td>
			<td class="align-middle"><div class="d-flex align-items-center">
				<a href="#"><c:out value="${workMessage.userBean.userName}"/></a>
			</div></td>
			<td class="align-middle"><div class="d-flex align-items-center">
				<c:out value="${workMessage.userBean.userAccount}"/>
			</div></td>
			<td class="align-middle"><div class="d-flex align-items-center">
			   <c:out value="${workMessage.answer}"/>
			</div></td>
			<td class="align-middle"><div class="d-flex align-items-center">
				 <fmt:formatDate
       pattern="yyyy 年 MM 月 dd 日 hh:mm:ss a EEEE" value="${workMessage.answerTime}" />
			</div></td>
		
		<td class="align-middle" style="width: 13%;"><div class="d-flex align-items-center">
		
      <c:choose>
    	<c:when test="${workMessage.status=='ok'}">
        <button class="btn btn-secondary btn-sm" disabled>已回覆</button>
    	</c:when>
    	<c:otherwise>
        <a href="${contextRoot}/backend/service/postreply?serviceId=${workMessage.serviceId}"><button id="noreply" class="btn btn-sm btn-primary">未回覆</button></a>
    	</c:otherwise>
	  </c:choose>
	  
	  
        	</div>
			</td>


		</tr>
	</c:forEach>
	</tbody>
</table>






  <div class="row justify-content-center" style="font-size:23px;">
  <div class="col-6">
   <c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
   
   <c:choose>
     <c:when test="${page.number != pageNumber-1}">
        <a href="${contextRoot}/backend/service/reply?p=${pageNumber}" style="color:#84C1FF"><c:out value="${pageNumber}" /></a>
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
</body>
</html>
<jsp:include page="layout/footer.jsp" />
