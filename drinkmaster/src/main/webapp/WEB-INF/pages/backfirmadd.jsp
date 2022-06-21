<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<c:set var="userId" value="1"></c:set>

<div class="content">

	<div class="container">
		<br> <br>
		<h2 class="mb-4" style="text-align: center;">${firmsave}</h2>

		<div class="row justify-content-center">

			<c:url value="/backend/firm/add" var="link_url"/>
			<form:form class="form" action="${link_url}" method="post" modelAttribute="firm" enctype="multipart/form-data">
				<form:hidden path="firmId" id="firmId"/>
				<div class="mb-3">
					<label for="firmName" class="form-label">廠商名稱</label>
					<form:input path="firmName" class="form-control" type="text"
						id="firmName" />
					<span id=firmNameSp></span>
				</div>

				<div class="mb-3">
					<label for="firmAddress" class="form-label">廠商地址</label>
					<form:input path="firmAddress" class="form-control" type="text"
						id="firmAddress" />
					<span id=firmAddressSp></span>
				</div>

				<div class="mb-3">
					<label for="firmPhone" class="form-label">廠商電話</label>
					<form:input path="firmPhone" class="form-control" type="text"
						id="firmPhone" />
					<span id=firmPhoneSp></span>
				</div>
				
				<div class="mb-3">
					<label for="userId" class="form-label">使用者</label>
					<form:input path="userId" class="form-control" type="text"
						id="userId" value="${userId}"/>
					<span id=firmPhoneSp></span>
				</div>

				<div class="mb-4">
					<label for="reallogo" class="form-label">Logo</label>
					<input name="reallogo" class="form-control" type="file"
						id="reallogo" onchange="preview()" />
					<span id=firmLogoSp><c:url value="${errors.firmLogo}"/></span>
				</div>

				<div class="mb-3"style="text-align: center;">
					<img id="logo" src="<c:url value="/backend/firm/${firm.firmId}/photo"/>" width="100px" height="100px" />
					<c:if test="${firm.firmId!=null}">
					<img id="oldlogo" src="<c:url value="/backend/firm/${firm.firmId}/photo"/>"width="100px" height="100px"/>
					</c:if>
				</div>
				
				<div class="mb-3" style="text-align: center;">
					<input type="submit" class="btn btn-success" value='<c:out value="${firmsave}"/>'>
				</div>
			</form:form>


		</div>

	</div>
</div>

<script type="text/javascript">

$(function(){
	$('#logo').hide();
});

function preview() {
	logo.src=URL.createObjectURL(event.target.files[0]);
	if ( (event.target.files[0].type).startsWith("image")){
		$('#oldlogo').hide();
		$('#logo').show();
	} 
}


</script>



<jsp:include page="layout/footer.jsp" />