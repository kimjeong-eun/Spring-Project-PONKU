<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%> --%>
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
		<form id="writeForm" action="#" method="POST">
			<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
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
					여기에 파일을 드래그하거나, 클릭하여 업로드
					<div id="Preview">
						<!-- style="visibility: hidden;" 숨기기 -->
						<!-- 숨겨진 div의 내용 -->
						<!-- <button id="uploadfile" >파일선택</button>
						<button id="deletefile" >삭제</button> -->
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
	/* $(document).ready(function(e) {

		var writeForm = $("#writeForm"); // 폼 in 문의종류, 상품정보, 제목, 내용, 작성자, 첨부파일(1,0), 비밀글(1,0), 비밀번호(선택)
		var files; // 사용자가 선택한 파일들

		// 사용자가 드래그한 파일을 드롭 영역 안에 놓았을 때의 동작(파일선택)
		dropZone.addEventListener('drop', function(e) {
			e.preventDefault(); // 기본 이벤트 방지
			dropZone.classList.remove('dragover'); // 스타일 복원

			files += e.dataTransfer.files; // 사용자가 드롭한 파일들의 목록
			console.log("files : " + files);
			//파일처리함수 js파일의 함수 예정 .. (files); // 파일 처리 함수 (서버로 업로드하는 로직 등)
		});

		// 사용자가 파일을 클릭으로 선택했을 때
		fileSelect.addEventListener('change', function() {
			files += this.files;
			console.log("files : " + files);
			//파일처리함수 js파일의 함수 예정 .. (files); // 파일 처리 함수 (서버로 업로드하는 로직 등)
		});

		$("button[type='submit']").on("click", function(e){
		  e.preventDefault();
		  		  
		  var str = "";
		  $(".uploadResult ul li").each(function(i, obj){
		    
		    var jobj = $(obj);
		    
		    console.dir(jobj);
		    console.log("-------------------------");
		    console.log(jobj.data("filename"));
		    
		    
		    str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		    str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		    str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		    str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
		    
		  });
		  
		  console.log(str);
		  
		  formObj.append(str).submit();
		  
		});
		
		// 파일 업로드는 별도의 업로드 버튼을 두지 않고 <input type='file'>의 내용이 변경되는것을 감지해서 처리하도록 한다.
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");			// 제한할 파일 확장자
		var maxSize = 5242880; //5MB									// 파일 최대 크기
		
		//파일 업로드 시 제한된 파일 확장자인지, 최대 파일크기를 넘었는지 검사한다.  
		function checkExtension(fileName, fileSize){					// 파일명과, 파일크기를 매개값으로 받는다.
		  
		  if(fileSize >= maxSize){									// 파일크기 초과 시
		    alert("파일 사이즈 초과");
		    return false;												// 안돼 돌아가
		  }
		  
		  if(regex.test(fileName)){									// 파일이름중에 제한된 확장자를 가진 파일이 있으면
		    alert("해당 종류의 파일은 업로드할 수 없습니다.");
		    return false;												// 안돼 돌아가
		  }
		  return true;												// 둘다 통과했으면 괜찮음 ~
		}
		
		var csrfHeaderName ="${_csrf.headerName}"; 					// ?
		var csrfTokenValue="${_csrf.token}";							// ?

		
		$("input[type='file']").change(function(e){					// 파일 추가 input 태그에 변화가 생기면 .. ?

		  var formData = new FormData();								// 가상의 폼태그를 생성하고
		  
		  var inputFile = $("input[name='uploadFile']");				// 파일 추가 input 태그의 파일들을 가져와서 inputFile 변수에 넣는다.
		  
		  var files = inputFile[0].files;								// 파일들의 배열을 만든다.
		  
		  for(var i = 0; i < files.length; i++){						// 파일이 있는만큼 반복하면서

		    if(!checkExtension(files[i].name, files[i].size) ){		// 파일 중에 제한된 확장자를 가진 파일이 있는지, 파일 최대 크기보다 큰 크기의 파일이 있는지 검사하고 만약 올리지 못할 파일이 있다면
		      return false;											// 안돼 돌아가
		    }
		    formData.append("uploadFile", files[i]);					// 없다면 ajax으로 파일을 업로드하기 위해 formData에 파일들을 집어넣는다.
		    
		  }
		  
		  $.ajax({													// ajax으로 파일 업로드하기
		    url: '/uploadAjaxAction',									// 전송 경로
		    processData: false, 										// false여야만 전송된다.
		    contentType: false,										// false여야만 전송된다.
		    beforeSend: function(xhr) {								// ?
		        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);	// ?
		    },
		    data:formData,											// formData 자체를 보낸다
		    type: 'POST',												// post 방식으로 보낸다.
		    dataType:'json',											// json방식으로 보낸다.
		      success: function(result){								// 성공 시 
		        console.log(result); 									// 콘솔에 결과를 출력하고
			  showUploadResult(result); //업로드 결과 처리 함수 	// 업로드 결과를 화면에 출력하도록 한다.

		    }
		  }); //$.ajax
		  
		});  
		
		function showUploadResult(uploadResultArr){																					// 파일 추가 input 태그에 변화가 생기면 업로드 url으로 보내고 업로드 결과를 처리하는 함수를 호출하는데, 그게 나다
		    
		  if(!uploadResultArr || uploadResultArr.length == 0){ return; }																// 업로드 할 파일들이 존재하지 않으면
		  
		  var uploadUL = $(".uploadResult ul");																						// 파일 하나 당 결과를 보여주는 부분을 가져온다.
		  
		  var str ="";
		  
		  $(uploadResultArr).each(function(i, obj){																					// 파일 정보 객체(BoardAttachVO)를 반복하면서
			
			if(obj.image){ // 이미지라면																						// 게시물이 등록될 때 첨부파일과 관련된 자려를 같이 전송하고 이를 db에 등록하기 위함
				var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);						// 경로를 포함한 썸네일 이미지 파일명을 저장
				str += "<li data-path='"+obj.uploadPath+"'";																	// data-path에 경로를 저장
			str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"					// data-uuid에 uuid, data-filename에 파일명, data-type에 이미지여부를 저장
			str +" ><div>";
				str += "<span> "+ obj.fileName+"</span>";																		// 파일명 출력	
				str += "<button type='button' data-file=\'"+fileCallPath+"\' "													// 삭제버튼(버튼을 클릭하면 data-file='경로를 포함한 썸네일파일명',
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";			// data-type='image'가 저장된다.
				str += "<img src='/display?fileName="+fileCallPath+"'>";														// 
				str += "</div>";
				str +"</li>";
			}else{		   // 일반 파일이라면
				var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
			    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			      
				str += "<li "
			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/resources/img/attach.png'></a>";
				str += "</div>";
				str +"</li>";
			}

		  });
		  
		  uploadUL.append(str);
		}

		$(".uploadResult").on("click", "button", function(e){						// 파일의 삭제버튼을 클릭하면
		    
		  console.log("delete file");					
		    
		  var targetFile = $(this).data("file");									// data-file을 가져온다.
		  var type = $(this).data("type");										// data-type을 가져온다.
		  
		  var targetLi = $(this).closest("li");									// 파일명,삭제버튼,이미지가 있는 li를 가져온다.(closest : 가장 가까운 li태그를 가져온다 .. ?)
		  
		  $.ajax({																// ajax으로 전송
		    url: '/deleteFile',													// 전송할 경로
		    data: {fileName: targetFile, type:type},								// 경로를 포함한 파일명, 이미지여부를 fileNAme, type라는 이름으로 설정
		    beforeSend: function(xhr) {											// ?
		        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);				// ?
		    },

		    dataType:'text',														// text 타입으로
		    type: 'POST',															// post 방식으로
		      success: function(result){											// 성공 시 결과를
		         alert(result);													// alert
		         
		         targetLi.remove();												// 파일명, 삭제버튼, 이미지가 있는 li를 삭제한다.
		       }
		  }); //$.ajax
		 });

	}); */
</script>
</body>
</html>