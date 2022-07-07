<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<style>
span{
	color: #ae0000;
}
</style>
<div class="row justify-content-center">
</div>

<div class="container">

<h2 class="mb-4" style="text-align: center; margin-top: 20px" >修改會員資料</h2>

<div class="row justify-content-center">

<div>
   <form:form class="form" method="post" action="${contextRoot}/backend/user/update/${user.userId}" modelAttribute="user" enctype="multipart/form-data">
   	<form:hidden path="userId" id="userId"/>
       <form:label path="userName">名&emsp;&emsp;稱</form:label>
       <form:input path="userName" class="form-control" onblur="checkEmpty()" id="userName"/>
       <form:errors path="userName" cssClass="error" />
       <span id="nameError"></span><br><br>
       
       <form:label path="userAccount">帳&emsp;&emsp;號</form:label>
       <form:input path="userAccount" class="form-control"  onblur="checkEmpty()" id="account"/>
       <form:errors path="userAccount" cssClass="error" />
       <span id="accErr"></span><br><br>
       
       <form:label path="userPassword">密&emsp;&emsp;碼</form:label>
       <form:password value="${user.userPassword}" path="userPassword" class="form-control"/>
       <form:errors path="userPassword" cssClass="error" />
       <span id="passwordSp"></span><br/>  <br><br>
       
       <form:label path="userAddress">地&emsp;&emsp;址</form:label>
       <form:input path="userAddress" class="form-control" onblur="checkEmpty()" id="address"/>
       <form:errors path="userAddress" cssClass="error" />
       <span id="addErr"></span>  <br><br>
            
       <form:label path="phone">電&emsp;&emsp;話</form:label>
       <form:input path="phone" class="form-control" onblur="checkEmpty()" id="phone"/>
       <form:errors path="phone" cssClass="error" />
       <span id="phoneErr"></span>  <br><br>
       
       <form:label path="gender">性&emsp;&emsp;別</form:label>
       <select name="gender" required="required" class="form-control" onblur="checkEmpty()">
       		<option>男</option>
       		<option>女</option>
       </select>
       <form:errors path="gender" cssClass="error" />
       <span id="genderErr"></span>  <br><br>
       
       <form:label path="birthday">生&emsp;&emsp;日</form:label>
  		<form:input type="date" path="birthday" class="form-control" onblur="checkEmpty()"/>
<!--        <input type="date" name="birthday" id="birthday" class="form-control"/> -->
       <form:errors path="birthday" cssClass="error" />
       <span id="bdErr"></span>  <br><br>
       
       <form:label path="createdate">創建日期</form:label>
       <form:input path="createdate" class="form-control" id="createdate" readonly="true"/>
       <form:errors path="createdate" cssClass="error" /><br><br>
       
       <form:label path="role">職&emsp;&emsp;權</form:label>
       <select id="role" name="role" required="required" class="form-control">
       		<option value="admin">管理者</option>
       		<option value="firm">廠商</option>
       		<option value="store">店家</option>
       		<option value="user">一般會員</option>
       </select>
       <form:errors path="role" cssClass="error" />
       <span id="roleErr"></span>  <br><br>
       
       
		<div class="mb-4">
			<label for="reallogo" class="form-label">大&ensp;頭&ensp;貼</label>
			<input name="reallogo" class="form-control" type="file"
				id="photo" onchange="preview()" />
			<span id=firmLogoSp><c:url value="${errors.userPhoto}"/></span><br>
		</div>
	
		<div class="mb-3"style="text-align: center;">
			<img id="logo" src="<c:url value="/backend/user/${user.userId}/photo"/>" width="100px" height="100px" />
			<c:if test="${user.userId!=null}">
			<img id="oldlogo" src="<c:url value="/backend/user/${user.userId}/photo"/>"width="100px" height="100px"/>
			</c:if>
		</div>
       
       
       <div class="row justify-content-center" style="margin-bottom: 100px">
       	<input type="submit" class="btn btn-success" value='<c:out value="送出"/>'>
       </div>
   </form:form>
