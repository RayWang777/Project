<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>飲君子後臺系統</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">



<link href="${contextRoot}/css/lib/calendar2/pignose.calendar.min.css"
	rel="stylesheet">
<link href="${contextRoot}/css/lib/chartist/chartist.min.css"
	rel="stylesheet">
<link href="${contextRoot}/css/lib/font-awesome.min.css"
	rel="stylesheet">
<link href="${contextRoot}/css/lib/themify-icons.css" rel="stylesheet">
<link href="${contextRoot}/css/lib/owl.carousel.min.css"
	rel="stylesheet" />
<link href="${contextRoot}/css/lib/owl.theme.default.min.css"
	rel="stylesheet" />
<link href="${contextRoot}/css/lib/weather-icons.css" rel="stylesheet" />
<link href="${contextRoot}/css/lib/menubar/sidebar.css" rel="stylesheet">
<link href="${contextRoot}/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="${contextRoot}/css/lib/helper.css" rel="stylesheet">
<link href="${contextRoot}/css/style.css" rel="stylesheet">




<style>
    li{
        font-size: large;
    }
</style>
</head>


<div
	class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
	<div class="nano">
		<div class="nano-content">



			<ul>
				<div class="logo">
					<a href="${contextRoot}/backend/"> <!-- <img src="assets/images/logo.png" alt="" /> -->
						<span>飲君子後台</span>
					</a>
				</div>
				<li><a class="sidebar-sub-toggle"><i
						class="large material-icons md-48">account_circle</i> 會員管理<span
						class="sidebar-collapse-icon ti-angle-down"></span></a>
					<ul>
						<li><a href="${contextRoot}/backend/product">新增</a></li>
						<li><a href="#">修改</a></li>

						<li><a href="#">刪除</a></li>
						<li><a href="#">查詢</a></li>
					</ul></li>
				<li><a class="sidebar-sub-toggle"><i
                    class="large material-icons">business</i> 廠商管理 <span
						class="sidebar-collapse-icon ti-angle-down"></span></a>
					<ul>
						<li><a href="${contextRoot}/backend/firm">新增</a></li>
						<li><a href="#">修改</a></li>

						<li><a href="#">刪除</a></li>
						<li><a href="#">查詢</a></li>
					</ul></li>
				<li><a class="sidebar-sub-toggle"><i class="large material-icons">store</i> 店家管理 <span
						class="sidebar-collapse-icon ti-angle-down"></span></a>
					<ul>
						<li><a href="${contextRoot}/backend/store">新增</a></li>
						<li><a href="#">修改</a></li>

						<li><a href="#">刪除</a></li>
						<li><a href="#">查詢</a></li>
					</ul></li>
				<li><a class="sidebar-sub-toggle"><i class="large material-icons">local_cafe</i> 商品管理 <span
						class="sidebar-collapse-icon ti-angle-down"></span></a>
					<ul>
						<li><a href="${contextRoot}/backend/product/insertview">新增</a></li>
						<li><a href="#">修改</a></li>

						<li><a href="#">刪除</a></li>
						<li><a href="${contextRoot}/backend/product/all">查詢</a></li>
					</ul></li>
				<li><a class="sidebar-sub-toggle"><i class="large material-icons">local_grocery_store</i> 購物車管理 <span
						class="sidebar-collapse-icon ti-angle-down"></span></a>
					<ul>
						<li><a href="${contextRoot}/backend/shoppingcar">新增</a></li>
						<li><a href="#">修改</a></li>

						<li><a href="#">刪除</a></li>
						<li><a href="#">查詢</a></li>
					</ul></li>
				<li><a class="sidebar-sub-toggle"><i class="large material-icons">list</i> 訂單管理 <span
						class="sidebar-collapse-icon ti-angle-down"></span></a>
					<ul>
						<li><a href="${contextRoot}/backend/order">新增</a></li>
						<li><a href="#">修改</a></li>

						<li><a href="#">刪除</a></li>
						<li><a href="#">查詢</a></li>
					</ul></li>
				<li><a class="sidebar-sub-toggle"><i class="large material-icons">message</i> 評論管理 <span
						class="sidebar-collapse-icon ti-angle-down"></span></a>
					<ul>
						<li><a href="${contextRoot}/backend/comment">新增</a></li>
						<li><a href="#">修改</a></li>
						<li><a href="#">刪除</a></li>
						<li><a href="#">查詢</a></li>
					</ul></li>
				<li><a class="sidebar-sub-toggle"><i class="large material-icons">room_service</i> 客服管理 <span
						class="sidebar-collapse-icon ti-angle-down"></span></a>
					<ul>
						<li><a href="${contextRoot}/backend/service">新增</a></li>
						<li><a href="#">修改</a></li>
						<li><a href="#">刪除</a></li>
						<li><a href="#">查詢</a></li>
					</ul></li>
				<li><a><i class="ti-close"></i> Logout</a></li>
			</ul>
		</div>
	</div>
</div>
<!-- /# sidebar -->

<div class="header">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="float-left">
					<div class="hamburger sidebar-toggle">
						<span class="line"></span> <span class="line"></span> <span
							class="line"></span>
					</div>
				</div>
				<div class="float-right">
		
			
					<div class="dropdown dib">
						<div class="header-icon" data-toggle="dropdown">
							<span class="user-avatar"><a>Logout</a></li>
							</span>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="content-wrap">
	<div class="main">
		<div class="container-fluid">
	
		<!-- jquery vendor -->
<script src="${contextRoot}/js/lib/jquery.min.js"></script>
<script src="${contextRoot}/js/lib/jquery.nanoscroller.min.js"></script>
<!-- nano scroller -->
<script src="${contextRoot}/js/lib/menubar/sidebar.js"></script>
<script src="${contextRoot}/js/lib/preloader/pace.min.js"></script>
<!-- sidebar -->
<script src="${contextRoot}/js/lib/bootstrap.min.js"></script>
<script src="${contextRoot}/js/scripts.js"></script>
<!-- bootstrap -->