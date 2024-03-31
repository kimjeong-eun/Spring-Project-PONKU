<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%> --%>
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
	background-color: #000;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s, transform 0.3s;
	margin-right: 10px;
}

.askcontainer button:hover {
	background-color: #808080;
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
	color: #000;
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

<div class="a-container">
	<div class="askcontainer">
		<h3>상세보기</h3>
		<div>
			<label for="ask_list_inquirytype">문의종류</label> <input
				class="form-control" id="ask_list_inquirytype"
				name='ask_list_inquirytype'
				value='${ AskListVO.ask_list_inquirytype }' readonly="readonly">
		</div>
		<div>
			<label for="ask_list_title">제목</label> <input class="form-control"
				id="ask_list_title" name='ask_list_title'
				value='${ AskListVO.ask_list_title }' readonly="readonly">
		</div>
		<div>
			<label for="ask_list_content">내용</label>
			<textarea class="form-control" id="ask_list_content" rows="3"
				name='ask_list_content' readonly="readonly">${ AskListVO.ask_list_content }</textarea>
		</div>
		<div>
			<label for="ask_list_writer">작성자</label> <input class="form-control"
				id="ask_list_writer" name='ask_list_writer'
				value='${ AskListVO.ask_list_writer }' readonly="readonly">
		</div>
		<%-- <c:set var="formattedRegDate" value="<fmt:formatDate value='${AskListVO.ask_list_regdate}' pattern='yyyy.MM.dd' />" /> --%>
		<%-- <c:set var="formattedUpdateDate" value="<fmt:formatDate value='${AskListVO.ask_list_updatedate}' pattern='yyyy.MM.dd' />" /> --%>

		<div>
		    <label for="ask_list_regdate">작성일</label>
    		<input class="form-control" id="ask_list_regdate" name='ask_list_regdate' value="${AskListVO.ask_list_regdate}" readonly="readonly">
		</div>
		<c:choose>
			<c:when test="${AskListVO.ask_list_regdate} == ${AskListVO.ask_list_updatedate}">
				<c:set var="updateDate" value="" />
			</c:when>
			<c:when test="${AskListVO.ask_list_regdate} != ${AskListVO.ask_list_updatedate}">
				<c:set var="updateDate" value="${AskListVO.ask_list_updatedate}" />
			</c:when>
		</c:choose>
		<div>
    		<label for="ask_list_updatedate">수정일</label>
    		<input class="form-control" id="ask_list_updatedate" name='ask_list_updatedate' value="${updateDate}" readonly="readonly">
		</div>
		

		<div class="button">
			<button type="button" onclick="location.href='/ask/main'">목록보기</button>
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
<script>
    // 작성일 날짜 형식화 함수
    function formatDateReg(regDate) {
        var date = new Date(regDate);
        var year = date.getFullYear();
        var month = ("0" + (date.getMonth() + 1)).slice(-2);
        var day = ("0" + date.getDate()).slice(-2);
        return year + "." + month + "." + day;
    }

    // 수정일 날짜 형식화 함수
    function formatDateUpdate(updateDate) {
        var date = new Date(updateDate);
        var year = date.getFullYear();
        var month = ("0" + (date.getMonth() + 1)).slice(-2);
        var day = ("0" + date.getDate()).slice(-2);
        return year + "." + month + "." + day;
    }
</script>

</body>

</html>