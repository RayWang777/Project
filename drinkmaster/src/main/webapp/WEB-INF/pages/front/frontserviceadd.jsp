<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<style>
body{
background-image:url(../../images/cold_drink_juice_promotion_image.jpg);
  background-repeat:no-repeat;
   background-size: 100% 90%;

}


</style>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div class="container">
<div class="row justify-content-center">
<div class="col-6">
 <h1>新增意見回饋</h1>
<form:form class="form" method="post" action="${contextRoot}/front/service/post" modelAttribute="workMessages">
<div class="form-group">
     <label for="exampleFormControlInput1">UserID :</label>
     
       <form:input  path="userBean" class="form-control"  value="${canSeeUser.userId}"/>
           
<%--     <c:out value="${latestMsg.userBean.userId}"  /> --%>
 
    <br/>
    <label for="exampleFormControlInput1">姓   名 :</label>
       <form:input path="userBean" class="form-control"  value="${canSeeUser.userName}"/>
<%--     <c:out value="${latestMsg.userBean.userName}" /> --%>


   </div>
  
  <br/>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">意見回饋 :</label>
    <br/>
    <form:textarea path="answer" class="form-control"/>
     </div>
     <br/>
     <div class="form-group">
    
     <input type="submit" name="submit" class="btn btn-success" value="送出">
    
 </div>
</form:form>
</div>
</div>

<br/>
<br/><br/><br/><br/><br/><br/>
</div>
<jsp:include page="layout/footer.jsp" />


