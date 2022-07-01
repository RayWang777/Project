<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/header.jsp"></jsp:include>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<body style="background-color: #F2FCFF;">
 <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">商家介紹</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
                </div>
            </div>
        </header>
<section class="py-5"><div class="container px-4 px-lg-0 mt-5" >
	<div
			class="row gx-4 gx-lg-10 row-cols-2 row-cols-md-3 row-cols-xl-3 j">
<c:forEach var="categoryBean" items="${category}">
	
		
			<div class="col mb-5" >
				<div class="card h-100" style=" border:#ECECEC; padding: 10px ;background-color: #F2FCFF; ">
					<div >
						<h3 class="fw-bolder" style="color: #3C6FA1;"><c:out value="${categoryBean.productCategoryName }"></c:out></h3>
					</div>
					<c:forEach var="productBean" items="${categoryBean.products}">
					<div style="font-size: large; border-bottom : 2px inset #C0C0C0; height: 52px ;"class="align-middle">
					<a href="#" style="color: black;text-decoration:none;">
					<c:if test="${productBean.productImage!=null}">
					<img
						src="${productBean.productImage}" style="width: 60px " height="50px" /></c:if>&nbsp;&nbsp;
						<b><c:out value="${productBean.productName}"></c:out></b>
						&nbsp;&nbsp;
						<c:if test="${productBean.status=='false' }">
						
						<i class="fa-solid fa-ban" style="color: red; font-size: xx-small;"></i>
						</c:if>
						
						<c:if test="${productBean.coldHot=='熱' || productBean.coldHot=='冷熱'}">
						<span style="position: absolute; right: 70px; margin-top: 10px;color: #FF4D00 ">
						<i class="fa-brands fa-hotjar" style="color: #FF4D00; "></i>
						<c:out value="${productBean.price}"/></span></c:if>
						<c:if test="${productBean.coldHot=='冷' || productBean.coldHot=='冷熱'}">
						<span style="position: absolute; right: 10px; margin-top: 10px;color: #2894FF"><i class="fa-regular fa-snowflake" style="color: #2894FF"></i>
						<c:out value="${productBean.price}"></c:out></span></c:if>
						</a>
						</div>
						
						
					</c:forEach>
				</div>
			</div>
			
	
	
	</c:forEach>
	</div>
	</div>
</section>



<br><br><br><br>













</body>







<jsp:include page="layout/footer.jsp"></jsp:include>