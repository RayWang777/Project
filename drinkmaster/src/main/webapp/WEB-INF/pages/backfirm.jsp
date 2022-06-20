<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<body>
	<form action="${contextRoot}/backend/product/select" method="get">
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">搜尋</label> <input
				type="text" class="form-control" name="select" />

		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>


	<table class="table table-hover"
		style="width: 100%; table-layout: fixed;">
		<thead>
			<tr>
				<th scope="col"><label class="control control--checkbox">
						<input type="checkbox" class="js-check-all" />
						<div class="control__indicator"></div>
				</label></th>
				<th scope="col">廠商名稱</th>
				<th scope="col">廠商電話</th>
				<th scope="col">廠商地址</th>
				<th scope="col">Logo</th>
				<th scope="col" style="text-align: left;">動作</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${firms.content}" var="firm">

				<tr scope="row">
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
					<td class="align-middle" style="width: 13%;"><c:url
							value="/backend/firm/edit/${firm.firmId}" var="edit_url" /> <a
						href="${edit_url}"><button type="button"
								class="btn btn-primary">編輯</button></a> <c:url
							value="/backend/firm/delete/${firm.firmId}" var="delete_url" /> <a
						href="${delete_url}" onclick="return confirm('真的要刪除嗎')"><button
								type="button" class="btn btn-danger">刪除</button></a></td>
				</tr>
			</c:forEach>







		</tbody>
	</table>
	<div class="row justify-content-center" style="font-size: x-large;">
		<c:forEach var="pageNumber" begin="1" end="${firms.totalPages}">
			<c:choose>
				<c:when test="${firms.number!=pageNumber-1}">
					<a href="${contextRoot}/backend/product/all?p=${pageNumber}"> <c:out
							value="${pageNumber}" />
					</a>
				</c:when>
				<c:otherwise>
					<c:out value="${pageNumber}"></c:out>
				</c:otherwise>
			</c:choose>
			<c:if test="${pageNumber!= firms.totalPages }">
   |
   </c:if>
		</c:forEach>
	</div>
	<div class="row justify-content-center"
		style="font-size: large; color: black;">
		<c:out value="總共有 ${firms.totalElements }筆資料"></c:out>
	</div>
</body>

<script src="<c:url value="/js/lib/popper.min.js"/>"></script>
<script src="<c:url value="/js/lib/main.js"/>"></script>

<jsp:include page="layout/footer.jsp" />