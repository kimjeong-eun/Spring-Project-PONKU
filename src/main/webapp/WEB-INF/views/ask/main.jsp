<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> --%>
<!-- <i> 태그 = 아이콘을 넣기 위한 script -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<jsp:include page="../includes/header.jsp"></jsp:include>
<style>
.faq-dropdown-container {
	display: flex; /* Flexbox를 사용하여 자식 요소를 수평으로 정렬 */
	align-items: center; /* 수직 가운데 정렬 */
	justify-content: flex-start; /* 왼쪽 정렬로 변경 */
	height: 50px;
}

.faq-dropdown {
	display: inline-block;
	position: relative;
}

.faq-toggle {
	background-color: #cd0000;
	color: #ffffff;
	padding: 10px 20px; /* 위아래 10px, 좌우 20px */
	border: none;
	cursor: pointer;
	display: inline-block;
	font-weight: bold; /* 두꺼운 글씨 */
}

.faq-menu {
	display: none;
	position: absolute;
	top: 0;
	left: 100%;
	background-color: #f9f9f9;
	padding: 10px;
	border-radius: 5px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	white-space: nowrap; /* 링크들을 가로로 나열 */
}

.faq-menu a {
	display: inline-block; /* 가로로 나열되도록 설정 */
	text-decoration: none;
	color: #333333;
	margin-right: 10px; /* 링크 사이 간격 조정 */
}

.faq-menu a:hover {
	background-color: #dddddd;
}

.faq-dropdown:hover .faq-menu {
	display: block;
}

.search-button {
	border: none; /* 테두리 제거 */
	background-color: transparent; /* 배경색 제거 */
}

#searchInput {
	width: 300px; /* 원하는 너비로 조정 */
}

#toggleButton {
	color: white; /* 텍스트 색상 */
	padding: 10px 20px; /* 내부 여백 */
	border: none; /* 테두리 없음 */
	cursor: pointer; /* 포인터 커서 */
	font-size: 16px; /* 폰트 크기 */
	transition: background-color 0.3s; /* 배경색 전환 효과 */
	width: 130px; /* 버튼의 너비 */
	height: 44.1px; /* 버튼의 높이 */
	font-weight: bold; /* 두꺼운 글씨 */
	margin-left: 10px; /* 버튼과 드롭다운 사이의 간격을 최소화 */
}

/* 비밀글 ON일 때 배경색 */
#toggleButton.secretOn {
	background-color: #cd0000; /* 빨간색 배경 */
}

/* 비밀글 OFF일 때 배경색 */
#toggleButton.secretOff {
	background-color: #808080; /* 회색 배경 */
}

/* 버튼에 호버 효과 추가 */
#toggleButton:hover {
	background-color: #555; /* 호버 시 배경색 변경 */
	color: white;
}

/* 페이지네이션 컨테이너 스타일 */
.pagination-container {
	display: flex;
	justify-content: center;
	margin-top: 30px;
	margin-bottom: 20px;
}

/* 페이지네이션 스타일 */
.pagination {
	display: flex;
	list-style: none;
}

/* 페이지네이션 아이템 스타일 */
.pagination li {
	margin-right: 5px;
}

/* 페이지네이션 링크 스타일 */
.pagination li a {
	padding: 5px 10px;
	text-decoration: none;
	border: 1px solid #ccc;
	color: #333;
}

/* 활성화된 페이지네이션 링크 스타일 */
.pagination li.active a {
	background-color: #cd0000;
	color: #fff;
	border-color: #cd0000;
}

#searchForm {
	vertical-align: middle; /* 검색 폼 요소들을 수직 중앙 정렬합니다. */
	text-align: center;
	margin-top: 15px;
	margin-left: auto; /* 검색 폼을 오른쪽으로 최대한 밀어냄 */
}

.b-s-container {
	margin: 0 auto; /* 좌우 여백을 자동으로 설정하여 가운데 정렬 */
	width: 75%;
}

.button-container {
	display: flex; /* 버튼들을 수평으로 나열하기 위해 flexbox 사용 */
	flex-wrap: nowrap; /* 버튼이 줄 바꿈 되지 않도록 설정 */
	width: 100%;
}

