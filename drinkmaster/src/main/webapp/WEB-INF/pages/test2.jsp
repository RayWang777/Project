<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.nav{
	
	height: 30px;
	
	background-color: #f1f1f1;
	
}


.warp{
	
	width: 1000px;
	
	margin: 0px auto;
	
}

.nav_ul1,.nav_ul2 li{
	
	float: left;
	
}

.nav_ul1 li{
	
	float: left;
	
	line-height: 30px;
	
	margin-right: 20px;
}

.nav_ul1 a,.nav_ul2 a,.nav_ul2 span{
	
	font-size: 12px;
	
	color: gray;
	
}

.nav_ul2{
	
	float: right;
	
}
.nav_ul2 li,.nav_ul2 span{
	
	line-height: 30px;
	
	margin-left: 15px;
	
}
.nav a:hover{
	
	color: red;
	
}

/*搜索框开始*/

.search{
	
	margin-top: 20px;
	
}

.search img{
	/*清除之前的样式*/
	clear: both;
	
	float: left;
	
}

.search_div{
	
	float: right;
	
	margin-top: 25px;
	
}
.search_text{
	
	width: 265px;
	
	height: 21px;
	
	
	border: 3px solid #c91623;
	
	position: relative;
	
	left: 4px;
	
	top: -1px;
}

.search_but{
	
	width: 51px;
	
	height: 29px;
	
	background-color: #c91623;
	
	border: 0px;
	
	color: #FFFFFF;
	
}

/*搜索框结束*/

/*标题开始*/
.title{
	
	margin-top: 130px;
	
}

.title h3{
	
	float: left;
	
	font-size: 23px;
	
	color:#c91623 ;
}


.title div{
	
	
	float: right;
	
	font-size: 14px;
	
	color:gray ;
}
/*标题结束*/

/*显示菜单的开始*/
.tips{
	
	width: 1000px;
	
	height: 50px;
	
	background-color: #f1f1f1;
	
	margin-top: 165px;
	
	border: 1px  solid  #e9e9e9;
	
}

.tips li{
	
	float: left;
	
	line-height: 50px;
	
	font-size: 12px;
	
	color: gray;
	
	
	
}

