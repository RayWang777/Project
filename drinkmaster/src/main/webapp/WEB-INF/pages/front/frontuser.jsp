<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/header.jsp"></jsp:include>


<style>
.shape-ex6{
    width: 200px;
    height: 200px;
    max-width:  100%;
    
    display: block;
    position: relative;
    font-size: 0;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -10%);
    
    border-radius:50%;
    border: 2px solid;
    overflow:hidden;
}
.shape-ex6-block{
    width: 100%; 
    height: 100%;
    position: absolute;
    text-align: center;
    overflow:hidden;
    
    margin: 0 auto;
}
.shape-ex6-block:before{
    content: ''; 
    display: inline-block;
    height: 100%;
    width: 0;
    vertical-align: middle;
    overflow:hidden;
}
.shape-ex6-img{
    max-width: 100%; 
    max-height: 100%;
    width: auto;
    height: auto;
    display: inline-block;
    vertical-align: middle;
    overflow:hidden;
}
.py-555 {
  padding-top: 10px !important;
  padding-bottom: 10px !important;
}
</style>

<header class="bg-dark py-555" style="padding-bottom: 5px">
	<div class="container px-4 px-lg-5 my-5">
		<div class="text-center text-white">
			<div class="shape-ex6">
			<div class="shape-ex6-block">
				<img class="shape-ex6-img" src="data:image/jpg;base64,<c:out value='${canSeeUser.byteArrayString}'/>"/>
			</div>
			</div>
			<h1 class="display-4 fw-bolder">${canSeeUser.userName}</h1>
			<p class="lead fw-normal text-white-50 mb-0">${canSeeUser.userAccount}</p>
		</div>
	</div>
</header>
<body>
	<div>
		${canSeeUser.userAccount}
	</div>
	
	
	
	
	
	
</body>



<jsp:include page="layout/footer.jsp"></jsp:include>