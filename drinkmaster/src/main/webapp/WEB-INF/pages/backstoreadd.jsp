<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<c:set var="userfirmid" scope="session" value="1"></c:set>
<div class="content">

	<div class="container">
		<br> <br>
		<h2 class="mb-4" style="text-align: center;">${save}</h2>

		<div class="row justify-content-center">

			<c:url value="/backend/store/add" var="link_url"/>
			<form:form class="form" action="${link_url}" method="post" modelAttribute="store">
			
				<form:hidden path="firmId" id="firmId" value="${userfirmid}"/>
			
				<form:hidden path="storeId" id="storeId"/>
				<div class="mb-3">
					<label for="storeName" class="form-label">店家名稱</label>
					<form:input path="storeName" class="form-control" type="text"
						id="storeName" />
					<span id=storeNameSp></span>
				</div>

				<div class="mb-3">
					<label for="storeAddress" class="form-label">店家地址</label>
					<form:input path="storeAddress" class="form-control" type="text"
						id="storeAddress" />
					<span id=storeAddressSp></span>
				</div>

				<div class="mb-3">
					<label for="storePhone" class="form-label">店家電話</label>
					<form:input path="storePhone" class="form-control" type="text"
						id="storePhone" />
					<span id=storePhoneSp></span>
				</div>

				<div class="mb-4">
					<label for="openTime" class="form-label">開店時間</label>
					<form:input path="openTime" class="form-control" type="text"
						id="openTime"/>
					<span id=openTimeSp></span>
				</div>
					<form:input path="latitude" class="form-control" type="text"
						id="latitude"/>
					<form:input path="longitude" class="form-control" type="text"
						id="longitude"/>
				<div class="mb-3" style="text-align: center;">
					<input type="submit" class="btn btn-success" value='<c:out value="${save}"/>'>
				</div>
			</form:form>


		</div>

	</div>
</div>

<script type="text/javascript">

$(function(){

});

</script>



<jsp:include page="layout/footer.jsp" />