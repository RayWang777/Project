<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
<style>
</style>

</head>
<body>
	<form action="${contextRoot}/backend/category/select" method="get">
		<div class="mb-3">
			<label for="select" class="form-label">搜尋</label> <input type="text"name="select" id="select" /> 
				<select name="filed">
				<option>種類</option>
				<c:if test="${userBean.role != 'store'}">
				<option>店家</option>
				</c:if>
			</select>
		<button type="submit" class="btn btn  btn-sm" style="font-style:italic;color:blue;">查詢</button>
		<c:out value="查到 ${page.totalElements }筆資料"></c:out>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<c:if test="${userBean.role == 'store'}">
		<a class="btn btn-link btn-sm" href="${contextRoot}/backend/prodcuct/insertcategory" role="button">新增商品種類</a>
		</c:if>
		</div >
		
	</form>
	<table class="table table-hover"
		style="width: 100%; table-layout: fixed;  border-bottom: 10px double #E0E0E0	;">
		<thead>
			<tr>
				<th scope="col"style="text-align:center;">商品種類</th>				
				<th scope="col"style="text-align:center;">店家</th>
				<c:if test="${userBean.role != 'firm'}">
				<th scope="col" style="text-align: center;">功能</th>
				</c:if>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="productCategoryBean" items="${page.content}">
				<tr>
					<th scope="row" style="text-align:center;"><b><c:out value="${productCategoryBean.productCategoryName}"  /></b></th>
					
					<td style="text-align:center;"><c:out value="${productCategoryBean.storeBean.storeName}" /></td>
					
					<td style="text-align:center;">
					<c:if test="${userBean.role == 'store'}">
							<a
								href="${contextRoot}/backend/editcategory?id=${productCategoryBean.productCategoryId}"><button
									class="btn btn-outline-primary btn-sm">編輯</button></a>
						</c:if><a
						onclick="return confirm('真的要刪除嗎')"
						href="${contextRoot}/backend/deletecategory?id=${productCategoryBean.productCategoryId}"><button
								class="btn btn-outline-danger btn-sm">刪除</button></a></td>
								
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<c:if test="${past=='2' }">
	<div class="row justify-content-center" style="font-size: 23px;">
		<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
			
				<c:if test="${page.number!=pageNumber-1 && page.number>=pageNumber-5}">
					<a href="${contextRoot}/backend/category/select?p=${pageNumber}&select=${select}&filed=${filed}"
						style="color: #84C1FF"><b> <c:out value="${pageNumber}" />
					</b></a>
				</c:if>
				<c:if test="${page.number==pageNumber-1 }">
				<c:out value="${pageNumber}"></c:out>
					</c:if>
			
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</c:forEach>
	</div>
</c:if>
<c:if test="${past=='1' }">
	<div class="row justify-content-center col mb-5" style="font-size: 23px;">
		<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
			
				<c:if test="${page.number!=pageNumber-1 && page.number>=pageNumber-5}">
					<a href="${contextRoot}/backend/category/all?p=${pageNumber}"
						style="color: #84C1FF"><b> <c:out value="${pageNumber}" />
					</b></a>
				</c:if>
				<c:if test="${page.number==pageNumber-1 }">
					<c:out value="${pageNumber}"></c:out>
				</c:if>
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</c:forEach>
	</div>
</c:if>

	
</body>

</html>


<jsp:include page="layout/footer.jsp" />