<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<jsp:include page="../includes/header.jsp"></jsp:include>
<sec:authentication property="principal" var="pinfo"/>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<link rel="stylesheet" type="text/css" href="../resources/css/myPage/updateAddress.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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

<div id="wrap">
<div id="category" class="category"></div>
<div id="container" class="cmmyssg_wrap">

<div class="cmmyssg_header ty_light react-area">
            <div class="cmmyssg_user" data-react-tarea-cd="00034_000000001">
                <div class="cmmyssg_user_info">
                    <h2 class="cmmyssg_user_tit" data-react-unit-type="text" data-react-unit-id="" data-react-unit-text="[{&quot;type&quot;:&quot;tarea_addt_val&quot;,&quot;value&quot;:&quot;이름&quot;}]">
                        <a href="http://www.ssg.com/myssg/main.ssg" class="cmmyssg_user_tittx clickable" data-react-tarea-dtl-cd="t00060"><span class="cmmyssg_user_titname">${pinfo.member.username}님</span>의 마이페이지</a>
                    </h2>
                </div>
            </div>
</div>                   

<jsp:include page="../myPage/myPageAsideBar.jsp"></jsp:include>

<div id="content" class="content_myssg myssg_delivery">
	<input type="hidden" name="member_seq" value="${pinfo.member.member_seq}"/>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<h2 class="stit">
		<span>배송지 관리</span>
	</h2>
	<div class="my_order_info">
		<div class="title">
			<p>기본배송지</p>
		</div>
				<p class="notranslate">(${pinfo.member.address1})<br>
					도로명 : ${pinfo.member.address2}<br>
					지번 : ${pinfo.member.address3}<br>
				</p>
	</div>

	<div id="del01" class="section data_tbl content active">
		<table border="1" class="data_table">
			<caption></caption>
			<colgroup>
				<col style="width:5%">
				<col style="width:12%">
				<col style="width:12%">
				<col>
				<col style="width:13%">
				<col style="width:17%">
			</colgroup>
			<thead>
			<tr>
				<th scope="col"></th>
				<th scope="col">주소별칭</th>
				<th scope="col">받으실분</th>
				<th scope="col">배송주소</th>
				<th scope="col">연락처</th>
				<th scope="col">관리</th>
			</tr>
			</thead>
			<tbody>
			
				<tr>
					<td>
						<input type="radio" name="deliveryKr" class="radio" value="4234033" title="배송지 선택">
						<input type="hidden" name="shpplocSeq" id="shpplocSeq" value="4234033">
						<input type="hidden" name="bascShpplocYn" id="bascShpplocYn" value="Y">
					</td>
					<td>
						<span class="sub_tit warning">
							[기본배송지]
							
						</span>
						<strong class="notranslate">${pinfo.member.addressName}</strong>
					</td>
					<td class="notranslate">${pinfo.member.username}</td>
					<td class="subject address">
						<p class="notranslate">(${pinfo.member.address1})<br>
							도로명 : ${pinfo.member.address2}<br>
					지번 : ${pinfo.member.address3}<br>
						</p>
					</td>
					<td>${pinfo.member.phone}</td>
					<td>
						<a href="javascript:fn_modify('4234033');" class="btn_cs ty4">
							<span>수정</span>
						</a>
					</td>
				</tr>
			
				<tr>
					<td>
						<input type="radio" name="deliveryKr" class="radio" value="1" title="배송지 선택">
						<input type="hidden" name="shpplocSeq" id="shpplocSeq" value="1">
						<input type="hidden" name="isDefault" id="isDefault" value="Y">
					</td>
					<td>
						<span class="sub_tit warning">
							
							
						</span>
						<strong class="notranslate">김수영</strong>
					</td>
					<td class="notranslate">김수영</td>
					<td class="subject address">
						<p class="notranslate">(16202)<br>
							<br>
							
						</p>
					</td>
					<td>010-2279-6331</td>
					<td>
						<a href="javascript:fn_modify('1');" class="btn_cs ty4">
							<span>수정</span>
						</a>
						
							<a href="javascript:fn_shpplocDel('1');" class="btn_cs ty2">
								<span>삭제</span>
							</a>
						
					</td>
				</tr>

			</tbody>
		</table>

		<div class="go_cancel">
			<button onclick="window.open('/popupAddress','_blank','width=700, height=600, top=50, left=50, scrollbars=yes')" class="btn_cs ty3"><span>새 배송지 추가</span></button>
		</div>

		<div class="paginate notranslate">
            <strong title="현재위치">1</strong>
        

		</div>

		<div class="button_btm">
			
				<button class="btn_cs ty1"><span>기본 배송지 설정</span></button>
				<button class="btn_cs ty4"><span>이번만 배송지 설정</span></button>
			
		</div>
	</div>
</div>
</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	function openWindow () {
		const options = 'width=700, height=600, top=50, left=50, scrollbars=yes'
		window.open('/myPages','_blank',options)
	}
});

jQuery(document).ready(function() { // jQuery 라이브러리 로드

    jQuery("#btnExecPostCode").on("click", function(event) { //우편번호 찾기 버튼 클릭 시 호출!
        openDaumZipAddress(); //daum 우편번호 api 이용하여 우편번호 검색 레이어 열기
    });
});

function openDaumZipAddress() { //daum 우편번호 api

    // wrap 레이어가 off(none)된 상태라면 다음 우편번호 레이어를 open 한다.
    if(jQuery("#wrap").css("display") == "none") {
        new daum.Postcode({
            oncomplete:function(data) { //oncomplete : 콜백함수
                jQuery("#zonecode").val(data.zonecode); //우편번호
                jQuery("#roadAddress").val(data.roadAddress); //도로명주소
                jQuery("#jibunAddress").val(data.jibunAddress); //지번주소
                jQuery("#bname").val(data.bname); //참고항목
                jQuery("#address_detail").focus(); //상세주소
                console.log(data);
            }

            // 사용자가 값을 주소를 선택해서 레이어를 닫을 경우
            // 다음 주소록 레이어를 완전히 종료 시킨다.
            , onclose:function(state) { //onclose : 콜백함수
                if(state === "COMPLETE_CLOSE") {
                    // 콜백함수를 실행하여 슬라이드 업 기능이 실행 완료후 작업을 진행한다.
                    offDaumZipAddress(function() { //검색 레이어 닫기
                        element_wrap.style.display = "none";
                    });
                }
            }
            , width:"100%"  // 가로사이즈를 wrap 레이어에 맞움
        }).embed(document.getElementById("wrap"));

        // 슬라이드 다운 기능을 이용해 레이어 창을 오픈한다.
        jQuery("#wrap").slideDown();
    }

    // warp 레이어가 open된 상태라면 다음 우편번호 레이어를 off 상태로 변경한다.
    else {

        // 콜백함수를 실행하여 슬라이드 업 기능이 실행 완료후 작업을 진행한다.
        offDaumZipAddress(function() {
            document.getElementById("wrap").style.display = "none";
            return false;
        });
    }
}

function offDaumZipAddress() {

    // 슬라이드 업 기능을 이용해 레이어 창을 닫는다.
    jQuery("#wrap").slideUp();
}




<%-- 	let csrfHeaderName = "${_csrf.headerName}"; //"X-CSRF-TOKEN"
	let csrfTokenValue = "${_csrf.token}";
	
	/*** 전송 버튼 클릭 시 alert창 띄우기 ***/
	$("#submitBtn").on("click", function(e) {
		e.preventDefault();
		
	});
}); --%>



</script>
	
<jsp:include page="../includes/footer.jsp"></jsp:include>