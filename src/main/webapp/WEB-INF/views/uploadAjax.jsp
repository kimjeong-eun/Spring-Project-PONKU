<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>Insert title here</title>
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

/* 기본 크기 */
.checkout.spad {
	min-height: 400px; /* 기본 최소 높이 */
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

</head>
<!-- Header Section Begin -->

<jsp:include page="./includes/header.jsp"></jsp:include>

<!-- Header Section End -->

<!-- Hero Section Begin -->
<section class="hero hero-normal">
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
				<div class="hero__search__form">
					<form action="#">
						<div class="hero__search__categories">
							All Categories <span class="arrow_carrot-down"></span>
						</div>
						<input type="text" placeholder="What do yo u need?">
						<button type="submit" class="site-btn">SEARCH</button>
					</form>
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
	data-setbg="/resources/img/breadcrumb.jpg">
<div class="container">
	<div class="row">
		<div class="col-lg-12 text-center">
			<div class="breadcrumb__text">
				<h2>관리자 추가 모드</h2>
				<div class="breadcrumb__option">
					<a href="./index.html">Home</a> <span>Checkout</span>
				</div>
			</div>
		</div>
	</div>
</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
<div class="container">
	<div class="checkout__form">
		<h4>관리자 추가 모드</h4>
		<form action="#">
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="checkout__order">
						<h4>상품 관리</h4>
						<div class="checkout__order__products">
							Products <span>Total</span>
						</div>
						<ul>
							<li>Vegetable’s Package <span>$75.99</span></li>
							<li>Fresh Vegetable <span>$151.99</span></li>
							<li>Organic Bananas <span>$53.99</span></li>
						</ul>
						<div class="checkout__order__subtotal">
							Subtotal <span>$750.99</span>
						</div>
						<div class="checkout__order__total">
							Total <span>$750.99</span>
						</div>
						<div class="checkout__input__checkbox">
							<label for="acc-or"> Create an account? <input
								type="checkbox" id="acc-or"> <span class="checkmark"></span>
							</label>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adip elit, sed do
							eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
						<div class="checkout__input__checkbox">
							<label for="payment"> Check Payment <input
								type="checkbox" id="payment"> <span class="checkmark"></span>
							</label>
						</div>
						<div class="checkout__input__checkbox">
							<label for="paypal"> Paypal <input type="checkbox"
								id="paypal"> <span class="checkmark"></span>
							</label>
						</div>
						<button type="submit" class="site-btn">PLACE ORDER</button>
					</div>
				</div>
				<!-- col-lg-4 -->

<div cl></div>

				<div class="col-lg-7 col-md-6">
					<p>
						기종 카테고리<span>*</span>
					</p>
					<div class="categ checkout__input row" style="height: 200px">
						<!-- 대분류 -->
						<div class="dropdown col">
							<button class="btn btn-light dropdown-toggle brandBtn" style="border-radius: 0;"
								type="button" aria-expanded="false">브랜드</button>
							<ul class="dropdown-menu" style="border-radius: 0; border: none; background-color: #f5f5f5;">
								<li><a class="dropdown-item dropdown-brand1">애플</a></li>
								<li><a class="dropdown-item dropdown-brand2">삼성</a></li>
								<li><a class="dropdown-item dropdown-brand3">구글</a></li>
							</ul>
						</div>
						<!-- 중분류 -->
						<div class="dropdown col">
							<button class="btn btn-light dropdown-toggle" type="button" style="border-radius: 0;"
								aria-expanded="false">기기명</button>

							<ul class="dropdown-menu dropdown-menu-apple" style="border-radius: 0; border: none; background-color: #f5f5f5;">
								<li><a class="dropdown-item">아이폰 S</a></li>
							</ul>
							<ul class="dropdown-menu dropdown-menu-sam">
								<li><a class="dropdown-item" href="">갤럭시 S</a></li>
							</ul>
						</div>
						<!-- .categ -->

						<div class="checkout__input mbd">
							<p>
								상품명<span>*</span>
							</p>
							<input type="text">
						</div>
						<div class="checkout__input">
							<p>
								판매가<span>*</span>
							</p>
							<input type="text" placeholder="Street Address"
								class="checkout__input__add">
						</div>
						<div class="checkout__input">
							<p>
								재고수량<span>*</span>
							</p>
							<input type="text">
						</div>
						<div>
							<p>
								상품 이미지<span>*</span>
							</p>
							<form method="post" enctype="multipart/form-data"
								action="uploadAjaxAction/${_csrf.parameterName}=${_csrf.token}">
								<input type='file' name='uploadFile' multiple>
							</form>

							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input type="hidden" name="_csrf">
							<!-- post방식 시 토큰 필수 -->

							<button id='uploadBtn'>Upload</button>
						</div>
						<div class="checkout__input">
							<p>
								상세 설명<span>*</span>
							</p>
							<input type="text">
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
				</div>
		</form>
	</div>
	<!-- .container -->
</section>
<!-- Checkout Section End -->

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<script>
	$(function() {
		var toggleBtn = $(".brandBtn"); // 버튼 선택
		var menu = $(".dropdown-menu");
		var appleItem = $(".dropdown-menu-apple");
		var samItem = $(".dropdown-menu-sam");
		//var mbd = $(".mbd");

		// 버튼을 클릭하면 드롭다운 메뉴 항목 보이기
		toggleBtn.click(function() {
			menu.toggle(); // 대분류 드롭다운 메뉴 항목 보이거나 숨기기
			appleItem.hide(); // 애플 메뉴 항목 숨기기
			samItem.hide(); // 삼성 메뉴 항목 숨기기

			if ($(".dropdown-menu").css("display") === "block") {
				$(".mbd").css("margin-top", "140px");
			} else {
				$(".mbd").css("margin-top", "50px");
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

		$("#uploadBtn").on("click", function(e) { //버튼 클릭 시
			var formData = new FormData(); //파라미터 대신 전달하는 폼데이터 생성
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files; //배열에 추가

			console.log(files);

			//add filedate to formdata
			for (var i = 0; i < files.length; i++) {
				if (!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile", files[i]); //K, V
			}

			$.ajax({
				url : '/uploadAjaxAction',
				processData : false, //기본값
				contentType : false,
				data : formData,
				type : 'POST',
				success : function(result) {
					alert("Uploaded");
				}
			}); //ajax
		});
	});
</script>
<!-- Footer Section Begin -->

<jsp:include page="./includes/footer.jsp"></jsp:include>

<!-- Footer Section End -->