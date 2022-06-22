<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div class="container">
<div class="row justify-content-center">
<div class="col-6">
 <h1>新增意見回饋</h1>
<form:form class="form" method="post" action="${contextRoot}/backend/service/post" modelAttribute="workMessages">
<div class="form-group">
    <label for="exampleFormControlInput1">姓名</label>
    <input type="text" class="form-control" id="FormControlInput1">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlInput1">Email信箱</label>
    <input type="email" class="form-control" id="FormControlInput2" placeholder="name@example.com">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">意見回饋</label>
    <form:textarea path="answer" class="form-control"/>
     </div>
     
     <div class="form-group">
    
     <input type="submit" name="submit" value="送出">
    
 </div>
</form:form>
</div>
</div>

<br/>
<div class="row justify-content-center">
		<div class="col-6">

			<div class="card">
				<div class="card-header">
					姓名 :
					 <c:out value="${workMessage.userBean.userName}" />
				</div>
				<br/>
				<div class="card-header">
					Email信箱 :
					<c:out value="${workMessage.email}" />
				</div>
				<br/>
				<div class="card-header">
					最新意見回饋
					(時間) <fmt:formatDate pattern="yyyy年MM月dd日 a hh:mm:ss EEEE"
						value="${latestMsg.answerTime}"/>
				</div>
				<div class="card-body">

					<c:out value="${latestMsg.answer}"/>
				</div>


			</div>

		</div>

	</div>

</div>

