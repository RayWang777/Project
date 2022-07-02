<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/header.jsp"></jsp:include>

<meta>
<style>
/*                背景滿版     */
html {
	height: 100%;
}

body {
	background-image: url("<c:url value="/ images/ cold_drink_juice_promotion_image.jpg "/>");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: 50% 40%;
	background-size: 100% 120%;
}
/*                背景滿版    */
.swiper-container {
	width: 830px;
	height: 370px;
}
</style>



<body >
	<!--                     <header class="bg-dark py-5"> -->
	<!--                       <div class="container px-4 px-lg-5 my-5">  -->
	<!--                            <div class="text-center text-white"> -->
	<!--                                 <h1 class="display-4 fw-bolder">Shop in style</h1> -->
	<!--                              <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>  -->
	<!--                           </div> -->
	<!--                        </div>  -->
	<!--                     </header>   -->

	<header class="py-2">
		<div class="swiper mySwiper">
			<div class="swiper-wrapper">
				<div class="swiper-button-next" style="margin-right: 15%"></div>
				<div class="swiper-button-prev" style="margin-left: 15%"></div>
				<c:forEach items="${swiperPic}" var="one">
					<div class="swiper-slide" style="text-align: center;">
						<a href="http://localhost:8081/drinkmaster/front/firm/${one}"><img
							alt="" src="<c:url value="/backend/firm/banner/${one}"/>"
							width="1000" height="370" /></a>
					</div>
				</c:forEach>
			</div>

			<div class="swiper-pagination"></div>
			<!--       <div class="swiper-scrollbar"></div> -->
		</div>

	</header>





	<!-- Section-->
	<section class="">
	<h2 style="margin-left: 166px">
						<b>最多人訂購</b>
					</h2>
		<div class="container px-4 px-lg-5 mt-0"
						style="margin-left: 180px;">
			<div class="row gx-4  row-cols-xl-3 ">
				
					
					
						
							<c:forEach items="${top3}" var="store">
								<div class="col mb-5">
								
									<a
										href="http://localhost:8081/drinkmaster/front/firm/${store.firmBean.firmId }">
										<img 
										src="http://localhost:8081/drinkmaster/front/firm/${store.firmBean.firmId }/photo ">
									</a>
								</div>
							</c:forEach>
						
					
				






			</div>
		</div>
	</section>



	<!-- 輪播 -->
	<script>
		var swiper = new Swiper(".mySwiper", {
			direction : 'horizontal',
			autoplay : {
				delay : 2000,
				stopOnLastSlide : false,
				disableOnInteraction : false,
			},
			loop : true,
			spaceBetween : '10px',

			pagination : ".swiper-pagination",
			speed : 100,
			//                     	 effect:'fade',
			effect : 'flip',

			observer : true,//修改swiper自己或子元素時，自動初始化swiper
			observeParents : true,//修改swiper的父元素時，自動初始化swiper

			pagination : {
				el : ".swiper-pagination",
				type : 'bullets',
				clickable : true,
			},
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
		});
	</script>
	<!-- 輪播結束 -->

</body>

<jsp:include page="layout/footer.jsp"></jsp:include>