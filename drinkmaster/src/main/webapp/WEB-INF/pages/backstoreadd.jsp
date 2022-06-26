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
		<h2 class="mb-4" style="text-align: center;">新增店家</h2>

		<div class="row justify-content-center">

			<c:url value="/backend/store/add" var="link_url" />
			<form:form class="form" action="${link_url}" method="post"
				modelAttribute="store">
				
				
				<div class="mb-3">
					<label for="selectuserId" class="form-label">廠商</label>
					<form:select id="selectfirmId" path="userBean.userId"
						class="form-control">

						<form:options items="${storeaddfirms}" itemLabel="firmName"
							itemValue="firmId" />
					</form:select>
					<form:hidden path="firmId" value="1" />
					<span id=firmPhoneSp></span>
				</div>

				<form:hidden path="storeId" id="storeId" />
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
					
					<div class="input-group bootstrap-timepicker timepicker">
            <input id="timepicker2" type="text" class="form-control input-small">
            <span class="input-group-addon">
                <i class="glyphicon glyphicon-time"></i>
            </span>
        </div>
						
					
					<input type="time" accept="number" id="startTime">
					<input type="time" id="endTime">
					
					
					<form:input path="openTime" class="form-control" 
						id="openTime" />
					<span id=openTimeSp></span>
				</div>
				<form:input path="latitude" class="form-control" type="text"
					id="latitude" />
				<form:input path="longitude" class="form-control" type="text"
					id="longitude" />
				<div class="mb-3" style="text-align: center;">
					<input type="submit" class="btn btn-success"
						value='<c:out value="新增店家"/>'>
				</div>
			</form:form>


		</div>

	</div>
</div>

<script async defer
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDmEBK0G5eNsuBCbrJzIYY88lee1rT_S_o">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/js/bootstrap-timepicker.min.js" integrity="sha512-2xXe2z/uA+2SyT/sTSt9Uq4jDKsT0lV4evd3eoE/oxKih8DSAsOF6LUb+ncafMJPAimWAXdu9W+yMXGrCVOzQA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script type="text/javascript">

$(function(){
	
	
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
	
	
	$('#timepicker2').timepicker({
    minuteStep: 1,
    template: 'modal',
    appendWidgetTo: 'body',
    showSeconds: true,
    showMeridian: false,
    defaultTime: false
	})

	
	
	

});

</script>





<jsp:include page="layout/footer.jsp" />