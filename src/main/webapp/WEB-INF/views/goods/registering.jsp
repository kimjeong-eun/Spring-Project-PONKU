<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> --%>
<html lang="kr">

<style>
body {
	height: auto;
}

.dropdown-menu {
	width: 94%;
	overflow: auto;
}

/* 분류 버튼 */
.dropdown-toggle {
	width: 100%;
}

/* 수정된 CSS */
.dropdown-menu-apple, .dropdown-menu-sam {
	display: none;
}

input[type=file]::file-selector-button {
	width: 150px;
	height: 30px;
	background: #fff;
	border: 1px solid rgb(77, 77, 77);
	border-radius: 3px;
	cursor: pointer; &: hover { background : rgb( 77, 77, 77);
	color: #fff;
}

}

/* 기본 크기 */
.checkout.spad {
	min-height: 1160px; /* 기본 최소 높이 */
}

/* 화면 너비가 768px 이하인 경우 */
@media ( max-width : 768px) {
	.checkout.spad {
		min-height: 300px; /* 더 작은 높이로 조정 */
	}
}

/* 화면 너비가 576px 이하인 경우 */
@media ( max-width : 576px) {
	.checkout.spad {
		min-height: 1600px; /* 더 작은 높이로 조정 */
	}
}
</style>

<!-- Header Section Begin -->

<jsp:include page="../includes/header.jsp"></jsp:include>

<!-- Header Section End -->

<!-- Hero Section Begin -->
<section class="hero-normal">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars"></i> <span>All departments</span>
					</div>
					<ul>
						<li><a href="#">Fresh Meat</a></li>
						<li><a href="#">Vegetables</a></li>
						<li><a href="#">Fruit & Nut Gifts</a></li>
						<li><a href="#">Fresh Berries</a></li>
						<li><a href="#">Ocean Foods</a></li>
						<li><a href="#">Butter & Eggs</a></li>
						<li><a href="#">Fastfood</a></li>
						<li><a href="#">Fresh Onion</a></li>
						<li><a href="#">Papayaya & Crisps</a></li>
						<li><a href="#">Oatmeal</a></li>
						<li><a href="#">Fresh Bananas</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="hero__search">
					<!-- <div class="hero__search__form">
						<form action="#">
							<div class="hero__search__categories">
								All Categories <span class="arrow_carrot-down"></span>
							</div>
							<input type="text" placeholder="What do yo u need?">
							<button type="submit" class="site-btn">SEARCH</button>
						</form> -->
				</div>
				<div class="hero__search__phone">
					<div class="hero__search__phone__icon">
						<i class="fa fa-phone"></i>
					</div>
					<div class="hero__search__phone__text">
						<h5>+65 11.188.888</h5>
						<span>support 24/7 time</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</section>
<!-- Hero Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
	data-setbg="/resources/img/bg1.png">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>상품 등록 페이지</h2>
					<div class="breadcrumb__option">
						<a href="./index.html">Home</a> <a href="./index.html">Vegetables</a>
						<span>Vegetable’s Package</span>
					</div>
				</div>
			</div>
		</div>
		<!-- row -->

	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Details Section Begin -->
