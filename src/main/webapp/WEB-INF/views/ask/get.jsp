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
		<input type="hidden" id="checkLock" value='${ AskListVO.ask_list_lock }'>
		<input type="hidden" id="asklistno" value='${ AskListVO.ask_list_no }'>
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
				<c:set var="updateDate" value='' />
			</c:when>
			<c:when test="${AskListVO.ask_list_regdate} != ${AskListVO.ask_list_updatedate}">
				<c:set var="updateDate" value="${AskListVO.ask_list_updatedate}" />
			</c:when>
		</c:choose>
		<div>
    		<label for="ask_list_updatedate">수정일</label>
    		<input class="form-control" id="ask_list_updatedate" name='ask_list_updatedate' value="${updateDate}" readonly="readonly">
		</div>
		
		<div>
    		<label for="ask_list_updatedate">첨부파일</label>
    		<ul id="attachFile">
    		</ul>
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
$(document).ready(function () { // 비밀글이고, 비밀번호 검증을 마쳤으면 이 페이지를 띄우도록 해야함 .. 
	debugger;
	var checkLock = document.getElementById("checkLock").value;
	var ask_list_no = document.getElementById("asklistno").value;
	console.log(checkLock);
	if(checkLock){
		response.sendRedirect("/ask/lock?no=" + ask_list_no);
	}
});
</script>
<script>
debugger;
var attachFile = $("#attachFile");
var filesString = '${fileJson}';
filesString = filesString.replace(/\\/g, "\\\\"); // 이스케이프 문자를 올바르게 처리하여
// JavaScript에서 JSON을 파싱할 때 문자열 내의 이스케이프 문자가 올바르게 처리되지 않았을 때 발생하는 에러 해결
// VM503:1 Uncaught SyntaxError: Bad escaped character in JSON at position 67 (line 1 column 68) at JSON.parse (<anonymous>) 
var files = JSON.parse(filesString); // 파싱한다.
console.log(files);
showUploadFile(files);
function showUploadFile(files){
	debugger;
	var str = "";
	var fileCallPath ;
	$(files).each(function(i, file){
		if(!file.fileType){ // 일반파일
			fileCallPath = encodeURIComponent(file.uploadPath + "\\" + file.uuid + "_" + file.fileName);
			str += "<li><a href='/downloadAsk?fileName=" + fileCallPath + "'>" + "<i class='fa-solid fa-file' style='color: #000;'></i>" + file.fileName + "</a></li>";
		} else { // 이미지파일
			if(!(file.uuid.startsWith("s_"))) { // uuid가 s_로 시작하지 않으면
				return;
			} else { // uuid가 s_로 시작하면
				fileCallPath = encodeURIComponent(file.uploadPath + "\\" + file.uuid + "_" + file.fileName); // 썸네일 경로
			} // 썸네일을 찾아서 썸네일 이미지를 출력
			console.log("이미지파일인 경우 썸네일의 경로 : " + fileCallPath);
			var index = fileCallPath.indexOf("s_"); // "s_"의 시작 인덱스를 찾음
			var cleanedFileCallPath = fileCallPath; // s_가 없으면 파일경로 그대로
			if (index !== -1) { // "s_"를 찾으면
			    cleanedFileCallPath = fileCallPath.slice(0, index) + fileCallPath.slice(index + 2); // "s_"를 제외한 문자열을 합침
			    console.log("다운로드시 파일 경로(s_제거) : " + cleanedFileCallPath); 
			}
			str += "<li><a href='/downloadAsk?fileName=" + cleanedFileCallPath + "'>" + "<img src='/displayAsk?fileName=" + fileCallPath + "'>" + file.fileName + "</a></li>";
		}
	});
	attachFile.append(str);
}
</script>

</body>

</html>