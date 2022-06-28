<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:include page="layout/header.jsp" />
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">

$(function(){
	
	$("#send").click(function(){
		var email= $("#to").val();
		var messageto = $('#message').val();
		
		var myHeaders = new Headers();
		myHeaders.append("Content-Type", "application/json");

		var raw = JSON.stringify({
		  "to": ""+email,
		  "message": ""+messageto
		});

		var requestOptions = {
		  method: 'POST',
		  headers: myHeaders,
		  body: raw,
		  redirect: 'follow'
		};

		fetch("http://localhost:8081/drinkmaster/send-email", requestOptions)
		  .then(response => response.text())
		  .then(result => console.log(result))
		  .catch(error => console.log('error', error));
		
	
		
		Swal.fire({
			  icon: 'success',
			  title: '信件已送出',
			  showConfirmButton: false,
			  timer: 3500
			}).then((result) => {
					
					location.replace('http://localhost:8081/drinkmaster/backend/service/reply')
			}
			)
			
	
		
	})
	
	
})




</script>
<body>


<nav>
        

    </nav>



Email :   <input id="to" type="text" value="${msg.userBean.userAccount}" /><br/>

回覆訊息 :<input id="message" type="text"  />

<button id="send" type="submit"  class="btn btn-lg btn-primary" >回覆</button>
	


</body>
</html>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> --%>

<%-- <jsp:include page="layout/header.jsp" /> --%>
<%-- <c:set var="contextRoot" value="${pageContext.request.contextPath}" /> --%>
<!-- <div class="container"> -->

<!-- <div class="row justify-content-center"> -->
<!-- <div class="col-6"> -->
<!--   <h1>回覆意見頁面</h1> -->
<!-- <div class="card"> -->
<!--   <div class="card-header"> -->
<!--     請輸入想回覆的訊息 -->
<!--   </div> -->
<!--   <div class="card-body"> -->
  
<%--   <form:form class="form" method="post" modelAttribute="model"> --%>
  
<%--   <form:input path="to" /> --%>
<%--   <form:input path="subject" type="hidden" /> --%>
  
<!--   <div class="form-group"> -->
<%--   <form:textarea path="message" value="clear" class="form-control"/> --%>
<!--   </div> -->
  
<!--   <input type="submit" name="submit" class="btn btn-lg btn-primary" value="回覆"> -->
 
<%--   </form:form> --%>
    
<!--   </div> -->
<!-- </div> -->

<!-- </div> -->

<!-- </div> -->

<!-- </div> -->
<%-- <jsp:include page="layout/footer.jsp" /> --%>