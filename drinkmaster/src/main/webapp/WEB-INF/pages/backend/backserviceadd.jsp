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
    
    <label for="exampleFormControlInput1">UserID</label>
    
  <form:input  path="userBean" class="form-control" id="userId" />
   </div>
  
  
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">意見回饋</label>
    <form:textarea path="answer" class="form-control" id="feedback"/>
    
     </div>
     
     <div class="form-group">
    
     <input type="submit" name="submit" class="btn btn-success" value="送出">
    
 </div>
</form:form>
 <button style="margin-bottom: 100px" class="btn btn-dark" onclick="fast()">一鍵輸入</button>
</div>
</div>

<br/>
<div class="row justify-content-center">
		<div class="col-6">

			<div class="card">
			<div class="btn btn-light">
					UserID:
					 <c:out value="${latestMsg.userBean.userId}" />
				</div>
				<br/>
				<div class="btn btn-light">
					姓名 :
					 <c:out value="${latestMsg.userBean.userName}" />
				</div>
				<br/>
				<div class="btn btn-light">
					Email信箱 :
					<c:out value="${latestMsg.userBean.userAccount}" />
				</div>
				<br/>
				<div class="btn btn-light">
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
<script type="text/javascript">

$(function(){

});

function fast() {
	let userId = document.getElementById("userId");
	let answer = document.getElementById("feedback");
	
	
	userId.value=("68");
	answer.value=("台北站前店的可不可商家沒有辦法提供電子載具，是否可向門市爭取!!!");
	
}

</script>
<jsp:include page="layout/footer.jsp" />
