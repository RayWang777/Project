<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<c:set var="userId" value="1"></c:set>


<style>

.error{
color:red;
}

</style>

<div class="content">

	<div class="container">
		<br> <br>
		<h2 class="mb-4" style="text-align: center;">新增廠商Banner</h2>

		<div class="row justify-content-center">

			<c:url value="/backend/firm/banner/add" var="link_url" />
			<form:form class="form" action="${link_url}" method="post"	modelAttribute="newBanner" enctype="multipart/form-data">
			
			
				<div class="mb-3">
					<label for="selectfirmId" class="form-label">廠商</label>
					<form:select id="selectfirmId" path="firmBean.firmId"
						class="form-control">

						<form:options items="${firms}" itemLabel="firmName"	itemValue="firmId" />
					</form:select>
					<form:hidden path="firmId" value="${firms[0].firmId}" />
					<span id=firmIdSp></span>
				</div>
							
				<div class="mb-4" style="text-align: center;">
					<img id="logo" src="<c:url value="/backend/firm/banner/${firm.firmId}"/>" width="1000px" height="450px" />
					<c:if test="${firm.firmId!=null}">
						<img id="oldlogo" src="<c:url value="/backend/firm/banner/${firm.firmId}"/>"	width="1000px" height="450px" />
					</c:if>
				</div>

				<div class="mb-4">
					<label for="reallogo" class="form-label">Logo</label>
					<input name="reallogo" class="form-control" type="file"
						id="reallogo" onchange="preview()" /> <span id=firmLogoSp><c:url
							value="${errors.firmLogo}" /></span>
				</div>

				<div class="mb-3" style="text-align: center;">
					<input type="submit" class="btn btn-success"
						value='<c:out value="新增廠商Banner"/>'>
				</div>
			</form:form>


		</div>

	</div>
</div>

<script type="text/javascript">
	$(function() {
		$('#logo').hide();
	});

	function preview() {
		logo.src = URL.createObjectURL(event.target.files[0]);
		if ((event.target.files[0].type).startsWith("image")) {
			$('#oldlogo').hide();
			$('#logo').show();
		}
	}
	
	$('#selectfirmId').click(function() {

		var selected = $('#selectfirmId').val()
		console.log(selected)
		$('#firmId').val(selected);

	})

</script>



<jsp:include page="layout/footer.jsp" />