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
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, 0%);
	    
	    margin-top: 100px;
	    margin-bottom: 300px;
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
		
		padding: 7% 140px 20px;
	}
	
</style>
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
		<div class="mb-3">
		<button type="submit" class="btn btn-primary">登入</button>
		<a href="${contextRoot}/front/register"><button type="button" class="btn btn-light" style="margin-left: 10px">註冊</button></a>
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
	
</div>
</body>

<script type="text/javascript">
function admin() {
	let acc = document.getElementById("userAccount");
	let pwd = document.getElementById("userPassword");
	acc.value=("jerry@gmail.com");
	pwd.value=("jerry6666");
}
function firm() {
	let acc = document.getElementById("userAccount");
	let pwd = document.getElementById("userPassword");
	acc.value=("mary@gmail.com");
	pwd.value=("mary4317");
}
function store() {
	let acc = document.getElementById("userAccount");
	let pwd = document.getElementById("userPassword");
	acc.value=("mark1@gmail.com");
	pwd.value=("mark1234");
}
function user() {
	let acc = document.getElementById("userAccount");
	let pwd = document.getElementById("userPassword");
	acc.value=("cindy1@gmail.com");
	pwd.value=("cindy9527");
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


<jsp:include page="layout/footer.jsp"></jsp:include>