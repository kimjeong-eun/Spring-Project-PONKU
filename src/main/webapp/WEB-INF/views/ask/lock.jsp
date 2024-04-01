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
	data-setbg="/resources/img/bannerimg.png">
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
	<h2>비밀글 보기 <i class="fa-solid fa-lock" style="color: #000;"></i></h2>
	<br>
	<div class="explanation">
	<span>이 글은 비밀글 입니다.</span>
	<br>
	<span>비밀번호를 입력하세요.</span>
	</div>
	<form id="passwordForm">
	<input type="hidden" id="ano" name="ask_list_no" value="${ ask_list_no }" />
		<input type="password" id="password" placeholder="비밀번호를 입력하세요">
		<p id="message"></p>
		<button class="botton" type="button" onclick="checkPassword()">확인</button>
		<button class="botton" type="button" onclick="location.href='/ask/main'">목록</button>
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
var csrfHeaderName = $("meta[name='_csrf_header']").attr("content")//"${_csrf.headerName}";
var csrfTokenValue = $("meta[name='_csrf']").attr("content")//"${_csrf.token}";
console.log(csrfHeaderName);
console.log(csrfTokenValue);

	function checkPassword() {
		debugger;
		var pw = document.getElementById("password").value;
		var ano = document.getElementById("ano").value;
		$.ajax({ // ajax으로 전송
			url: '/ask/lock', // 전송할 경로
			data: JSON.stringify({ password: pw, ask_list_no: ano }),
			//async : true,
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			//dataType: 'text', // text 타입으로
			contentType: 'application/json',
			type: 'POST', // post 방식으로
			success: function(result) { // 성공 시 결과를
				debugger;
				console.log("비밀번호 일치 : " + result);
				message(result);
			}, error: function(result) {
				console.log("실패 : " + result);
				message(result);
				return;
			}
		}); //$.ajax
		
	}
	
	function message(result) {
		if (result === "true") {
			document.getElementById("message").innerText = "비밀번호가 일치합니다";
			//window.location.href = '/ask/main';
		} else {
			document.getElementById("message").innerText = "비밀번호가 일치하지 않습니다.";
			//location.reload();
			return;
		}
	}
</script>
</body>

</html>