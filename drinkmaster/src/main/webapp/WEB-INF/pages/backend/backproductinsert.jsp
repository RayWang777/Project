<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div class="row justify-content-center">
	<h2><c:out value="${now}"></c:out></h2>
</div>
<div class="container">


	<div style="margin-left: 420px">

		<div>
			<form:form class="form" method="post" enctype="multipart/form-data"
				action="${contextRoot}/backend/${insert}" modelAttribute="product">
				<form:hidden path="productId" id="productId" />

				<label for="productName">商品</label>
				<form:input type="text" path="productName" id="productName"
					name="productName" onblur="check()" />
				<span style="color: red" id="name">${errors.name}</span>
				<br>
				<br>
				<label for="productCategoryBean">商品種類</label>
				<select  id="select" name="select">
				<c:forEach var="productCategoryBean" items="${productcategory1}">
				<c:choose>
					<c:when test="${product.productCategoryBean.productCategoryId == productCategoryBean.productCategoryId}">
					<option  selected="selected" value="${productCategoryBean.productCategoryId}">${productCategoryBean.productCategoryName}</option>
					</c:when>
					<c:otherwise>
					<option value="${productCategoryBean.productCategoryId}">${productCategoryBean.productCategoryName}</option>
				</c:otherwise></c:choose>
				</c:forEach>
				</select>
				
					<br>
					<br>
				<label for="price"> 價格</label>
				<form:input path="price" id="price" name="price" onblur="check1()" />
				<span id="price1" style="color: red">${errors.price1}</span>
				<br>
				<br>
				<label for="productImage"> 圖片</label>
				<form:input path="productImage" id="productImage"
					name="productImage" type="file" onchange="preview()" />
				<img id="image" src="" width="100px" height="100px" />
				<c:if test="${product.productId!=null&&product.productImage!=null}">
					<img id="oldImage" src="${product.productImage}" width="100px"
						height="100px" />
				</c:if>
				<br>
				<br>
				<label for="coldHot">溫度</label>
				<form:select path="coldHot" id="coldHot" name="coldHot">
					<form:option value="冷"></form:option>
					<form:option value="熱"></form:option>
					<form:option value="冷熱"></form:option>
				</form:select>
				<br>
				<br>
				<label for="status">狀態</label>
				<form:select path="status" id="status" name="status">
					<form:option value="true">上架中</form:option>
					<form:option value="false">已下架</form:option>
				</form:select>



				<br>
				<br>
				<div style="margin-left: 75px">
					<input type="submit" name="submit" value="${status}"
						onclick="checkname()">
						<c:if test="${now=='新增商品'}">
						<a  href="${contextRoot}/backend/autoinput" style="margin-left: 30px">一鍵輸入</a>
						</c:if>
				</div>
			</form:form>



		</div>

	</div>
</div>
<script type="text/javascript">
	$(function() {
		$('#image').hide();
	});

	function preview() {
		image.src = URL.createObjectURL(event.target.files[0]);
		if ((event.target.files[0].type).startsWith("image")) {
			$('#oldImage').hide();
			$('#image').show();
		}
	}
</script>
<script>
	function check() {
		let thename = document.getElementById("name");
		
		let productName = document.getElementById("productName");
		
		let nname = productName.value;
	
		
		if (nname == "" || nname.length == 0) {
			thename.innerHTML = "請輸入商品";
		} else {
			thename.innerHTML = "";
		}
	}
</script>
<script>
	function check1() {
	
		let theprice = document.getElementById("price1");
		let price = document.getElementById("price");
		
		let pprice = price.value;
		
		if (pprice < 0 || pprice == "") {
			theprice.innerHTML = "請輸入正確金額"
		} else {
			theprice.innerHTML = "";

		}
	}
</script>


<jsp:include page="layout/footer.jsp" />