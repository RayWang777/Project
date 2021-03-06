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
		<h2 class="mb-4" style="text-align: center;">新增廠商</h2>

		<div class="row justify-content-center">

			<c:url value="/backend/firm/add" var="link_url" />
			<form:form class="form" action="${link_url}" method="post"
				modelAttribute="firm" enctype="multipart/form-data">
				<form:hidden path="firmId" id="firmId" />
				<div class="mb-3">
					<label for="firmName" class="form-label">廠商名稱</label>
					<form:input path="firmName" class="form-control" type="text"
						id="firmName" />
					<form:errors path="firmName" cssClass="error"></form:errors>
					<span id=firmNameSp></span>
				</div>

				<div class="mb-3">
					<label for="firmAddress" class="form-label">廠商地址</label>
					<form:input path="firmAddress" class="form-control" type="text"
						id="firmAddress" />
					<form:errors path="firmAddress" cssClass="error"></form:errors>
					<span id=firmAddressSp></span>
				</div>

				<div class="mb-3">
					<label for="firmPhone" class="form-label">廠商電話</label>
					<form:input path="firmPhone" class="form-control" type="text"
						id="firmPhone" />
					<form:errors path="firmPhone" cssClass="error"></form:errors>
					<span id=firmPhoneSp></span>
				</div>

				<div class="mb-3">
					<label for="selectuserId" class="form-label">管理者</label>
					<form:select id="selectuserId" path="userBean.userId"
						class="form-control">

						<form:options items="${firmaddusers}" itemLabel="userName"
							itemValue="userId" />
					</form:select>
					<form:hidden path="userId" value="${firmaddusers[0].userId}" />
					<span id=firmUserIdSp></span>
				</div>

				<div class="mb-4" style="text-align: center;">
					<img id="logo" src="<c:url value="/backend/firm/${firm.firmId}/photo"/>" width="100px" height="100px" />
					<c:if test="${firm.firmId!=null}">
						<img id="oldlogo" src="<c:url value="/backend/firm/${firm.firmId}/photo"/>"	width="100px" height="100px" />
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
						value='<c:out value="新增廠商"/>'>
				</div>
			</form:form>


		</div>
<button id="autoinput" type="button" class="btn btn-primary">廠商產生器</button>
	</div>
</div>

<script type="text/javascript">
	$('#autoinput').click(function(){
		
		$('#firmName').val('Sharetea');
		$('#firmAddress').val('台北市大安區復興南路一段');
		$('#firmPhone').val('0800-520-843');
		$('#firmAddress').val('台北市大安區復興南路一段');
	})




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

	$('#selectuserId').click(function() {

		var selected = $('#selectuserId').val()
		console.log(selected)
		$('#userId').val(selected);

	})
</script>



<jsp:include page="layout/footer.jsp" />