<section class="product-details spad">
	<div class="container">
		<form action="registering" method="post">
			<div class="row">

				<div class="col-lg-6 col-md-6" style="box-sizing: border-box;">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src="/resources/img/product/details/product-details-1.jpg"
								alt="">
						</div>
						<div class="product__details__pic__slider owl-carousel">
							<img
								data-imgbigurl="/resources/img/product/details/product-details-2.jpg"
								src="/resources/img/product/details/thumb-1.jpg" alt=""> <img
								data-imgbigurl="/resources/img/product/details/product-details-3.jpg"
								src="/resources/img/product/details/thumb-2.jpg" alt=""> <img
								data-imgbigurl="/resources/img/product/details/product-details-5.jpg"
								src="/resources/img/product/details/thumb-3.jpg" alt=""> <img
								data-imgbigurl="/resources/img/product/details/product-details-4.jpg"
								src="/resources/img/product/details/thumb-4.jpg" alt="">
						</div>
					</div>
				</div>

				<div class="col-lg-6 col-md-6" style="box-sizing: border-box;">

					<!-- 예쁜 레이아웃 쀼쀼 -->
					<div class="product__details__text">

						<div class="checkout__input row">
							<div class="col">
								<p>
									상품번호<span>*</span>
								</p>
							</div>
							<div class="col">
								<input name="gno" type="text">
							</div>
						</div>

						<div class="checkout__input row"
							style="margin-top: 50px; color: #252525; font-weight: 700; margin-bottom: 16px;">
							<div class="col">
								<p>
									상품명<span>*</span>
								</p>
							</div>
							<div class="col">
								<input name="gname" type="text">
							</div>
						</div>

						<div class="checkout__input row">
							<div class="col">
								<p>판매가</p>
							</div>
							<div class="col row">
								<div class="col-9" style="padding: 0;">
									<input name="price" type="text"
										class="checkout__input__add product__details__price">
								</div>
								<div class="col-3">
									<span class="product__details__price">원</span>
								</div>
							</div>
						</div>

						<div class="checkout__input">
							<p>
								상품 설명<span>*</span>
							</p>
							<textarea name="information" type="text" rows="5"
								style="width: 100%; font-size: 16px; font-family:"Cairo", sans-serif;
							color:#6f6f6f; font-weight: 400; line-height: 26px; margin: 0 0 15px 0;"></textarea>
						</div>

						<div class="checkout__input row" style="height: 80px">
							<p>
								기종 카테고리<span>*</span>
							</p>
							<!-- 대분류 -->
							<div class="dropdown col">
								<button class="btn btn-light dropdown-toggle brandBtn"
									style="border-radius: 0;" type="button" aria-expanded="false">브랜드</button>
								<ul class="dropdown-menu"
									style="border-radius: 0; border: none; background-color: #f5f5f5;">
									<li><a class="dropdown-item dropdown-brand1">애플</a></li>
									<li><a class="dropdown-item dropdown-brand2">삼성</a></li>
									<li><a class="dropdown-item dropdown-brand3">구글</a></li>
								</ul>
							</div>
							<!-- 중분류 -->
							<div class="dropdown col">
								<button class="btn btn-light dropdown-toggle" type="button"
									style="border-radius: 0;" aria-expanded="false">기기명</button>

								<ul class="dropdown-menu dropdown-menu-apple"
									style="border-radius: 0; border: none; background-color: #f5f5f5;">
									<li><a class="dropdown-item">아이폰 S</a></li>
								</ul>
								<ul class="dropdown-menu dropdown-menu-sam"
									style="border-radius: 0; border: none; background-color: #f5f5f5;">
									<li><a class="dropdown-item" href="">갤럭시 S</a></li>
								</ul>
							</div>
						</div>

						<ul>
							<li><b>Availability</b> <span>In Stock</span></li>
							<li><b>Shipping</b> <span>01 day shipping. <samp>Free
										pickup today</samp></span></li>
							<li><b>Weight</b> <span>0.5 kg</span></li>
							<li><b>Share on</b>
								<div class="share">
									<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
										class="fa fa-twitter"></i></a> <a href="#"><i
										class="fa fa-instagram"></i></a> <a href="#"><i
										class="fa fa-pinterest"></i></a>
								</div></li>
						</ul>
					</div>
					<!-- details -->

					<!-- <div class="checkout__input">
						<p>
							재고수량<span>*</span>
						</p>
						<input type="text">
					</div> -->

					<div class="checkout__input">
						<div class="row">
							<p>
								상품 이미지<span>*</span>
							</p>
						</div>
						<div class="row">
							<%-- <form method="post" enctype="multipart/form-data"
								action="uploadAjaxAction/${_csrf.parameterName}=${_csrf.token}">
								<div class="col-10">
									<input type='file' name='uploadFile' multiple
										style="border: 0; padding: 0;">
								</div>
								<div class="col-2">
									<button id='uploadBtn' class="btn btn-light"
										style="width: 100%;">Upload</button>
								</div>

								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="hidden" name="_csrf">
								<!-- post방식 시 토큰 필수 -->
							</form> --%>
						</div>
					</div>

					<!-- <div class="checkout__input__checkbox">
                                <label for="acc">
                                    Create an account?
                                    <input type="checkbox" id="acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <p>Create an account by entering the information below. If you are a returning customer
                            please login at the top of the page</p> -->
				</div>
				<!-- col-lg-7 -->
			</div>
			<!-- row -->

			<div class="checkout__input" style="text-align: center;">
				<button type="reset" class="btn btn-default"
					style="padding: 15px 60px; font-size: 1rem; border: 1px solid grey">초기화</button>
				<button type="submit" class="btn-default site-btn"
					style="margin-top: 160px; padding: 15px 60px; font-size: 1rem;">상품
					등록</button>
			</div>
		</form>


	</div>
	<!-- container -->

	<div class="col-lg-12">
		<div class="product__details__tab">
			<ul class="nav nav-tabs" role="tablist">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">Description</a>
				</li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#tabs-2" role="tab" aria-selected="false">Information</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#tabs-3" role="tab" aria-selected="false">Reviews <span>(1)</span></a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tabs-1" role="tabpanel">
					<div class="product__details__tab__desc">
						<h6>Products Infomation</h6>
						<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit
							amet dui. Pellentesque in ipsum id orci porta dapibus. Proin eget
							tortor risus. Vivamus suscipit tortor eget felis porttitor
							volutpat. Vestibulum ac diam sit amet quam vehicula elementum sed
							sit amet dui. Donec rutrum congue leo eget malesuada. Vivamus
							suscipit tortor eget felis porttitor volutpat. Curabitur arcu
							erat, accumsan id imperdiet et, porttitor at sem. Praesent sapien
							massa, convallis a pellentesque nec, egestas non nisi. Vestibulum
							ac diam sit amet quam vehicula elementum sed sit amet dui.
							Vestibulum ante ipsum primis in faucibus orci luctus et ultrices
							posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam
							vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p>
						<p>Praesent sapien massa, convallis a pellentesque nec,
							egestas non nisi. Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Mauris blandit aliquet elit, eget tincidunt nibh
							pulvinar a. Cras ultricies ligula sed magna dictum porta. Cras
							ultricies ligula sed magna dictum porta. Sed porttitor lectus
							nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar
							a. Vestibulum ac diam sit amet quam vehicula elementum sed sit
							amet dui. Sed porttitor lectus nibh. Vestibulum ac diam sit amet
							quam vehicula elementum sed sit amet dui. Proin eget tortor
							risus.</p>
					</div>
				</div>
				<div class="tab-pane" id="tabs-2" role="tabpanel">
					<div class="product__details__tab__desc">
						<h6>Products Infomation</h6>
						<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit
							amet dui. Pellentesque in ipsum id orci porta dapibus. Proin eget
							tortor risus. Vivamus suscipit tortor eget felis porttitor
							volutpat. Vestibulum ac diam sit amet quam vehicula elementum sed
							sit amet dui. Donec rutrum congue leo eget malesuada. Vivamus
							suscipit tortor eget felis porttitor volutpat. Curabitur arcu
							erat, accumsan id imperdiet et, porttitor at sem. Praesent sapien
							massa, convallis a pellentesque nec, egestas non nisi. Vestibulum
							ac diam sit amet quam vehicula elementum sed sit amet dui.
							Vestibulum ante ipsum primis in faucibus orci luctus et ultrices
							posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam
							vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p>
						<p>Praesent sapien massa, convallis a pellentesque nec,
							egestas non nisi. Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Mauris blandit aliquet elit, eget tincidunt nibh
							pulvinar a. Cras ultricies ligula sed magna dictum porta. Cras
							ultricies ligula sed magna dictum porta. Sed porttitor lectus
							nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar
							a.</p>
					</div>
				</div>
				<div class="tab-pane" id="tabs-3" role="tabpanel">
					<div class="product__details__tab__desc">
						<h6>Products Infomation</h6>
						<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit
							amet dui. Pellentesque in ipsum id orci porta dapibus. Proin eget
							tortor risus. Vivamus suscipit tortor eget felis porttitor
							volutpat. Vestibulum ac diam sit amet quam vehicula elementum sed
							sit amet dui. Donec rutrum congue leo eget malesuada. Vivamus
							suscipit tortor eget felis porttitor volutpat. Curabitur arcu
							erat, accumsan id imperdiet et, porttitor at sem. Praesent sapien
							massa, convallis a pellentesque nec, egestas non nisi. Vestibulum
							ac diam sit amet quam vehicula elementum sed sit amet dui.
							Vestibulum ante ipsum primis in faucibus orci luctus et ultrices
							posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam
							vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
