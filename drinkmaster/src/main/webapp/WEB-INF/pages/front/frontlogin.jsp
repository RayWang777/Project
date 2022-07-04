<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

                <jsp:include page="layout/header.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>飲君子 登入</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
	


<style>
	.login-block {
		width: 1600px;
		height:500px;
		
		display: block;
	    position: relative;
	    top: 0%;
	    left: 50%;
	    transform: translate(-50%, 0%);
	    
	    margin-top: 100px;
	    margin-bottom: 100px;
	    border: 1px solid gray;
	    box-shadow: 12px 12px 12px gray;
	}
	
	.login-block-left{
 		width: 952px;
		height: 500px;
		float:left;
	}
	.login-block-left-img{
		width: 952px;
		height: 500px;
	}
	
	.login-block-right{
		width: auto;
		height: 500px;
		float: right;
		
		padding: 7% 120px 20px;
	}
	

	
</style>

        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextRoot}/css/lib/front/styles.css" rel="stylesheet" />
</head>

<body>
			
<div class="login-block">

	<div>
		<img class="login-block-left" src="http://localhost:8081/drinkmaster/images/front_login.png" />
	</div>
	
	<div class="login-block-right">
	 <form:form class="form-right" method="post" action="${contextRoot}/front/loginGo">
		<div class="mb-3">
			<label for="select" class="form-label">帳號</label>
			<input type="text" class="form-control" name="userAccount" id="userAccount" 
			placeholder="請輸入電子信箱" onblur="checkEmpty()"/>
			<span id="accErr"></span>
		</div>
		<div class="mb-3">
			<label for="select" class="form-label">密碼</label>
			<input type="password" class="form-control" name="userPassword" id="userPassword" placeholder="請輸入密碼"/>
		</div>
		<div>
			<form:errors path="pass" cssClass="error" />
		</div>
		<div class="mb-3 text-center">

		<button type="submit" id="buttonsubmitlogin" class="btn btn-success">登入</button>
		<a href="${contextRoot}/front/register">
			<button type="button" class="btn btn-secondary" style="margin-left: 10px">註冊</button>
		</a>

		</div>

		<div class="mb-3">
			<span><c:out value="${errorloginstr}"></c:out></span>
		</div>
		
	</form:form>
	
<!-- 		<button class="btn btn-light" onclick="admin()">admin帳密</button> -->
<!-- 		<button class="btn btn-light" onclick="firm()">firm帳密</button> -->
<!-- 		<button class="btn btn-light" onclick="store()">store帳密</button> -->
		<button class="btn btn-light text-white bg-white border-0" >admi帳密帳密密</button>
		<button class="btn btn-light" onclick="user()">使用者帳密</button>
		<button class="btn btn-light text-white bg-white border-0" >firmn</button>
		<button class="btn btn-light text-white bg-white border-0" >store帳</button>
		
	</div>
	
</div>


  <script src="${contextRoot}/js/lib/jquery.min.js"></script>
		<script src="${contextRoot}/js/lib/jquery.nanoscroller.min.js"></script>
		<!-- nano scroller -->
		<script src="${contextRoot}/js/lib/menubar/sidebar.js"></script>
		<script src="${contextRoot}/js/lib/preloader/pace.min.js"></script>
        
        <!-- Bootstrap core JS-->
        <script src="${contextRoot}/js/lib/front/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${contextRoot}/js/lib/front/scripts.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>



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
			
			$('#buttonsubmitlogin').trigger('click');
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

			$('#buttonsubmitlogin').trigger('click');
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
			$('#buttonsubmitlogin').trigger('click');
		})
}
function user() {
	let acc = document.getElementById("userAccount");
	let pwd = document.getElementById("userPassword");
	acc.value=("cindy1@gmail.com");
	pwd.value=("cindy9527");
	
	Swal.fire({
		  icon: 'success',
		  title: '使用者登入成功',
		  showConfirmButton: false,
		  timer: 2000
		}).then( ()=>{
			
			console.log('123')
			$('#buttonsubmitlogin').trigger('click');
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
		theacc.innerHTML="須符合email格式";
	}
}
</script>

</body>