.tips li:nth-child(1){width: 90px; border-top: 3px solid #c91623 ;}

.tips li:nth-child(2){margin-left: 80px;}

.tips li:nth-child(3){margin-left: 430px;}

.tips li:nth-child(4){margin-left: 70px;}

.tips li:nth-child(5){margin-left: 110px;}

.tips li:nth-child(6){margin-left: 50px;}

/*显示菜单的结束*/


/*商品详情展示开始*/
.info{
	 width: 1000px;
	 
	 height: 125px;
	 
	 
	 background-color: #fff4e8;
	 
	 border: 1px  solid gray;
	 
	 margin-top: 30px;
	
	
	border-top: 3px solid  gray;
}

.info li{
	  float:  left;	
	  
	  margin-top: 20px;
}
.info a{
	
	font-size: 12px;
	
	color: #333333;
	
}
.info_1{
	
	margin-left: 23px;
	
}
.info_2{
	
	margin-left: 15px;
	
	border: 1px  solid gray;
	
}
.info_3{
	  
	  width: 270px;
	  
	  height: 20px;
	
}

.info_4{
	
	 margin-left: 45px;
	
}
.info_5{
	
	margin-left: 70px;
	
}
.info_6{
	
	 margin-left: 40px;
}
.info_6 input{
	
	width: 30px;
	
	height: 12px;
	
	text-align: center;
	
	position: relative;
	
	top: -2px;
	
	left: -5px;
	
}

.info_6 button{
	
	 width: 30px;
	 
	 height: 18px;
}
.bot{
	
	 position: relative;
	
	left: -10px;
}
.info_7{
	 width: 120px;
	 
}

/*商品详情展示结束*/


/*结算模块开始*/

.balance{
	
	width: 1000px;
	
	height: 50px;
	
	border: 1px  solid  gray;
	
	
	margin-top: 30px;
	
}

.balance_ul1,.balance_ul1>li,.balance_ul2>li{
	
	float: left;
	
	line-height: 50px;
	
	margin-left: 14px;
	
	
}
.balance_ul2{
	
	float: right;
}

.butt{
	
	width: 100px;
	
	height: 50px;
	
	background-color: #C91623;
	
	border: 0px;
	
	color: #FFFFFF;
	
	font-size: 20px;
	
	font-weight: bold;
	
}

.balance span{
	
	
	 font-size: 25px;
	 
	 color: #C91623 ;
	
	font-weight: bold;
}

.balance_ul2 li:nth-child(1){width: 120px;}

.balance_ul2 li:nth-child(2){width: 150px;}
</style>
</head>
<body>
<div class="nav">
		  	
		  	
		  	 <div class="warp">
		  	 	
		  	 	  <ul class="nav_ul1">
		  	 	  	<li><a href=""><i class="iconfont">&#xe6d3;</i> 京东首页</a></li>
		  	 	  	<li><a href="">配送到：北京</a></li>
		  	 	  </ul>
		  	 	
		  	 	
		  	 	  <ul class="nav_ul2">
		  	 	  	<li><a href="">哈你宝贝</a><span>|</span></li>
		  	 	  	<li><a href="">我的订单</a><span>|</span></li>
		  	 	  	<li><a href="">我的京东</a><span>|</span></li>
		  	 	  	<li><a href="">京东会员</a><span>|</span></li>
		  	 	  	<li><a href="">企业采购</a><span>|</span></li>
		  	 	  	<li><a href="">京东手机</a><span>|</span></li>
		  	 	  	<li><a href="">关注京东</a><span>|</span></li>
		  	 	  	<li><a href="">客户服务</a><span>|</span></li>
		  	 	  	<li><a href="">网站导航</a></li>
		  	 	  </ul>
		  	 	
		  	 </div>
		  	
		  	
		  	
		  </div>
		  
		
		<!--导航结束-->
		
		<!--搜索框开始-->
		  <div class="search">
		  	
		  	  <div class="warp">
		  	  	  
		  	  	  
		  	  	  <img src="img/logo.jpg" />
		  	  	  
		  	  	  
		  	  	  <div class="search_div">
		  	  	  	 
		  	  	  	  <input type="text" class="search_text" />
		  	  	  	
		  	  	  	  <input type="button" value="搜索"  class="search_but"/>
		  	  	  	
		  	  	  </div>
		  	  	
		  	  	
		  	  </div>
		  	
		  </div>
		
		<!--搜索框结束-->
		
		<!--标题开始-->
		  <div class="title warp">
		  	
		  	  <h3>全部商品</h3>
		  	   
		  	  <div>
		  	  	 
		  	  	 <span>配送到</span>
		  	  	
		  	  	<select>
		  	  		<option>昌平区</option>
		  	  		
		  	  		<option>顺义区</option>
		  	  		
		  	  		<option>大兴区</option>
		  	  		
		  	  		<option>朝阳区</option>
		  	  		
		  	  		<option>昌平区</option>
		  	  		
		  	  		
		  	  	</select>
		  	  	
		  	  </div>
		  	
		  </div>
		
		<!--标题结束-->
		
		<!--显示菜单的开始-->
		  <div class="tips warp">
		  	
		  	 <ul>
		  	 	<li>
		  	 		<input type="checkbox" name="fav" id="all" onclick="checkTest1(this),checkTest2()"/>
		  	 		全选
		  	 	</li>
		  	 	<li>商品</li>
		  	 	<li>单价</li>
		  	 	<li>数量</li>
		  	 	<li>小计</li>
		  	 	<li>操作</li>
		  	 </ul>
		  	
		  	
		  </div>
		<!--显示菜单的结束-->
		
		<!--商品详情展示开始-->
		  <div class="info warp">
		  	
		  	  <ul>
		  	  	<li class="info_1"><input type="checkbox"   name="fav" onclick="checkTest2()"/> </li>
		  	  	<li class="info_2"> <img src="img/img1.jpg" width="80px"/> </li>
		  	  	<li class="info_3"><a>【京东超市】desha春秋季儿童休闲服</a></li>
		  	  	<li class="info_4"><a>颜色：灰色+粉红</a> </li>
		  	  	<li class="info_5">182.5</li>
		  	  	<li class="info_6">
		  	  		<button onclick="checkTest3(this,1),checkTest2()">-</button>
		  	  		<input type="text" name="" id="" value="1" />
		  	  		<button class="bot" onclick="checkTest3(this,2),checkTest2()">+</button>
		  	  		
		  	  	</li>
		  	  	<li class="info_7">￥182.5</li>
		  	  	<li>
		  	  		<a href="javascript:viod(0)" onclick="checkTest4(this),checkTest2()">删除</a><br />
		  	  		<a>已到我的关注</a>
		  	  	</li>
		  	  </ul>
		  </div>
		
		 <div class="info warp">
		  	
		  	  <ul>
		  	  	<li class="info_1"><input type="checkbox" name="fav" onclick="checkTest2()"/> </li>
		  	  	<li class="info_2"> <img src="img/img1.jpg" width="80px"/> </li>
		  	  	<li class="info_3"><a>【京东超市】desha春秋季儿童休闲服</a></li>
		  	  	<li class="info_4"><a>颜色：灰色+粉红</a> </li>
		  	  	<li class="info_5">182.5</li>
		  	  	<li class="info_6">
		  	  		<button onclick="checkTest3(this,1),checkTest2()">-</button>
		  	  		<input type="text" name="" id="" value="1" />
		  	  		<button class="bot" onclick="checkTest3(this,2),checkTest2()">+</button>
		  	  		
		  	  	</li>
		  	  	<li class="info_7">￥182.5</li>
		  	  	<li>
		  	  		<a href="javascript:viod(0)" onclick="checkTest4(this),checkTest2()">删除</a><br />
		  	  		<a>已到我的关注</a>
		  	  	</li>
		  	  </ul>
		  	
		  	
		  </div>
		  
		   <div class="info warp">
		  	
		  	  <ul>
		  	  	<li class="info_1"><input type="checkbox" name="fav"  onclick="checkTest2()"/> </li>
		  	  	<li class="info_2"> <img src="img/img1.jpg" width="80px"/> </li>
		  	  	<li class="info_3"><a>【京东超市】desha春秋季儿童休闲服</a></li>
		  	  	<li class="info_4"><a>颜色：灰色+粉红</a> </li>
		  	  	<li class="info_5">182.5</li>
		  	  	<li class="info_6">
		  	  		<button onclick="checkTest3(this,1),checkTest2()">-</button>
		  	  		<input type="text" name="" id="" value="1" />
		  	  		<button class="bot" onclick="checkTest3(this,2),checkTest2()">+</button>
		  	  		
		  	  	</li>
		  	  	<li class="info_7">￥182.5</li>
		  	  	<li>
		  	  		<a href="javascript:viod(0)" onclick="checkTest4(this),checkTest2()">删除</a><br />
		  	  		<a>已到我的关注</a>
		  	  	</li>
		  	  </ul>
		  	
		  	
		  </div>
		<!--商品详情展示结束-->
		
		<!--结算开始-->
		
	   <div class="balance warp">
	   	
	   	   <ul class="balance_ul1">
	   	   	<li>
	   	   		
	   	   		<input type="checkbox" name="fav" id="" value=""  onclick="checkTest1(this),checkTest2()"/>
	   	   		全选
	   	   	</li>
	   	   	<li><a>删除选中商品</a></li>
	   	   	<li><a>移到我的关注</a></li>
	   	   	<li><a>清除下柜商品</a></li>
	   	   </ul>
	   	   
	   	   <ul class="balance_ul2">
	   	   	
	   	   	 <li>已经选择<span id="snum">0</span>件商品</li>
	   	   	 <li>总价 <span id="zongz">￥0</span></li>
	   	   	 <li>
	   	   	 	<button class="butt">去结算</button>
	   	   	 	
	   	   	 </li>
	   	   	
	   	   </ul>
	   	
	   	
	   </div>
</body>
</html>