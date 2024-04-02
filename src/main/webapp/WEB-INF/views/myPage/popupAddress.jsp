<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
    
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko" style="height: 100%;"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<style>
      input {
        height: 40px;
        vertical-align: middle;
        border: 1px solid #dadada;
        padding: 0px 15px;
      }
      
      #pop_header h1 {
	    border-bottom: solid 0px #1e1e1e !important;
	  }
	  
	  input {
	    height: 27px;
	    vertical-align: middle;
	    border: 1px solid #dadada;
	    padding: 0px 15px;
	  }
</style>
<link rel="stylesheet" type="text/css" href="//sui.ssgcdn.com/ui/ssg/css/common/layout.css?v=20240327">
<link rel="stylesheet" type="text/css" href="//sui.ssgcdn.com/ui/ssg/css/scom.css?v=20240327">
<link rel="stylesheet" type="text/css" href="//sui.ssgcdn.com/ui/ssg/css/popup.css?v=20240327">
<script type="text/JavaScript" src="https://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/JavaScript" src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<link type="text/css" rel="stylesheet" charset="UTF-8" href="https://www.gstatic.com/_/translate_http/_/ss/k=translate_http.tr.qhDXWpKopYk.L.W.O/am=wA/d=0/rs=AN8SPfq5gedF4FIOWZgYyMCNZA5tU966ig/m=el_main_css"><script type="text/javascript" charset="UTF-8" src="https://translate.googleapis.com/_/translate_http/_/js/k=translate_http.tr.ko.bYiHAOBrOyU.O/am=AAQ/d=1/exm=el_conf/ed=1/rs=AN8SPfrezzaShpT-Mgjb6BvVOzZqP6qC5Q/m=el_main"></script></head>
<body style="position: relative; min-height: 100%; top: 0px;">
<div id="pop_wrap">
    
<!-- [D] 600 X 822 : 팝업사이즈 -->
<div id="pop_wrap" class="cart">
	<div id="pop_header">
	<sec:authentication property="principal" var="pinfo"/>
		<h1>
			배송지 수정
		</h1>
	</div>
	<hr>
	<div id="pop_container">
		<div id="pop_content" class="content_popup delivery" style="width:540px">
			<div class="section">
				
				<div class="delivery_reg">
					<div class="aside">
						<div class="btn_delivery_reset">
							<a href="javascript:shpploc.init();">초기화</a>
						</div>
					</div>
					<form id="submitForm" name="submitForm">
						<fieldset class="fieldset">
							<legend class="blind">배송지 입력</legend>
							<div class="pop_data_table tbl_style1">
								<table border="1">
								<caption>배송지 설정</caption>
								<colgroup><col style="width:100px;"><col style="width:448px;"></colgroup>
								<tbody>
								
									<tr>
									<th scope="row"><label for="addressName1">주소별칭</label></th>
									<td>
										<input type="text" id="shpplocAntnmNm" name="addrName" value="" class="input_text small" style="width:232px;ime-mode:active;" maxlength="20">
									</td>
									</tr>
								
								
								<tr>
								<th scope="row"><label for="rcptpeNm">받으실 분</label></th>
								<td>
									<input type="text" id="rcptpeNm" name="name" value="" class="input_text small" style="width:232px;ime-mode:active;" maxlength="20">
								</td>
								</tr>
								<tr>
								<th class="tbl_style1" scope="row">휴대폰</th>
								<td>
									<select id="hpno1" title="휴대폰 첫자리 선택" class="select small" style="width:97px">
										<option value="">선택</option>
										<option value="010" addtoptnval1="" addtoptnval2="" selected="selected">010</option><option value="011" addtoptnval1="" addtoptnval2="">011</option><option value="016" addtoptnval1="" addtoptnval2="">016</option><option value="017" addtoptnval1="" addtoptnval2="">017</option><option value="018" addtoptnval1="" addtoptnval2="">018</option><option value="019" addtoptnval1="" addtoptnval2="">019</option>
									</select>
									<span class="text">-</span>
									<input type="text" id="hpno2" title="휴대폰 중간자리 입력" value="" class="input_text small" maxlength="4" style="width:96px;">
									<span class="text">-</span>
									<input type="text" id="hpno3" title="휴대폰 마지막자리 입력" value="" class="input_text small last" maxlength="4" style="width:96px;">
									<input type="hidden" id="phone" name="phone" value=""/>
								</td>
								</tr>
								<tr>
								<th scope="row" class="vt"><span class="full_address">배송주소</span></th>
								<td class="address">
									<p>
								      <input type="text" id="zip-code" name="address1" placeholder="우편번호">
								      <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
								    <p>
								    </p>
								      <input type="text" id="address-1" name="address2" placeholder="도로명주소" style="width: 310px">
								    <p>
								    </p>
								      <input type="text" id="address-2"name="address3" placeholder="상세주소" style="width: 310px">
								    </p>
								    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
								    <script>
								      function execDaumPostcode() {
								        new daum.Postcode( {
								          oncomplete: function( data ) {
								            document.getElementById( 'zip-code' ).value = data.zonecode;
								            document.getElementById( 'address-1' ).value = data.address;
								          }
								        } ).open();
								      }
								    </script>
								</td>
								</tr>
								</tbody>
								</table>
							</div>
							 <input type="hidden" name="member_seq" value="${pinfo.member.member_seq}" />
							 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</fieldset>
					</form>
					
				</div>
			</div>
			<div class="pop_btn_area notranslate">
				 <button name="btn-submit" id="submitBtn" type="button">확인</button>
				<a href="javascript:void(0);" onclick="shpploc.cancel()" class="color3">취소</a>
			</div>
		</div>
		<button class="button_close" type="button" onclick="window.close();">팝업닫기<span class="ir"></span></button>
	</div>
