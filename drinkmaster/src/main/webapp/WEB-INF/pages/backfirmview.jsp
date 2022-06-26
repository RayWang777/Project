<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<style>

input+select{
width:306px;
}


</style>


<div class="content">

	<div class="container">
		<br> <br>
		<h2 class="mb-4" style="text-align: center;">修改廠商</h2>

		<div class="row justify-content-center">

			<c:url value="/backend/firm/edit/${firm.firmId}" var="link_url" />
			<form:form class="form" method="post" action="${link_url}" modelAttribute="firm" enctype="multipart/form-data">
				<form:hidden path="firmId" id="firmId"/>
				<div class="mb-3">
					<label for="firmName" class="form-label">廠商名稱</label>
					<form:input disabled="true" path="firmName" class="form-control" type="text"
						id="firmName" />
					<span id=firmNameSp></span>
				</div>

				<div class="mb-3">
					<label for="firmAddress" class="form-label">廠商地址</label>
					<form:input disabled="true" path="firmAddress" class="form-control" type="text"
						id="firmAddress" />
					<span id=firmAddressSp></span>
				</div>

				<div class="mb-3">
					<label for="firmPhone" class="form-label">廠商電話</label>
					<form:input disabled="true" path="firmPhone" class="form-control" type="text"
						id="firmPhone" />
					<span id=firmPhoneSp></span>
				</div>
				
				<div class="mb-3">
					<label for="selectuserId" class="form-label">管理者</label>
					<form:select disabled="true" id="selectuserId" path="userBean.userId"
						class="form-control">

						<form:options items="${firmaddusers}" itemLabel="userName"
							itemValue="userId" />
					</form:select>
					<form:hidden path="userId" value="1" />
					<span id=firmPhoneSp></span>
				</div>
								
				<div class="mb-3"style="text-align: center;">
					<img id="logo" src="<c:url value="/backend/firm/${firm.firmId}/photo"/>" width="100px" height="100px" />
					<c:if test="${firm.firmId!=null}">
					<img id="oldlogo" src="<c:url value="/backend/firm/${firm.firmId}/photo"/>"width="100px" height="100px"/>
					</c:if>
				</div>

				<div class="mb-4" id="imgall">
					<label for="reallogo" class="form-label">Logo</label>
					<input name="reallogo" class="form-control" type="file"
						id="reallogo" onchange="preview()" />
					<span id=firmLogoSp><c:url value="${errors.firmLogo}"/></span>
				</div>
				<c:if test="${userBean.role =='admin' }">

				<div class="mb-3" style="text-align: center;">
					<input id="readyupdate" type="button" class="btn btn-primary" value='<c:out value="編輯"/>'>
					<input id="toupdate" type="submit" class="btn btn-success" value='<c:out value="修改廠商"/>'>
				</div>
				</c:if>
			</form:form>


		</div>

	</div>
</div>

<script type="text/javascript">

$(function(){
	$('#logo').hide();
	$('#imgall').hide();
	$('#toupdate').hide();
	
});

function preview() {
	logo.src=URL.createObjectURL(event.target.files[0]);
	if ( (event.target.files[0].type).startsWith("image")){
		$('#oldlogo').hide();
		$('#logo').show();
	} 
}


$('#selectuserId').click(function() {

	var selected = $('#selectuserId').val()
	console.log(selected)
	$('#userId').val(selected);

})

$('#readyupdate').click(function(){
	$('#firmName').prop('disabled',false);
	$('#firmAddress').prop('disabled',false);
	$('#firmPhone').prop('disabled',false);
	$('#selectuserId').prop('disabled',false);
	$('#imgall').show();
	
	$('#toupdate').show();
	$('#readyupdate').hide();

	
	
})

</script>



<jsp:include page="layout/footer.jsp" />