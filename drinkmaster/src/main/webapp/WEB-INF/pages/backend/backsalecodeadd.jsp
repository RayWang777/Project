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
		<h2 class="mb-4" style="text-align: center;">產生平台優惠券</h2>

		<div class="row justify-content-center">


			<form:form class="form" method="post"	modelAttribute="newSaleCode">
				<div hidden="true">
				<c:choose>
				<c:when test="${userBean.role == 'admin' }">
				<div class="mb-3">
					<label for="selectfirmId" class="form-label">廠商</label>
					<form:select id="selectfirmId" path="firmId"
						class="form-control">

						<form:options items="${firms}" itemLabel="firmName"
							itemValue="firmId" />
					</form:select>
					<form:hidden path="firmId" value="${firms[0].firmId}" />
					<span id=firmIdSp></span>
				</div>
				</c:when>
				<c:otherwise>
					<form:select path="firmId"	class="form-control">
						<option value="${firms[0].firmId}" selected="true">${firms[0].firmName}</option>
					</form:select>
					<form:hidden path="firmId" value="${firms[0].firmId}" />
				</c:otherwise>
				</c:choose>
			</div>

			
				<label for="discount" class="form-label">折扣</label>
				<div class="mb-3 input-group">
					<form:input path="discount" class="form-control" type="text"
						id="discount" />
					<span class="input-group-text">折(%)</span>
					<form:errors path="discount" cssClass="error"></form:errors>
					<span id=discountSp></span>
				</div>
				
				<label for="count" class="form-label">數量</label>
				<div class="mb-3 input-group">
					<input name="count" class="form-control" type="text"
						id="count" />
					<span class="input-group-text">筆</span>
					<input hidden="true" name="counterror" class="error"/>
					<span id=countSp></span>
				</div>
				
				
				
				
				<div class="mb-3">
				<label for="validDate" class="form-label">有效時間</label>
					<form:input path="validDate" class="form-control" type="date"
						id="validDate" value="${now}" />
				<form:errors path="validDate" cssClass="error"></form:errors>
					<span id=validDateSp></span>
				</div>
				<div class="mb-3" style="text-align: center;">
					<input type="submit" class="btn btn-success"
						value='<c:out value="產生折扣碼"/>'>
				</div>
			</form:form>

		</div>
			<button id="autoinput" type="button" class="btn btn-primary">折扣產生器</button>

	</div>
</div>

<script type="text/javascript">

$('#autoinput').click(function(){
	$('#discount').val('80');
	$('#count').val('10');
	
})



$('#selectfirmId').click(function() {

	var selected = $('#selectfirmId').val()
	console.log(selected)
	$('#firmId').val(selected);
})

</script>



<jsp:include page="layout/footer.jsp" />