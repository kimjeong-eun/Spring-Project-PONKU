<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>Show Your Colors | Ponku</title>
<!-- <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge"> -->

<!-- Header Section Begin -->

<jsp:include page="./includes/header.jsp"></jsp:include>

<!-- Header Section End -->

<!-- Hero Section Begin -->
<section class="hero">

	<div class="container">
		<div class="row">

			<!-- 히어로 -->
			<div class="hero__item">
				<!-- <div class="hero__text">
                            <span>매일이 크리스마스처럼...</span>
                            <h2> 산타의 <br />선물 상자</h2>
                            <p>장난감, 문구류 할인 및 배달 가능</p>
                            <a href="#" class="primary-btn">상품보러 가기</a>
                        </div> -->
				<video src="/resources/vid/case1.webm"
					style="width: 100%; height: 95%;" autoplay muted loop></video>

				<!-- 이것도 퍼오긴 했는데 동영상 비율이 달라서 배너? 등으로 사용하면 좋을 것 같아요 -->
				<!-- <video src="/resources/vid/case2.mp4" style="width: 100%; height: 100%;" autoplay muted loop></video> -->
			</div>

		</div>
		<!-- .row -->
	</div>
	<!-- .container -->
</section>
<!-- Hero Section End -->

<!-- Categories Section Begin -->
<section class="categories" style="max-width: 1400px; margin: 0 auto;">
   <div class="container" style="">
      <div class="row">
         <div class="categories__slider owl-carousel">
            <div class="col-lg-3">
               <div class="categories__item set-bg"
                  data-setbg="/resources/img/marsh-cloud.jpg">
                  <h5>
                     <a href="/goods/get?gno=4">Marshmallow Cloud</a>
                  </h5>
               </div>
            </div>
            <div class="col-lg-3">
               <div class="categories__item set-bg"
                  data-setbg="/resources/img/matin-denim.jpg">
                  <h5>
                     <a href="/goods/get?gno=2">Matin Kim Destroyed Denim Case</a>
                  </h5>
               </div>
            </div>
            <div class="col-lg-3">
               <div class="categories__item set-bg"
                  data-setbg="/resources/img/padding.jpg">
                  <h5>
                     <a href="/goods/get?gno=5">The Baffle Case</a>
                  </h5>
               </div>
            </div>
            <div class="col-lg-3">
               <div class="categories__item set-bg"
                  data-setbg="/resources/img/matin-black-logo.jpg">
                  <h5>
                     <a href="/goods/get?gno=1">Matin Kim Black Logo Case</a>
                  </h5>
               </div>
            </div>
            <div class="col-lg-3">
               <div class="categories__item set-bg"
                  data-setbg="/resources/img/sparkles.jpg">
                  <h5>
                     <a href="/goods/get?gno=3">Chrome Sparkles - Graphite</a>
                  </h5>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<!-- Categories Section End -->

<!-- Blog Section Begin -->
<section class="from-blog spad"
	style="max-width: 1400px; margin: 0 auto;">
	<div class="container">
		<div class="row">
			<div class="section-title from-blog__title">
				<h2>From The Blog</h2>
			</div>

			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="blog__item">
					<div class="blog__item__pic">
						<img src="/resources/img/blog/blog3.png" alt="">
					</div>
					<div class="blog__item__text">
						<ul>
							<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
							<li><i class="fa fa-comment-o"></i> 5</li>
						</ul>
						<h5>
							<a href="#">Be Breast Aware</a>
						</h5>
						<p>유방암에 대한 인식을 돕는 컬렉션. Be Breast Aware 컬렉션을 통해 컬렉션 케이스를 구매할
							때마다 Living Beyond Breast Cancer 단체에 5달러를 기부합니다.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="blog__item">
					<div class="blog__item__pic">
						<img src="/resources/img/blog/blog1.png" alt="">
					</div>
					<div class="blog__item__text">
						<ul>
							<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
							<li><i class="fa fa-comment-o"></i> 5</li>
						</ul>
						<h5>
							<a href="#">자신을 최우선으로 생각하세요!</a>
						</h5>
						<p>5월 정신건강 인식의 달을 맞이해, 케이스가 판매될 때마다 비영리 단체 To Write Love On
							Her Arms (TWLOHA)에 US$5를 기부합니다.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="blog__item">
					<div class="blog__item__pic">
						<img src="/resources/img/blog/blog2.png" alt="">
					</div>
					<div class="blog__item__text">
						<ul>
							<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
							<li><i class="fa fa-comment-o"></i> 5</li>
						</ul>
						<h5>
							<a href="#">Pawfect Love</a>
						</h5>
						<p>강아지 고양이를 향한 사랑을 사랑스러운 Pawfect Love 컬렉션으로 표현해 보세요! 세계 강아지 &
							고양이 날을 맞이하여 컬렉션 케이스를 구매할 때마다 International Fund of Animal Welfare
							(IFAW)에 5달러가 기부됩니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Blog Section End -->

<script>
	$(document).ready(function() {
		$('.cateUl').hide(); //웹페이지 로딩 후 카테고리 숨김

		$('.cateUl').click(function() { //이벤트 리스너 추가

			// 현재 .cateUl의 display 속성
			var currentDisplay = $(this).css('display');

			if (currentDisplay === 'none' || currentDisplay === 'hidden') {
				$(this).show();
			} else {
				$(this).hide();
			}
		});
	});
</script>
<!-- Footer Section Begin -->

<jsp:include page="./includes/footer.jsp"></jsp:include>

<!-- Footer Section End -->