<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		<h2 class="mb-2">廠商列表</h2>
		
		<c:url value="/backend/firm/add" var="add_url"/>
		<a href="${add_url}"><button type="button" class="btn btn-success">新增廠商</button></a>

		<div class="table-responsive">
			<table class="table table-striped custom-table">
				<thead style="vertical-align: middle;">
					<tr>
						<th></th>
						<th scope="col"><label class="control control--checkbox">
								<input type="checkbox" class="js-check-all" />
								<div class="control__indicator"></div>
						</label></th>
						<th scope="col">廠商名稱</th>
						<th scope="col">廠商電話</th>
						<th scope="col">廠商地址</th>
						<th scope="col" style="width: 0.6%;">Logo</th>
						<th scope="col" style="text-align: left;">動作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${firms.content}" var="firm">

						<tr scope="row">
							<th></th>
							<td class="align-middle"><label
								class="control control--checkbox"><input type="checkbox"
									id="check" value="<c:out value='${firm.firmId}'/>"
									style="margin-top: 20px;" />
									<div class="control__indicator"></div></label></td>
							<td class="align-middle">
								<div class="d-flex align-items-center">
									<a href="#"><c:out value='${firm.firmName}' /></a>
								</div>
							</td>
							<td class="align-middle"><c:out value='${firm.firmPhone}' />
							</td>
							<td class="align-middle"><c:out value='${firm.firmAddress}' /></td>
							<td class="align-middle"><img
								src="<c:url value="/backend/firm/${firm.firmId}/photo"/>"
								style="width: 100px; height: 100px;"></td>
							<td class="align-middle" style="width: 13%;">
							<a href="${edit_url}"><button	type="button" class="btn btn-primary">編輯</button></a>
							<c:url value="/backend/firm/delete/${firm.firmId}" var="delete_url"/>
							<a href="${delete_url}"><button type="button" class="btn btn-danger">刪除</button></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<br/>
					<div style="text-align: center;color:black;font-size: medium;">
						<c:forEach begin="1" end="${firms.totalPages}" var="p">
							<c:choose>
								<c:when test="${p==firms.number+1}">
									<span style="color: blue;"><c:out value="${p}" /></span>
								</c:when>
								<c:otherwise>
									<a href="<c:url value="/backend/firm/all?p=${p}"/>"><c:out value="${p}" /></a>
								</c:otherwise>
							</c:choose>
							<c:if test="${p!=firms.totalPages}">
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