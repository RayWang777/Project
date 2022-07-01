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
    .backend-background{
    	background-image:url("http://localhost:8081/drinkmaster/images/back_BG.jpg");
    	background-size: cover;
	}
	.form-label{
		font-size:x-large;
		font-weight: bold;
	}
	.login-title {
	  background: rgba(0,0,0,0.9);
	  padding: 30px 30px 20px;
	  color: white;
	  font-size:x-large;
	  
	  width: 500px;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  margin: -185px 0 0 -250px;
	}
</style>
</head>


<body class="backend-background">

<div class="login-title">
	飲君子廠商管理後台登入
</div>

<div class="login-form">
 <form:form class="form" method="post" action="${contextRoot}/backend/loginGo">
	<div class="mb-3" style="text-align: center;">
		<label for="select" class="form-label" style="color:white;">帳號</label>
		<input type="text" class="form-control" name="userAccount" id="userAccount" 
		placeholder="請輸入電子信箱" onblur="checkEmpty()"/>
		<span id="accErr" style="color: white;"></span>
	</div>
	<div class="mb-3" style="text-align: center;">
		<label for="select" class="form-label" style="color:white;">密碼</label>
		<input type="password" class="form-control" name="userPassword" id="userPassword" placeholder="請輸入密碼"/>
	</div>
	<div>
		<form:errors path="pass" cssClass="error" />
	</div>
	<div class="mb-3">
	<button id="buttonsubmit" type="submit" class="btn btn-primary">登入</button>
	<a href="${contextRoot}/backend/register"><button type="button" class="btn btn-light" style="margin-left: 10px">註冊</button></a>
	</div>

	<div class="mb-3">
		<span><c:out value="${errorloginstr}"></c:out></span>
	</div>
	
</form:form>

	<button onclick="admin()">admin帳密</button>
	<button onclick="firm()">firm帳密</button>
	<button onclick="store()">store帳密</button>
	<button onclick="user()">user帳密</button>
	
</div>
</body>

<script src="<c:url value="/js/lib/jquery.min.js"/>"></script>
<script src="<c:url value="/js/lib/sweetalert2@11.js"/>"></script>
<script type="text/javascript">

$(function(){
	
	
	
})


function admin() {
	let acc = document.getElementById("userAccount");
	let pwd = document.getElementById("userPassword");
	acc.value=("jerry@gmail.com");
	pwd.value=("jerry6666");
	
	Swal.fire({
		  icon: 'success',
		  title: '管理者登入成功',
		  showConfirmButton: false,
		  timer: 2000
		}).then( ()=>{
			
			console.log('123')
			$('#buttonsubmit').trigger('click');
		})
		
}
function firm() {
	let acc = document.getElementById("userAccount");
	let pwd = document.getElementById("userPassword");
	acc.value=("mary@gmail.com");
	pwd.value=("mary4317");
	
	Swal.fire({
		  icon: 'success',
		  title: '廠商登入成功',
		  showConfirmButton: false,
		  timer: 2000
		}).then( ()=>{
			
			console.log('123')
			$('#buttonsubmit').trigger('click');
		})
	
}
function store() {
	let acc = document.getElementById("userAccount");
	let pwd = document.getElementById("userPassword");
	acc.value=("mark1@gmail.com");
	pwd.value=("mark1234");
	
	Swal.fire({
		  icon: 'success',
		  title: '店家登入成功',
		  showConfirmButton: false,
		  timer: 2000
		}).then( ()=>{
			
			console.log('123')
			$('#buttonsubmit').trigger('click');
		})
}
function user() {
	let acc = document.getElementById("userAccount");
	let pwd = document.getElementById("userPassword");
	acc.value=("cindy1@gmail.com");
	pwd.value=("cindy9527");
	Swal.fire({
		  icon: 'false',
		  title: '一般使用者無法登入',
		  showConfirmButton: false,
		  timer: 2000
		}).then( ()=>{
			
			console.log('123')
			$('#buttonsubmit').trigger('click');
		})
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
		theacc.innerHTML="⛔須符合email格式";
	}
}
</script>


