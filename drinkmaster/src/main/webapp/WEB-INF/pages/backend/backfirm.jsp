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
	<c:url value="/backend/firm/add" var="add_url" />
	<a href="${add_url}"><button type="button" class="btn btn-success">新增廠商</button></a>


	<form:form action="${contextRoot}/backend/firm/all" method="get"
		modelAttribute="firmSerch">
		<div class="mb-3 input-group">
			<form:input path="sfn" class="form-control" value="${serchFirm.sfn}"
				placeholder="廠商名稱" />
			<form:input path="sfp" class="form-control" value="${serchFirm.sfp}"
				placeholder="廠商電話" />
			<form:input path="sfa" class="form-control" value="${serchFirm.sfa}"
				placeholder="廠商地址" />
			<form:input path="sun" class="form-control" value="${serchFirm.sun}"
				placeholder="管理者" />
		</div>
		<div class="mb-3 input-group" hidden="true">
			<form:input path="p" class="form-control" value="${serchFirm.p}"
				placeholder="頁數" />
			<form:input path="s" class="form-control" value="${serchFirm.s}"
				placeholder="欄數" />
			<form:input path="c" class="form-control" value="${serchFirm.c}"
				placeholder="欄位" />
			<form:input path="d" class="form-control" value="${serchFirm.d}"
				placeholder="排序" />
		</div>
		<button type="submit" class="btn btn-primary">查詢</button>
		<c:out value="查到 ${firms.totalElements}筆資料"></c:out>
	</form:form>



	<table class="table table-hover"
		style="width: 100%; table-layout: fixed;">
		<thead>
			<tr>
				<th style="width: 50px;"><label class="control control--checkbox">
						<input type="checkbox" class="js-check-all" />
				</label></th>
				<th scope="col"><a href="<c:url value="/backend/firm/all?sfn=${serchFirm.sfn}&sfp=${serchFirm.sfp}&sfa=${serchFirm.sfa}&sun=${serchFirm.sun}&p=${serchFirm.p}&s=${serchFirm.s}&c=2&d=${!serchFirm.d}"/>">廠商名稱<c:if test="${serchFirm.d}">↓</c:if><c:if test="${!serchFirm.d}">↑</c:if></a></th>
				<th scope="col"><a href="<c:url value="/backend/firm/all?sfn=${serchFirm.sfn}&sfp=${serchFirm.sfp}&sfa=${serchFirm.sfa}&sun=${serchFirm.sun}&p=${serchFirm.p}&s=${serchFirm.s}&c=4&d=${!serchFirm.d}"/>">廠商電話<c:if test="${serchFirm.d}">↓</c:if><c:if test="${!serchFirm.d}">↑</c:if></a></th>
				<th scope="col"><a href="<c:url value="/backend/firm/all?sfn=${serchFirm.sfn}&sfp=${serchFirm.sfp}&sfa=${serchFirm.sfa}&sun=${serchFirm.sun}&p=${serchFirm.p}&s=${serchFirm.s}&c=3&d=${!serchFirm.d}"/>">廠商地址<c:if test="${serchFirm.d}">↓</c:if><c:if test="${!serchFirm.d}">↑</c:if></a></th>
				<th scope="col"><a href="<c:url value="/backend/firm/all?sfn=${serchFirm.sfn}&sfp=${serchFirm.sfp}&sfa=${serchFirm.sfa}&sun=${serchFirm.sun}&p=${serchFirm.p}&s=${serchFirm.s}&c=5&d=${!serchFirm.d}"/>">管理者<c:if test="${serchFirm.d}">↓</c:if><c:if test="${!serchFirm.d}">↑</c:if></a></th>
				<th scope="col">Logo</th>
				<th style="width: 140px;text-align: left;">動作</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${firms.content}" var="firm">
				<tr scope="row">
					<td class="align-middle"><label
						class="control control--checkbox"><input type="checkbox"
							id="check" value="<c:out value='${firm.firmId}'/>"
							style="margin-top: 20px;" />
						</label></td>
					<td class="align-middle">
						<div class="d-flex align-items-center">
							<a href="<c:url	value="/backend/firm/${firm.firmId}"/>"><c:out value='${firm.firmName}' /></a>
						</div>
					</td>
					<td class="align-middle"><c:out value='${firm.firmPhone}' />
					</td>
					<td class="align-middle"><c:out value='${firm.firmAddress}' /></td>

					<td class="align-middle"><c:out
							value="${firm.userBean.userName}" /></td>

					<td class="align-middle"><img
						src="<c:url value="/backend/firm/${firm.firmId}/photo"/>"
						style="width: 100px; height: 100px;"></td>
					<td class="align-middle" style="width: 13%;"><c:url
							value="/backend/firm/edit/${firm.firmId}" var="edit_url" /> <a
						href="${edit_url}"><button type="button"
								class="btn btn-primary">編輯</button></a> <c:url
							value="/backend/firm/delete/${firm.firmId}" var="delete_url" />
						<button	type="button" class="btn btn-danger" id="${firm.firmId}" onclick="return del(event)">刪除</button></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<div class="row justify-content-center" style="font-size: x-large;">
		<c:forEach var="pageNumber" begin="1" end="${firms.totalPages}">
			<c:choose>
				<c:when test="${firms.number!=pageNumber-1}">
				&nbsp;<a
						href="${contextRoot}/backend/firm/all?sfn=${serchFirm.sfn}&sfp=${serchFirm.sfp}&sfa=${serchFirm.sfa}&sun=${serchFirm.sun}&p=${pageNumber}&s=${serchFirm.s}&c=${serchFirm.c}&d=${serchFirm.d}"><c:out
							value="${pageNumber}" /></a>&nbsp;
				</c:when>
				<c:otherwise>
					&nbsp;<c:out value="${pageNumber}"></c:out>&nbsp;
				</c:otherwise>
			</c:choose>
			&nbsp;<c:if test="${pageNumber!= firms.totalPages }">|</c:if>&nbsp;
		</c:forEach>
	</div>
	<div class="row justify-content-center"
		style="font-size: large; color: black;">
		<c:out value="總共有 ${firms.totalElements} 筆資料"></c:out>
	</div>

</body>

<script src="<c:url value="/js/lib/popper.min.js"/>"></script>
<script src="<c:url value="/js/lib/main.js"/>"></script>

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
				
				document.location.href='${contextRoot}/backend/firm/delete/'+local;
				
			})
		  }else if (result.isDenied) {
			    return false;
			  }
		});
}

</script>

<jsp:include page="layout/footer.jsp" />