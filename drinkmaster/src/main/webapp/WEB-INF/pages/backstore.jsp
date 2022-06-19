<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<style>
.table {
	font-size: 20px;
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

<div class="content">

	<div class="container">
		<br> <br>
		<h2 class="mb-2">店家列表</h2>
		
		<c:url value="/backend/store/add" var="add_url"/>
		<a href="${add_url}"><button type="button" class="btn btn-success">新增店家</button></a>

		<div class="table-responsive">
			<table class="table table-striped custom-table">
				<thead style="vertical-align: middle;">
					<tr>
						<th></th>
						<th scope="col"><label class="control control--checkbox">
								<input type="checkbox" class="js-check-all" />
								<div class="control__indicator"></div>
						</label></th>
						<th scope="col">店家名稱</th>
						<th scope="col">店家電話</th>
						<th scope="col">店家地址</th>
						<th scope="col">開店時間</th>
						<th scope="col" style="text-align: left;">動作</th> 
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${stores.content}" var="store">

						<tr scope="row">
							<th></th>
							<td class="align-middle"><label
								class="control control--checkbox"><input type="checkbox"
									id="check" value="<c:out value='${store.storeId}'/>"
									style="margin-top: 20px;" />
									<div class="control__indicator"></div></label></td>
							<td class="align-middle">
								<div class="d-flex align-items-center">
									<a href="#"><c:out value='${store.storeName}' /></a>
								</div>
							</td>
							<td class="align-middle"><c:out value='${store.storePhone}' />
							</td>
							<td class="align-middle"><c:out value='${store.storeAddress}' /></td>
							<td class="align-middle"><c:out value='${store.openTime}' /></td>
							<input type="hidden" id="latitude" value="${store.latitude}"/>
							<input type="hidden" id="longitude" value="${store.longitude}"/>
							<td class="align-middle" style="width: 13%;">
							<c:url value="/backend/store/edit/${store.storeId}" var="edit_url"/>
							<a href="${edit_url}"><button	type="button" class="btn btn-primary">編輯</button></a>
							<c:url value="/backend/store/delete/${store.storeId}" var="delete_url"/>
							<a href="${delete_url}"><button type="button" class="btn btn-danger">刪除</button></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<br/>
					<div style="text-align: center;color:black;font-size: medium;">
						<c:forEach begin="1" end="${stores.totalPages}" var="p">
							<c:choose>
								<c:when test="${p==stores.number+1}">
									<span style="color: blue;"><c:out value="${p}" /></span>
								</c:when>
								<c:otherwise>
									<a href="<c:url value="/backend/store/all?p=${p}"/>"><c:out value="${p}" /></a>
								</c:otherwise>
							</c:choose>
							<c:if test="${p!=stores.totalPages}">
							|
							</c:if>
						</c:forEach>
					</div>
			</div>
	</div>
</div>



<script src="<c:url value="/js/lib/popper.min.js"/>"></script>
<script src="<c:url value="/js/lib/main.js"/>"></script>

<jsp:include page="layout/footer.jsp" />