</div>
</div>
</div>

<script type="text/javascript">

$(function(){
	$('#logo').hide();
});

function preview() {
	logo.src=URL.createObjectURL(event.target.files[0]);
	if ( (event.target.files[0].type).startsWith("image")){
		$('#oldlogo').hide();
		$('#logo').show();
	} 
}

document.getElementById("userPassword").addEventListener("blur",checkPwd);
function checkPwd(){
    //取得userPassword元素
    let thePwdObj=document.getElementById("userPassword");
    console.log(thePwdObj);
    //取得userPassword元素值
    let thePwdObjVal=thePwdObj.value;
    console.log(thePwdObjVal);
    console.log(typeof thePwdObjVal);

    //判斷元素值是否為空白，密碼長度是否大於6
    //如果長度是否大於6，判斷是否包含字母、數字、特殊符號
    let sp=document.getElementById("passwordSp");
    let thePwdObjValLen=thePwdObjVal.length;
    let flag1=false,flag2=false,flag3=false;

    if(thePwdObjVal=="")
        sp.innerHTML="欄位不得為空"; 
    else if(thePwdObjValLen>=6){
        // sp.innerHTML=">=6";
        for(let i=0;i<thePwdObjValLen;i++){
            let ch=thePwdObjVal.charAt(i).toUpperCase();
            if(ch>="A" && ch<="Z")
                flag1=true;
            else if(ch>="0" && ch<="9")
                flag2=true;
            if(flag1 && flag2) break;
        }
        if(flag1 && flag2)
            sp.innerHTML="✅";
        else
            sp.innerHTML="欄位需含數字與英文";
    }else{
        sp.innerHTML="欄位不能小於6個字元";
    }     
}


function checkEmpty(){
	//please input the test email to see is valid
	let strEmail = document.getElementById("account");
	let theacc = document.getElementById("accErr");
	
	//Regular expression Testing
	emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
	 
	//validate ok or not
	if(strEmail.value.search(emailRule)!= -1){
		theacc.innerHTML="✅";
	}else{
        console.log(strEmail.value.search(emailRule));
		theacc.innerHTML="須符合email格式";
	}
	
    let thename = document.getElementById("nameError");
    let userName = document.getElementById("userName");
    let nname = userName.value;
    if (nname == "" || nname.length == 0) {
        thename.innerHTML = "請輸入名稱";
    } else {
        thename.innerHTML = "";
    }

    let theAdd = document.getElementById("addErr");
    let address = document.getElementById("address");
    let add = address.value;
    if (add == "" || add.length == 0) {
        theAdd.innerHTML = "請輸入地址";
    } else {
        theAdd.innerHTML = "";
    }

    let thePhone = document.getElementById("phoneErr");
    let phone = document.getElementById("phone");
    let pphone = phone.value;
    if (pphone == "" || pphone.length == 0) {
        thePhone.innerHTML = "請輸入電話";
    } else {
        thePhone.innerHTML = "";
    }
    let thegender = document.getElementById("genderErr");
    let gender = document.getElementById("gender");
    let gen = gender.value;
    if (gen == "" || gen.length == 0) {
        thegender.innerHTML = "請輸入性別";
    } else {
        thegender.innerHTML = "";
    }
    let theRole = document.getElementById("roleErr");
    let role = document.getElementById("role");
    let ro = role.value;
    if (ro == "" || ro.length == 0) {
        theRole.innerHTML = "請輸入職權";
    } else {
        theRole.innerHTML = "";
    }
    
    let theBD = document.getElementById("bdErr");
    let birthday = document.getElementById("birthday");
    let bd = birthday.value;
    if (bd == "" || bd.length == 0) {
    	theBD.innerHTML = "請選取生日";
    } else {
    	theBD.innerHTML = "";
    }

}

</script>

<jsp:include page="layout/footer.jsp" />