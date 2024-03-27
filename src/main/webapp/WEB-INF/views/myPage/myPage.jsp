<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<jsp:include page="../includes/header.jsp"></jsp:include>

<head>
	<meta charset="UTF-8">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<link rel="stylesheet" type="text/css" href="../resources/css/myPage/myPage.css">
 	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body class="body_wide body_wide_ctn" style="position: relative; min-height: 100%; top: 0px;">
<noscript>
	<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PWBFGRL"
	        height="0" width="0" style="display:none;visibility:hidden"></iframe>
</noscript>

<div id="skip">
	<h2>스킵 네비게이션</h2>
	<ul>
		<li><a href="#content">본문바로가기</a></li>
	</ul>
</div>

<div id="category" class="category"></div>
<div id="container" class="cmmyssg_wrap">
				<!-- SSG -->
<input type="hidden" id="ssgDomain" value="http://www.ssg.com">
<input type="hidden" id="couponWebImgPathUrl" value="https://sui.ssgcdn.com">
<input type="hidden" id="openChooseBenefit" value="N">
<input type="hidden" id="mbrspMbrDivCd" value="2001">
<input type="hidden" id="mbrGrdCd" value="10">
<div class="cmmyssg_header ty_light react-area">
            <div class="cmmyssg_user" data-react-tarea-cd="00034_000000001">
                <div class="cmmyssg_user_info">
                    <h2 class="cmmyssg_user_tit" data-react-unit-type="text" data-react-unit-id="" data-react-unit-text="[{&quot;type&quot;:&quot;tarea_addt_val&quot;,&quot;value&quot;:&quot;이름&quot;}]">
                        <sec:authentication property="principal" var="pinfo"/>
                        <a href="http://www.ssg.com/myssg/main.ssg" class="cmmyssg_user_tittx clickable" data-react-tarea-dtl-cd="t00060"><span class="cmmyssg_user_titname">${pinfo.member.username}님</span>의 마이페이지</a>
                    </h2>
                </div>
            </div>     
</div>

<jsp:include page="../myPage/myPageAsideBar.jsp"></jsp:include>

<div id="content" class="content_myssg">
		<form id="submitForm" name="submitForm" method="post">
		<sec:authentication property="principal" var="pinfo"/>
	    <h2 class="stit"><span>회원정보 변경</span></h2>
	     <div class="form_section">
			<div class="content_intro">
				<h3>필수정보입력</h3>
				<p class="join_txt">
					<img src="//sui.ssgcdn.com/ui/ssg/img/mem/ico_star.gif" alt="필수"> 표시는 필수입력 항목 이오니 반드시 입력해 주세요.
				</p>
			</div>
			<fieldset class="fieldset medium">
				<legend>항목입력</legend>
				<div class="field">
					<span class="label">아이디 <img src="//sui.ssgcdn.com/ui/ssg/img/mem/ico_star.gif" alt="필수"></span>
					<div class="insert" id="idCheckDiv">
							<span>${pinfo.member.userid}</span>
					</div>
				</div>
				    <div class="field">
				        <span class="label">비밀번호 <img src="//sui.ssgcdn.com/ui/ssg/img/mem/ico_star.gif" alt="필수"></span>
				        <div class="insert">
				            <span id="mbrNm">*****</span>
				        </div>
				    </div>
				<div class="field">
					<span class="label">이름 <img src="//sui.ssgcdn.com/ui/ssg/img/mem/ico_star.gif" alt="필수"></span>
					<div class="insert">
						<span id="mbrNm">${pinfo.member.username}</span>
					</div>
				</div>
				<div class="field" id="emailChg01">
					<label for="email" class="label">이메일주소 <img src="//sui.ssgcdn.com/ui/ssg/img/mem/ico_star.gif" alt="필수"></label>
					<div class="insert">
						<input type="text" id="email" name="email" placeholder="자주 사용하시는 이메일 주소를 입력해주세요." value="${pinfo.member.email}" class="input_text small translated" style="width:250px" maxlength="50"><span class="trans_placeholder blind" data-default-txt="자주 사용하시는 이메일 주소를 입력해주세요.">자주 사용하시는 이메일 주소를 입력해주세요.</span>
					</div>
				</div>
			</fieldset>
		</div>
		<div class="form_btn_area">
			<p id="alertArea" class="desc"></p>
			<input type="hidden" name="member_seq" value="${pinfo.member.member_seq}"/>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<button type="submit" id="submitBtn" class="cs_btn large black">확인</button>
		</div>
		<div class="cs_info_box">
			<h3 class="cs_info_subtit">회원정보변경 안내</h3>
			<ul class="cs_info_lst">
				<li>배송지 정보는 '나의 정보관리 &gt; 배송지 관리' 메뉴에서 추가/수정/삭제하실 수 있습니다.</li>
				<li>주문 정보는 회원 정보에 등록된 휴대폰번호 및 이메일주소로 안내됩니다.</li>
			</ul>
		</div>
	  </form>
	</div>
  </div>
 
<script>
$(document).ready(function() {
	let csrfHeaderName = "${_csrf.headerName}"; //"X-CSRF-TOKEN"
	let csrfTokenValue = "${_csrf.token}";
	
	/*** 전송 버튼 클릭 시 alert창 띄우기 ***/
	$("#submitBtn").on("click", function(e) {
		e.preventDefault();
		
	  	//serialize 가 form요소를 하나씩 읽어옴
	 	let formData = $("#submitForm").serialize(); 
		
		// Ajax로 전송
		$.ajax({
			url: '/successUpdateMember', // 성공여부를 처리하는 스크립트의 경로
            type: 'POST',
            data: formData,            
            dataType: 'text', //리턴타입 , 성공여부를 text로 추출함
			beforeSend: function(xhr){   // 헤더에 csrf 값 추가
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
            success: function(result) {
                if (result == "true") {
                	alert("회원정보 변경을 완료하였습니다.");
                	location.href = "/myPage";//성공 시 이동할 페이지
                } else {
                	alert("회원정보 변경 실패");
                	location.href = "/myPage";//실패 시 이동할 페이지   
                }
            },
            error: function(xhr, status, error) {
                // 서버 요청 실패 시 실행할 코드
                alert("회원정보 변경 실패(서버요청실패)");
            }
		});
	});
});



</script>

<jsp:include page="../includes/footer.jsp"></jsp:include>