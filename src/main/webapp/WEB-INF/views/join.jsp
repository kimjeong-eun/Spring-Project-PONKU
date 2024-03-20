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
 <script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>

</head>
 
<body>
  <div class="container">
	<div class="content">
    	<form id="joinForm" name="joinForm" action="/join" method="post">
	      <!-- HEADER -->
	      <header>
	        <h2>회원가입</h2>
	        <h3>가입을 통해 더 다양한 서비스를 만나보세요!</h3>
	      </header>
		 
	      <!-- INPUT -->
	      <section>
	     	<div class="info" id="info__name">
	          <input class="box" name="username" type="text" placeholder="이름"/>
	          <div class="error-msg"></div>
	        </div>
	        <div class="info" id="info__id">
			    <div id="id-input">
			        <input class="box" name="userid" id="userid" type="text" placeholder="아이디 입력(6~20자)"/>
			    </div>
			    <div class="error-msg" id="id-error-msg"></div>
			    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</div>
			
	        <div class="info" id="info__pw">
	          <input class="box" name="password" type="password" placeholder="비밀번호 입력 (문자, 숫자, 특수문자 포함 8~20자)"/>
	          <div class="error-msg"></div>
	        </div>
	        <div class="info" id="info__pwRe">
	          <input class="box" name="repw" type="password" placeholder="비밀번호 재입력"/>
	          <div class="error-msg"></div>
	        </div>
	        <div class="info" id="info__email">
	          <input class="box" id="email-txt" name="inputEmail" type="text" placeholder="이메일 입력"/>
	          <span>@</span>
	          <input class="box" id="domain-txt" name="inputDomain" type="text"/>
	          <select class="box" id="domain-list">
	            <option value="type">직접 입력</option>
	            <option value="naver.com">naver.com</option>
	            <option value="google.com">google.com</option>
	            <option value="gmail.com">gmail.com</option>
	            <option value="hanmail.net">hanmail.net</option>
	            <option value="nate.com">nate.com</option>
	            <option value="kakao.com">kakao.com</option>
	          </select>
	          <input type="hidden" name="email" id="email" value="" />
	        </div>
	        <div class="info" id="info__birth">
	          <div id="birth-flex">
	            <select class="box" id="birth-year" name="birthY">
	              <option disabled selected>출생 연도</option>
	            </select>
	            <select class="box" id="birth-month" name="birthM">
	              <option disabled selected>월</option>
	            </select>
	            <select class="box" id="birth-day" name="birthD">
	              <option disabled selected>일</option>
	            </select>
	            <input type="hidden" name="birth" id="birth" value="" />
	          </div>
	          <div class="error-msg"></div>
	        </div>
	        <!-- <div id="print-date"></div> -->
	        <div class="info" id="info__mobile">
	          <input class="box" name="phone" type="text" placeholder="휴대폰 번호 입력 (‘-’ 제외 11자리 입력)"/>
	          <div class="error-msg"></div>
	        </div>
	      </section>
	      <div id="result-fail"></div>
	      <button id="submit">가입하기</button>
	      
	      <div class="exist">
	        <span>이미 회원이신가요?</span>
	        <a href="/customLogin">로그인 하러가기</a>
	      </div>
    	</form>
	 </div>
  </div>
  
<script>

/*** 회원가입 병합 ***/
	//email
	$("#email-txt").blur(function() {
		email();
	});
	
	$("#domain-list").blur(function(){
		email();
	});
	
	function email() {
		const inputEmail = $("#email-txt").val();
		const inputDomain = $("#domain-list").val();
		
		if(inputEmail != "" && inputDomain != "") {
			$("#email").val(inputEmail + "@" + inputDomain);
		}	
	};
	
	//birth
	$("#birth-year").blur(function() {
		birth();
	});
	
	$("#birth-month").blur(function(){
		birth();
	});

	$("#birth-day").blur(function(){
		birth();
	});
	
	function birth() {
		const birthY = $("#birth-year").val();
		const birthM = $("#birth-month").val();
		const birthD = $("#birth-day").val();
		
		if(birthY != "" && birthM != "" && birthD != "") {
			$("#birth").val(birthY + birthM + birthD);
		}	
	};
	
		

/*** SECTION - ID ***/
const idInputEl = document.querySelector('#info__id input');
const idErrorMsgEl = document.querySelector('#info__id .error-msg');
const idCheckBtn = document.querySelector('#id-check');

idInputEl.addEventListener('change', () => {
  const idRegExp = /^[a-zA-Z0-9]{6,20}$/;
  if(idRegExp.test(idInputEl.value)) { // 정규식 조건 만족 O
    idErrorMsgEl.textContent = "";
    account.id = idInputEl.value;
  } else { // 정규식 조건 만족 X
    idErrorMsgEl.style.color = "red";
    idErrorMsgEl.textContent = errMsg.id.invalid;
    account.id = null;
  }
  console.log(account);
});

	$(document).ready(function() {
	
	var csrfHeaderName = "${_csrf.headerName}"; //"X-CSRF-TOKEN"
	var csrfTokenValue = "${_csrf.token}";
	
    // ID 입력란에서 포커스가 벗어날 때 동작한다.
    $("input[name='userid']").blur(function() {
        var userid = $(this).val();
        console.log('userId :',userid); 

        if (userid == '' || userid.length == 0) {
            $("#id-error-msg").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
            return false;
        }

        // Ajax로 전송
        $.ajax({
            url: '/checkId', // 실제로 서버에서 ID 중복 확인을 처리하는 스크립트의 경로
            type: 'POST',
            data: {userId:userid},
            dataType: 'text',
			beforeSend: function(xhr){   // 헤더에 csrf 값 추가
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
            success: function(result) {
                if (result == "true") {
                    $("#id-error-msg").css("color", "red").text("사용 불가능한 ID 입니다.");
                } else {
                    $("#id-error-msg").css("color", "black").text("사용 가능한 ID 입니다.");
                }
            },
            error: function(xhr, status, error) {
                // 서버 요청 실패 시 실행할 코드
                console.error('AJAX request failed:', error);
            }
        }); // End Ajax
    });
});
	
	
	

</script>
	
</body>

</html>