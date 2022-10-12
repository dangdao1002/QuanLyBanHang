<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Cart</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
		<!-- bootstrap -->
		<link type="text/css" rel="stylesheet" href="home/css/bootstrap.min.css"/>      
		
		<!-- Slick -->
		<link type="text/css" rel="stylesheet" href="home/css/slick.css"/>
		<link type="text/css" rel="stylesheet" href="home/css/slick-theme.css"/>
		
		<!-- nouislider -->
		<link type="text/css" rel="stylesheet" href="home/css/nouislider.min.css"/>
		
		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="home/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="home/css/style.css"/>
		
		<!-- jQuery Plugins -->
		<script src="home/js/jquery.min.js"></script>
		<script src="home/js/bootstrap.min.js"></script>
		<script src="home/js/slick.min.js"></script>
		<script src="home/js/nouislider.min.js"></script>
		<script src="home/js/jquery.zoom.min.js"></script>
		<script src="home/js/main.js"></script>
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
	</head>
    <body>
    <!-- HEADER -->
		<header>
			<!-- TOP HEADER -->
			<div id="top-header">
				<div class="container">
					<ul class="header-links pull-left">
						<li><a href="#"><i class="fa fa-phone"></i> 1800 6601</a></li>
						<li><a href="#"><i class="fa fa-envelope-o"></i> electro@com.vn</a></li>
						<li><a href="#"><i class="fa fa-map-marker"></i> Tòa nhà QTSC Building 9. Đường số 3, Công viên phần mềm Quang Trung</a></li>
					</ul>
					<ul class="header-links pull-right">
						<li><a href="<c:url value='/cart?action=view' />">Giỏ hàng của bạn<b>(<span id="countTotal">${sessionScope.cart.tongsl}</span>)</b></a></li>
						<c:if test="${empty sessionScope.user}">
							<li><a href="<c:url value='/login' />"><i class="fa fa-user-o"></i>Đăng nhập</a></li>
						</c:if>
						<c:if test="${not empty sessionScope.user}">
							<li><a href="<c:url value='/logout' />">Đăng xuất</a></li>					
							<li><i>Welcome,</i><a>${sessionScope.user.fullname}</a></li>
						</c:if>
					</ul>
					<input type="hidden" id="checkUserLogin" value="${sessionScope.user.username}" />
				</div>
			</div>
			<!-- /TOP HEADER -->

			<!-- MAIN HEADER -->
			<div id="header">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<!-- LOGO -->
						<div class="col-md-3">
							<div class="header-logo">
								<a href="<c:url value='/index' />" class="logo">
									<img src="home/img/logo.png" alt="">
								</a>
							</div>
						</div>
						<!-- /LOGO -->

						<!-- SEARCH BAR -->
						<div class="col-md-6">
							<div class="header-search">
								<form>
									<select class="input-select">
										<option value="0">All Categories</option>
										<option value="1">Category 01</option>
										<option value="1">Category 02</option>
									</select>
									<form method="POST" class="search_form">
										<input class="input" placeholder="Search here">
										<button class="search-btn">Search</button>
									</form>
								</form>
							</div>
						</div>
						<!-- /SEARCH BAR -->

						<!-- ACCOUNT -->
						<div class="col-md-3 clearfix">
							<div class="header-ctn">
								<!-- Menu Toogle -->
								<div class="menu-toggle">
									<a href="#">
										<i class="fa fa-bars"></i>
										<span>Menu</span>
									</a>
								</div>
								<!-- /Menu Toogle -->
							</div>
						</div>
						<!-- /ACCOUNT -->
					</div>
					<!-- row -->
				</div>
				<!-- container -->
			</div>
			<!-- /MAIN HEADER -->
		</header>
		<!-- /HEADER -->
		
		<!-- NAVIGATION -->
		<nav id="navigation">
			<!-- container -->
			<div class="container">
				<!-- responsive-nav -->
				<div id="responsive-nav">
					<!-- NAV -->
					<ul class="main-nav nav navbar-nav">
						<li class="active"><a href="<c:url value='/index' />">Home</a></li>
						<li><a href="#">Giảm giá "Sốc"</a></li>
							<c:forEach var="category" items="${listCategory}">
								<li><a href="<c:url value='/sanpham?maDM=${category.madm}'/>">${category.tendanhmuc}</a></li>
							</c:forEach>
					</ul>
					<!-- /NAV -->
				</div>
				<!-- /responsive-nav -->
			</div>
			<!-- /container -->
		</nav>
		<!-- /NAVIGATION -->

		<!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="breadcrumb-header">Giỏ hàng của bạn</h3>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /BREADCRUMB -->		
		<div id="wrapper" class="container">
			<section class="main-content">				
				<div class="row">
					<div class="span9">					
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Remove</th>
									<th>Image</th>
									<th>Product Name</th>
									<th>Quantity</th>
									<th>Unit Price</th>
									<th>Total</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cartDetail" items="${sessionScope.cart.detail}">
									<tr id="tr-${cartDetail.value.masp}">
										<td><button onclick="removeSP('${cartDetail.value.masp}')" class="btn btn-danger" type="button">X</button></td>
										<td></td>
										<td>${cartDetail.value.tensp}</td>
										<td><input id="slMua-${cartDetail.value.masp}" onchange="updateCart('${cartDetail.value.masp}')" type="number" class="input-mini" value="${cartDetail.value.slMua}"></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cartDetail.value.giasp}" /></td>
										<td>
											<span id="totalSP-${cartDetail.value.masp}">
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${cartDetail.value.giasp * cartDetail.value.slMua}" />
											</span>
										</td>
									</tr>
									<input type="hidden" id="giaSP-${cartDetail.value.masp}" value="${cartDetail.value.giasp}" />
								</c:forEach>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td><strong id="tongTien"><fmt:formatNumber type="number" maxFractionDigits="3" value="${sessionScope.cart.tongtien}"/></strong></td>
								</tr>		  
							</tbody>
						</table>
						<hr/>
						<div class="row-fluid">
							<div class="span6">
									<label class="control-label">Phone number:</label>
								<div class="control-label">
									<div class="controls">
										<input id="phoneNumber" type="text" placeholder="" maxlength="11" class="input-xlarge">
									</div>
								</div>
							</div>
							<div class="span6">
								<div class="control-group">
									<label class="control-label">Address:</label>
									<div class="controls">
										<input id="address" type="text" placeholder="" class="input-xlarge">
									</div>
								</div>
							</div>
						</div>
						<hr/>
						<p class="buttons center">				
							<button class="primary-btn order-submit" type="button" id="payNow">Pay Now</button>
						</p>					
					</div>
				</div>
			</section>	
		</div>
		
		<!-- NEWSLETTER -->
		<div id="newsletter" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<div class="newsletter">
							<p>Sign Up for the <strong>NEWSLETTER</strong></p>
							<form>
								<input class="input" type="email" placeholder="Enter Your Email">
								<button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
							</form>
							<ul class="newsletter-follow">
								<li>
									<a href="#"><i class="fa fa-facebook"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-twitter"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-instagram"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-pinterest"></i></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /NEWSLETTER -->

		<!-- FOOTER -->
		<footer id="footer">
			<!-- top footer -->
			<div class="section">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">About Us</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
								<ul class="footer-links">
									<li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
									<li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
									<li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Categories</h3>
								<ul class="footer-links">
									<li><a href="#">Hot deals</a></li>
									<li><a href="#">Laptops</a></li>
									<li><a href="#">Smartphones</a></li>
									<li><a href="#">Cameras</a></li>
									<li><a href="#">Accessories</a></li>
								</ul>
							</div>
						</div>

						<div class="clearfix visible-xs"></div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Information</h3>
								<ul class="footer-links">
									<li><a href="#">About Us</a></li>
									<li><a href="#">Contact Us</a></li>
									<li><a href="#">Privacy Policy</a></li>
									<li><a href="#">Orders and Returns</a></li>
									<li><a href="#">Terms & Conditions</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Service</h3>
								<ul class="footer-links">
									<li><a href="#">My Account</a></li>
									<li><a href="#">View Cart</a></li>
									<li><a href="#">Wishlist</a></li>
									<li><a href="#">Track My Order</a></li>
									<li><a href="#">Help</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /top footer -->

			<!-- bottom footer -->
			<div id="bottom-footer" class="section">
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-md-12 text-center">
							<ul class="footer-payments">
								<li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
								<li><a href="#"><i class="fa fa-credit-card"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
							</ul>
							<span class="copyright">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</span>
						</div>
					</div>
						<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /bottom footer -->
		</footer>
		<!-- /FOOTER -->
		
		<script>
			function removeSP(maSP) {
				$.ajax({
        	        url: 'cart?action=add&masp=' + maSP + '&soluong=0&isUpdate=0',
        	        dataType : 'json'
        	    }).then(function(data) {
        	    	$('#tongTien').text(numberWithDot(data.tongtien));
        	    	$('#countTotal').text(data.tongsl);
        	    	var idRemoveTag = '#tr-' + maSP;
        	    	$(idRemoveTag).remove();
        	    }).fail(function(error) {
        	    	alert('Xóa thất bại, vui lòng thử lại!');
        	    });
			}
			
			function updateCart(maSP) {
				var idInputSL = '#slMua-' + maSP;
				var slUpdate = $(idInputSL).val();
				var idInputGiaSP = '#giaSP-' + maSP;
				var giaSP = parseFloat($(idInputGiaSP).val());
				if (parseInt(slUpdate) < 1) {
					removeSP(maSP);
				} else {
					$.ajax({
	        	        url: 'cart?action=add&masp=' + maSP + '&soluong=' + slUpdate + '&isUpdate=1',
	        	        dataType : 'json'
	        	    }).then(function(data) {
	        	    	$('#tongTien').text(numberWithDot(data.tongtien));
	        	    	$('#countTotal').text(data.tongsl);
	        	    	var tongTienSPUpdate = parseFloat(giaSP * parseInt(slUpdate)); 
	        	    	let idTongGiaSP = '#totalSP-' + maSP;
	        	    	$(idTongGiaSP).text(numberWithDot(tongTienSPUpdate));
	        	    }).fail(function(error) {
	        	    	alert('Cập nhật thất bại, vui lòng thử lại!');
	        	    });
				}
			}
			
			$('#payNow').click(function() {
				var checkUserLogin = $('#checkUserLogin').val();
				if (checkUserLogin.length == 0) {
					window.location.href = "login";
					return;
				}
				
				var phone = $('#phoneNumber').val();
				var address = $('#address').val();
				if (phone.length == 0) {
					alert('Vui lòng nhập sdt');
					$('#phoneNumber').focus();
					return;
				};
				if (address.length == 0) {
					alert('Vui lòng nhập địa chỉ');
					$('#address').focus();
					return;
				}
				
				$.ajax({
        	        url: 'cart?action=paying&phone=' + phone + '&address=' + address,
        	        dataType : 'json'
        	    }).then(function(data) {
        	    	alert('Thanh toán thành công!');
        	    	window.location.href = "index";
        	    }).fail(function(error) {
        	    	alert('Thanh toán thất bại, vui lòng thử lại!');
        	    });
			})
			
			function numberWithDot(x) {
			    return x.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ".");
			}
		</script>	
    </body>
</html>