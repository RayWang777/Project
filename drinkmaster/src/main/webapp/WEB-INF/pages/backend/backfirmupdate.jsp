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
		<h2 class="mb-4" style="text-align: center;">修改廠商</h2>

		<div class="row justify-content-center">

			
			<form:form class="form" method="post" modelAttribute="firm" enctype="multipart/form-data">
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
				
				<c:choose>
				<c:when test="${userBean.role == 'admin'}">
				
				<div class="mb-3">
					<label for="selectuserId" class="form-label">管理者</label>
					<form:select id="selectuserId" path="userBean.userId" class="form-control" >
					
					<c:forEach items="${firmaddusers}" var="firmadduser">
					 <c:choose>
					  <c:when test="${firmadduser.userId == originUserId }">
					  	<option value="${firmadduser.userId}" selected="true">${firmadduser.userName}</option>
					  </c:when>
					  <c:otherwise>
					  	<option value="${firmadduser.userId}">${firmadduser.userName}</option>
					  	</c:otherwise>
					  </c:choose>					 					
					</c:forEach>
					</form:select>
					<form:hidden path="userId" value="${originUserId}" />
					<span id=firmPhoneSp></span>
				</div>
				
				</c:when>
				<c:otherwise>
					<form:select hidden="true" path="userBean.userId"
						class="form-control">

						<form:options items="${firmaddusers}" itemLabel="userName"
							itemValue="userId" />
					</form:select>
				
					<form:hidden path="userId" value="${userBean.userId}" />
				</c:otherwise>
				</c:choose>
				
				
				<div class="mb-3"style="text-align: center;">
					<img id="logo" src="<c:url value="/backend/firm/${firm.firmId}/photo"/>" width="100px" height="100px" />
					<c:if test="${firm.firmId!=null}">
					<img id="oldlogo" src="<c:url value="/backend/firm/${firm.firmId}/photo"/>"width="100px" height="100px"/>
					</c:if>
				</div>

				<div class="mb-4">
					<label for="reallogo" class="form-label">Logo</label>
					<input name="reallogo" class="form-control" type="file"
						id="reallogo" onchange="preview()" />
					<span id=firmLogoSp><c:url value="${errors.firmLogo}"/></span>
				</div>

				<div class="mb-3" style="text-align: center;">
					<input type="submit" class="btn btn-success" value='<c:out value="修改廠商"/>'>
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


$('#selectuserId').click(function() {

	var selected = $('#selectuserId').val()
	console.log(selected)
	$('#userId').val(selected);

})

</script>



<jsp:include page="layout/footer.jsp" />