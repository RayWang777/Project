<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<title>意見回饋</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<style>
/*                背景滿版     */
                    html { 
            			height: 100%; 
     					} 
                    body {
                        background-image: url("<c:url value="/images/cold_drink_juice_promotion_image.jpg"/>");
                        background-repeat: no-repeat;
                        background-attachment:fixed;
                        background-position: 50% 40%;
                        background-size: 100% 120%;
                    }
/*                背景滿版    */



</style>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div class="container">
<div class="row justify-content-center">
<div class="col-6">
 <h1>意見回饋</h1>
<form:form id="needsubmit" class="form" method="post" action="${contextRoot}/front/service/post" modelAttribute="workMessages">
<div class="form-group">
     <label for="exampleFormControlInput1">會員編號 :</label>
     
       <form:input  path="userBean" class="form-control"  value="${canSeeUser.userId}"  readonly="true"/>
           
<%--     <c:out value="${latestMsg.userBean.userId}"  /> --%>
 
    <br/>
    <label for="exampleFormControlInput1">姓   名 :</label>
       <form:input path="userBean" class="form-control"  value="${canSeeUser.userName}"  readonly="true"/>
<%--     <c:out value="${latestMsg.userBean.userName}" /> --%>


   </div>
  
  <br/>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1" >意見回饋 :</label>
    <br/>
    <form:textarea path="answer" class="form-control" id="userfeedback" />
     </div>
     <br/>
     <div class="form-group">
    
     <button type="button" class="btn btn-success" id="send">送出</button><br/><br/>
 </div>
</form:form>
     <button style="margin-bottom: 100px" class="btn btn-dark" onclick="fast()">一鍵輸入</button>
</div>
</div>

<br/>
<br/><br/><br/><br/><br/><br/>
</div>



<script type="text/javascript">

function sendto(){
	$('#needsubmit').submit();
}


function fast() { 
	let answer = document.getElementById("userfeedback"); 
	answer.value=("50嵐南京店沒辦法提供刷卡服務，是否可請店家提供，謝謝"); 
	 } 

$(function(){
	
	$("#send").click(function(){
		Swal.fire({
			  icon:'success',
			  title:'意見回饋已送出',
			  showConfirmButton: false,
			  timer: 3000
			}).then(
					
// 					location.replace('http://localhost:8081/drinkmaster/front/service/add')

					setTimeout(function () { $("#needsubmit").submit(); }, 3000)
				);
})
});


</script>
<jsp:include page="layout/footer.jsp" />


