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

<table class="table table-hover"style="width:100%;table-layout:fixed;">
  <thead>
    <tr>
      <th scope="col">品項</th>
      <th scope="col">店家</th>
      <th scope="col">價格</th>
      <th scope="col">圖片</th>
      <th scope="col">溫度</th>
      <th scope="col">狀態</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td>Otto</td>
      <td>Otto</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
       <td>@fat</td>
        <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td >Larry the</td>
      <td>@twitter</td>
      <td>Otto</td>
      <td>Otto</td>
      <td>Otto</td>
    </tr>
  </tbody>
</table>

</body>

</html>


<jsp:include page="layout/footer.jsp" />