<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<style>
.table {
	font-size: 16px;
}
  a:link
        {
            color: black;
        }
        a:visited
        {
            color: black;
        }
        a:hover
        {
            color: red;
        }
        a:active
        {
            color: black;
        }
</style>

<body>
	<br>
	<c:url value="/backend/store/add" var="add_url"/>
	<a href="${add_url}"><button type="button" class="btn btn-success">新增店家</button></a>
		<br> <br>
			<table class="table table-striped custom-table">
				<thead style="vertical-align: middle;">
					<tr>
						<th scope="col" style="width: 50px;"><label class="control control--checkbox">
								<input type="checkbox" class="js-check-all" /></div>
						</label></th>
						<th style="width: 130px;text-align: left;">廠商名稱</th>
						<th style="width: 280px;text-align: left;">店家名稱</th>
						<th style="width: 180px;text-align: left;">店家電話</th>
						<th style="width: 480px;text-align: left;">店家地址</th>
						<th scope="col">開店時間</th>
						<th scope="col">管理者</th>
						<th scope="col">位置</th>
						<th style="width: 140px;text-align: left;">動作</th> 
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${stores.content}" var="store">
						<tr>
							<td class="align-middle"><label
								class="control control--checkbox"><input type="checkbox"
									id="check" value="<c:out value='${store.storeId}'/>"
									style="margin-top: 20px;" /></label></td>
							<td class="align-middle"><c:out value='${store.firmBean.firmName}' /></td>
							<td class="align-middle"><c:out value='${store.storeName}' /></td>
							<td class="align-middle"><c:out value='${store.storePhone}' /></td>
							<td class="align-middle"><c:out value='${store.storeAddress}' /></td>
							<td class="align-middle"><c:out value='${store.openTime}' /></td>
							<td class="align-middle"><c:out value='${store.userBean.userName}'/></td>
							<input type="text" hidden="true" id="latitude" value="${store.latitude}"/>
							<input type="text" hidden="true" id="longitude" value="${store.longitude}"/>
							<td class="align-middle">詳細</td>
							<td class="align-middle">
								<c:url value="/backend/store/edit/${store.storeId}" var="edit_url"/>
								<a href="${edit_url}"><button	type="button" class="btn btn-primary">編輯</button></a>
								<c:url value="/backend/store/delete/${store.storeId}" var="delete_url"/>
								<a href="${delete_url}" onclick="return confirm('真的要刪除嗎')"><button type="button" class="btn btn-danger">刪除</button></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<br/>
			
				<div class="row justify-content-center" style="font-size: x-large;">
		<c:forEach var="pageNumber" begin="1" end="${stores.totalPages}">
			<c:choose>
				<c:when test="${stores.number!=pageNumber-1}">
				&nbsp;<a
						href="${contextRoot}/backend/store/all?p=${pageNumber}"><c:out value="${pageNumber}" /></a>&nbsp;
				</c:when>
				<c:otherwise>
					&nbsp;<c:out value="${pageNumber}"></c:out>&nbsp;
				</c:otherwise>
			</c:choose>
			&nbsp;<c:if test="${pageNumber!= stores.totalPages }">|</c:if>&nbsp;
		</c:forEach>
	</div>
	<div class="row justify-content-center"
		style="font-size: large; color: black;">
		<c:out value="總共有 ${stores.totalElements} 筆資料"></c:out>
	</div>
			
</body>
<script src="<c:url value="/js/lib/popper.min.js"/>"></script>
<script src="<c:url value="/js/lib/main.js"/>"></script>

<jsp:include page="layout/footer.jsp" />