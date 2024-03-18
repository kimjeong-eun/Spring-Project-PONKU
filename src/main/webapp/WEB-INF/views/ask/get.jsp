<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<jsp:include page="../includes/header.jsp"></jsp:include>
<style>
.askcontainer {
	margin: 50px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.1);
	padding: 30px;
}

.askcontainer div {
	margin-bottom: 20px;
}

.askcontainer label {
	font-weight: bold;
}

.askcontainer input[type="text"], .board-container textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 16px;
}

.askcontainer textarea {
	height: 150px;
	resize: vertical;
}

.askcontainer .form-control[readonly] {
	background-color: #f8f9fa;
	border: none;
	cursor: default;
}

.askcontainer .form-control[readonly]:focus {
	outline: none;
}

.a-container {
	width: 75%;
	margin: 0 auto;
}

h3 {
	text-align: center;
}

.askcontainer button {
	background-color: #cd0000;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s, transform 0.3s;
	margin-right: 10px;
}

.askcontainer button:hover {
	background-color: #b30000;
	transform: scale(1.05);
}

.askcontainer .button {
	text-align: right;
}

.breadcrumb-section a {
	color: #fff;
	text-decoration: none;
	transition: color 0.3s;
}

.breadcrumb-section a:hover {
	color: #cd0000;
}

.button button {
	font-weight: bold;
}
</style>

<!-- Hero Section Begin -->
<section class="hero hero-normal">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars" style="color: white;"></i> <span>All
							departments</span>
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
					<h2>문의 게시판</h2>
					<div class="breadcrumb__option">
						<a href="./index.html">홈</a> <span>문의 게시판</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<div class="a-container">
	<div class="askcontainer">
		<h3>
			<i class="fa-solid fa-question" style="color: #cd0000;"></i>&nbsp;&nbsp;&nbsp;상세보기&nbsp;&nbsp;&nbsp;<i
				class="fa-solid fa-question" style="color: #cd0000;"></i>
		</h3>
		<div>
			<label for="bno">문의종류</label> <input class="form-control" id="bno"
				name='bno' value='상품문의' readonly="readonly">
		</div>
		<div>
			<label for="title">제목</label> <input class="form-control" id="title"
				name='title' value='이 상품은 얼마인가요?' readonly="readonly">
		</div>
		<div>
			<label for="content">내용</label>
			<textarea class="form-control" id="content" rows="3" name='content'
				readonly="readonly">2개사면 얼마인가요 ?? 얼른 답해주세요.</textarea>
		</div>
		<div>
			<label for="writer">작성자</label> <input class="form-control"
				id="writer" name='writer' value='user1' readonly="readonly">
		</div>
		<div>
			<label for="writeDate">작성일</label> <input class="form-control"
				id="writeDate" name='writeDate' value='2024-03-18'
				readonly="readonly">
		</div>
		<div>
			<label for="modifyDate">수정일</label> <input class="form-control"
				id="modifyDate" name='modifyDate' value='' readonly="readonly">
		</div>
		<div class="button">
			<button type="button">목록보기</button>
			<button type="button">수정</button>
			<button type="button">삭제</button>
		</div>
	</div>
</div>

<jsp:include page="../includes/footer.jsp"></jsp:include>

<!-- Js Plugins -->
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/jquery-ui.min.js"></script>
<script src="/resources/js/jquery.slicknav.js"></script>
<script src="/resources/js/mixitup.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/main.js"></script>

</body>

</html>