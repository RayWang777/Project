<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<h1>後台首頁</h1>
<p>你好, ${userBean.userName}</p>
<table class="table table-hover" style="width:100%;table-layout:fixed;">
	<tr>
		<th scope="col">ID</th>
		<th scope="col">姓名</th>
		<th scope="col">帳號</th>
		<th scope="col">密碼</th>
		<th scope="col">電話</th>
		<th scope="col">地址</th>
		<th scope="col">性別</th>
		<th scope="col">權限</th>
		<th scope="col">生日</th>
		<th scope="col">創建日期</th>
		<th scope="col">大頭貼</th>
	</tr>
	<tr>
		<td class="align-middle"><div class="d-flex align-items-center">
			<c:out value="${userBean.userId}"/>
		</div></td>
		<td class="align-middle"><div class="d-flex align-items-center">
			<c:out value="${userBean.userName}"/>
		</div></td>
		<td class="align-middle"><div class="d-flex align-items-center">
			<c:out value="${userBean.userAccount}"/>
		</div></td>
		<td class="align-middle"><div class="d-flex align-items-center">
			<c:out value="${userBean.userPassword}"/>
		</div></td>
		<td class="align-middle"><div class="d-flex align-items-center">
			<c:out value="${userBean.phone}"/>
		</div></td>
		<td class="align-middle"><div class="d-flex align-items-center">
			<c:out value="${userBean.userAddress}"/>
		</div></td>
		<td class="align-middle"><div class="d-flex align-items-center">
			<c:out value="${userBean.gender}"/>
		</div></td>
		<td class="align-middle"><div class="d-flex align-items-center">
			<c:out value="${userBean.role}"/>
		</div></td>
		<td class="align-middle"><div class="d-flex align-items-center">
			<c:out value="${userBean.birthday}"/>
		</div></td>
		<td class="align-middle"><div class="d-flex align-items-center">
			<c:out value="${userBean.createdate}"/>
		</div></td>
		
		<td class="align-middle"><img src="<c:url value="/backend/user/${userBean.userId}/photo"/>"
						style="width: 100px; height: 100px;"></td>
		
	</tr>	
</table>

<jsp:include page="layout/footer.jsp" />