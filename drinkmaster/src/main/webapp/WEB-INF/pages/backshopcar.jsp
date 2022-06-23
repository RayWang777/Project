<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
<style type="text/css">
#shopcarform input:focus
{
	border-color:rgba(82, 168, 236, 0.8);
	outline:0;outline:thin dotted \9;
	-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);
	-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);
	box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);
	outline-style: none ;
	border-radius: 3px;
	padding: 14px 14px;
	font-family: "Microsoft soft";
	font-size: 14px;
	height: 25px;
	width: 350px;
}

#shopcarform input
{
 	outline-style: none ; 
    border: 1px solid #ccc;  
    border-radius: 3px; 
    padding: 14px 14px; 
    font-family: "Microsoft soft";
 	height: 25px; 
 	width: 350px; 
    outline: 0; 
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(0, 106, 255,.4);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(0, 106, 255,.4); 
	font-size: 14px;
}


#shopcarform label {
	font-size: 16px;
}

#shopcarform #status{ 
	height: 25px; 
	width: 150px;
	font-size: 16px;
 } 
 
#shopcarform #shopcarsubmit{ 
 	height: 30px; 
 	width: 60px; 
 	font-size: 16px; 
   	vertical-align: middle; 
   	line-height: 30px; 
   	padding:0px 8px; 
   	border-radius: 2px; 
   	border-color: #007BFF;
 } 
 
#shopcarform #closebutton{ 
 	height: 30px; 
 	width: 60px; 
 	font-size: 16px; 
   	vertical-align: middle; 
   	line-height: 30px; 
   	padding:0px 8px; 
   	border-radius: 2px; 
 } 
 
 

#shopcarform select{
	height: 20px;
	width: 80px;
	border-color: black;
	border-radius: 2px;
}

</style>

</head>
<body>
<br>
<p>
<button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#exampleModal" data-whatever="">新增購物車</button></a>&emsp;
<a href="${contextRoot}/backend/shopCar/findAll"><button type="button" class="btn btn-outline-dark btn-sm">購物車列表</button></a>&emsp;
<a href="${contextRoot}/backend/shopCar/findStatus?sta=true"><button type="button" class="btn btn-outline-dark btn-sm">已送出</button></a>&emsp;
<a href="${contextRoot}/backend/shopCar/findStatus?sta=false"><button type="button" class="btn btn-outline-dark btn-sm">未送出</button></a>&emsp;
</p>
<form action="${contextRoot}/backend/product/select" method="get">
		<div class="mb-3">
			<label for="select" class="form-label">搜尋</label> <input type="text"name="select" id="select" /> 
				<select name="filed">
				<option>品項</option>
				<option>價格</option>
				<option>溫度</option>
				<option>待付款</option>
				<option>待出貨</option>
				<option>已出貨</option>
				<option>已取消</option>
			</select>
		<button type="submit" class="btn btn  btn-sm" style="font-style:italic;color:blue;">查詢</button>
		<c:out value="查到 ${page.totalElements } 筆資料"></c:out>
		</div >
		
	</form>			
