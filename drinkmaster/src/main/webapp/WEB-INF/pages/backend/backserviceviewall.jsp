<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<table class="table table-hover" style="width:100%;table-layout:fixed;">
	<thead>
		<tr>
			<th scope="col">
			<label class="control control--checkbox">
				<input type="checkbox" class="js-check-all"/>
			</label>
			</th>
			<th scope="col">UserID</th>
			<th scope="col">姓名</th>
			<th scope="col">Email信箱</th>
			<th scope="col">意見內容</th>
			<th scope="col">意見回饋時間</th>
			<th scope="col" style="text-align: left;">功能</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="workMessage" items="${page.content}">
		<tr>
			<td class="align-middle">
			<label class="control control--checkbox">
				<input type="checkbox" id="check" value="<c:out value='${workMessage.userBean.userId}'/>"
					style="margin-top:20px;"/>
			</label>
			</td>
			<td class="align-middle"><div class="d-flex align-items-center">
				<a href="#"><c:out value="${workMessage.userBean.userId}"/></a>
			</div></td>
			<td class="align-middle"><div class="d-flex align-items-center">
				<a href="#"><c:out value="${workMessage.userBean.userName}"/></a>
			</div></td>
			<td class="align-middle"><div class="d-flex align-items-center">
				<c:out value="${workMessage.userBean.userAccount}"/>
			</div></td>
			<td class="align-middle"><div class="d-flex align-items-center">
			   <c:out value="${workMessage.answer}"/>
			</div></td>
			<td class="align-middle"><div class="d-flex align-items-center">
				 <fmt:formatDate
       pattern="yyyy 年 MM 月 dd 日 hh:mm:ss a EEEE" value="${workMessage.answerTime}" />
			</div></td>
			
			
			<td class="align-middle" style="width: 13%;"><div class="d-flex align-items-center">
				<div style="margin: 5px"><a href="${contextRoot}/backend/service/edit?serviceId=${workMessage.serviceId}">
					<button type="button" class="btn btn-primary">編輯</button>
				</a></div>
				<div style="margin: 5px"><button type="button" class="btn btn-danger" id="${workMessage.serviceId}" onclick="del(event)">刪除</button>
				
				
				
				
				
				
				</div>
			</div></td>
		</tr>
	</c:forEach>
	</tbody>
</table>



 <div class="row justify-content-center" style="font-size:23px;">
  <div class="col-6">
   <c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
   
   <c:choose>
     <c:when test="${page.number != pageNumber-1}">
        <a href="${contextRoot}/backend/service/viewall?p=${pageNumber}" style="color:#84C1FF"><c:out value="${pageNumber}" /></a>
     </c:when>
   
     <c:otherwise>
       <c:out value="${pageNumber}" />
     </c:otherwise>
   </c:choose>
   
   <c:if test="${pageNumber != page.totalPages}">
   |
   </c:if>    
   </c:forEach>
  </div>
 </div>

</body>
<script type="text/javascript">


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
// 		console.log(local)
		document.location.href='${contextRoot}/backend/service/delete?serviceId='+local;
		
	})
}else if (result.isDenied) {
	    return false;
	  }
});
}	

</script>


// $(function(){
	
// 	$("#deletebtn").click(function(){
		
// swal({
// 	title:"確認要刪除嗎?",
// 	text:"刪除後無法再回復!",
//     type:"warning",
//     showCancelButtonText:true,
//     cinfirmButtonText:"確認刪除",
//     closeOnconfirm:true,
//     closeOnCancel:true
// },
// function(isConfirm){
// 	if(isConfirm){
// 		swal("刪除成功","資料已成功刪除","success");
// 	}
// 	else{
// 		swal("取消","資料未更動","error");
// 	}
// });

// 	})
// 	})


//-----------------------------------------------------
	
<!-- 	$(function(){ -->
	
<!-- 	$("#deletebtn").click(function(event){ -->
<!-- const swalWithBootstrapButtons = Swal.mixin({ -->
<!-- 	  customClass: { -->
<!-- 	    confirmButton: 'btn btn-success', -->
<!-- 	    cancelButton: 'btn btn-danger' -->
<!-- 	  }, -->
<!-- 	  buttonsStyling: false -->
<!-- 	}) -->

<!-- 	swalWithBootstrapButtons.fire({ -->
<!-- 	  title: '確認要刪除嗎?', -->
<!-- 	  text: "刪除後無法再回復!", -->
<!-- 	  icon: 'warning', -->
<!-- 	  showCancelButton: true, -->
<!-- 	  confirmButtonText: '確認刪除', -->
<!-- 	  cancelButtonText: '取消', -->
<!-- 	  reverseButtons: true -->
<!-- 	}).then((result) => { -->
<!-- 	  if (result.isConfirmed) { -->
<!-- 	    swalWithBootstrapButtons.fire( -->
<!-- 	      '刪除成功!', -->
<!-- 	      '資料已成功刪除', -->
<!-- 	      'success' -->
<!-- 	    ).then( -->
<!-- 	    	location.href=	 -->
<!-- 	    ) -->
<!-- 	  } else if ( -->
<!-- 	    /* Read more about handling dismissals below */ -->
<!-- 	    result.dismiss === Swal.DismissReason.cancel -->
<!-- 	  ) { -->
<!-- 	    swalWithBootstrapButtons.fire( -->
<!-- 	      '取消', -->
<!-- 	      '資料未更動', -->
<!-- 	      'error' -->
<!-- 	    ) -->
<!-- 	  } -->
<!-- 	}); -->
<!-- 	}) -->
<!-- }) -->



</html>
<jsp:include page="layout/footer.jsp" />
