<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<link href="<c:url value="/js/lib/popper.min.js"/>" rel="stylesheet">
<style>
.table {
	font-size: 16px;
}
  a:link
        {
            color: black;
        }
        a:visited
        {
            color: black;
        }
        a:hover
        {
            color: red;
        }
        a:active
        {
            color: black;
        }

</style>

<body>
	<br>
	
	<c:if test="${salecodes!=null}">	
	<a href="<c:url value="/backend/salecode/xlsx"/>"><button id="downloadexcel" type="button" class="btn btn-success">下載清單</button></a>
	</c:if>
	
	<c:url value="/backend/salecode/add" var="add_url" />
	<c:if test="${error == null }">
	<a href="${add_url}"><button type="button" class="btn btn-success">產生折扣碼</button></a>
	</c:if>
	<c:if test="${error != null }"><button type="button" class="btn btn-warning" style="color:blue;"><c:out value="${error}"/></button></c:if>
	<div class="mb-3 input-group"></div>
	
	
	<form action="<c:url value="/backend/salecode/check"/>" method="post">
	<div class="mb-3 input-group">
			<input name="salecode" class="form-control" type="text" id="salecode" />
				<input type="submit" class="input-group-text btn btn-primary" value="折扣碼確認">
			<span id="salecodeSp"></span>
	</div>
	<div class="mb-3 input-group">
			<label id="statuslb" class="input-group-text" for="status">折扣碼狀態</label>
			<input name="status" readonly="true" class="form-control" type="text" id="status" value="${status.saleCode}"/>
			<label class="input-group-text" for="discount">&nbsp&nbsp折&nbsp&nbsp&nbsp&nbsp扣&nbsp&nbsp</label>
			<input name="discount" readonly="true" class="form-control" type="text" id="status" value="<c:if test="${status.discount < 1}">
			<fmt:formatNumber type="number" value="${(status.discount*100)}"/>折</c:if>"/>
	<c:choose>
	<c:when test="${status!=null}">
	
	</c:when>
	<c:otherwise>
	</c:otherwise>
	</c:choose>
	</div>
	</form>
	
	<div class="mb-3 input-group">
			<input name="destroy" class="form-control" type="text" id="destroy" />
				<input type="text" class="input-group-text btn btn-primary" id="destroybutton" value="註銷折扣碼">
			<span id="destroySp"></span>
	</div>

</body>

<script src="<c:url value="/js/lib/popper.min.js"/>"></script>
<script src="<c:url value="/js/lib/main.js"/>"></script>
<script type="text/javascript">
$(function(){
	
	var status =$('#status').val();
	
	if(status=='已過期'){
		$('#statuslb').attr('style','background-color:#dc3545;color:#F9F900');
		$('#status').attr('style','background-color:#dc3545;color:#F9F900');
	}


	if(status=='無此序號'){
		$('#statuslb').attr('style','background-color:#dc3545;color:#F9F900');
		$('#status').attr('style','background-color:#dc3545;color:#F9F900');
	}
	
	
	$('#downloadexcel').click(function(){
		$('#downloadexcel').hide();
	})
	
	
	$('#destroystatuslb').hide();
	
})


	$('#destroybutton').click(function(){
		
		
		var saleCode = $('#destroy').val();
		var saleCodeJson = {"saleCode": saleCode};
		var saleString= JSON.stringify(saleCodeJson)
// 		console.log(saleCode)
// 		console.log(saleCodeJson)
// 		console.log(saleString)
		
		$.ajax({
			url:'http://localhost:8081/drinkmaster/backend/salecode/destroy',
    		method:'POST',
    		contentType: 'application/x-www-form-urlencoded', // 送過去的
    		dataType: 'json',
    		data: 's='+saleCode,
    	    success: function(responseText){
			
    	     },
    	     error:function(err){
    	    	
     	        if(err.responseText=="註銷成功"){
	    			Swal.fire({
	    			  icon: 'success',
	    			  title: '註銷成功',
	    			  showConfirmButton: false,
	    			  timer: 1500
	    			})

	    		}
    	    	 
    	    	 

    	       if(err.responseText == "已過期" ){
    	    	   Swal.fire({
  	    			  icon: 'warning',
  	    			  title: '序號已無效',
  	    			  showConfirmButton: false,
  	    			  timer: 1500
  	    			})
   	    		}
    	       
    	       if(err.responseText== "無此序號"){
   	    		Swal.fire({
 	    			  icon: 'error',
 	    			  title: '無此序號',
 	    			  showConfirmButton: false,
 	    			  timer: 1500
 	    			})
   	    		}
    	     }
    	})
		
		
		
	})

</script>

<jsp:include page="layout/footer.jsp" />