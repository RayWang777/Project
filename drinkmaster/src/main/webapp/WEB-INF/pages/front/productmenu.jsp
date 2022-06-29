<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/header.jsp"></jsp:include>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<section class="py-5">
<c:forEach var="category" items="${category}">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<div class="col mb-5">
				<div class="card h-100">
					<div class="card-body p-8">
						<h5 class="fw-bolder" style="color: navy;"><c:out value="${category.productCategoryName }"></c:out></h5>
					</div>
					<div><b>紅茶</b></div>
				</div>
			</div>
			
	</div>
	</div>
	</c:forEach>
</section>

























<jsp:include page="layout/footer.jsp"></jsp:include>