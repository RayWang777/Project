<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div class="content">

	<div class="container">
		<br> <br>
		<h2 class="mb-4" style="text-align: center;">修改店家</h2>

		<div class="row justify-content-center">

		
			<form:form class="form" method="post" modelAttribute="store">
				<c:choose>
				<c:when test="${userBean.role == 'admin' }">
				<div class="mb-3">
					<label for="selectfirmId" class="form-label">廠商</label>
					<form:select id="selectfirmId" path="firmId" class="form-control">
						<c:forEach items="${storeaddfirms}" var="storeaddfirm">  
						  <c:choose>
							<c:when test="${ storeaddfirm.firmId == store.firmId }">
								<option value="${storeaddfirm.firmId}" selected="true">${storeaddfirm.firmName}</option>
							</c:when>
							<c:otherwise>
								<option value="${storeaddfirm.firmId}" >${storeaddfirm.firmName}</option>
							</c:otherwise>
						  </c:choose>
						</c:forEach>
					</form:select>
					<form:hidden path="firmId" value="${store.firmId}" />
					<span id=firmIdSp></span>
				</div>
				</c:when>
				<c:otherwise>
					<form:select path="userBean.userId" hidden="true" lass="form-control">
						<option value="${storeaddfirms.firmId}" selected="true">${storeaddfirms.firmName}</option>
					</form:select>
					<form:hidden path="firmId" value="${storeaddfirms.firmId}" />
				</c:otherwise>
				</c:choose>


				<form:hidden path="storeId" id="storeId" value="${storeBean.storeId}" />
				<div class="mb-3">
					<label for="storeName" class="form-label">店家名稱</label>
					<form:input path="storeName" class="form-control" type="text"
						id="storeName" />
					<span id=storeNameSp></span>
				</div>

				<div class="mb-3">
					<label for="storeAddress" class="form-label">店家地址</label>
					<form:input path="storeAddress" class="form-control" type="text"
						id="storeAddress" />
					<span id=storeAddressSp></span>
				</div>

				<div class="mb-3">
					<label for="storePhone" class="form-label">店家電話</label>
					<form:input path="storePhone" class="form-control" type="text"
						id="storePhone" />
					<span id=storePhoneSp></span>
				</div>

				<div class="mb-4">
					<label for="startTime" class="form-label">開店時間</label>
					<br/>		
					<input type="time" accept="number" id="startTime">
					<input type="time" id="endTime">
					<form:input path="openTime" class="form-control" 
						id="openTime" />
					<span id=openTimeSp></span>
				</div>
				
			<div class="mb-4">
				<c:choose>
				<c:when test="${userBean.role =='store'}">
					<form:select path="userBean.userId" hidden="true" class="form-control">
					 	<form:option value="${userBean.userId}">${userBean.userName}</form:option>
					</form:select>
					<form:hidden path="userId" value="${userBean.userId}" />
				</c:when>
				<c:otherwise>
					<div class="mb-4">
						<label for="selectuserId" class="form-label">管理者</label>
							<form:select id="selectuserId" path="userBean.userId" class="form-control" >
								<form:options items="${storeaddusers}" itemLabel="userName" itemValue="userId"/>	
							</form:select>
							<form:hidden path="userId" value="${store.userBean.userId}" />
						<span id=userIdSp></span>
					</div>
				
				</c:otherwise>						
				</c:choose>
			</div>
				
				
				

				<form:hidden path="latitude" class="form-control" id="latitude" />
				<form:hidden path="longitude" class="form-control" id="longitude" />
				<div class="mb-3" style="text-align: center;">
					<input type="submit" class="btn btn-success"
						value='<c:out value="修改店家"/>'>
				</div>
			</form:form>


		</div>

	</div>
</div>


<script src="<c:url value="/js/key.js"/>"></script>
<script async defer
  src="https://maps.googleapis.com/maps/api/js?key="+key>
</script>

<script type="text/javascript">

$(function(){
	
	var initstartTime = $('#openTime').val().split('-')[0];
	var initendTime = $('#openTime').val().split('-')[1];
	
	$('#startTime').val(initstartTime);
	$('#endTime').val(initendTime);
	
	$('#storeAddress').change(function(){
		var location = $('#storeAddress').val();

		const geocoder = new google.maps.Geocoder();

// 請 Google Maps API 依據地址轉換成經緯度
		geocoder.geocode( { 'address': location}, function(results, status) {
	  if (status == 'OK') {
    // 若轉換成功...
    
    var lat = results[0].geometry.location.lat();
    var lng = results[0].geometry.location.lng();
	$('#latitude').val(lat);
	$('#longitude').val(lng);

  			} else {
    // 若轉換失敗...
    			console.log(status)
  				}
			});
	});

	
	$('#selectfirmId').click(function() {

		var selected = $('#selectfirmId').val()
		console.log(selected)
		$('#firmId').val(selected);
	})
	
	$('#selectuserId').click(function() {

		var selected = $('#selectuserId').val()
		console.log(selected)
		$('#userId').val(selected);

	})
	
	
	$('#startTime').blur(function(){
		var startime = $('#startTime').val();
		var endtime = $('#endTime').val();
		$('#endTime').attr('min',startime);
		
		$('#openTime').val(startime+'-'+endtime);
	})
	
	$('#endTime').blur(function(){
		var startime = $('#startTime').val();
		var endtime = $('#endTime').val();
		
		$('#openTime').val(startime+'-'+endtime);
	})


});

</script>





<jsp:include page="layout/footer.jsp" />