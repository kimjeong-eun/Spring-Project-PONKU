<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<jsp:include page="../includes/header.jsp"></jsp:include>
<style>
.breadcrumb-section {
	background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url('/resources/img/breadcrumb.jpg');
	background-size: cover;
	background-position: center;
	color: #fff;
}

.breadcrumb-section a {
	color: #fff;
	text-decoration: none;
	transition: color 0.3s;
}

.breadcrumb-section a:hover {
	color: #cd0000;
}

.write-post {
	padding: 50px 0;
}

.write-post .container {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.1);
	padding: 30px;
}

.write-post h2 {
	font-size: 28px;
	margin-bottom: 30px;
	text-align: center;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	font-weight: bold;
}

.form-group input[type="text"], .form-group textarea, .form-group input[type="password"],
	.form-group input[type="file"], .form-group input[type="checkbox"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 16px;
}

.form-group textarea {
	height: 150px;
	resize: vertical;
}

.form-group input[type="file"] {
	cursor: pointer;
}

button.rite {
	background-color: #cd0000;
	color: #fff;
	border: none;
	padding: 15px 25px;
	cursor: pointer;
	font-size: 18px;
	font-weight: bold;
	text-transform: uppercase;
	transition: background-color 0.3s, transform 0.3s;
}

button.rite:hover {
	background-color: #b30000;
	transform: scale(1.05);
}

#password-group {
	display: none;
}

.form-group input[type="checkbox"] {
	width: 2%;
	margin-right: 5px; /* 체크박스를 왼쪽으로 이동시킵니다. */
	height: 20px; /* 체크박스의 높이를 조정합니다. */
}

.password {
	margin-right: 10px; /* 라벨과 체크박스 사이의 간격을 조정합니다. */
}

#type {
	display: flex;
	align-items: center;
}

#type>label {
	margin-right: 10px;
}

.ritediv {
	text-align: right;
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

<!-- 글 작성 폼 섹션 -->
<section class="write-post">
	<div class="container">
		<h2>
			<i class="fa-solid fa-question" style="color: #cd0000;"></i>&nbsp;&nbsp;&nbsp;문의하기&nbsp;&nbsp;&nbsp;<i
				class="fa-solid fa-question" style="color: #cd0000;"></i>
		</h2>
		<form id="postForm" action="#" method="POST">
			<div id="type" class="form-group">
				<label for="postType">문의종류</label> <select id="postType"
					name="postType">
					<option value="general">상품문의</option>
					<option value="question">교환반품</option>
					<option value="review">배송문의</option>
					<option value="review">주문결제</option>
					<option value="review">기타</option>
				</select>
			</div>
			<div class="form-group">
				<label for="title">제목</label> <input type="text" id="title"
					name="title" required>
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea id="content" name="content" rows="8" required></textarea>
			</div>
			<div class="form-group">
				<label for="author">작성자</label> <input type="text" id="author"
					name="author">
			</div>
			<div class="form-group">
				<label for="attachment">첨부 파일</label> <input type="file"
					id="attachment" name="attachment" multiple>
			</div>
			<div class="form-group">
				<label for="secret" class="checkbox-label">비밀글</label> <input
					type="checkbox" id="secret" name="secret">
			</div>
			<div id="password-group" class="form-group">
				<label for="password" class="password">비밀번호</label> <input
					type="password" id="password" name="password">
			</div>
			<div class="ritediv">
				<button type="submit" class="rite">글 작성</button>
			</div>
		</form>
	</div>
</section>

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
<script>
	document.getElementById("secret").addEventListener("change", function() {
		var passwordGroup = document.getElementById("password-group");
		if (this.checked) {
			passwordGroup.style.display = "block";
		} else {
			passwordGroup.style.display = "none";
		}
	});
</script>
</body>

</html>