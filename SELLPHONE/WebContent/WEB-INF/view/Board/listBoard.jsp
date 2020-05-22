<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>게시판 작성</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="OneTech shop project">
<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- The styles -->
    <link id="bs-css" href="${pageContext.request.contextPath}/resource/charisma-master/css/bootstrap-cerulean.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/charisma-master/css/charisma-app.css" rel="stylesheet">
    <link href='${pageContext.request.contextPath}/resource/charisma-master/bower_componets/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
    <link href='${pageContext.request.contextPath}/resource/charisma-master/bower_componets/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
    <link href='${pageContext.request.contextPath}/resource/charisma-master/bower_componets/chosen/chosen.min.css' rel='stylesheet'>
    <link href='${pageContext.request.contextPath}/resource/charisma-master/bower_componets/colorbox/example3/colorbox.css' rel='stylesheet'>
    <link href='${pageContext.request.contextPath}/resource/charisma-master/bower_componets/responsive-tables/responsive-tables.css' rel='stylesheet'>
    <link href='${pageContext.request.contextPath}/resource/charisma-master/bower_componets/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>
    <link href='${pageContext.request.contextPath}/resource/charisma-master/css/jquery.noty.css' rel='stylesheet'>
    <link href='${pageContext.request.contextPath}/resource/charisma-master/css/noty_theme_default.css' rel='stylesheet'>
    <link href='${pageContext.request.contextPath}/resource/charisma-master/css/elfinder.min.css' rel='stylesheet'>
    <link href='${pageContext.request.contextPath}/resource/charisma-master/css/elfinder.theme.css' rel='stylesheet'>
    <link href='${pageContext.request.contextPath}/resource/charisma-master/css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='${pageContext.request.contextPath}/resource/charisma-master/css/uploadify.css' rel='stylesheet'>
    <link href='${pageContext.request.contextPath}/resource/charisma-master/css/animate.min.css' rel='stylesheet'>
	<style>
			#pagination-container {
			box-sizing: border-box;
			width: 100%;
			border: solid 1px red; border: none;
			position: relative;
			display: flex; flex-flow: row nowrap; justify-content: center; align-items: center;
			#indicator {
				width: 3rem; height: 3rem;
				border-radius: 50%; background-color: $gold; visibility: hidden;
				position: absolute; top: 50%; transform: translateY(-50%); left: 0; z-index: -1;
			}
			a {
				margin: 0 1.5rem 0 0; padding: .75rem 0 0; box-sizing: border-box; 
				border-radius: 50%;
				width: 3rem; height: 3rem;
				display: block;
				font-size: 1.5rem; color: $navy; text-decoration: none; font-weight: 700; 
				text-align: center; line-height: 100%;
				&:last-of-type {margin-right: 0;}
				&.active {
		
				}
			}
			#hand-svg {
				width: 350px; height: 450px; box-sizing: border-box;
				position: absolute; top: 0; left: 0; z-index: -1;
				visibility: hidden;
				pointer-events: none;
			}
		}
	</style>
	<script>
			var
			pagContainer = document.getElementById('pagination-container'),
			pagIndicator = document.getElementById('indicator'),
			pagLinks = document.querySelectorAll('.pag-link'),
		    	handSVG = document.getElementById('hand-svg'),
		    	fingerBG = document.getElementById('finger-bg'),
		    	fingerBorder = document.getElementById('finger-border'),
		    	fingernail1 = document.getElementById('fingernail-1'),
		    	fingernail2 = document.getElementById('fingernail-2'),
			numLinks, curLink,
		    	pagContainerRect, svgRect, yDest, yDistance,
		    	TL,
		    	fingerBGB = "M320.8,119c-1-6.5-7-10.9-13.5-9.9l-0.1,0c-6.2,0.9-12.3,1.8-18.3,2.4c-6,0.6-11.8,1-17.6,1 c-5.8,0-11.6,0.1-17.4-0.9c-8-1.4-13.6-5.4-17.4-11c-3.1-4.5-5.1-10-6.3-15.9c-1-4.6-1.5-9.4-1.8-14.1c-0.4-6.4,0-12.8,1.5-19.1 c1.5-6.3,4.2-12.6,7.7-18.6l0.1-0.2c2.9-5,1.8-11.5-2.9-15.1c-5.1-4-12.4-3.1-16.4,2c-2.2,2.8-4.2,5.7-6.1,8.7 c-2.9,4.7-5.5,9.6-7.5,14.9c-3.4,8.7-5.5,18.1-5.9,27.5c-0.5,9.4,0.5,18.8,2.4,27.7c1.9,8.9,4.7,17.4,8.1,25.6l0,0.1 c0.3,0.7,0.6,1.4,1,2c1.5,2.7,3.6,4.8,6.1,6.4c2.3,7.2,17.1,12.4,17.1,12.4c6.7,0,13.4-0.1,20.2-0.5c6.8-0.4,13.6-1.1,20.4-2.3 c6.8-1.1,13.5-2.6,19.9-4.4c6.4-1.7,12.6-3.7,18.7-5.6C318.2,130.3,321.7,124.8,320.8,119z",
		    	fingerBorderB = "M257.9 144.9c4.8-.4 11.5-2 16.3-2.8 6.8-1.1 13.5-2.6 19.9-4.4 6.4-1.7 12.6-3.7 18.7-5.6 5.4-1.7 9-7.2 8.1-13-1-6.5-7-10.9-13.5-9.9h-.1c-6.2.9-12.3 1.8-18.3 2.4-6 .6-11.8 1-17.6 1-5.8 0-11.6.1-17.4-.9-9.8-1.7-15.9-7.3-19.7-14.9-2.1-4.2-3.6-9.1-4.5-14.1-.7-3.9-1.2-8-1.4-12-.4-6.4 0-12.8 1.5-19.1 1.5-6.3 4.2-12.6 7.7-18.6l.1-.2c2.9-5 1.8-11.5-2.9-15.1-5.1-4-12.4-3.1-16.4 2-1.4 1.7-2.7 3.5-4 5.4-3.8 5.6-7.1 11.7-9.7 18.2-3.4 8.7-5.5 18.1-5.9 27.5-.4 7.1.1 14.1 1.1 20.9",
		    	fingernail2B = "M229.6 17.5l-5.8 11.2c-.6 1.1-1.9 1.5-2.9.9l-2.5-1.3c-1.1-.6-1.5-1.9-.9-2.9l2.7-5.2c1.8-3.4 6-4.7 9.3-2.9.1 0 .1.1.1.2z",
		    	fingernail1B = "M303.2 128.9l-.4-1.7c-.5-2.3.9-4.5 3.1-5l12.3-2.8c1.2 5.2-2 10.3-7.2 11.5l-3.5.8c-1.9.4-3.9-.8-4.3-2.8z"
		;
		
		function onPagLinkClick(e) {
			e.preventDefault();
			var time = 0;
			
			if(TL && TL.isActive()) {TL.kill();}
			TL = new TimelineMax({paused: true});
			
			svgRect = handSVG.getBoundingClientRect();
		
			if(svgRect.top > yDest) {
				TL
					.to(handSVG, .35, {rotation: 0, y: -44, ease: Quad.easeOut}, 0)
					.to(fingerBG, .4, {morphSVG: fingerBG, ease: Quad.easeOut}, ".25")
					.to(fingerBorder, .4, {morphSVG: fingerBorder, ease: Quad.easeOut}, ".25")
					.to(fingernail1, .4, {morphSVG: fingernail1, ease: Quad.easeOut}, ".25")
					.to(fingernail2, .4, {morphSVG: fingernail2, ease: Quad.easeOut}, ".25")
				;
				time = TL.duration();
			} else {
				TL
					.to(fingerBG, .25, {morphSVG: fingerBG, ease: Quad.easeOut}, 0)
					.to(fingerBorder, .25, {morphSVG: fingerBorder, ease: Quad.easeOut}, 0)
					.to(fingernail1, .25, {morphSVG: fingernail1, ease: Quad.easeOut}, 0)
					.to(fingernail2, .25, {morphSVG: fingernail2, ease: Quad.easeOut}, 0)
				;
			}
			
			TL
				.to(indicator, .5, {x: e.target.rect.left - pagContainerRect.left, ease: Quad.easeInOut}, time)
				.to(pagLinks[curLink], .2, {color: '#3a5e77', ease: Linear.easeNone}, time)
				.to(handSVG, .5, {x: e.target.rect.left - pagContainerRect.left - 251, ease: Quad.easeInOut}, time)
				.to(e.target, .2, {color: '#FFF', ease: Linear.easeNone}, time + .45)
				
				.to(fingerBG, .4, {morphSVG: fingerBGB, ease: Quad.easeOut}, time + .6)
				.to(fingerBorder, .4, {morphSVG: fingerBorderB, ease: Quad.easeOut}, time + .6)
				.to(fingernail1, .4, {morphSVG: fingernail1B, ease: Quad.easeOut}, time + .6)
				.to(fingernail2, .4, {morphSVG: fingernail2B, ease: Quad.easeOut}, time + .6)
				
				.to(handSVG, .5, {rotation: 0, y: yDistance, ease: Quad.easeIn}, "-=.25")
			;
			TL.play();
			curLink = e.target.num;
		}
		
		function initPagination() {
			numLinks = pagLinks.length;
			curLink = 0;
			for(var i = 0; i < numLinks; i++) {
				pagLinks[i].addEventListener('click', onPagLinkClick);
				pagLinks[i].rect = pagLinks[i].getBoundingClientRect();
				pagLinks[i].num = i;
			}
			
			pagContainerRect = pagContainer.getBoundingClientRect();
			svgRect = handSVG.getBoundingClientRect();
			yDest = svgRect.top - 44;
			yDistance = document.querySelector('footer').getBoundingClientRect().top - pagContainerRect.top;
			
			TweenMax.set(pagLinks[0], {color: "#FFF"});
			TweenMax.set(indicator, {autoAlpha: 1, x: pagLinks[0].rect.left - pagContainerRect.left});
			TweenMax.set(handSVG, {autoAlpha: 1, rotation: 0, x: pagLinks[0].rect.left - pagContainerRect.left - 253, y: yDistance});
			TweenMax.set(fingerBG, {morphSVG: fingerBGB});
			TweenMax.set(fingerBorder, {morphSVG: fingerBorderB});
			TweenMax.set(fingernail1, {morphSVG: fingernail1B});
			TweenMax.set(fingernail2, {morphSVG: fingernail2B});
			
		}
		
		console.clear();
		initPagination();
	</script>
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resource/charisma-master/bower_componets/jquery/jquery.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resource/Board/styles/bootstrap4/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resource/Board/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/Board/styles/cart_styles.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/Board/styles/cart_responsive.css">

