<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up</title>
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
  <link rel="stylesheet" href="../resources/css/join.css">
  <script defer src="../resources/js/join.js"></script>
  
</head>
 
<body>
  <div class="container">
    <form id="joinForm" action="/join" method="post">
	    <div class="content">
	      <!-- HEADER -->
	      <header>
	        <h2>회원가입</h2>
	        <h3>가입을 통해 더 다양한 서비스를 만나보세요!</h3>
	      </header>
		 
	      <!-- INPUT -->
	      <section>
	        <div class="info" id="info__id">
			    <div id="id-input">
			        <input class="box" name="id" type="text" id="id-input-field" placeholder="아이디 입력(6~20자)"/>
			    </div>
			    <div class="error-msg" id="id-error-msg"></div>
			</div>
			
	        <div class="info" id="info__pw">
	          <input class="box" type="password" placeholder="비밀번호 입력 (문자, 숫자, 특수문자 포함 8~20자)"/>
	          <div class="error-msg"></div>
	        </div>
	        <div class="info" id="info__pwRe">
	          <input class="box" type="password" placeholder="비밀번호 재입력"/>
	          <div class="error-msg"></div>
	        </div>
	        <div class="info" id="info__email">
	          <input class="box" id="email-txt" type="text" placeholder="이메일 입력"/>
	          <span>@</span>
	          <input class="box" id="domain-txt" type="text"/>
	          <select class="box" id="domain-list">
	            <option value="type">직접 입력</option>
	            <option value="naver.com">naver.com</option>
	            <option value="google.com">google.com</option>
	            <option value="hanmail.net">hanmail.net</option>
	            <option value="nate.com">nate.com</option>
	            <option value="kakao.com">kakao.com</option>
	          </select>
	        </div>
	        <div class="info" id="info__birth">
	          <div id="birth-flex">
	            <select class="box" id="birth-year">
	              <option disabled selected>출생 연도</option>
	            </select>
	            <select class="box" id="birth-month">
	              <option disabled selected>월</option>
	            </select>
	            <select class="box" id="birth-day">
	              <option disabled selected>일</option>
	            </select>
	          </div>
	          <div class="error-msg"></div>
	        </div>
	        <!-- <div id="print-date"></div> -->
	        <div class="info" id="info__mobile">
	          <input class="box" type="text" placeholder="휴대폰 번호 입력 (‘-’ 제외 11자리 입력)"/>
	          <div class="error-msg"></div>
	        </div>
	      </section>
	      <div id="result-fail"></div>
	      <button id="submit">가입하기</button>
	      
	      <div class="exist">
	        <span>이미 회원이신가요?</span>
	        <a href="/signin/index.html">로그인 하러가기</a>
	      </div>
	    </div>
    </form>
  </div>
</body>

</html>