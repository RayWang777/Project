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
<link rel="stylesheet" href="<c:url value="/css/lib/bootstrap.min.css"/>"/>
<link rel="stylesheet" href="<c:url value="/css/lib/font-awesome.min.css"/>"/>

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

.total{
    padding-left: 15px;
    padding-right: 15px;
    padding-top: 20px;
    padding-bottom: 13px;
    display: flex;
    justify-content: space-between;
}
.total span{
    font-size: 20px;
    color: #829886;
    font-weight: bold;
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
</head>




<body>
<br>
<div class="wrap">
        <div class="top">
        
            <h3>訂單明細</h3>
            <div class="price">
                <span>訂購人</span>
                
                <span><input type="text" value="${canSeeUser.userName}" readonly="readonly" style="border:none"></span>
            </div>
            <div class="price">
                <span>商品名稱</span>
                
                <span><input type="text" value="${shopcarBuy.productName}" readonly="readonly" style="border:none"></span>
            </div>
            <div class="price">
                <span>數量</span>
                
                <span><input type="text" value="${shopcarBuy.quantity}" readonly="readonly" style="border:none"></span>
            </div>
            <div class="price">
                <span>甜度</span>
                
                <span><input type="text" value="${shopcarBuy.sweet}" readonly="readonly" style="border:none"></span>
            </div>
            <div class="price">
                <span>冷熱</span>
                
                <span><input type="text" value="${shopcarBuy.coldhot}" readonly="readonly" style="border:none"></span>
            </div>
            <div class="price">
                <span>電話</span>
                
                <span><input type="text" value="${shopcarBuy.phone}" readonly="readonly" style="border:none"></span>
            </div>
            <div class="price">
                <span>地址</span>
                
                <span><input type="text" value="${shopcarBuy.address}" readonly="readonly" style="border:none"></span>
            </div>
            <br>
            <div class="total">
                <span>總金額</span>
                <span>NT$ <input type="text" value="${shopcarBuy.totalPrice}" readonly="readonly" style="border:none"></span>
            </div>
        </div>
        <div class="bottom">
            <h3>購物清單</h3>
<!--             <div class="list"> -->
<!--                 <img src="https://i.postimg.cc/zB7qtwdD/pic.png" alt="pciture of cake"> -->
<!--                 <div class="item"> -->
<!--                         <h4>焦糖馬卡龍 (2)</h4> -->
<!--                         <p class="item-price">NT$ 900</p> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="list"> -->
<!--                 <img src="https://i.postimg.cc/zB7qtwdD/pic.png" alt="pciture of cake"> -->
<!--                 <div class="item"> -->
<!--                        <h4>焦糖馬卡龍 (2)</h4> -->
<!--                         <p class="item-price">NT$ 900</p> -->
<!--                 </div> -->
<!--             </div>   -->
<!--             <div class="list"> -->
<!--                 <img src="https://i.postimg.cc/zB7qtwdD/pic.png" alt="pciture of cake"> -->
<!--                 <div class="item"> -->
<!--                     <ul> -->
<!--                        <h4>焦糖馬卡龍 (2)</h4> -->
<!--                         <p class="item-price">NT$ 900</p> -->
<!--                 </div> -->
            </div>    
        </div>
<br>
    
</body>

<script type="text/javascript">

</script>

<script src="<c:url value="/js/lib/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/lib/jquery.min.js"/>"></script>

<jsp:include page="layout/footer.jsp"></jsp:include>