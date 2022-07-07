<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

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

#ratingBarOne {
  background-color: #ff6f31;
}

#ratingBarTwo {
  background-color: #ff9f02;
}

#ratingBarThree {
  background-color: #ffcf02;
}

#ratingBarFour {
  background-color: #88b131;
}

#ratingBarFive {
  background-color: #99cc00;
}

#dropdownMenu2{
	background-color: white;
	border: 1px solid gray;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1 style="text-align:center">所有評論</h1>


<div class="container">

<form method="get" action="${contextRoot}/backend/comment/storenamelike">

<div style="text-align:right">

<%-- <a href="${contextRoot}/front/comment/storecomment?commentfirmid=${commentStore.firmId}"><button class="btn btn-outline-success">全部</button></a> --%>

<input type="text" id="commentstorename" name="commentstorename"/><button type="submit" class="btn btn-outline-success">搜尋</button>
 </div>

<!-- <div id="ratingBarFive" class="ratingBar"></div> -->
<!-- <div id="ratingBarFour" class="ratingBar"></div> -->
<!-- <div id="ratingBarThree" class="ratingBar"></div> -->
<!-- <div id="ratingBarTwo" class="ratingBar"></div> -->
<!-- <div id="ratingBarOne" class="ratingBar"></div> -->
</form>
<br/>

<div class="dropdown" style="text-align:right">
  <button class="btn btn-black dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-expanded="false">
    排序
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
    <a href="${contextRoot}/backend/comment/all"><button class="dropdown-item" type="button">最新</button></a>
    <a href="${contextRoot}/backend/comment/scoredesc"><button class="dropdown-item" type="button">評分最高</button></a>
    <a href="${contextRoot}/backend/comment/scoreasc"><button class="dropdown-item" type="button">評分最低</button></a>
    <a href="${contextRoot}/backend/comment/timeasc"><button class="dropdown-item" type="button">最早</button></a>
  </div>
</div>


<br/>


<table class="table table-hover"
		style="width: 100%; table-layout: fixed;">
		<thead>
			<tr>
				<th style="width: 50px;">
				<label class="control control--checkbox">
						<input type="checkbox" class="js-check-all" />
				</label></th>
				<th scope="col">店家</th>
				<th scope="col">店名</th>
				<th scope="col" style="width: 80px">使用者</th>
				<th scope="col" style="width: 180px ; text-align:center">評分</th>
				<th scope="col">評論內容</th>
				<th scope="col">圖片</th>
				<th scope="col">時間</th>
				<th style="width: 140px;text-align: left;">動作</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach  var="comment" items="${page}" >
				<tr scope="row">
					<td class="align-middle"><label
						class="control control--checkbox"><input type="checkbox"
							id="check" value="<c:out value='${comment.commentId}'/>"
							style="margin-top: 20px;" />
						</label></td>
						<td class="align-middle">
						<div class="d-flex align-items-center">
							<c:out value="${comment.storeBean.firmBean.firmName}"></c:out>
						</div>
					</td>
					<td class="align-middle">
						<div class="d-flex align-items-center">
							<c:out value="${comment.storeBean.storeName}"></c:out>
						</div>
					</td>
					<td class="align-middle"><c:out value="${comment.userBean.userName}"></c:out>
					</td>
					<td class="align-middle"><div style="pointer-events: none; width: 150px;" id="scores${comment.commentId}" class="awesomeRating"></div>
					
					<div class="awesomeRatingValue"></div>
						<script type="text/javascript">
						
							$("#scores${comment.commentId}").awesomeRating({
								
								valueInitial: "${comment.score}",
								values: ["1.0", "2.0", "3.0", "4.0", "5.0"],
								targetSelector: "span.awesomeRatingValue"
							});
						
							console.log(${comment.score});
						</script>

					<td class="align-middle"><c:out value="${comment.content}"></c:out></td>

					<td class="align-middle"><img src="${comment.commentPhoto}" style="width: 100px;heiget: 100px" /></td>
					<td class="align-middle">(時間) <fmt:formatDate pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss EEEE" value="${comment.createTime}" /></td>
					
					<td class="align-middle" style="width: 13%;"><a href="${contextRoot}/backend/comment/editComment?commentid=${comment.commentId}"><button class="btn btn-primary">編輯</button></a>
					<a onclick="return confirm('真的要刪除嗎?')" href="${contextRoot}/backend/comment/delete?commentid=${comment.commentId}"><button class="btn btn-danger">刪除</button></a>
					</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>





</div>



<jsp:include page="layout/footer.jsp" />


</body>
</html>