<table class="table table-hover"style="width:100%;table-layout:fixed;">
  <thead>
    <tr>
      <th scope="col"><label class="control control--checkbox">
						<input type="checkbox" class="js-check-all" />
						<div class="control__indicator"></div>
	</label></th>
      <th scope="col">購物車編號</th>
      <th scope="col">商品</th>
      <th scope="col" style="width: 170px;">成立時間</th>
      <th scope="col">數量</th>
      <th scope="col">冰塊</th>
      <th scope="col">甜度</th>
      <th scope="col">狀態</th>
      <th scope="col">  </th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="shopCarBean" items="${page.content}">
    <tr scope="row">
					<td class="align-middle"><label
						class="control control--checkbox"><input type="checkbox"
							id="check" value="<c:out value='${shopCarBean.shopcarId}'/>"
							style="margin-top: 20px;" />
							<div class="control__indicator"></div></label></td>
    
      <th scope="row"><c:out value="${shopCarBean.shopcarId}"/></th>
      <td><c:out value="${shopCarBean.productBean.productId}"/></td>
      <td><fmt:formatDate  value="${shopCarBean.createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
      <td><c:out value="${shopCarBean.productAmount}"/></td>
      <td><c:out value="${shopCarBean.ice}"/></td>
      <td><c:out value="${shopCarBean.sweet}"/></td>
      <c:choose>
			<c:when test="${shopCarBean.status==true}">
			<td style="color: green;">
					<c:out value="已送出" /></td>
						</c:when>
						<c:otherwise>
			<td style="color: red;">
					<c:out value="未送出" /></td>
						</c:otherwise>
					   </c:choose>               
      <td><a href="${contextRoot}/backend/shopCar/edit?id=${shopCarBean.shopcarId}"><button class="btn btn-outline-primary btn-sm">編輯</button></a>
          <a onclick="return confirm('確定要刪除嗎?')"  href="${contextRoot}/backend/shopCar/delete?id=${shopCarBean.shopcarId}"><button class="btn btn-outline-danger btn-sm">刪除</button></a></td>
      </tr>
    </c:forEach>
 
  </tbody>
</table>
<div class="row justify-content-center" style="font-size: x-large;">
  <c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
   <c:choose>
   <c:when test="${page.number!=pageNumber-1}">
   <a href="${contextRoot}/backend/shopCar/findAll?s=${pageNumber}"> <c:out value="${pageNumber}" /> </a>
   </c:when>
   <c:otherwise>
   <c:out value="${pageNumber}"></c:out>
   </c:otherwise>
   </c:choose> 
   <c:if test="${pageNumber!= page.totalPages }">
   |
   </c:if>
   </c:forEach>

   
   
   <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">新增購物車</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
  <div class="modal-body">
  <form:form id="shopcarform" class="form" method="post" action="${contextRoot}/backend/shopCar/insert" modelAttribute="shopCarBean">
  <span><form:label path="createTime">成立時間&thinsp;</form:label></span>
  <form:input path="createTime" /><br><br>
  <form:label path="productAmount">數&emsp;&emsp;量&thinsp;</form:label>
  <form:input path="productAmount" /><br><br>
  <form:label path="ice">冰&emsp;&emsp;塊&thinsp;</form:label>
  <form:input path="ice" /><br><br>
  <form:label path="status">狀&emsp;&emsp;態&thinsp;</form:label>
  <select id="status" >
  <option value="false">未送出</option>
  <option value="true">已送出</option>
  </select>
  <form:hidden id="shopcarstatus" path="status" /><br><br>
  <form:label path="sweet">甜&emsp;&emsp;度&thinsp;</form:label>
  <form:input path="sweet" /><br>
  
 
  <br><br>
  <div class="row justify-content-center">
  <a href="${contextRoot}/backend/shopCar/insert">
  <button type="submit" id="shopcarsubmit" class="btn btn-primary btn-sm"  name="submit"  onclick="return confirm('確定要新增嗎?')" >確認</button>&emsp;  
  </a>
  <button type="button" id="closebutton" class="btn btn-outline-dark btn-sm" data-dismiss="modal" aria-label="Close" >取消</button>
  </div>
  </form:form>
      </div>
      
    </div>
  </div>
</div>
   
 <script type="text/javascript">
$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('新增購物車 ' + recipient)
	  modal.find('.modal-body input').val(recipient)
	})



$('#shopcarsubmit').click(function() {
  $('#shopcarform').submit();
});



$(function(){
	
$('#status').change(function(){
var valuesta = $('#status').val();
console.log(valuesta);
$('#shopcarstatus').val(valuesta);	
	
})	
	
});
</script>  
   
   
</body>

</html>
<script src="<c:url value="/js/lib/popper.min.js"/>"></script>
<script src="<c:url value="/js/lib/main.js"/>"></script>

<jsp:include page="layout/footer.jsp" />