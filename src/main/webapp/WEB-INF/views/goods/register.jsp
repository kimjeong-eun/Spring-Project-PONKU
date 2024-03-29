<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html lang="kr">

<style>
body {
	height: auto;
}

.dropdown-menu {
	width: 94%;
	overflow: auto;
}

/* 분류 버튼 */
.dropdown-toggle {
	width: 100%;
}

/* 수정된 CSS */
.dropdown-menu-apple, .dropdown-menu-sam {
	display: none;
}

input[type=file]::file-selector-button {
	width: 150px;
	height: 30px;
	background: #fff;
	border: 1px solid rgb(77, 77, 77);
	border-radius: 3px;
	cursor: pointer; &: hover { background : rgb( 77, 77, 77);
	color: #fff;
}

}

.attLi {
	display: inline-block;
	margin-right: 20px;
}

.attDel {
	display: inline-block;
	cursor: pointer;
	text-align: center;
	margin-left: 5px;
}

/* 기본 크기 */
.checkout.spad {
	min-height: 1160px; /* 기본 최소 높이 */
}

/* 화면 너비가 768px 이하인 경우 */
@media ( max-width : 768px) {
	.checkout.spad {
		min-height: 300px; /* 더 작은 높이로 조정 */
	}
}

/* 화면 너비가 576px 이하인 경우 */
@media ( max-width : 576px) {
	.checkout.spad {
		min-height: 1600px; /* 더 작은 높이로 조정 */
	}
}
</style>

<!-- Header Section Begin -->

<jsp:include page="../includes/header.jsp"></jsp:include>

<!-- Header Section End -->

<!-- Hero Section Begin -->

<%-- <p>principal : <sec:authentication property="principal"/></p> <!-- principal: UserDetailsService에서 반환된 객체 -->
<p>MemverVO : <sec:authentication property="principal.member"/></p>
<p>사용자 이름 : <sec:authentication property="principal.member.username"/></p>
<p>사용자 아이디 : <sec:authentication property="principal.username"/></p>
<p>사용자 권한 리스트 : <sec:authentication property="principal.member.authList"/></p>
 --%>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
	data-setbg="/resources/img/bg1.png">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>상품 등록 페이지</h2>
					<div class="breadcrumb__option">
						<a href="./index.html">Home</a> <a href="./index.html">Vegetables</a>
						<span>Vegetable’s Package</span>
					</div>
				</div>
			</div>
		</div>
		<!-- row -->

	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Details Section Begin -->
