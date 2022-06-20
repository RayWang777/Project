<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
<style>

</style>

</head>
<body>
<br>
<p>
<a href="${contextRoot}/backend/order/insertview"><button type="button" class="btn btn-success btn-sm">新增廠商</button></a>
</p>		
<table class="table table-hover"style="width:100%;table-layout:fixed;">
  <thead>
    <tr>
      <th scope="col"><label class="control control--checkbox">
						<input type="checkbox" class="js-check-all" />
						<div class="control__indicator"></div>
	</label></th>
      <th scope="col">訂單編號</th>
      <th scope="col" style="width: 170px;">訂單時間</th>
      <th scope="col">地址</th>
      <th scope="col">電話</th>
      <th scope="col">狀態</th>
      <th scope="col">總金額</th>
      <th scope="col">  </th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="orderBean" items="${page.content}">
    <tr scope="row">
					<td class="align-middle"><label
						class="control control--checkbox"><input type="checkbox"
							id="check" value="<c:out value='${orderBean.orderId}'/>"
							style="margin-top: 20px;" />
							<div class="control__indicator"></div></label></td>
    
      <th scope="row"><c:out value="${orderBean.orderId}"/></th>
      <td><fmt:formatDate  value="${orderBean.createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
      <td><c:out value="${orderBean.orderAddress}"/></td>
      <td><c:out value="${orderBean.orderPhone}"/></td>
      <td><c:out value="${orderBean.orderStatus}"/></td>
      <td><c:out value="${orderBean.totalPrice}"/></td>
      <td><a href="${contextRoot}/backend/order/edit?id=${orderBean.orderId}"><button class="btn btn-outline-primary btn-sm">編輯</button></a>
        <a onclick="return confirm('確定要刪除嗎?')"  href="${contextRoot}/backend/order/delete?id=${orderBean.orderId}"><button class="btn btn-outline-danger btn-sm">刪除</button></a></td>
      </tr>
    </c:forEach>
 
  </tbody>
</table>
<div class="row justify-content-center" style="font-size: x-large;">
  <c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
   <c:choose>
   <c:when test="${page.number!=pageNumber-1}">
   <a href="${contextRoot}/backend/order/findAll?o=${pageNumber}"> <c:out value="${pageNumber}" /> </a>
   </c:when>
   <c:otherwise>
   <c:out value="${pageNumber}"></c:out>
   </c:otherwise>
   </c:choose> 
   <c:if test="${pageNumber!= page.totalPages }">
   |
   </c:if>
   </c:forEach>
   </div>
   <div  class="row justify-content-center" style="font-size: large; color:black;">
   <c:out value="總共有 ${page.totalElements }筆資料"></c:out>
   </div>
</body>

</html>
<script src="<c:url value="/js/lib/popper.min.js"/>"></script>
<script src="<c:url value="/js/lib/main.js"/>"></script>

<jsp:include page="layout/footer.jsp" />