<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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

/* 첨부파일 보여주기 */
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align: center;
}

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul li span {
	color: white;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img {
	width: 600px;
}
</style>

<!-- Header Section Begin -->

<jsp:include page="../includes/header.jsp"></jsp:include>

<!-- Header Section End -->

<!-- Product Details Section Begin -->
<section class="product-details spad">
	<div class="container" style="max-width: 1370px; padding-top: 100px;">
		<div class="row">

			<div class="col-lg-7 col-md-7">
				<div class="product__details__pic">

					<div class="product__details__pic__item">
						<!-- <div class="checkout__input"> -->
						<img class="product__details__pic__item--large"
							src="/resources/img/${goods.title_img}" alt="">
					</div>

					<div class="product__details__pic__slider owl-carousel">
						<img
							data-imgbigurl="/resources/img/product/details/product-details-2.jpg"
							src="/resources/img/${goods.info_img}" alt=""> <img
							data-imgbigurl="/resources/img/product/details/product-details-3.jpg"
							src="/resources/img/product/details/thumb-2.jpg" alt=""> <img
							data-imgbigurl="/resources/img/product/details/product-details-5.jpg"
							src="/resources/img/product/details/thumb-3.jpg" alt=""> <img
							data-imgbigurl="/resources/img/product/details/product-details-4.jpg"
							src="/resources/img/product/details/thumb-4.jpg" alt="">
					</div>

				</div>
				<!-- product__details__pic__item -->
			</div>

			<div class="col-lg-5 col-md-5" style="box-sizing: border-box;">

				<div class="product__details__text">

					<div class="checkout__input"
						style="margin-top: 50px; color: #252525; font-weight: 700; margin-bottom: 16px;">
						<input name="gname" type="text" value='${goods.gname}' style="color: black; border: 0;" readonly="readonly">
					</div>

					<div class="checkout__input">
						<input name="price" type="text"
							class="checkout__input__add product__details__price"
							value='${goods.price}' style="color: black; border: 0; display: inline; width: 25%;"
							readonly="readonly"> <span
							class="product__details__price" style="color: black";>원</span>
					</div>

					<div class="checkout__input row" style="height: 80px">
						<p>
							기종 카테고리
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

						<div class="row">
							<div class="col">
								<button type="submit" class="btn btn-info"
									style="margin-top: 160px; padding: 15px 60px; font-size: 1rem; width: 100%;">장바구니</button>
							</div>
							<div class="col">
								<button type="submit" class="btn btn-info"
									style="margin-top: 160px; padding: 15px 60px; font-size: 1rem; width: 100%;">구매하기</button>
							</div>
						</div>

					</div>
					<!-- checkout__input -->
				</div>
				<!-- product__details__text -->

				<!-- <div class="checkout__input">
						<p>
							재고수량<span>*</span>
						</p>
						<input type="text">
					</div> -->

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

			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<form id="operForm" action="/goods/modify" method="get">
					<button type="submit" class="btn btn-default" data-oper='modify'
						style="padding: 15px 60px; font-size: 1rem; border: 1px solid grey">수정</button>

					<input type="hidden" id="gno" name="gno" value='${goods.gno}'>
				</form>
			</sec:authorize>

		</div>
		<!-- checkout__input -->


	</div>
	<!-- container -->

	<div class="col-lg-12">
		<div class="product__details__tab">
			<ul class="nav nav-tabs" role="tablist">
				<li class="nav-item"
					style="border: 1px grey solid; padding: 20px 50px;"><a
					class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
					aria-selected="true">상품정보</a></li>
				<li class="nav-item"
					style="border: 1px grey solid; padding: 20px 50px;"><a
					class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
					aria-selected="false">Q&A</a></li>
				<li class="nav-item"
					style="border: 1px grey solid; padding: 20px 50px;"><a
					class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
					aria-selected="false">리뷰<span>(1)</span></a></li>
			</ul>
			<div class="tab-content">

				<div class="tab-pane active" id="tabs-1" role="tabpanel">
					<div class="product__details__tab__desc mx-auto"
						style="width: 80%;">
						<textarea name="information" type="text" rows="5"
							style="width: 80%; font-size: 20px; color: black; line-height: 26px; margin: 0 0 15px 0; border: 0;"
							readonly="readonly">${goods.information}</textarea>
					</div>
					<!-- product__details__tab__desc -->

					<div class='uploadResult'>
						<ul>
						</ul>
					</div>

					<div class='bigPictureWrapper'>
						<div class='bigPicture'></div>
					</div>

				</div>
				<!-- tabs-1 tabpane -->

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
				<!-- tab-pane -->

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
				<!-- tab-pane -->

			</div>
		</div>
	</div>
	</div>
	</div>
</section>
<!-- Product Details Section End -->

<!-- Related Product Section Begin -->
<section class="related-product">
	<div class="container" style="max-width: 1370px;">
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
	$(document)
			.ready(
					function() {

						(function() {
							/* P571 댓글을 자동으로 동작 ? */
							var gno = '<c:out value="${goods.gno}"/>';

							$.getJSON("/goods/getAttachList", {
								gno : gno
							}, function(arr) {
								console.log(arr);
							});
						})(); //즉시 실행 함수, function

						/* 첨부파일 보기 */
						$
								.getJSON(
										"/board/getAttachList",
										{
											bno : bno
										},
										function(arr) {

											console.log(arr);

											var str = "";

											$(arr)
													.each(
															function(i, attach) {

																//image type
																if (attach.fileType) {
																	var fileCallPath = encodeURIComponent(attach.uploadPath
																			+ "/s_"
																			+ attach.uuid
																			+ "_"
																			+ attach.fileName);

																	str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
																	str += "<img src='/display?fileName="
																			+ fileCallPath
																			+ "'>";
																	str += "</div>";
																	str
																			+ "</li>";
																} else {

																	str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
																	str += "<span> "
																			+ attach.fileName
																			+ "</span><br/>";
																	str += "<img src='/resources/img/attach.png'></a>";
																	str += "</div>";
																	str
																			+ "</li>";
																}
															});

											$(".uploadResult ul").html(str);

										});//end getjson

						/* 버튼 동작 */
						var operForm = $("#operForm");

						$("button[data-oper='modify']").on(
								"click",
								function(e) { //수정 버튼을 누를 경우
									operForm.attr("action", "/goods/modify")
											.submit(); //input[type='hidden']의 gno를 보내고 이동
								});
					});
</script>

<!-- Footer Section Begin -->

<jsp:include page="../includes/footer.jsp"></jsp:include>

<!-- Footer Section End -->