<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div class="row justify-content-center">
	<h2>新增商品種類</h2>
</div>
<div class="container">


	<div class="row justify-content-center">

		<div>
			<form:form class="form" method="post" 
				action="${contextRoot}/backend/${insert}" modelAttribute="category">
				<form:hidden path="productCategoryId" id="productCategoryId" />

				<label for="productName">商品種類</label>
				<form:input type="text" path="productCategoryName" id="productCategoryName"
					name="productCategoryName" onblur="check()" />
				<span id="name">${errors.name}</span>
				
				
				<label for="storeBean">店家</label>
				<form:input path="storeBean" id="storeBean" name="storeBean" />
				<br>
				<br>
				<div class="row justify-content-center">
					<input type="submit" name="submit" value="確定新增"
						onclick="checkname()">
				</div>
			</form:form>



		</div>

	</div>
</div>
<script type="text/javascript">
	function check() {
		let thename = document.getElementById("name");
		let productCategoryName = document.getElementById("productCategoryName");
				let nname = productCategoryName.value;
		
		console.log(pprice);
		if (nname == "" || nname.length == 0) {
			thename.innerHTML = "請輸入商品種類";
		} else {
			thename.innerHTML = "";
		}
	}
</script>


<jsp:include page="layout/footer.jsp" />