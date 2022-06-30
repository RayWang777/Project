<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<link href="<c:url value="/js/lib/popper.min.js"/>" rel="stylesheet">
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
	<c:url value="/backend/firm/banner/add" var="add_url" />
	<c:if test="${error == null }">
	<a href="${add_url}"><button type="button" class="btn btn-success">新增Banner</button></a>
	</c:if>
	<c:if test="${error != null }"><button type="button" class="btn btn-warning" style="color:blue;"><c:out value="${error}"/></button></c:if>


	<table class="table table-hover"
		style="width: 100%; table-layout: fixed;">
		<thead>
			<tr>
				<th style="width: 50px;"><label class="control control--checkbox">
						<input type="checkbox" class="js-check-all" />
				</label></th>
				<th style="width: 300px;text-align: center;">廠商名稱</th>
				<th scope="col">Banner</th>
				
				<th style="width: 140px;text-align: left;">動作</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${firmBanners.content}" var="firmBanner">
				<tr scope="row">
					<td class="align-middle"><label
						class="control control--checkbox"><input type="checkbox"
							id="check" value="<c:out value='${firmBanner.id}'/>"
							style="margin-top: 20px;" />
						</label></td>
						
					<td class="align-middle" style="text-align: center;"><c:out value="${firmBanner.firmBean.firmName}"/></td>	
					
					<td class="align-middle"><img
						src="<c:url value="/backend/firm/banner/${firmBanner.firmBean.firmId}"/>"
						style="width: 500px; height: 270px;"></td>
					<td class="align-middle" style="width: 13%;"><c:url
							value="/backend/firm/banner/edit/${firmBanner.id}" var="edit_url" /> <a
						href="${edit_url}"><button type="button"
								class="btn btn-primary">編輯</button></a> <c:url
							value="/backend/firm/banner/delete/${firmBanner.id}" var="delete_url" />
						<a href="${delete_url}" onclick="return confirm('真的要刪除嗎')"><button
								type="button" class="btn btn-danger">刪除</button></a></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<div class="row justify-content-center" style="font-size: x-large;">
		<c:forEach var="pageNumber" begin="1" end="${firmBanners.totalPages}">
			<c:choose>
				<c:when test="${firmBanners.number!=pageNumber-1}">
				&nbsp;<a
						href="${contextRoot}/backend/firm/banner/all?p=${pageNumber}"><c:out
							value="${pageNumber}" /></a>&nbsp;
				</c:when>
				<c:otherwise>
					&nbsp;<c:out value="${pageNumber}"></c:out>&nbsp;
				</c:otherwise>
			</c:choose>
			&nbsp;<c:if test="${pageNumber!= firmBanners.totalPages }">|</c:if>&nbsp;
		</c:forEach>
	</div>
	<div class="row justify-content-center"
		style="font-size: large; color: black;">
		<c:out value="總共有 ${firmBanners.totalElements} 筆資料"></c:out>
	</div>

</body>

<script src="<c:url value="/js/lib/popper.min.js"/>"></script>
<script src="<c:url value="/js/lib/main.js"/>"></script>

<jsp:include page="layout/footer.jsp" />