</section>
<!-- Product Details Section End -->

<!-- Related Product Section Begin -->
<section class="related-product">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title related__product__title">
					<h2>Related Product</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="product__item">
					<div class="product__item__pic set-bg"
						data-setbg="/resources/img/product/product-1.jpg">
						<ul class="product__item__pic__hover">
							<li><a href="#"><i class="fa fa-heart"></i></a></li>
							<li><a href="#"><i class="fa fa-retweet"></i></a></li>
							<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6>
							<a href="#">Crab Pool Security</a>
						</h6>
						<h5>$30.00</h5>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="product__item">
					<div class="product__item__pic set-bg"
						data-setbg="/resources/img/product/product-2.jpg">
						<ul class="product__item__pic__hover">
							<li><a href="#"><i class="fa fa-heart"></i></a></li>
							<li><a href="#"><i class="fa fa-retweet"></i></a></li>
							<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6>
							<a href="#">Crab Pool Security</a>
						</h6>
						<h5>$30.00</h5>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="product__item">
					<div class="product__item__pic set-bg"
						data-setbg="/resources/img/product/product-3.jpg">
						<ul class="product__item__pic__hover">
							<li><a href="#"><i class="fa fa-heart"></i></a></li>
							<li><a href="#"><i class="fa fa-retweet"></i></a></li>
							<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6>
							<a href="#">Crab Pool Security</a>
						</h6>
						<h5>$30.00</h5>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="product__item">
					<div class="product__item__pic set-bg"
						data-setbg="/resources/img/product/product-7.jpg">
						<ul class="product__item__pic__hover">
							<li><a href="#"><i class="fa fa-heart"></i></a></li>
							<li><a href="#"><i class="fa fa-retweet"></i></a></li>
							<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6>
							<a href="#">Crab Pool Security</a>
						</h6>
						<h5>$30.00</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Related Product Section End -->

