<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="layout/header.jsp" />
<!DOCTYPE html>
<html>
<head>

<link href="${contextRoot}/css/lib/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<link href="${contextRoot}/css/lib/awesomeRating.min.css" rel="stylesheet" type="text/css" media="all">
<link href="${contextRoot}/font/fontawesome-webfont.ttf" rel="stylesheet" type="text/css" media="all">
<link href="${contextRoot}/font/fontawesome-webfont.woff" rel="stylesheet" type="text/css" media="all">
<link href="${contextRoot}/font/fontawesome-webfont.woff2" rel="stylesheet" type="text/css" media="all">

<script src="${contextRoot}/js/lib/awesomeRating.min.js"></script>
<script src="${contextRoot}/js/lib/average-rating.min.js" type="text/javascript"></script>

<style type="text/css">
.ratingBar {
  height: 30px;
}

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script type="text/javascript">

$(document).ready(function(){
	
	
// 	("#send").click(function(){
// 		var useraccount = $("#userAccount").val();
		
// 		var datas = {"useraccount":'' + useraccount};
// 		console.log('datas:' + datas);
// 		console.log(datas);
	
	$.ajax({
		type:'post',
		url:'comment/commentstore',
		contentType:'application/json',
		data: JSON.stringify(datas),
		success: function(CBS){
			
			var CBSText = '';
			for(var i=0; i<CBS.length; i++){
					CBSText += 	
						
						
								"商店名稱:" + CBS[i].storeBean.storeName + "<br/>" +
								"使用者:"	+ CBS[i].userBean.userName + "<br/>" +
								'<div style="pointer-events: none" id="scores'+[i]+'" class="awesomeRating"></div>' +
								'<div class="awesomeRatingValue"></div>'
								
								
								$("#scores"+[i]+").awesomeRating({
									
									valueInitial: "CBS"+[i]+".score",
									values: ["1.0", "2.0", "3.0", "4.0", "5.0"],
									targetSelector: "span.awesomeRatingValue"
								});
							
								console.log(CBS[i].score);
								
								
								
								"評論:"	+ CBS[i].content + "<br/>" +
								
								(時間) <fmt:formatDate pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss EEEE" value="CBS"+[i]+".createTime" />
								
			}
			
			
			$('#result1').html(CBSText);
			
			console.log(CBS);
		},
		error: function(e){
			console.log(e);
		}
		
	});
	
// 	});
// });
	
}


</script>


<div id="result1"></div>


</body>
</html>