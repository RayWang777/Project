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
<a href="${contextRoot}/backend/shopCar/insertView"><button type="button" class="btn btn-success btn-sm">新增購物車</button></a>
</p>		
<table class="table table-hover"style="width:100%;table-layout:fixed;">
  <thead>
    <tr>
      <th scope="col"><label class="control control--checkbox">
						<input type="checkbox" class="js-check-all" />
						<div class="control__indicator"></div>
	</label></th>
      <th scope="col">購物車編號</th>
      <th scope="col" style="width: 170px;">成立時間</th>
      <th scope="col">數量</th>
      <th scope="col">冰塊</th>
      <th scope="col">甜度</th>
      <th scope="col">狀態</th>
      <th scope="col">  </th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="shopCarBean" items="${page.content}">
    <tr scope="row">
					<td class="align-middle"><label
						class="control control--checkbox"><input type="checkbox"
							id="check" value="<c:out value='${shopCarBean.shopcarId}'/>"
							style="margin-top: 20px;" />
							<div class="control__indicator"></div></label></td>
    
      <th scope="row"><c:out value="${shopCarBean.shopcarId}"/></th>
      <td><fmt:formatDate  value="${shopCarBean.createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
      <td><c:out value="${shopCarBean.productAmount}"/></td>
      <td><c:out value="${shopCarBean.ice}"/></td>
      <td><c:out value="${shopCarBean.sweet}"/></td>
      <td><c:out value="${shopCarBean.status}"/></td>
      <td><a href="${contextRoot}/backend/shopCar/edit?id=${shopCarBean.shopcarId}"><button class="btn btn-outline-primary btn-sm">編輯</button></a>
        <a onclick="return confirm('確定要刪除嗎?')"  href="${contextRoot}/backend/shopCar/delete?id=${shopCarBean.shopcarId}"><button class="btn btn-outline-danger btn-sm">刪除</button></a></td>
      </tr>
    </c:forEach>
 
  </tbody>
</table>
<div class="row justify-content-center" style="font-size: x-large;">
  <c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
   <c:choose>
   <c:when test="${page.number!=pageNumber-1}">
   <a href="${contextRoot}/backend/shopCar/findAll?s=${pageNumber}"> <c:out value="${pageNumber}" /> </a>
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