</div>

<script type="text/javascript" src="//translate.google.co.kr/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script type="text/javascript">

$(document).ready(function() {
	let csrfHeaderName = "${_csrf.headerName}"; //"X-CSRF-TOKEN"
	let csrfTokenValue = "${_csrf.token}";
	
	function openWindow () {
		const options = 'width=700, height=600, top=50, left=50, scrollbars=yes'
		window.open('/myPages','_blank',options)
	}
	
	//phone 병합
	$("#hpno1").blur(function() {
		phone();
	});
	
	$("#hpno2").blur(function(){
		phone();
	});

	$("#hpno3").blur(function(){
		phone();
	});
	
	function phone() {
		const hpno1 = $("#hpno1").val();
		const hpno2 = $("#hpno2").val();
		const hpno3 = $("#hpno3").val();
		
		if(hpno1 != "" && hpno2 != "" && hpno3 != "") {
			$("#phone").val(hpno1 + "-" + hpno2 + "-" + hpno3);
		}	
	};
	
	/*** 전송 버튼 클릭 시 alert창 띄우기 ***/
	$("#submitBtn").on("click", function(e){
	    
	 	//serialize 가 form요소를 하나씩 읽어옴
	 	var formData = $("#submitForm").serialize(); 
	 	
		// Ajax로 전송
        $.ajax({
            url: '/successInsertAddress', // 성공여부를 처리하는 스크립트의 경로
            type: 'POST',
            data: formData,            
            dataType: 'text', //리턴타입 , 성공여부를 text로 추출함
			beforeSend: function(xhr){   // 헤더에 csrf 값 추가
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
            success: function(result) {
                if (result == "true") {
                	alert("신규 배송지가 추가되었습니다.");
                	window.close();
                	location.href = "/updateAddress";//성공 시 이동할 페이지
                } else {
                	alert("배송지 추가 실패.");
                	window.close();
                	location.href = "/updateAddress";//실패 시 이동할 페이지
                }
            },
            error: function(xhr, status, error) {
                // 서버 요청 실패 시 실행할 코드
                console.error('AJAX request failed:', error);
            }
        }); // End Ajax
	});  
	
});

jQuery(document).ready(function() { // jQuery 라이브러리 로드

    jQuery("#btnExecPostCode").on("click", function(event) { //우편번호 찾기 버튼 클릭 시 호출!
        openDaumZipAddress(); //daum 우편번호 api 이용하여 우편번호 검색 레이어 열기
    });
});


</script>
</div></body></html>
