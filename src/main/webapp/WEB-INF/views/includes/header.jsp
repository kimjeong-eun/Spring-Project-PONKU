<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html lang="kr">
<!DOCTYPE html>

<style>
.container {
	max-width: 1200px;
}
</style>

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Show Your Colors | Ponku</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>

<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<!-- 폰트 어썸 -->
<script src="https://kit.fontawesome.com/c96d31bca3.js"
	crossorigin="anonymous"></script>

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">

</head>

				
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-4">
						<a><i class="fa fa-envelope"></i> ponkuu@naver.com</a>
					</div>
					<div class="header__top__center col-lg-4 col-md-4">
						<a>20,000원 이상 구매시 무료배송</a>
					</div>

					<div class="header__top__right col-lg-4 col-md-4">
						<div class="header__top__right__social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa-brands fa-instagram"></i></a>
						</div>
						<div class="header__top__right__language">
							<div name=language>Korean</div>
							<span class="arrow_carrot-down"></span>
							<ul>
								<li><a href="#">Korean</a></li>
								<li><a href="#">English</a></li>
							</ul>
						</div>
						<div class="header__top__right__auth">
								<sec:authentication property="principal" var="pinfo" />
								
                            	<sec:authorize access="isAuthenticated()">
                            	
                            	<input type="hidden" value="${pinfo.member.member_seq }" name="memberSeq"> 
                            	
                            	<div class="hero__cart" style="display: inline-block;">
									<ul>
										<li><a href="#"><i class="fa fa-heart"></i> <!-- <span></span> --></a></li>
										<li><a href="/shoppingcart?member=${pinfo.member.member_seq }"><i class="fa fa-shopping-bag"></i><span id="cart-elements"> </span></a></li>
									</ul>
								<!--   <div class="header__cart__price">item: <span>$150.00</span></div> -->
								</div>
                            	<form action="/logout" method="post" name="logoutForm">
                            		<a href="#" name="logoutBtn" style="display: inline-block;"><i class="fa fa-user"></i>LogOut ( ${pinfo.username })</a>
                            		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            	</form>
                            	
                            	<script type="text/javascript">
		                            	// 로그인시 쇼핑카트에 몇개가 담겼는지 정보 받아옴
		                            	
		            		    		var memberSeq = $("input[name='memberSeq']").val()+"";
		            		    		
		            		    		console.log(memberSeq);
		            		    		
		            			    	 $.ajax({
		            			    		
		            			    		 url:'/showCartElements',
		            			    		 type:'GET',
		            			    		 data:{member: memberSeq},
		            			    		 contentType:'application/x-www-form-urlencoded; charset=utf-8',
		            			    		 dataType:'text',
		            			    		 success: function(result) {
		            							
		            			    			
		            			    			 $("#cart-elements").text(result+"");
		            						}
		            			    		 
		            			    	 });
                            	</script>
                            	</sec:authorize>                    		   
                                <sec:authorize access="isAnonymous()">
                                	<a href="/customLogin"><i class="fa fa-user"></i>LogIn</a>
                                </sec:authorize>
						</div>
					</div>
				</div>
			</div>
			<!-- container -->
		</div>
		<!-- header__top -->

		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="/">
						<img src="/resources/img/logo/ponku_logo1.png" alt="" style="width: 10rem; transform: translateX(-10rem);">
						</a>		
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu" style="text-align: center;">
						<ul>
							<li class="active"><a href="/">상품구매</a></li>
							<li><a href="/custompage">커스텀 케이스</a></li>
							<li><a href="./blog.html">이벤트</a></li>
							<li><a href="./contact.html">문의게시판</a></li>
							
 							<sec:authorize access="isAuthenticated()">
                            
								<li><a href="/myPage" name="myPage">마이페이지</a>
	                                <ul class="header__menu__dropdown">
	                                    <li><a href="./shop-details.html">Shop Details</a></li>
	                                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
	                                    <li><a href="./checkout.html">Check Out</a></li>
	                                    <li><a href="./blog-details.html">Blog Details</a></li>
	                                </ul>
	                            </li>
                            </sec:authorize>
                            
                            <sec:authorize access="isAnonymous()">
								<li>
									<a href="#" name="noMember">마이페이지</a>
	                            </li>                  
                            </sec:authorize>

						</ul>
					</nav>
				</div>
				<div class="col-lg-3"></div>
			</div>
			<!-- row -->
		</div>
		<!-- container -->
		
		
		  <script>
	
		     $(document).ready(function(){
		    	
		    	 $("a[name='logoutBtn']").on("click",function(e){
		    		 
		    		 e.preventDefault();
		    		 var formObj = $("form[name='logoutForm']");
		    		 formObj.submit();
		    		 alert("로그아웃이 완료되었습니다. 이용해주셔서 감사합니다.");
		    		 
		    	 });
		
		    	 $("a[name='noMember']").on("click",function(e){
		    		
		    		 e.preventDefault();
		    		 alert("로그인 후 이용 가능합니다!!");
		    	 });
		    	 
		    	
			    	
		   	    	 
		    	 
		  });
    </script>
		

	</header>
	<!-- Header Section End -->