<script>
	$(function() {
		var toggleBtn = $(".brandBtn"); // 버튼 선택
		var menu = $(".dropdown-menu");
		var appleItem = $(".dropdown-menu-apple");
		var samItem = $(".dropdown-menu-sam");

		// 버튼을 클릭하면 드롭다운 메뉴 항목 보이기
		toggleBtn.click(function() {
			menu.toggle(); // 대분류 드롭다운 메뉴 항목 보이거나 숨기기
			appleItem.hide(); // 애플 메뉴 항목 숨기기
			samItem.hide(); // 삼성 메뉴 항목 숨기기

			if ($(".dropdown-menu").css("display") === "block") {
				$(".cateMar").css("margin-top", "140px");
			} else {
				$(".cateMar").css("margin-top", "50px");
			}
		});

		// 애플 브랜드를 클릭하면 애플 메뉴 항목 보이기
		$(".dropdown-brand1").click(function() {
			appleItem.show();
			samItem.hide();
		});

		// 삼성 브랜드를 클릭하면 삼성 메뉴 항목 보이기
		$(".dropdown-brand2").click(function() {
			appleItem.hide();
			samItem.show();
		});
	});

	//헤더 토큰 정보 설정, 명시적 함수 먼저 실행
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	});

	$(document).ready(function() {

		//파일의 확장자와 크기 사전 처리
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz$)"); //정규표현식
		var maxSize = 5242880; //5MB

		function checkExtension(fileName, fileSize) {
			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (regex.test(fileName)) { //.test(): 표현식 만족 시
				alert("해당 종류의 파일은 업로드할 수 없습니다");
				return false;
			}
			return true; //반복을 위함 (문제 없을 시 true)
		}

		$("#uploadBtn").on("click", function(e) {
			e.preventDefault(); // 기본 동작(페이지 새로고침) 방지

			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;

			// 파일 업로드 처리
			for (var i = 0; i < files.length; i++) {
				formData.append("uploadFile", files[i]);
			}

			$.ajax({
				url : 'uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				success : function(result) {
					alert("Uploaded");
				},
				error : function(xhr, status, error) {
					console.error(xhr.responseText);
				}
			});
		});
	});
</script>

<!-- Footer Section Begin -->

<jsp:include page="../includes/footer.jsp"></jsp:include>

<!-- Footer Section End -->