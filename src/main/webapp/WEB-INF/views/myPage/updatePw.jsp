<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<jsp:include page="../includes/header.jsp"></jsp:include>

<head>
	<meta charset="UTF-8">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<link rel="stylesheet" type="text/css" href="../resources/css/myPage/updatePw.css">
 	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">
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
    <h2 class="stit"><span>비밀번호 변경</span></h2>
    <form id="submitForm" method="post">
        <div class="password_change existing">

            <fieldset class="fieldset large">
                <legend>비밀번호 수정</legend>
                <div class="wrap">
                    <label for="pwd" class="label">비밀번호</label>
                    <input type="password" id="pwd" name="password" title="비밀번호" value="" class="input_text small" style="width: 270px" maxlength="20">
                    <span class="error_txt small warning" id="pwdMsg"></span>
                    <input type="hidden" name="mode" value="2" />
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </div>
                <div class="wrap">
                    <label for="newPwd" class="label">비밀번호 확인</label>
                    <input type="password" id="newPwd" name="rePwd" title="비밀번호" value="" class="input_text small" style="width: 270px" maxlength="20">
                    <span class="error_txt small warning" id="rePwdMsg"></span>
                </div>
            </fieldset>

        </div>
        <div class="form_btn_area password_modification">
            <button type="submit" id="submitBtn" class="cs_btn large black">확인</button>
        </div>

    </form>
    <div class="information style">
        <h4 class="notifications strong">주의하세요</h4>
        <ul>
    		<li>비밀번호는 <span>영문과 숫자를 조합하여 8~20자리로 입력</span>해 주세요.</li>
        </ul>
    </div>
</div>
</div>

<script>
$(document).ready(function() {
	let csrfHeaderName = "${_csrf.headerName}"; //"X-CSRF-TOKEN"
	let csrfTokenValue = "${_csrf.token}";

	
	/*** 전송 버튼 클릭 시 alert창 띄우기 ***/
	$("#submitBtn").on("click", function(e) {
		//비밀번호 유효성 검사
		const pwRegExp = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/
		if(pwRegExp.test($("#pwd").val)) {
			alert("비밀번호는 영문, 숫자, 특수문자를 포함하여 8자 이상 20자 이하여야 합니다.");
		    return;
		}
					
		//비밀번호 재입력 일치 여부 확인
		if($("#pwd").val === $("#rePwd").val) {
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		
		var form = $("#submitForm"); //id를 사용하여 폼 요소 선택
		form.submit();
	});
});
</script>


<jsp:include page="../includes/footer.jsp"></jsp:include>