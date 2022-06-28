<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<head>
<meta charset="UTF-8">
<title>飲君子後臺系統</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">



<link href="<c:url value="/css/lib/themify-icons.css"/>" rel="stylesheet">
<link href="<c:url value="/css/lib/menubar/sidebar.css"/>" rel="stylesheet">
<link href="<c:url value="/css/lib/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/css/style.css"/>" rel="stylesheet">




<style>
    li{
        font-size: large;
    }
</style>
</head>

<div class="login-form">
 <form:form class="form" method="post" action="${contextRoot}/backend/loginGo">
	<div class="mb-3">
		<label for="select" class="form-label">帳號</label>
		<input type="text" class="form-control" name="userAccount" id="userAccount" onblur="checkEmpty()"/>
		<span id="accErr"></span>
	</div>
	<div class="mb-3">
		<label for="select" class="form-label">密碼</label>
		<input type="text" class="form-control" name="userPassword" id="userPassword"/>
	</div>
	<div>
		<form:errors path="pass" cssClass="error" />
	</div>
	<div class="mb-3">
	<button type="submit" class="btn btn-primary">登入</button>
	<a href="${contextRoot}/backend/register"><button type="button" class="btn btn-light" style="margin-top: 10px">註冊</button></a>
	</div>
	<button onclick="admin()">admin帳密</button>
	<button onclick="firm()">firm帳密</button>
	<button onclick="store()">store帳密</button>
	<button onclick="user()">user帳密</button>
	<div class="mb-3">
		<span><c:out value="${errorloginstr}"></c:out></span>
	</div>
	
</form:form>
</div>

<<script type="text/javascript">
function admin() {
	let acc = document.getElementById("userAccount");
	let pwd = document.getElementById("userPassword");
	acc.value=("jerry@gmail.com");
	pwd.value=("jerry6666");
}
function firm() {
	let acc = document.getElementById("userAccount");
	let pwd = document.getElementById("userPassword");
	acc.value=("jerry2@gmail.com");
	pwd.value=("jerry6666");
}
function store() {
	let acc = document.getElementById("userAccount");
	let pwd = document.getElementById("userPassword");
	acc.value=("cindy@gmail.com");
	pwd.value=("cindy9527");
}
function user() {
	let acc = document.getElementById("userAccount");
	let pwd = document.getElementById("userPassword");
	acc.value=("jerry1@gmail.com");
	pwd.value=("jerry6666");
}

function checkEmpty(){
	
	//please input the test email to see is valid
	let strEmail = document.getElementById("userAccount");
	let theacc = document.getElementById("accErr");
	
	//Regular expression Testing
	emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
	 
	//validate ok or not
	if(strEmail.value.search(emailRule)!= -1){
		theacc.innerHTML="";
	}else{
        console.log(strEmail.value.search(emailRule));
		theacc.innerHTML="須符合email格式";
	}
}
</script>


<jsp:include page="layout/footer.jsp" />