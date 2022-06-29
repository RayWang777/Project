<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<form class="form-inline" action="${contextRoot}/backend/user/select" method="get">
	<div class="mb-3">
		<label for="select" class="form-label">搜尋</label>
		<input type="text" class="form-control" name="select"/>
	</div>
	<button type="submit" class="btn btn-primary">送出</button>
</form>

<table class="table table-hover" style="width:100%;table-layout:fixed;">
	<thead>
		<tr>
			<th scope="col">
			<label class="control control--checkbox">
				<input type="checkbox" class="js-check-all"/>
			</label>
			</th>
			<th scope="col">姓名</th>
			<th scope="col">帳號</th>
			<th scope="col">地址</th>
			<th scope="col">手機</th>
			<th scope="col">性別</th>
			<th scope="col">生日</th>
			<th scope="col">大頭貼</th>
			<th scope="col" style="text-align: left;">功能</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="userBean" items="${page.content}">
		<tr>
			<td class="align-middle">
			<label class="control control--checkbox">
				<input type="checkbox" id="check" value="<c:out value='${userBean.userId}'/>"
					style="margin-top:20px;"/>
			</label>
			</td>
			<td class="align-middle"><div class="d-flex align-items-center">
				<a href="#"><c:out value="${userBean.userName}"/></a>
			</div></td>
			<td class="align-middle"><div class="d-flex align-items-center">
				<c:out value="${userBean.userAccount}"/>
			</div></td>
			<td class="align-middle"><div class="d-flex align-items-center">
				<c:out value="${userBean.userAddress}"/>
			</div></td>
			<td class="align-middle"><div class="d-flex align-items-center">
				<c:out value="${userBean.phone}"/>
			</div></td>
			<td class="align-middle"><div class="d-flex align-items-center">
				<c:out value="${userBean.gender}"/>
			</div></td>
			<td class="align-middle"><div class="d-flex align-items-center">
				<c:out value="${userBean.birthday}"/>
			</div></td>
			
			<td class="align-middle">
<%-- 			<img src="<c:url value="/backend/user/${userBean.userId}/photo"/>" style="width: 100px; height: 100px;"> --%>
				<img width="100" src="data:image/jpg;base64,<c:out value='${userBean.byteArrayString}'/>">
			</td>
						
			<td class="align-middle" style="width: 13%;"><div class="d-flex align-items-center">
				<div style="margin: 5px"><c:url value="/backend/user/update/${userBean.userId}" var="update_url" />
				<a href="${update_url}">
					<button type="button" class="btn btn-primary">編輯</button>
				</a></div>
				<div style="margin: 5px"><c:url value="/backend/user/delete/${userBean.userId}" var="delete_url" />
				<a href="${delete_url}" onclick="return confirm('真的要刪除嗎')">
					<button type="button" class="btn btn-danger">刪除</button>
				</a></div>
			</div></td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<div class="row justify-content-center" style="font-size:23px;">
		<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
			<c:choose>
				<c:when test="${page.number!=pageNumber-1}">
					<a href="${contextRoot}/backend/user/all?u=${pageNumber}" style="color:#84C1FF"><b > <c:out
							value="${pageNumber}" />
					</b></a>
				</c:when>
				<c:otherwise>
					<c:out value="${pageNumber}"></c:out>
				</c:otherwise>
			</c:choose>
			&nbsp;<c:if test="${pageNumber!= page.totalPages }">
   |
   </c:if>&nbsp;
		</c:forEach>
	</div>
	
<script src="<c:url value="/js/lib/popper.min.js"/>"></script>
<script src="<c:url value="/js/lib/main.js"/>"></script>

<jsp:include page="layout/footer.jsp" />