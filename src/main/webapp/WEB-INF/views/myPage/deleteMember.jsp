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
                        <a class="cmmyssg_user_tittx clickable" data-react-tarea-dtl-cd="t00060"><span class="cmmyssg_user_titname">${pinfo.member.username}님</span>의 마이페이지</a>
                    </h2>
                </div>
            </div>     
</div>

<jsp:include page="../myPage/myPageAsideBar.jsp"></jsp:include>


<div id="content" class="content_myssg">
  <form id="submitForm" action="/logout" name="submitForm" method="post">
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
    <div class="form_section" data-reactingv2-key="00195_000000743|t00000|1">
        <div class="inp_sec">
			<span class="free_selected_agree">
				<input type="checkbox" id="withdrawal" name="withdrawal">
				<label for="withdrawal">회원탈퇴 유의사항을 모두 확인하였으며, PONKUU 회원탈퇴에 동의합니다.</label>
			</span>
        </div>
    </div>
    <div class="cmem_btn_area">
    <input type="hidden" name="member_seq" value="${pinfo.member.member_seq}"/>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
       <button type="submit" id="submitBtn" class="cs_btn large black">확인</button>
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
		
		if(!$("#withdrawal").is(':checked')) {
			alert("회원 탈퇴 동의여부를 확인해주시기 바랍니다.");
		} else {
			// Ajax로 전송
			$.ajax({
				url: '/successDeleteMember', // 성공여부를 처리하는 스크립트의 경로
	            type: 'POST',
	            data: formData,            
	            dataType: 'text', //리턴타입 , 성공여부를 text로 추출함
				beforeSend: function(xhr){   // 헤더에 csrf 값 추가
					xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
				},
	            success: function(result) {
	                if (result == "true") {
	                	alert("회원탈퇴를 완료하였습니다.");
	                	location.href = "/customLogin";//성공 시 이동할 페이지
	                } else {
	                	alert("회원탈퇴 실패");
	                }
	            },
	            error: function(xhr, status, error) {
	                // 서버 요청 실패 시 실행할 코드
	                alert("회원정보 변경 실패(서버요청실패)");
	            }
			});
			
		} //else 종료
	  	
		
		
	}); //submitBtn 종료
}); //document 종료

</script>

<jsp:include page="../includes/footer.jsp"></jsp:include>