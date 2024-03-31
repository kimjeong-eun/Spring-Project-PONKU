<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%> --%>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<jsp:include page="../includes/header.jsp"></jsp:include>
<style>
/* 스타일을 입힐 비밀번호 입력 폼 */
#passwordForm {
	margin-top: 20px;
	text-align: center;
}

/* 비밀번호 입력 필드 */
#password {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box; /* 입력한 내용이 경계선 안에 잘리지 않도록 함 */
}

/* 확인 버튼 */
button.botton {
	background-color: #000;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 49%;
	margin-bottom: 10px;
}

/* 확인 버튼에 마우스를 올렸을 때 */
button.botton:hover {
	background-color: #808080;
	color: white;
}

/* 비밀번호 일치 여부 메시지 */
#message {
	color: red;
}

/* 목록으로 돌아가기 링크 */
.passwordcontainer a.list {
	color: blue; /* 파란색 */
	text-decoration: none; /* 밑줄 제거 */
}

.passwordcontainer {
	max-width: 400px;
	margin: 100px auto; /* 위아래 여백 추가 */
	padding: 20px;
}
/* 목록으로 돌아가기 링크에 마우스를 올렸을 때 */
.passwordcontainer a.list:hover {
	text-decoration: underline; /* 밑줄 추가 */
}
h2, .explanation {
	text-align: center;
}
.breadcrumb-section a {
	color: #fff;
	text-decoration: none;
	transition: color 0.3s;
}
.breadcrumb-section a:hover {
	color: #000;
}
</style>
<!-- Hero Section Begin -->
<section class="hero hero-normal">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars" style="color: white;"></i> <span>All departments</span>
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

<div class="passwordcontainer">
	<h2><i class="fa-solid fa-lock" style="color: #cd0000;"></i> 비밀글 보기 <i class="fa-solid fa-lock" style="color: #cd0000;"></i></h2>
	<br>
	<div class="explanation">
	<span>이 글은 비밀글 입니다.</span>
	<br>
	<span>비밀번호를 입력하세요.</span>
	</div>
	<form id="passwordForm">
		<input type="password" id="password" placeholder="비밀번호를 입력하세요">
		<p id="message"></p>
		<button class="botton" type="button" onclick="checkPassword()">확인</button>
		<button class="botton" type="button">목록</button>
	</form>
	
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
<script>
	function checkPassword() {
		var password = document.getElementById("password").value;
		// 여기에 비밀번호 검증 로직을 작성하세요
		// 예를 들어, 입력된 비밀번호가 "1234"일 때만 허용하도록 하겠습니다.
		if (password === "1234") {
			document.getElementById("message").innerText = "비밀번호가 일치합니다!";
			// 비밀번호가 일치할 경우 다음 동작을 추가하세요
		} else {
			document.getElementById("message").innerText = "비밀번호가 일치하지 않습니다.";
		}
	}
</script>
</body>

</html>