<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div class="row justify-content-center">
</div>

<div class="container">

<h2 class="mb-4" style="text-align: center; margin-top: 20px" >${usersave}</h2>

<div class="row justify-content-center">

<div>
   <form:form class="form" method="post" action="${contextRoot}/backend/user/insert" modelAttribute="user" enctype="multipart/form-data">
   	<form:hidden path="userId" id="userId"/>
       <form:label path="userName">姓&emsp;&emsp;名</form:label>
       <form:input path="userName" class="form-control"/>
       <form:errors path="userName" cssClass="error" /><br><br>
       
       <form:label path="userAccount">帳&emsp;&emsp;號</form:label>
       <form:input path="userAccount" class="form-control"/>
       <form:errors path="userAccount" cssClass="error" /><br><br>
       
       <form:label path="userPassword">密&emsp;&emsp;碼</form:label>
       <form:input path="userPassword" class="form-control"/>
       <form:errors path="userPassword" cssClass="error" />
       <span id="passwordSp"></span><br/>  <br><br>
       
       <form:label path="userAddress">地&emsp;&emsp;址</form:label>
       <form:input path="userAddress" class="form-control"/>
       <form:errors path="userAddress" cssClass="error" /><br><br>
            
       <form:label path="phone">電&emsp;&emsp;話</form:label>
       <form:input path="phone" class="form-control"/>
       <form:errors path="phone" cssClass="error" /><br><br>
       
       <form:label path="gender">性&emsp;&emsp;別</form:label>
       <form:input path="gender" class="form-control"/>
       <form:errors path="gender" cssClass="error" /><br><br>
       
       <form:label path="birthday">生&emsp;&emsp;日</form:label>
<%--   <form:input path="birthday" class="form-control"/> --%>
       <input type="date" name="birthday" id="birthday" class="form-control"/>
       <form:errors path="birthday" cssClass="error" /><br><br>
       
       <form:label path="createdate">創建日期</form:label>
       <form:input path="createdate" class="form-control" disabled="true" />
       <form:errors path="createdate" cssClass="error" /><br><br>
       
       <form:label path="role">職&emsp;&emsp;權</form:label>
       <form:input path="role" class="form-control"/>
       <form:errors path="role" cssClass="error" /><br><br>
       
       
		<div class="mb-4">
			<label for="reallogo" class="form-label">大&ensp;頭&ensp;貼</label>
			<input name="reallogo" class="form-control" type="file"
				id="reallogo" onchange="preview()" />
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
        sp.innerHTML="密碼不得為空"; 
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
            sp.innerHTML="密碼需含數字與英文";
    }else{
        sp.innerHTML="密碼不能小於6個字元";
    }     
}

</script>

<jsp:include page="layout/footer.jsp" />