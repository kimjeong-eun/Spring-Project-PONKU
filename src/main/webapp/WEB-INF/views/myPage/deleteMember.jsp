<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<jsp:include page="../includes/header.jsp"></jsp:include>

<head>
	<meta charset="UTF-8">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<link rel="stylesheet" type="text/css" href="../resources/css/myPage/deleteMember.css">
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
    <h2 class="stit">
        <span>회원탈퇴</span>
    </h2>
    <div class="form_section">
        <div class="content_intro">
            <h3>탈퇴 유의사항</h3>
        </div>
        <div class="content_leave">
            <div class="section">

                <div class="tit_txt">
                    <h4>포인트 소멸</h4>
                </div>
                <ul class="info_lst">
                    <li>회원탈퇴 시 보유하고 계신 포인트가 자동 소멸되며 복원되지 않습니다.</li>
                    <li>출금 가능 금액이 있으신 경우 고객센터로 출금 신청 후 탈퇴해주세요.</li>
                </ul>

            </div>
            <div class="section">
                <div class="tit_txt">
                    <h4>회원 재가입 제한</h4>
                </div>
                <ul class="info_lst">
                    <li>회원탈퇴 후 재가입 시 신규회원으로 가입되며, 탈퇴 전의 회원정보, 주문정보, 포인트, 쿠폰은 복원되지
                        않습니다.
                    </li>
                </ul>
            </div>
            <div class="section">
                <div class="tit_txt">
                    <h4>개인정보 파기</h4>
                </div>
                <ul class="info_lst">
                    <li>개인정보는 회원 재가입 유예기간 경과 후 즉시 파기됩니다.</li>
                    <li>단, 전자상거래법, 통신비밀보호법 등 관련 법령의 규정에 의하여 아래의 개인정보가 일정기간 보관됩니다.</li>
                </ul>
                <div class="tbl_sec">
                    <div class="tbl_wrap ty2">
                        <table>
                            <caption>개인정보 파기 기간 안내 테이블</caption>
                            <colgroup>
                                <col style="width: 50%">
                                <col style="width: 50%">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th><span class="in">계약 또는 청약철회 등에 관한 기록</span></th>
                                <td><span class="in">5년</span></td>
                            </tr>
                            <tr>
                                <th><span class="in">대금결제 및 재화 등의 공급에 관한 기록</span></th>
                                <td><span class="in">5년</span></td>
                            </tr>
                            <tr>
                                <th><span class="in">소비자의 불만 또는 분쟁처리에 관한 기록</span></th>
                                <td><span class="in">3년</span></td>
                            </tr>
                            <tr>
                                <th><span class="in">웹사이트 방문 기록</span></th>
                                <td><span class="in">3개월</span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="form_section">
        <div class="content_intro">
            <h3>탈퇴 사유 및 개선점(선택)</h3>
        </div>
        <div class="content_leave">
            <div class="leave_textarea">
                <textarea id="recommend_improvement" maxlength="100" placeholder="PONKUU에 해주고 싶은 말씀을 입력해주세요." class="translated"></textarea><span class="trans_placeholder blind" data-default-txt="SSG.COM에 해주고 싶은 말씀을 자유롭게 입력해주세요.(100자 이내)">SSG.COM에 해주고 싶은 말씀을 자유롭게 입력해주세요.(100자 이내)</span>
            </div>
        </div>
    </div>
    <div class="form_section" data-reactingv2-key="00195_000000743|t00000|1">
        <div class="inp_sec">
			<span class="free_selected_agree">
				<input type="checkbox" id="withdrawal" name="withdrawal">
				<label for="withdrawal">회원탈퇴 유의사항을 모두 확인하였으며, PONKUU 회원탈퇴에 동의합니다.</label>
			</span>
        </div>
    </div>
    <div class="cmem_btn_area">
        <a href="javascript:void(0)" id="submitBtn" class="cs_btn cmem_btn_orange">확인</a>
    </div>
</div>
</div>
<jsp:include page="../includes/footer.jsp"></jsp:include>