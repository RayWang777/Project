<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

</head>
<body>
<br>
<p>
<a href="${contextRoot}/backend/order/findAll"><button type="button" class="btn btn-outline-dark btn-sm">訂單列表</button></a>&emsp;
</p>
<div>
	
<table class="table table-hover"style="width:100%;table-layout:fixed;">
  <thead>
    <tr>
      <th scope="col"><label class="control control--checkbox">
						<input type="checkbox" class="js-check-all" />
						<div class="control__indicator"></div>
	</label></th>
      <th scope="col">storeID</th>
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
      <td><c:out value="${orderBean.storeBean.storeId}"/></td>
      <td><c:out value="${orderBean.shopCarBean.shopCarId}"/></td>

      <td>
      <a href="${contextRoot}/backend/order/edit?id=${orderBean.orderId}"><button class="btn btn-outline-primary btn-sm">編輯</button></a>
        <a onclick="return confirm('確定要刪除嗎?')"  href="${contextRoot}/backend/order/delete?id=${orderBean.orderId}"><button class="btn btn-outline-danger btn-sm">刪除</button></a></td>
      </tr>
    </c:forEach>
 
  </tbody>
</table>

</div>   
    

</body>

</html>
<script src="<c:url value="/js/lib/popper.min.js"/>"></script>
<script src="<c:url value="/js/lib/main.js"/>"></script>

<jsp:include page="layout/footer.jsp" />