</head>

<body>

	<div class="super_container">

		<!-- Header -->

		<header class="header">

			<!-- Top Bar -->
			
			
			<div class="top_bar">
				<div class="container">
					<div class="row">
						<div class="col d-flex flex-row">
							<div class="top_bar_content ml-auto">
								<div class="top_bar_menu">
									<ul class="standard_dropdown top_bar_dropdown">
									</ul>
								</div>
								<div class="top_bar_user">
									<div class="user_icon">
										<img src="images/user.svg" alt="">
									</div>
									<c:if test="${empty authUser}">
									<div><a href="${pageContext.request.contextPath}/resource/Login/SignSelect.jsp">Register</a></div>
									<div><a href="${pageContext.request.contextPath}/resource/Login/SelectBuyerSeller.html">Log in</a></div>
									</c:if>
									<c:if test="${!empty authUser}">
									<div>${authUserId} 님</div>
									<div><a href="${ctxPath}/SELLPHONE/logout.do">Log out</a></div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			<!-- Header Main -->

			<div class="header_main">
				<div class="container">
					<div class="row">

						<!-- Logo -->
						<div class="col-lg-2 col-sm-3 col-3 order-1">
							<div class="logo_container">
								<div class="logo">
									<a href="index.html">SellPhone</a>
								</div>
							</div>
						</div>

						<!-- Search -->
						<div
							class="col-lg-6 col-12 order-lg-2 order-3 text-lg-left text-right">
							<div class="header_search">
								<div class="header_search_content">
									<div class="header_search_form_container">
										<form action="#" class="header_search_form clearfix">
											<input type="search" required="required"
												class="header_search_input"
												placeholder="Search for products...">
											<div class="custom_dropdown">
												<div class="custom_dropdown_list">
													<span class="custom_dropdown_placeholder clc">All
														Categories</span> <i class="fas fa-chevron-down"></i>
													<ul class="custom_list clc">
														<li><a class="clc" href="#">All Categories</a></li>
														<li><a class="clc" href="#">Computers</a></li>
														<li><a class="clc" href="#">Laptops</a></li>
														<li><a class="clc" href="#">Cameras</a></li>
														<li><a class="clc" href="#">Hardware</a></li>
														<li><a class="clc" href="#">Smartphones</a></li>
													</ul>
												</div>
											</div>
											<button type="submit" class="header_search_button trans_300"
												value="Submit">
												<img src="images/search.png" alt="">
											</button>
										</form>
									</div>
								</div>
							</div>
						</div>

						<!-- Wishlist -->
						<div
							class="col-lg-4 col-9 order-lg-3 order-2 text-lg-left text-right">
							<div
								class="wishlist_cart d-flex flex-row align-items-center justify-content-end">
								<div
									class="wishlist d-flex flex-row align-items-center justify-content-end">
									<div class="wishlist_icon">
										<img src="images/heart.png" alt="">
									</div>
									<div class="wishlist_content">
										<div class="wishlist_text">
											<a href="#">Wishlist</a>
										</div>
										<div class="wishlist_count">115</div>
									</div>
								</div>

								<!-- Cart -->
								<div class="cart">
									<div
										class="cart_container d-flex flex-row align-items-center justify-content-end">
										<div class="cart_icon">
											<img src="images/cart.png" alt="">
											<div class="cart_count">
												<span>10</span>
											</div>
										</div>
										<div class="cart_content">
											<div class="cart_text">
												<a href="#">Cart</a>
											</div>
											<div class="cart_price">$85</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Main Navigation -->

			<nav class="main_nav">
				<div class="container">
					<div class="row">
						<div class="col">

							<div class="main_nav_content d-flex flex-row">

								<!-- Categories Menu -->

								<div class="cat_menu_container">
									<div
										class="cat_menu_title d-flex flex-row align-items-center justify-content-start">
										<div class="cat_burger">
											<span></span><span></span><span></span>
										</div>
										<div class="cat_menu_text">categories</div>
									</div>

									<ul class="cat_menu">
										<li><a href="#">Computers & Laptops <i
												class="fas fa-chevron-right ml-auto"></i></a></li>
										<li><a href="#">Cameras & Photos<i
												class="fas fa-chevron-right"></i></a></li>
										<li class="hassubs"><a href="#">Hardware<i
												class="fas fa-chevron-right"></i></a>
											<ul>
												<li class="hassubs"><a href="#">Menu Item<i
														class="fas fa-chevron-right"></i></a>
													<ul>
														<li><a href="#">Menu Item<i
																class="fas fa-chevron-right"></i></a></li>
														<li><a href="#">Menu Item<i
																class="fas fa-chevron-right"></i></a></li>
														<li><a href="#">Menu Item<i
																class="fas fa-chevron-right"></i></a></li>
														<li><a href="#">Menu Item<i
																class="fas fa-chevron-right"></i></a></li>
													</ul></li>
												<li><a href="#">Menu Item<i
														class="fas fa-chevron-right"></i></a></li>
												<li><a href="#">Menu Item<i
														class="fas fa-chevron-right"></i></a></li>
												<li><a href="#">Menu Item<i
														class="fas fa-chevron-right"></i></a></li>
											</ul></li>
										<li><a href="#">Smartphones & Tablets<i
												class="fas fa-chevron-right"></i></a></li>
										<li><a href="#">TV & Audio<i
												class="fas fa-chevron-right"></i></a></li>
										<li><a href="#">Gadgets<i
												class="fas fa-chevron-right"></i></a></li>
										<li><a href="#">Car Electronics<i
												class="fas fa-chevron-right"></i></a></li>
										<li><a href="#">Video Games & Consoles<i
												class="fas fa-chevron-right"></i></a></li>
										<li><a href="#">Accessories<i
												class="fas fa-chevron-right"></i></a></li>
									</ul>
								</div>

								<!-- Main Nav Menu -->

								<div class="main_nav_menu ml-auto">
									<ul class="standard_dropdown main_nav_dropdown">
										<li><a href="index.html">Home<i
												class="fas fa-chevron-down"></i></a></li>
										<li class="hassubs"><a href="#">Super Deals<i
												class="fas fa-chevron-down"></i></a>
											<ul>
												<li><a href="#">Menu Item<i
														class="fas fa-chevron-down"></i></a>
													<ul>
														<li><a href="#">Menu Item<i
																class="fas fa-chevron-down"></i></a></li>
														<li><a href="#">Menu Item<i
																class="fas fa-chevron-down"></i></a></li>
														<li><a href="#">Menu Item<i
																class="fas fa-chevron-down"></i></a></li>
													</ul></li>
												<li><a href="#">Menu Item<i
														class="fas fa-chevron-down"></i></a></li>
												<li><a href="#">Menu Item<i
														class="fas fa-chevron-down"></i></a></li>
												<li><a href="#">Menu Item<i
														class="fas fa-chevron-down"></i></a></li>
											</ul></li>
										<li class="hassubs"><a href="#">Featured Brands<i
												class="fas fa-chevron-down"></i></a>
											<ul>
												<li><a href="#">Menu Item<i
														class="fas fa-chevron-down"></i></a>
													<ul>
														<li><a href="#">Menu Item<i
																class="fas fa-chevron-down"></i></a></li>
														<li><a href="#">Menu Item<i
																class="fas fa-chevron-down"></i></a></li>
														<li><a href="#">Menu Item<i
																class="fas fa-chevron-down"></i></a></li>
													</ul></li>
												<li><a href="#">Menu Item<i
														class="fas fa-chevron-down"></i></a></li>
												<li><a href="#">Menu Item<i
														class="fas fa-chevron-down"></i></a></li>
												<li><a href="#">Menu Item<i
														class="fas fa-chevron-down"></i></a></li>
											</ul></li>
										<li class="hassubs"><a href="#">Pages<i
												class="fas fa-chevron-down"></i></a>
											<ul>
												<li><a href="shop.html">Shop<i
														class="fas fa-chevron-down"></i></a></li>
												<li><a href="product.html">Product<i
														class="fas fa-chevron-down"></i></a></li>
												<li><a href="blog.html">Blog<i
														class="fas fa-chevron-down"></i></a></li>
												<li><a href="blog_single.html">Blog Post<i
														class="fas fa-chevron-down"></i></a></li>
												<li><a href="regular.html">Regular Post<i
														class="fas fa-chevron-down"></i></a></li>
												<li><a href="cart.html">Cart<i
														class="fas fa-chevron-down"></i></a></li>
												<li><a href="contact.html">Contact<i
														class="fas fa-chevron-down"></i></a></li>
											</ul></li>
										<li><a href="blog.html">Q&A<i
												class="fas fa-chevron-down"></i></a></li>
										<li><a href="contact.html">Contact<i
												class="fas fa-chevron-down"></i></a></li>
									</ul>
								</div>

								<!-- Menu Trigger -->

								<div class="menu_trigger_container ml-auto">
									<div
										class="menu_trigger d-flex flex-row align-items-center justify-content-end">
										<div class="menu_burger">
											<div class="menu_trigger_text">menu</div>
											<div class="cat_burger menu_burger_inner">
												<span></span><span></span><span></span>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</nav>

			<!-- Menu -->

			<div class="page_menu">
				<div class="container">
					<div class="row">
						<div class="col">

							<div class="page_menu_content">

								<div class="page_menu_search">
									<form action="#">
										<input type="search" required="required"
											class="page_menu_search_input"
											placeholder="Search for products...">
									</form>
								</div>
								<!-- <ul class="page_menu_nav">
									<li class="page_menu_item has-children"><a href="#">Language<i
											class="fa fa-angle-down"></i></a>
										<ul class="page_menu_selection">
											<li><a href="#">English<i class="fa fa-angle-down"></i></a></li>
											<li><a href="#">Italian<i class="fa fa-angle-down"></i></a></li>
											<li><a href="#">Spanish<i class="fa fa-angle-down"></i></a></li>
											<li><a href="#">Japanese<i class="fa fa-angle-down"></i></a></li>
										</ul></li> -->
									<!-- <li class="page_menu_item has-children"><a href="#">Currency<i
											class="fa fa-angle-down"></i></a>
										<ul class="page_menu_selection">
											<li><a href="#">US Dollar<i class="fa fa-angle-down"></i></a></li>
											<li><a href="#">EUR Euro<i class="fa fa-angle-down"></i></a></li>
											<li><a href="#">GBP British Pound<i
													class="fa fa-angle-down"></i></a></li>
											<li><a href="#">JPY Japanese Yen<i
													class="fa fa-angle-down"></i></a></li>
										</ul></li> -->
									<li class="page_menu_item"><a href="index.html">Home<i
											class="fa fa-angle-down"></i></a></li>
									<li class="page_menu_item has-children"><a href="#">Super
											Deals<i class="fa fa-angle-down"></i>
									</a>
										<ul class="page_menu_selection">
											<li><a href="#">Super Deals<i
													class="fa fa-angle-down"></i></a></li>
											<li class="page_menu_item has-children"><a href="#">Menu
													Item<i class="fa fa-angle-down"></i>
											</a>
												<ul class="page_menu_selection">
													<li><a href="#">Menu Item<i
															class="fa fa-angle-down"></i></a></li>
													<li><a href="#">Menu Item<i
															class="fa fa-angle-down"></i></a></li>
													<li><a href="#">Menu Item<i
															class="fa fa-angle-down"></i></a></li>
													<li><a href="#">Menu Item<i
															class="fa fa-angle-down"></i></a></li>
												</ul></li>
											<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
											<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
											<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										</ul></li>
									<li class="page_menu_item has-children"><a href="#">Featured
											Brands<i class="fa fa-angle-down"></i>
									</a>
										<ul class="page_menu_selection">
											<li><a href="#">Featured Brands<i
													class="fa fa-angle-down"></i></a></li>
											<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
											<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
											<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										</ul></li>
									<li class="page_menu_item has-children"><a href="#">Trending
											${pageContext.request.contextPath}/resource/Board/styles<i class="fa fa-angle-down"></i>
									</a>
										<ul class="page_menu_selection">
											<li><a href="#">Trending ${pageContext.request.contextPath}/resource/Board/styles<i
													class="fa fa-angle-down"></i></a></li>
											<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
											<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
											<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										</ul></li>
									<li class="page_menu_item"><a href="blog.html">blog<i
											class="fa fa-angle-down"></i></a></li>
									<li class="page_menu_item"><a href="contact.html">contact<i
											class="fa fa-angle-down"></i></a></li>
								</ul>

								<div class="menu_contact">
									<div class="menu_contact_item">
										<div class="menu_contact_icon">
											<img src="images/phone_white.png" alt="">
										</div>
										+38 068 005 3570
									</div>
									<div class="menu_contact_item">
										<div class="menu_contact_icon">
											<img src="images/mail_white.png" alt="">
										</div>
										<a href="mailto:fastsales@gmail.com">fastsales@gmail.com</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</header>

		<!-- Cart -->

		<div class="cart_section">
			<div class="container">
				<div class="row">
					<div class="col-lg-10 offset-lg-1">
						<div class="cart_container">	
							<div class="cart_title"><strong>Q&A 게시판</strong></div>
								<div class="box-content">
								    
								    <table class="table table-striped table-bordered bootstrap-datatable datatable responsive">
								    <thead>
								    <tr>
								        <th>No</th>
								        <th>제목</th>
								        <th>작성자</th>
								        <th>게시 날짜</th>
								        <th>기능 버튼</th>
								    </tr>
								    </thead>
								    <tbody>
								    <c:if test="${articlePage.hasNoArticles()}">
										<tr>
											<td colspan="5">게시글이 없습니다.</td>
										</tr>
									</c:if>
										
									<c:forEach var="article" items="${articlePage.content}">
										<tr>
											<td class="center">${article.qna_idx}</td>
											<td class="center">
											<a href="read.do?no=${article.qna_idx}&pageNo=${articlePage.currentPage}">
											<c:out value="${article.qna_title}"/>
											</a>
											</td>
											<td class="center">${article.writer.name}</td>
											<td class="center">${article.qna_date}</td>
											<td class="center">
								            <a class="btn btn-success" href="read.do?no=${article.qna_idx}&pageNo=${articlePage.currentPage}">
								                <i class="glyphicon glyphicon-zoom-in icon-white"></i>
								                View
								            </a>
								            <a class="btn btn-info" href="modify.do?no=${article.qna_idx}">
								                <i class="glyphicon glyphicon-edit icon-white"></i>
								                Edit
								            </a>
								            <a class="btn btn-danger" href="delete.do?no=${article.qna_idx}">
								                <i class="glyphicon glyphicon-trash icon-white"></i>
								                Delete
								            </a>
								        	</td>
											
										</tr>
									</c:forEach>							   
								    </tbody>
								    </table>
								    <c:if test="${articlePage.hasArticles()}">
										<ul class="pagination pagination-centered" style="margin-left:400px">
											<li><a href="#"> [Prev] </a></li>
											<c:if test="${articlePage.startPage > 5}">
											<a href="list.do?pageNo=${articlePage.startPage - 5}">[이전]</a>
											</c:if>
											<c:forEach var="pNo" 
													   begin="${articlePage.startPage}" 
													   end="${articlePage.endPage}">												
							                        
							                        <li>
							                            <a href="list.do?pageNo=${pNo}"> [${pNo}] </a>
							                        </li>
							                                  
											</c:forEach>
											<c:if test="${articlePage.endPage < articlePage.totalPages}">
											<a href="list.do?pageNo=${articlePage.startPage + 5}">[다음]</a>
											</c:if>
											<li><a href="#"> [NEXT] </a></li>
										</ul>
									</c:if>
										<div id="pagination-container">
											<div class="cart_buttons" style="margin-top:0px;">
											<button type="submit" class="button cart_button_clear"
												onclick="location.href='write.do'"
												style="margin-left: 700px;">게시글 작성</button>
											<!-- 만드신 프로젝트로 바꿀것 example.do -->
											<!-- <button type="button" class="button cart_button_checkout"></button> -->
										</div>
								    </div>
								    </div>

							</div>
							

							
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Newsletter -->

		<!--<div class="newsletter">
			<div class="container">
				<div class="row">
					<div class="col">
						<div
							class="newsletter_container d-flex flex-lg-row flex-column align-items-lg-center align-items-center justify-content-lg-start justify-content-center">
							<div class="newsletter_title_container">
								<div class="newsletter_icon">
									<img src="images/send.png" alt="">
								</div>
								<div class="newsletter_title">Sign up for Newsletter</div>
								<div class="newsletter_text">
									<p>...and receive %20 coupon for first shopping.</p>
								</div>
							</div>
							<div class="newsletter_content clearfix">
								<form action="#" class="newsletter_form">
									<input type="email" class="newsletter_input"
										required="required" placeholder="Enter your email address">
									<button class="newsletter_button">Subscribe</button>
								</form>
								<div class="newsletter_unsubscribe_link">
									<a href="#">unsubscribe</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> -->

		<!-- Footer -->

		<footer class="footer">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 footer_col">
						<div class="footer_column footer_contact">
							<div class="logo_container">
								<div class="logo">
									<a href="#">OneTech</a>
								</div>
							</div>
							<div class="footer_title">Got Question? Call Us 24/7</div>
							<div class="footer_phone">+38 068 005 3570</div>
							<div class="footer_contact_text">
								<p>17 Princess Road, London</p>
								<p>Grester London NW18JR, UK</p>
							</div>
							<div class="footer_social">
								<ul>
									<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
									<li><a href="#"><i class="fab fa-twitter"></i></a></li>
									<li><a href="#"><i class="fab fa-youtube"></i></a></li>
									<li><a href="#"><i class="fab fa-google"></i></a></li>
									<li><a href="#"><i class="fab fa-vimeo-v"></i></a></li>
								</ul>
							</div>
						</div>
					</div>

					<div class="col-lg-2 offset-lg-2">
						<div class="footer_column">
							<div class="footer_title">Find it Fast</div>
							<ul class="footer_list">
								<li><a href="#">Computers & Laptops</a></li>
								<li><a href="#">Cameras & Photos</a></li>
								<li><a href="#">Hardware</a></li>
								<li><a href="#">Smartphones & Tablets</a></li>
								<li><a href="#">TV & Audio</a></li>
							</ul>
							<div class="footer_subtitle">Gadgets</div>
							<ul class="footer_list">
								<li><a href="#">Car Electronics</a></li>
							</ul>
						</div>
					</div>

					<div class="col-lg-2">
						<div class="footer_column">
							<ul class="footer_list footer_list_2">
								<li><a href="#">Video Games & Consoles</a></li>
								<li><a href="#">Accessories</a></li>
								<li><a href="#">Cameras & Photos</a></li>
								<li><a href="#">Hardware</a></li>
								<li><a href="#">Computers & Laptops</a></li>
							</ul>
						</div>
					</div>

					<div class="col-lg-2">
						<div class="footer_column">
							<div class="footer_title">Customer Care</div>
							<ul class="footer_list">
								<li><a href="#">My Account</a></li>
								<li><a href="#">Order Tracking</a></li>
								<li><a href="#">Wish List</a></li>
								<li><a href="#">Customer Services</a></li>
								<li><a href="#">Returns / Exchange</a></li>
								<li><a href="#">FAQs</a></li>
								<li><a href="#">Product Support</a></li>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</footer>

		<!-- Copyright -->

		<div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col">

						<div
							class="copyright_container d-flex flex-sm-row flex-column align-items-center justify-content-start">
							<div class="copyright_content">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</div>
							<div class="logos ml-sm-auto">
								<ul class="logos_list">
									<li><a href="#"><img src="images/logos_1.png" alt=""></a></li>
									<li><a href="#"><img src="images/logos_2.png" alt=""></a></li>
									<li><a href="#"><img src="images/logos_3.png" alt=""></a></li>
									<li><a href="#"><img src="images/logos_4.png" alt=""></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/resource/Board/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/Board/styles/bootstrap4/popper.js"></script>
	<script src="${pageContext.request.contextPath}/resource/Board/styles/bootstrap4/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/Board/plugin/greensock/TweenMax.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/Board/plugin/greensock/TimelineMax.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/Board/plugin/scrollmagic/ScrollMagic.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/Board/plugin/greensock/animation.gsap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/Board/plugin/greensock/ScrollToPlugin.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/Board/plugin/easing/easing.js"></script>
	<script src="${pageContext.request.contextPath}/resource/Board/js/cart_custom.js"></script>
	
	<!-- external javascript -->

	<script src="${pageContext.request.contextPath}/resource/charisma-master/bower_componets/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- library for cookie management -->
	<script src="${pageContext.request.contextPath}/resource/charisma-master/js/jquery.cookie.js"></script>
	<!-- calender plugin -->
	<script src='${pageContext.request.contextPath}/resource/charisma-master/bower_componets/moment/min/moment.min.js'></script>
	<script src='${pageContext.request.contextPath}/resource/charisma-master/bower_componets/fullcalendar/dist/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='${pageContext.request.contextPath}/resource/charisma-master/js/jquery.dataTables.min.js'></script>
	
	<!-- select or dropdown enhancer -->
	<script src="${pageContext.request.contextPath}/resource/charisma-master/bower_componets/chosen/chosen.jquery.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="${pageContext.request.contextPath}/resource/charisma-master/bower_componets/colorbox/jquery.colorbox-min.js"></script>
	<!-- notification plugin -->
	<script src="js/jquery.noty.js"></script>
	<!-- library for making tables responsive -->
	<script src="${pageContext.request.contextPath}/resource/charisma-master/bower_componets/responsive-tables/responsive-tables.js"></script>
	<!-- tour plugin -->
	<script src="${pageContext.request.contextPath}/resource/charisma-master/bower_componets/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
	<!-- star rating plugin -->
	<script src="${pageContext.request.contextPath}/resource/charisma-master/js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="${pageContext.request.contextPath}/resource/charisma-master/js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="${pageContext.request.contextPath}/resource/charisma-master/js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="${pageContext.request.contextPath}/resource/charisma-master/js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="${pageContext.request.contextPath}/resource/charisma-master/js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="${pageContext.request.contextPath}/resource/charisma-master/js/charisma.js"></script>
</body>

</html>