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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resource/Board/styles/bootstrap4/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resource/Board/plugin/fontawesome-free-5.0.1/css/fontawesome-all.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/Board/styles/cart_${pageContext.request.contextPath}/resource/Board/styles.css">
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
									<div>
										<a href="../Login/SelectSign.html">회원가입</a>
									</div>
									<div>
										<a href="../Login/SelectLogin.html">로그인</a>
									</div>
									<div>
										<a href="../OneTech/board.html">게시판</a>
									</div>
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
										<li><a href="blog.html">Blog<i
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
								        <th>답변 여부</th>
								    </tr>
								    </thead>
								    <tbody>
								    <c:if test="${articlePage.hasNoArticles()}">
										<tr>
											<td colspan="5">게시글이 없습니다.</td>
										</tr>
									</c:if>
										<tr>
								        <td>Chris Jack</td>
								        <td class="center">2012/01/01</td>
								        <td class="center">Member</td>
								        <td class="center">
								            <span class="label-success label label-default">Active</span>
								        </td>
								        <td class="center">
								            <a class="btn btn-success" href="#">
								                <i class="glyphicon glyphicon-zoom-in icon-white"></i>
								                View
								            </a>
								            <a class="btn btn-info" href="#">
								                <i class="glyphicon glyphicon-edit icon-white"></i>
								                Edit
								            </a>
								            <a class="btn btn-danger" href="#">
								                <i class="glyphicon glyphicon-trash icon-white"></i>
								                Delete
								            </a>
								        </td>
								    	</tr>
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
								            <a class="btn btn-success" href="#">
								                <i class="glyphicon glyphicon-zoom-in icon-white"></i>
								                View
								            </a>
								            <a class="btn btn-info" href="#">
								                <i class="glyphicon glyphicon-edit icon-white"></i>
								                Edit
								            </a>
								            <a class="btn btn-danger" href="#">
								                <i class="glyphicon glyphicon-trash icon-white"></i>
								                Delete
								            </a>
								        	</td>
											<!-- <td>${article.readCount}</td> -->
										</tr>
									</c:forEach>
								    <tr>
								        <td>David R</td>
								        <td class="center">2012/01/01</td>
								        <td class="center">Member</td>
								        <td class="center">
								            <span class="label-success label label-default">Active</span>
								        </td>
								        <td class="center">
								            <a class="btn btn-success" href="#">
								                <i class="glyphicon glyphicon-zoom-in icon-white"></i>
								                View
								            </a>
								            <a class="btn btn-info" href="#">
								                <i class="glyphicon glyphicon-edit icon-white"></i>
								                Edit
								            </a>
								            <a class="btn btn-danger" href="#">
								                <i class="glyphicon glyphicon-trash icon-white"></i>
								                Delete
								            </a>
								        </td>
								    </tr>
								    
								    
								   
								    </tbody>
								    </table>
								    </div>
								    </div>
							</div>


							<div class="cart_buttons">
								<button type="submit" class="button cart_button_clear"
									onclick="location.href='index.html'">게시글 작성</button>
								<!-- 만드신 프로젝트로 바꿀것 example.do -->
								<!-- <button type="button" class="button cart_button_checkout"></button> -->
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
</body>

</html>