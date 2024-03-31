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
	color: #000;
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
	background-color: #000;
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
	background-color: #808080;
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

/* input[type=file]::file-selector-button {
	width: 150px;
	height: 30px;
	background: #fff;
	border: 1px solid rgb(77, 77, 77);
	cursor: pointer; &: hover { background : rgb( 77, 77, 77);
	color: #fff;
} */ /* 삭제 예정(얘를 쓰면 드래그앤드롭 스타일 적용안됌) */
#file-draganddrop {
	border: 2px dashed #ccc;
	padding: 20px;
	text-align: center;
	cursor: pointer;
	transition: all 0.3s ease; /* 부드러운 전환 효과 */
}

#file-draganddrop.dragover {
	border-color: #007bff; /* 밝은 파란색으로 변경 */
	background-color: #f0f8ff; /* 매우 연한 파란색 배경 */
	color: #ccc;
}

#fileList {
	list-style-type: none;
	padding: 0;
}

.fileItem {
	display: flex;
	align-items: center;
	margin-bottom: 5px;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f9f9f9;
}

.fileItem span {
	margin-right: 10px;
}

.deleteButton {
	background-color: #000;
	color: white;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
}

.deleteButton:hover {
	background-color: #808080;
}

i.fa-solid {
	color: #000;
}
</style>

<!-- Hero Section Begin -->
<section class="hero-normal">
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

<!-- 글 작성 폼 섹션 -->
<section class="write-post">
	<div class="container">
		<h2>
			문의하기&nbsp;<i class="fa-solid fa-comment-dots"></i>
		</h2>
			<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
			<!-- csrf 토큰 -->
			<div id="type" class="form-group">
				<label for="postType">문의종류</label> <select id="postType"
					name="ask_list_inquirytype">
					<option value="상품문의">상품문의</option>
					<option value="교환반품">교환반품</option>
					<option value="배송문의">배송문의</option>
					<option value="주문결제">주문결제</option>
					<option value="기타">기타</option>
				</select>
			</div>
			<div class="form-group">
				<label for="product">상품정보</label>
				<button type="button" id="product" name="ask_list_productno">검색하기</button>
				<!-- required : 필수값 -->
			</div>
			<div class="form-group">
				<label for="title">제목</label> <input type="text" id="title"
					name="ask_list_title" required>
				<!-- required : 필수값 -->
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea id="content" name="ask_list_content" rows="8" required></textarea>
				<!-- 한글 최대 666자 -->
			</div>
			<div class="form-group">
				<label for="author">작성자</label> <input type="text" id="author"
					name="ask_list_writer" required>
				<!-- 로그인쪽에서 끌어올 예정 -->
			</div>
			<div class="form-group" id="attachmentUploadDiv">
				<label>첨부 파일</label>
				<div id="file-draganddrop">
					[여기에 파일을 드래그하거나, 클릭하여 업로드]
					<div id="Preview">
			
					</div>
				</div>
				<input type="file" id="file-selectinput" multiple
					style="display: none;" />
				<!-- <input type="file" id="attachment" name="ask_list_attach" multiple> -->
				<!-- 파일 여러개 선택 가능 -->

			</div>
			<div class="form-group">
				<label for="secret" class="checkbox-label">비밀글</label> <input
					type="checkbox" id="secret" name="ask_list_lock" value="true">
				<!-- 체크하지 않으면 아무값도 넘어가지 않는다. -->
			</div>
			<div id="password-group" class="form-group">
				<label for="password" class="password">비밀번호</label> <input
					type="password" id="password" name="ask_list_lock_password">
			</div>
			<div class="ritediv">
				<button type="submit" class="rite" id="submitwrite">글 작성</button>
			</div>
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
			this.value = "true";
			passwordGroup.style.display = "block"; // 표시함
		} else {
			this.value = "false";
			passwordGroup.style.display = "none"; // 숨김
		}
	});
</script>
<!-- cdn header.jsp에 추가 -->
<script type="text/javascript" src="/resources/js/asklist.js"></script>
<script type="text/javascript" src="/resources/js/file.js"></script>
<script>
/* 	

						var writeForm = $("#writeForm"); // 폼 in 문의종류, 상품정보, 제목, 내용, 작성자, 첨부파일(1,0), 비밀글(1,0), 비밀번호(선택)

						$("button[type='submit']")
								.on(
										"click",
										function(e) { // 글쓰기 버튼을 클릭했을 떄
											e.preventDefault();

											var str = "";
											$(".uploadResult ul li")
													.each(
															function(i, obj) {

																var jobj = $(obj);

																console
																		.dir(jobj);
																console
																		.log("-------------------------");
																console
																		.log(jobj
																				.data("filename"));

																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].fileName' value='"
																		+ jobj
																				.data("filename")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].uuid' value='"
																		+ jobj
																				.data("uuid")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].uploadPath' value='"
																		+ jobj
																				.data("path")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].fileType' value='"
																		+ jobj
																				.data("type")
																		+ "'>";

															});

											console.log(str);

											formObj.append(str).submit();

										});

						 */
</script>
</body>
</html>