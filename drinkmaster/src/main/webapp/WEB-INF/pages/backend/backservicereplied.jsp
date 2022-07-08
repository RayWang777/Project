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
		var msgId = $('#msgId').val();
		
		var myHeaders = new Headers();
		myHeaders.append("Content-Type", "application/json");

		var raw = JSON.stringify({
		  "to": ""+email,
		  "message": ""+messageto,
		  "msgId": ""+msgId
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
			  timer: 3000
			}).then((result) => {
					location.replace('http://localhost:8081/drinkmaster/backend/service/reply')
			}
			);
		
	
		
	})
	
	
})




</script>
<body>


<nav>
        

    </nav>
<div class="container">
<div class="row justify-content-center">
<div class="col-6">
 <h1>意見回覆</h1>


Email :   <input id="to" type="text" value="${msg.userBean.userAccount}" class="form-control" /><br/>

回覆訊息 :<input id="message" type="text"  class="form-control" />
<input type="hidden" id="msgId" value="${msg.serviceId}">
<button id="send" type="submit"  class="btn btn-lg btn-primary" >回覆</button><br/><br/>
 <button style="margin-bottom: 100px" class="btn btn-dark" onclick="fast()">一鍵輸入</button>	
</div>
</div>
</div>

</body>

</html>


<script type="text/javascript">

$(function(){

});

function fast() {
	let answer = document.getElementById("message");
	
	answer.value=("謝謝您的意見回饋，我們會盡快向門市爭取!!!");
	
}

</script>

<jsp:include page="layout/footer.jsp" />