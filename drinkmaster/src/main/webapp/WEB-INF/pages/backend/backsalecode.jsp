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
	
	<table class="table table-hover"
		style="width: 100%; table-layout: fixed;">
		<thead>
			<tr>
				<th style="width: 50px;"><label class="control control--checkbox">
						<input type="checkbox" class="js-check-all" />
				</label></th>
				<th style="text-align: center;" scope="col">折扣碼</th>
				<th style="text-align: center;" scope="col">折扣數</th>
				<th style="text-align: center;" scope="col">有效時間</th>
				
				<th style="width: 140px;text-align: left;">動作</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${allValiedCode.content}" var="oneSaleCode">
				<tr scope="row">
					<td class="align-middle"><label
						class="control control--checkbox"><input type="checkbox"
							id="check" name="saleCodesId"   value="<c:out value='${oneSaleCode.saleCodeId}'/>"
							style="margin-top: 20px;" />
						</label></td>
						
					<td class="align-middle" style="text-align: center;"><c:out value="${oneSaleCode.saleCode}"/></td>	
					<td class="align-middle" style="text-align: center;"><c:out value="${oneSaleCode.discount}"/></td>	
					<td class="align-middle" style="text-align: center;"><c:out value="${oneSaleCode.validDate}"/></td>	
					
					
					<td class="align-middle" style="width: 13%;"> 
						<button id="${oneSaleCode.saleCode}" type="button" class="btn btn-danger" onclick="del(event)">註銷</button></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<div class="row justify-content-center" style="font-size: x-large;">
		<c:forEach var="pageNumber" begin="1" end="${allValiedCode.totalPages}">
			<c:choose>
				<c:when test="${allValiedCode.number!=pageNumber-1}">
				&nbsp;<a
						href="${contextRoot}/backend/salecode/all?p=${pageNumber}"><c:out
							value="${pageNumber}" /></a>&nbsp;
				</c:when>
				<c:otherwise>
					&nbsp;<c:out value="${pageNumber}"></c:out>&nbsp;
				</c:otherwise>
			</c:choose>
			&nbsp;<c:if test="${pageNumber!= allValiedCode.totalPages }">|</c:if>&nbsp;
		</c:forEach>
	</div>
	<div class="row justify-content-center"
		style="font-size: large; color: black;">
		<c:out value="總共有 ${allValiedCode.totalElements} 筆資料"></c:out>
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
	    			}).then(
	    				location.href='http://localhost:8081/drinkmaster/backend/salecode/all'		
	    			)

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
	
	
	
	function del(event){
			  console.log(event.target.id)
	var local = event.target.id;
	 Swal.fire({
		  title: '確認要刪除嗎?',
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#dc3545',
		  cancelButtonColor: '#28a745',
		  confirmButtonText: '確認刪除',
		  cancelButtonText: '&nbsp&nbsp取&nbsp&nbsp&nbsp&nbsp消&nbsp&nbsp',
		  reverseButtons: true
		  
		}).then((result) => {
		  if (result.isConfirmed) {
			  
	
			Swal.fire({
			  icon: 'success',
			  title: '資料已移除',
			  showConfirmButton: false,
			  timer: 2000
			}).then( ()=>{
				
				document.location.href='${contextRoot}/backend/salecode/destroy?s='+local;
				
			})
		  }else if (result.isDenied) {
			    return false;
			  }
		});
}

</script>

<jsp:include page="layout/footer.jsp" />