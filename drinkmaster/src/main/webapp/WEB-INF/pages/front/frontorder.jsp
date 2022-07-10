<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/header.jsp"></jsp:include>


<head>
<meta charset="utf-8" />
<title>訂單明細</title>

<%-- <link rel="stylesheet" href="<c:url value="/css/lib/font-awesome.min.css"/>"/> --%>

<style type="text/css">
/* .table>tbody>tr>td, .table>tfoot>tr>td{ */
/*     vertical-align: middle; */
/* } */
/* @media screen and (max-width: 600px) { */
/*     table#cart tbody td .form-control{ */
/* 		width:20%; */
/* 		display: inline !important; */
/* 	} */
/* 	.actions .btn{ */
/* 		width:36%; */
/* 		margin:1.5em 0; */
/* 	} */
	
/* 	.actions .btn-info{ */
/* 		float:left; */
/* 	} */
/* 	.actions .btn-danger{ */
/* 		float:right; */
/* 	} */
	
/* 	table#cart thead { display: none; } */
/* 	table#cart tbody td { display: block; padding: .6rem; min-width:320px;} */
/* 	table#cart tbody tr td:first-child { background: #333; color: #fff; } */
/* 	table#cart tbody td:before { */
/* 		content: attr(data-th); font-weight: bold; */
/* 		display: inline-block; width: 8rem; */
/* 	} */
	
	
	
/* 	table#cart tfoot td{display:block; } */
/* 	table#cart tfoot td .btn{display:block;} */
	
/* } */
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}

.wrap{
    width: 600px;
    margin: 0 auto;
}

.top{
    margin-bottom: 20px;
    border: #e7eeea solid;
}
.top h3{
    padding-top: 28px;
    padding-bottom: 28px;
    padding-left: 105px;
    padding-right: 105px;
    font-size: 18px;
    font-weight: bold;
    color: #829886;
    background-color: #e7eeea;
    text-align: center;
}

.price{
    padding-left: 15px;
    padding-right: 15px;
    padding-top: 15px;
    display: flex;
    justify-content: space-between;
}
.price span{
    color: #829886;
}

/* .total{ */
/*     padding-left: 15px; */
/*     padding-right: 15px; */
/*     padding-top: 20px; */
/*     padding-bottom: 13px; */
/*     display: flex; */
/*     justify-content: space-between; */
/* } */
.total span{
    font-size: 20px;
    color: #829886;
    font-weight: bold;
}


.total #totalprice{

	padding-left: 240px;
}

.bottom{
    border: #e7eeea solid;
}
.bottom h3{
    padding-top: 28px;
    padding-bottom: 28px;
    padding-left: 105px;
    padding-right: 105px;
    font-size: 18px;
    font-weight: bold;
    color: #829886;
    background-color: #e7eeea;
    text-align: center;
}

.list{
    padding: 15px;
    padding-left: 20px;
    display: flex;
    align-items: center;
}
.item-price{
    margin-left: 20px;
    font-size: 20px;
    font-weight: bold;
    color: #829886;
}

.item h4{
    margin-left: 20px;
    margin-bottom: 5px;
    color: #829886;
}

</style>
<link rel="stylesheet" href="<c:url value="/css/lib/bootstrap.min.css"/>"/>
</head>




<body>
<br>
<div style="text-align: center;"><h3>訂單明細</h3></div>
<div class="wrap">
           
</div>
<%-- <c:forEach varStatus="vs" var="shopcarItems" items="${shopcarBuy}"> --%>
<div class="wrap">
        <div class="top">
        <div class="price">
            <span>訂購人</span>
                
            <span>
            <c:out value="${canSeeUser.userName}" /></span>
            </div>
         <div class="price">
                <span>電話</span>
                
                <span><c:out value="${data.orderPhone}" /></span>
            </div>
            <div class="price">
                <span>地址</span>
                
                <span><c:out value="${data.orderAddress}" /></span>
            </div>
            
            <div class="price">
                <span>下單時間</span>
                
                <span>
                <fmt:formatDate  value="${data.createTime}" pattern="yyyy-MM-dd HH:mm"/>
<%--                 <c:out value="${data.createTime}" /> --%>
                </span>
            </div>
            <div class="price">
                <span>訂單狀態</span>
                
                <span><c:out value="${data.orderStatus}" /></span>
            </div>
            
            
<!--             <div class="price"> -->
<!--                 <span>商店名稱</span> -->
                
<%--                 <span><c:out value="${shopcarItems.value.storeName}" /></span> --%>
<!--             </div> -->
<!--             <div class="price"> -->
<!--                 <span>商品名稱</span> -->
                
<%--                 <span><c:out value="${shopcarItems.value.productName}" /></span> --%>
<!--             </div> -->
<!--             <div class="price"> -->
<!--                 <span>數量</span> -->
                
<%--                 <span><c:out value="${shopcarItems.value.quantity}" /></span> --%>
<!--             </div> -->
<!--             <div class="price"> -->
<!--                 <span>甜度</span> -->
                
<%--                 <span><c:out value="${shopcarItems.value.sweet}" /></span> --%>
<!--             </div> -->
<!--             <div class="price"> -->
<!--                 <span>冷熱</span> -->
                
<%--                 <span><c:out value="${shopcarItems.value.coldhot}" /></span> --%>
<!--             </div> -->
            
            <br>
            <div class="total">
            
                <span style="margin-left: 15px;">總金額</span>
                
                <span  id="totalprice">NT$ <c:out value="${data.totalPrice}" /></span>
            	
            </div>
        </div>

            </div>  
<%--             </c:forEach>   --%>
        <div style="text-align: center;">
        <a href="${contextRoot}/front/">
        <button type="button" class="btn btn-success">繼續購買</button>
		</a>
		&ensp;&ensp;&ensp;
		<a href="${contextRoot}/front/order/userOrder?orderuserid=${canSeeUser.userId}">
		<button type="button" class="btn btn-warning">查看訂單</button>
		</a>
		</div>
<br>
    
</body>

<script type="text/javascript">

</script>

<%-- <script src="<c:url value="/js/lib/bootstrap.min.js"/>"></script> --%>
<%-- <script src="<c:url value="/js/lib/jquery.min.js"/>"></script> --%>

<jsp:include page="layout/footer.jsp"></jsp:include>