.button {
	background-color: #ffffff;
	border: none;
	color: #000000;
	padding: 10px 20px;
	margin-right: 10px;
	cursor: pointer;
}

.button.active {
	background-color: #cd0000; /* 클릭되었을 때 색상 변경 */
	color: #ffffff; /* 클릭되었을 때 텍스트 색상 변경 */
}

div.col {
	width: 100%;
}

div.row {
	width: 100%;
}

div.ask__main {
	width: 100%;
	margin-top: 50px;
	margin-bottom: 10px;
}

.searchbutton {
	border: none;
	background-color: #ffffff;
}

.button-search-container {
	width: 100%;
}

.breadcrumb-section a {
	color: #fff;
	text-decoration: none;
	transition: color 0.3s;
}

.breadcrumb-section a:hover {
	color: #cd0000;
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

<!-- 게시판 리스트 -->
<div class="container mx-auto">
	<div class="ask__main">
		<div class="row">
			<div class="col">
				<div class="faq-dropdown-container d-flex align-items-center">
					<div class="faq-dropdown">
						<div class="faq-toggle">자주묻는질문</div>
						<div class="faq-menu">
							<a href="#">배송문의</a> <a href="#">교환/반품</a> <a href="#">주문/결제</a>
						</div>
					</div>
					<!-- 비밀글 ON 버튼 이동 -->
					<button id="toggleButton" class="secretOn ml-2">비밀글 ON</button>
					<form id="searchForm" class="d-flex" > <!-- action="/ask/main" method='get' -->
						<select id="searchCategory" class="mr-2" name="type">
							<option value="all" <c:out value="${pageMaker.cri.type == null || pageMaker.cri.type eq 'all'?'selected':''}"/>>전체</option>
							<option value="title" <c:out value="${pageMaker.cri.type eq 'title'?'selected':''}"/>>제목</option>
							<option value="content" <c:out value="${pageMaker.cri.type eq 'content'?'selected':''}"/>>내용</option>
							<option value="writer" <c:out value="${pageMaker.cri.type eq 'writer'?'selected':''}"/>>작성자</option>
						</select>
						<input type="text" id="searchInput" class="mr-2" name="keyword" placeholder="검색어를 입력하세요">
						<button type="submit" class="searchbutton">
							<i class="fa-solid fa-magnifying-glass" style="color: #cd0000;"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="b-s-container">
	<div class="button-search-container">
		<div class="button-container">
			<button class="button">전체</button>
			<button class="button">상품문의</button>
			<button class="button">교환반품</button>
			<button class="button">배송문의</button>
			<button class="button">주문결제</button>
			<div class="faq-dropdown d-flex align-items-center ml-auto">
				<button class="faq-toggle ml-3 mr-3" onclick="location.href='/ask/write'">글쓰기</button>
			</div>
		</div>
	</div>
</div>

<!-- 테이블 시작 -->
<div class="container mt-4">
	<table class="table">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">문의종류</th>
				<th scope="col">상품정보</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody class="ask_list_tbody">
			<!-- <i class="fa-solid fa-paperclip" style="color: #cd0000;"></i>
			<i class="fa-solid fa-lock" style="color: #cd0000;"></i> -->
			<%-- <c:forEach items="${list}" var="askList">
				<tr>
					<th scope="row"><c:out value="${askList.ask_list_no}" /></th>
					<td><c:out value="${askList.ask_list_inquirytype}" /></td>
					<td><c:out value="${askList.ask_list_productno}" /></td>
					<td><a class='move' href='<c:out value="${askList.ask_list_no}"/>'><c:out value="${askList.ask_list_title}" /></a>
					<td><c:out value="${askList.ask_list_writer}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${askList.ask_list_regdate}" /></td>
				</tr>
			</c:forEach> --%>
		</tbody>
	</table>
</div>

<%-- <form id='actionForm' action="/ask/main" method='get'> <!-- 그냥 컨트롤러를 이용하는 방법 -->
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	<input type='hidden' name='type'
		value='<c:out value="${ pageMaker.cri.type }"/>'> <input
		type='hidden' name='keyword'
		value='<c:out value="${ pageMaker.cri.keyword }"/>'>
</form> --%>


<div class="pagination-container">
	<!-- 페이징 -->
	
</div>

<!-- Contact Section Begin 오프라인 매장이 있는 컨셉이라면 .. 넣기 -->
<!-- <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_phone"></span>
                        <h4>전화번호</h4>
                        <p>+01-3-8888-6868</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_pin_alt"></span>
                        <h4>오프라인 매장</h4>
                        <p>60-49 Road 11378 New York</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_clock_alt"></span>
                        <h4>운영시간</h4>
                        <p>10:00 am to 23:00 pm</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_mail_alt"></span>
                        <h4>Email</h4>
                        <p>hello@colorlib.com</p>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
<!-- Contact Section End -->

<!-- Map Begin 오프라인 매장이 있다면 나중에 (네이버지도)map api 사용예정 -->
<!-- <div class="map">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d49116.39176087041!2d-86.41867791216099!3d39.69977417971648!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x886ca48c841038a1%3A0x70cfba96bf847f0!2sPlainfield%2C%20IN%2C%20USA!5e0!3m2!1sen!2sbd!4v1586106673811!5m2!1sen!2sbd"
            height="500" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        <div class="map-inside">
            <i class="icon_pin"></i>
            <div class="inside-widget">
                <h4>New York</h4>
                <ul>
                    <li>Phone: +12-345-6789</li>
                    <li>Add: 16 Creek Ave. Farmingdale, NY</li>
                </ul>
            </div>
        </div>
    </div> -->
<!-- Map End -->

<!-- Contact Form Begin 글쓰기 -->
<!-- <div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2>Leave Message</h2>
                    </div>
                </div>
            </div>
            <form action="#">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <input type="text" placeholder="Your name">
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <input type="text" placeholder="Your Email">
                    </div>
                    <div class="col-lg-12 text-center">
                        <textarea placeholder="Your message"></textarea>
                        <button type="submit" class="site-btn">SEND MESSAGE</button>
                    </div>
                </div>
            </form>
        </div>
    </div> -->
<!-- Contact Form End -->

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
	const toggleButton = document.getElementById("toggleButton"); // 비밀글 ON/OFF 버튼 태그를 가져온다.

	toggleButton.addEventListener("click", function() { // 클릭 이벤트가 일어나면
		if (toggleButton.textContent === "비밀글 ON") { // 버튼 태그의 글자가 비밀글 ON이면
			toggleButton.textContent = "비밀글 OFF"; // 비밀글 OFF로 바꾸고
			toggleButton.classList.remove("secretOn"); // secretOn css를 지우고
			toggleButton.classList.add("secretOff"); // secretOff css를 추가한다.	
		} else { // 버튼 태그의 글자가 비밀글 OFF면
			toggleButton.textContent = "비밀글 ON";
			toggleButton.classList.remove("secretOff");
			toggleButton.classList.add("secretOn");
		}
	});
	
</script>

<script type="text/javascript">
	//$(document).ready( function() {
						/* var result = '<c:out value="${result}"/>';
						
						checkModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {

							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ " 번이 등록되었습니다.");
							}

							$("#myModal").modal("show");
						}

						$("#regBtn").on("click", function() {

							self.location = "/board/register";

						});*/

						
						
						// 페이징(숫자버튼)(그냥 컨트롤러를 이용하는 방법)
						/* $(".paginate_button a").on("click", function(e) {
							e.preventDefault();
							console.log('click');

							actionForm.find("input[name='pageNum']").val($(this).attr("href"));
							actionForm.submit();
						}); 

						$(".move").on("click", function(e) {
							e.preventDefault(); // 기존동작무시
							actionForm.append("<input type='hidden' name='ask_list_no' value='" + $(this).attr("href") + "'>");
							actionForm.attr("action", "/board/get");
							actionForm.submit();
						}); */

</script>

<!-- cdn header.jsp에 추가 -->
<script type="text/javascript" src="/resources/js/asklist.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	
	var ask_list_tbody = $(".ask_list_tbody");
	var searchForm = $("#searchForm"); 
	var searchType = $("#searchCategory");
	var searchKeyword = $("#searchInput");
	showList(1, searchType, searchKeyword); // 기본 페이지는 1페이지
	
	function showList(page, type, keyword){ // 리스트에 값이 있는지 검사하고 출력한다.
		console.log("show list " + page);
	
		askListService.getListWithPaging({page: page|| 1, type: type, keyword: keyword}, function(askListCnt, list){
			
			console.log("askListCnt: "+ askListCnt ); 
	        console.log("list: " + list);
			
			
			if(page == -1){
		          pageNum = Math.ceil(askListCnt/10.0);
		          showList(pageNum);
		          return;
		    }
			var str = "";
			if(list == null || list.length == 0){
		          return;
		    }
			// ask_list_tbody.empty(); // 이전 목록 삭제
			// 위 두개가 검증되었으면
			for (var i = 0, len = list.length || 0; i < len; i++) {
				str += '<tr><th scope="row">' + list[i].ask_list_no + '</th>';
			    str += '<td>' + list[i].ask_list_inquirytype + '</td>';
			    if(list[i].ask_list_productno != null){
			    	str += '<td>' + list[i].ask_list_productno + '</td>';
			    } else {
			    	str += '<td></td>';
			    }
			    str += '<td><a class="move" href="' + list[i].ask_list_no + '">' + list[i].ask_list_title;
			    if(list[i].ask_list_lock == true || list[i].ask_list_lock == 1){
			    	str += ' <i class="fa-solid fa-lock" style="color: #cd0000;"></i>';
			    }
			    /* 나중에 첨부파일도 하기! if */
			    '</a></td>';
			    str += '<td>' + list[i].ask_list_writer + '</td>';
			    var regDate = new Date(list[i].ask_list_regdate);
			    var formattedDate = regDate.toLocaleString('ko-KR', { year: 'numeric', month: '2-digit', day: '2-digit' });
			    str += '<td>' + formattedDate + '</td></tr>';
         }
		ask_list_tbody.html(str); // 리스트 출력
		showAskListPage(askListCnt);
			
		}); // 익명함수 종료
	} // showList
	
	var pageNum = 1;
	var paginationContainer = $(".pagination-container"); // 페이징이 출력될 곳(div)
	
	function showAskListPage(askListCnt){ // 페이징을 계산해서 페이지번호를 출력
	      
	      var endNum = Math.ceil(pageNum / 10.0) * 10;	// 마지막 페이지
	      var startNum = endNum - 9; 					// 시작 페이지
	      
	      var prev = startNum != 1;						// 이전
	      var next = false;								// 다음
	      
	      if(endNum * 10 >= askListCnt){					
	        endNum = Math.ceil(askListCnt/10.0);
	      }
	      
	      if(endNum * 10 < askListCnt){					// 다음으로 true
	        next = true;
	      }
	      
	      var str = '<ul class="pagination">';
	      
	      if(prev){
	        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>이전</a></li>";
	      }
	      
	       
	      
	      for(var i = startNum ; i <= endNum; i++){
	        
	        var active = pageNum == i? "active":"";
	        
	        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
	      }
	      
	      if(next){
	        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>다음</a></li>";
	      }
	      
	      str += "</ul>";
	      
	      console.log(str);
	      paginationContainer.html(str);
	      
	} // showAskListPage
	
	// 페이지 번호를 클릭했을 때 해당 페이지 번호를 showList로 보내 리스트를 출력
	paginationContainer.on("click","li a", function(e){
        e.preventDefault(); // 기존 동작 무시
        
        var targetPageNum = $(this).attr("href");
        
        console.log("targetPageNum: " + targetPageNum);
        
        pageNum = targetPageNum;
        
        showList(pageNum);
    }); // 익명함수종료
    
	$("#searchForm button").on("click", function(e) {
				if (!searchForm.find("option:selected").val()) {
					alert("검색종류를 선택하세요");
					return false;
				}

				if (!searchForm.find("input[name='keyword']").val()) {
					alert("키워드를 입력하세요");
					return false;
				}

				showList(1, searchType, searchKeyword); // 기본 페이지는 1페이지

	});

});
    
    
	

</script>

</body>

</html>