<section class="product-details spad">
	<div class="container" style="max-width: 1370px;">

		<!--  action="register" -->
		<!-- action="uploadAjaxAction/${_csrf.parameterName}=${_csrf.token}" -->
		<form method="post" enctype="multipart/form-data" role="form" action="/goods/register">
		
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			
			<div class="row">

				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">

						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src="/resources/img/product/details/product-details-1.jpg"
								alt="">
						</div>

						<div class="product__details__pic__slider owl-carousel">
							<img
								data-imgbigurl="/resources/img/product/details/product-details-2.jpg"
								src="/resources/img/product/details/thumb-1.jpg" alt=""> <img
								data-imgbigurl="/resources/img/product/details/product-details-3.jpg"
								src="/resources/img/product/details/thumb-2.jpg" alt=""> <img
								data-imgbigurl="/resources/img/product/details/product-details-5.jpg"
								src="/resources/img/product/details/thumb-3.jpg" alt=""> <img
								data-imgbigurl="/resources/img/product/details/product-details-4.jpg"
								src="/resources/img/product/details/thumb-4.jpg" alt="">
						</div>

					</div>
					<!-- product__details__pic__item -->
				</div>

				<div class="col-lg-6 col-md-6" style="box-sizing: border-box;">

					<div class="product__details__text">

						<!-- 회의 후 삭제? 예정 -->
						<div class="checkout__input row">
							<div class="col">
								<p>
									담당자<span>*</span>
								</p>
							</div>
							<div class="col">
								<input value='<sec:authentication property="principal.username"/>' readonly="readonly">
							</div>
						</div>
						
						<div class="checkout__input row">
							<div class="col">
								<p>
									상품번호<span>*</span>
								</p>
							</div>
							<div class="col">
								<input name="gno" type="text">
							</div>
						</div>

						<div class="checkout__input row"
							style="margin-top: 50px; color: #252525; font-weight: 700; margin-bottom: 16px;">
							<div class="col">
								<p>
									상품명<span>*</span>
								</p>
							</div>
							<div class="col">
								<input name="gname" type="text">
							</div>
						</div>

						<div class="checkout__input row">
							<div class="col">
								<p>판매가</p>
							</div>
							<div class="col row">
								<div class="col-9" style="padding: 0;">
									<input name="price" type="text"
										class="checkout__input__add product__details__price">
								</div>
								<div class="col-3">
									<span class="product__details__price">원</span>
								</div>
							</div>
						</div>

						<div class="checkout__input">
							<p>
								상품 설명<span>*</span>
							</p>
							<textarea name="information" type="text" rows="5"
								style="width: 100%; font-size: 16px; font-family:"Cairo", sans-serif;
							color:#6f6f6f; font-weight: 400; line-height: 26px; margin: 0 0 15px 0;"></textarea>
						</div>

 
 						<div class="checkout__input">
							<div class="row">
								<p>
									상품 이미지<span>*</span>
								</p>
							</div>
							<div class="row">

								<div class="uploadDiv col-10">
									<input type='file' name='uploadFile' multiple
										style="border: 0; padding: 0;">
								</div>
								<div class="col-2">
									<button id='uploadBtn' class="btn btn-light"
										style="width: 100%;">Upload</button>
								</div>
							</div>

							<div class="uploadResult">
								<ul>

								</ul>
							</div>

						</div>
						<!-- checkout__input -->

						<div class="checkout__input row" style="height: 80px">
							<p>
								기종 카테고리<span>*</span>
							</p>
							<!-- 대분류 -->
							<div class="dropdown col">
								<button class="btn btn-light dropdown-toggle brandBtn"
									style="border-radius: 0;" type="button" aria-expanded="false">브랜드</button>
								<ul class="dropdown-menu"
									style="border-radius: 0; border: none; background-color: #f5f5f5;">
									<li><a class="dropdown-item dropdown-brand1">애플</a></li>
									<li><a class="dropdown-item dropdown-brand2">삼성</a></li>
									<li><a class="dropdown-item dropdown-brand3">구글</a></li>
								</ul>
							</div>
							<!-- 중분류 -->
							<div class="dropdown col">
								<button class="btn btn-light dropdown-toggle" type="button"
									style="border-radius: 0;" aria-expanded="false">기기명</button>

								<ul class="dropdown-menu dropdown-menu-apple"
									style="border-radius: 0; border: none; background-color: #f5f5f5;">
									<li><a class="dropdown-item">아이폰 S</a></li>
								</ul>
								<ul class="dropdown-menu dropdown-menu-sam"
									style="border-radius: 0; border: none; background-color: #f5f5f5;">
									<li><a class="dropdown-item" href="">갤럭시 S</a></li>
								</ul>
							</div>
						</div> <!-- checkout__input -->

						<ul>
							<li><b>Availability</b> <span>In Stock</span></li>
							<li><b>Shipping</b> <span>01 day shipping. <samp>Free
										pickup today</samp></span></li>
							<li><b>Weight</b> <span>0.5 kg</span></li>
							<li><b>Share on</b>
								<div class="share">
									<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
										class="fa fa-twitter"></i></a> <a href="#"><i
										class="fa fa-instagram"></i></a> <a href="#"><i
										class="fa fa-pinterest"></i></a>
								</div></li>
						</ul>
					</div>
					<!-- details -->

					<!-- <div class="checkout__input">
						<p>
							재고수량<span>*</span>
						</p>
						<input type="text">
					</div> -->

					<!-- <div class="checkout__input__checkbox">
                                <label for="acc">
                                    Create an account?
                                    <input type="checkbox" id="acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <p>Create an account by entering the information below. If you are a returning customer
                            please login at the top of the page</p> -->
				</div>
				<!-- col-lg-7 -->
			</div>
			<!-- row -->

			<div class="checkout__input" style="text-align: center;">
				<button type="reset" class="btn btn-default"
					style="padding: 15px 60px; font-size: 1rem; border: 1px solid grey">초기화</button>
				<button type="submit" class="btn-default site-btn"
					style="margin-top: 160px; padding: 15px 60px; font-size: 1rem;">상품
					등록</button>
			</div>
		</form>
	</div>
	<!-- container -->

	<script>
	$(function() {
	    /* 드롭다운 */
	    var toggleBtn = $(".brandBtn"); // 버튼 선택
	    var menu = $(".dropdown-menu");
	    var appleItem = $(".dropdown-menu-apple");
	    var samItem = $(".dropdown-menu-sam");

	    // 버튼을 클릭하면 드롭다운 메뉴 항목 보이기
	    toggleBtn.click(function() {
	        menu.toggle(); // 대분류 드롭다운 메뉴 항목 보이거나 숨기기
	        appleItem.hide(); // 애플 메뉴 항목 숨기기
	        samItem.hide(); // 삼성 메뉴 항목 숨기기

	        if ($(".dropdown-menu").css("display") === "block") {
	            $(".cateMar").css("margin-top", "140px");
	        } else {
	            $(".cateMar").css("margin-top", "50px");
	        }
	    });

	    // 애플 브랜드를 클릭하면 애플 메뉴 항목 보이기
	    $(".dropdown-brand1").click(function() {
	        appleItem.show();
	        samItem.hide();
	    });

	    // 삼성 브랜드를 클릭하면 삼성 메뉴 항목 보이기
	    $(".dropdown-brand2").click(function() {
	        appleItem.hide();
	        samItem.show();
	    });

	    //헤더 토큰 정보 설정, 명시적 함수 먼저 실행
	    $(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	    });

	    /* 파일 업로드 */
	    /* 게시물 등록 시 첨부파일 정보 hidden으로 전송 */
	      var formObj = $("form[role='form']");
  
	      /* Submit 버튼 클릭 */
	      $("button[type='submit']").on("click", function(e){
	          e.preventDefault();

	          var str = "";

	          $(".uploadResult ul li").each(function(i, obj){
	              var jobj = $(obj);

	              str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	              str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	              str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	              str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	          });

	          formObj.append(str).submit();
	      });
	    
	    /* 파일의 확장자와 크기 사전 처리 */
	    var regexp = new RegExp("(.*?)\\.(exe|sh|zip|alz$)"); //정규표현식
	    var maxSize = 5242880; //5MB

	    function checkExtension(fileName, fileSize) {
	        if (fileSize >= maxSize) {
	            alert("파일 사이즈 초과");
	            return false;
	        }

	        if (regexp.test(fileName)) { //.test(): 표현식 만족 시
	            alert("해당 종류의 파일은 업로드할 수 없습니다");
	            return false;
	        }
	        return true; //반복을 위함 (문제 없을 시 true)
	    }

	    /* 여러 file 추가 위한 <input tye='file'>초기화 */
	    var cloneObj = $(".uploadDiv").clone(); //아무 내용 없는 div clone

	    var uploadResult = $(".uploadResult ul");

	    /* 파일 업로드 후 파일 미리보기 */
	    function ShowUploadFile(uploadResultArr) { //JSON 데이터를 받아 해당 파일명 추가

	        var str = "";

	        $(uploadResultArr).each(function(i, obj) {
	            var fileCallPath = ""; // fileCallPath 변수 초기화 및 showImage 시 전역 변수로 사용

	            if(!obj.image) { //이미지가 아닐 경우
	            	
	            	var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
	            
	                str += "<li>&nbsp;<i class='fa-solid fa-paperclip'/>" + obj.fileName + "<span data-file=\'"+fileCallPath+"\'><i class='fa-solid fa-rectangle-xmark'></i></span>"+
	                    "</li>"; //첨부파일 아이콘 + 파일명
	            } else {
	                var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName); 
	                    
	                var originPath = obj.uploadPath+ "\\"+obj.uuid +"_"+obj.fileName;
	                    
	                originPath = originPath.replace(new RegExp(/\\/g),"/");
	                    
	                str += "<li><p>" + obj.fileName + "</p><a href=\"javascript:showImage(\'"+originPath+"\')\">"+
	                       "<img src='display?fileName="+fileCallPath+"'></a>"+
	                       "<span data-file=\'"+fileCallPath+"\' data-type='image'><i class='fa-solid fa-rectangle-xmark'></i></span>"+
	                       "</li>";
	            }
	        });
	        uploadResult.append(str);
	    }

		/* 업로드 버튼 클릭 */
	    $("#uploadBtn").on("click", function(e) {
	        e.preventDefault(); // 기본 동작(페이지 새로고침) 방지

	        var formData = new FormData();
	        var inputFile = $("input[name='uploadFile']");
	        var files = inputFile[0].files;

	        // 파일 업로드 처리
	         for (var i = 0; i < files.length; i++) {
	            
	        	if(!checkExtension(files[i].name, files[i].size)) {
	        		return false;
	        	}
	        	formData.append("uploadFile", files[i]);
	        }

	        $.ajax({
	            url: 'uploadAjaxAction',
	            processData: false,
	            contentType: false,
	            data: formData,
	            type: 'POST',
	            dataType: 'json',
	            success: function(result) {
	                console.log(result);
	                //모달 창으로 등록할 것 예정
					alert("n개의 파일이 등록되었습니다.");
	                
	                ShowUploadFile(result);

	                $(".uploadDiv").html(cloneObj.html()); //업로드 후 복사된 객체를 div 내에 다시 추가하여 초기화
	            },
	            error: function(xhr, status, error) {
	                console.error(xhr.responseText);
	            }
	        }); //JSON 데이터 반환
	    });
		
		/* 삭제 버튼 클릭 */
		$(".uploadResult").on("click", "span", function(e) { //이벤트 위임 (업로드 후 span 생성)
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			var $targetElement = $(this).closest("li"); // 클릭된 삭제 버튼이 속한 리스트 아이템 요소 선택
			
			console.log("delete......" + targetFile);
			
			$.ajax({
				url: '/goods/deleteFile',
				data: {fileName: targetFile, type:type},
				dataType: 'text',
				type: 'POST',
				success: function(result) {
					alert(result);
					$targetElement.remove();
				},
		        error: function(xhr, status, error) {
		            console.error(xhr.responseText);
		        }		
			});
		});
		
	}); //function

	//$(document).ready()의 바깥쪽에 작성
	function showImage(fileCallPath) {

		var str = "";
		
		$(uploadResultArr).each(function(i, obj){
			
			if(!obj.image) {
				
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid +"_" + fileName);
			}
		});
	}
	</script>

	<!-- Footer Section Begin -->

	<jsp:include page="../includes/footer.jsp"></jsp:include>

	<!-- Footer Section End -->