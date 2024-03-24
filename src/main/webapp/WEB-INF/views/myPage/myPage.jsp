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
				<div class="field">
					<label for="mbrCntsELno" class="label">휴대폰번호 <img src="//sui.ssgcdn.com/ui/ssg/img/mem/ico_star.gif" alt="필수"></label>
					<input type="hidden" name="cntsTypeCd" value="20">
					<input type="hidden" name="mbrCntsno" id="mbrCntsno">
					<div class="insert">
						<div>
							<select id="mbrCntsano" name="mbrCntsano" title="식별번호 선택" class="select small" style="width: 102px;">
								<option value="010" addtoptnval1="" addtoptnval2="" selected="selected">010</option><option value="011" addtoptnval1="" addtoptnval2="">011</option><option value="016" addtoptnval1="" addtoptnval2="">016</option><option value="017" addtoptnval1="" addtoptnval2="">017</option><option value="018" addtoptnval1="" addtoptnval2="">018</option><option value="019" addtoptnval1="" addtoptnval2="">019</option>
							</select>
							<span>-</span>
							<input type="tel" id="mbrCntsELno" title="휴대폰 번호 뒷자리" placeholder="- 없이 뒷자리를 입력해주세요." value="22796331" class="input_text small translated" style="width:136px;ime-mode:disabled;" maxlength="8" numberonly=""><span class="trans_placeholder blind" data-default-txt="- 없이 뒷자리를 입력해주세요.">- 없이 뒷자리를 입력해주세요.</span>
						</div>
					</div>
				</div>
				<div class="field" id="emailChg01">
					<label for="email" class="label">이메일주소 <img src="//sui.ssgcdn.com/ui/ssg/img/mem/ico_star.gif" alt="필수"></label>
					<div class="insert">
						<input type="text" id="email" name="email" placeholder="자주 사용하시는 이메일 주소를 입력해주세요." value="ktndud2@naver.com" class="input_text small translated" style="width:250px" maxlength="50"><span class="trans_placeholder blind" data-default-txt="자주 사용하시는 이메일 주소를 입력해주세요.">자주 사용하시는 이메일 주소를 입력해주세요.</span>
					</div>
				</div>
			</fieldset>
		</div>
		<div class="form_btn_area">
			<p id="alertArea" class="desc"></p>
			<a href="javascript:void(0);" onclick="modify.update();" id="submitBtn" class="cs_btn large black">변경하기</a>
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
  </div>
<jsp:include page="../includes/footer.jsp"></jsp:include>