<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Header Section Begin -->

	<jsp:include page="./includes/header.jsp"></jsp:include>

	<!-- Header Section End -->

	<h1>Upload with Ajax</h1>

	<form method="post" enctype="multipart/form-data"
		action="uploadAjaxAction/${_csrf.parameterName}=${_csrf.token}">
		<input type='file' name='uploadFile' multiple>
	</form>

	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	<input type="hidden" name="_csrf">
	<!-- post방식 시 토큰 필수 -->

	<button id='uploadBtn'>Upload</button>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

	<script>
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
</body>
</html>