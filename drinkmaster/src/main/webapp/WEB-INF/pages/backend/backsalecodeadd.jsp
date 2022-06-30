<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<style>
.error{
color:red;
}
</style>


<div class="content">

	<div class="container">
		<br> <br>
		<h2 class="mb-4" style="text-align: center;">新增店家</h2>

		<div class="row justify-content-center">


			<form:form class="form" method="post"	modelAttribute="newSaleCode">
				
				<c:choose>
				<c:when test="${userBean.role == 'admin' }">
				<div class="mb-3">
					<label for="selectfirmId" class="form-label">廠商</label>
					<form:select id="selectfirmId" path="firmId"
						class="form-control">

						<form:options items="${firms}" itemLabel="firmName"
							itemValue="firmId" />
					</form:select>
					<form:input path="firmId" value="${firms[0].firmId}" />
					<span id=firmIdSp></span>
				</div>
				</c:when>
				<c:otherwise>
					<form:select path="firmId"	class="form-control">
						<option value="${firms.firmId}" selected="true">${firms.firmName}</option>
					</form:select>
					<form:hidden path="firmId" value="${firms.firmId}" />
				</c:otherwise>
				</c:choose>


			
				<div class="mb-3">
					<label for="discount" class="form-label">折扣</label>
					<form:input path="discount" class="form-control" type="text"
						id="storeName" />
					<form:errors path="discount" cssClass="error"></form:errors>
					<span id=discountSp></span>
				</div>

				
				<div class="mb-3" style="text-align: center;">
					<input type="submit" class="btn btn-success"
						value='<c:out value="產生折扣碼"/>'>
				</div>
			</form:form>


		</div>

	</div>
</div>

<script type="text/javascript">

$('#selectfirmId').click(function() {

	var selected = $('#selectfirmId').val()
	console.log(selected)
	$('#firmId').val(selected);
})

</script>



<jsp:include page="layout/footer.jsp" />