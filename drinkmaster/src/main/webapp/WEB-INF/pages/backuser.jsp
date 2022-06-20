<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<form class="form-inline" action="${contextRoot}/backend/user/select" method="get">
	<div class="mb-3">
		<label for="select" class="form-label">搜尋</label>
		<input type="text" class="form-control" name="select"/>
	</div>
	<button type="submit" class="btn btn-primary">送出</button>
</form>

<table class="table table-hover" style="width:100%;table-layout:fixed;">
	<thead>
		<tr>
			<th scope="col">姓名</th>
			<th scope="col">帳號</th>
			<th scope="col">地址</th>
			<th scope="col">手機</th>
			<th scope="col">性別</th>
			<th scope="col">生日</th>
			<th scope="col">功能</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="userBean" items="${page.content}">
		<tr>
			<td scope="row"><c:out value="${userBean.userName}"/></td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<jsp:include page="layout/footer.jsp" />