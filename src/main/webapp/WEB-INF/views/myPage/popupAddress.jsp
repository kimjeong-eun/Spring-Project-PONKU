<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
										<input type="text" id="shpplocAntnmNm" name="shpplocAntnmNm" value="" class="input_text small" style="width:232px;ime-mode:active;" maxlength="20">
									</td>
									</tr>
								
								
								<tr>
								<th scope="row"><label for="rcptpeNm">받으실 분</label></th>
								<td>
									<input type="text" id="rcptpeNm" name="rcptpeNm" value="" class="input_text small" style="width:232px;ime-mode:active;" maxlength="20">
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
								</td>
								</tr>
								<tr>
								<th scope="row" class="vt"><span class="full_address">배송주소</span></th>
								<td class="address">
									<p>
								      <input type="text" id="zip-code" placeholder="우편번호">
								      <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
								    <p>
								    </p>
								      <input type="text" id="address-1" placeholder="도로명주소" style="width: 310px">
								    <p>
								    </p>
								      <input type="text" id="address-2" placeholder="상세주소" style="width: 310px">
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
						</fieldset>
					</form>
					
				</div>
			</div>
			<div class="pop_btn_area notranslate">
				<a href="javascript:shpploc.save();" class="color4">확인</a>
				<a href="javascript:void(0);" onclick="shpploc.cancel()" class="color3">취소</a>
			</div>
		</div>
		<button class="button_close" type="button" onclick="window.close();">팝업닫기<span class="ir"></span></button>
	</div>
</div>

<script type="text/javascript" src="//translate.google.co.kr/translate_a/element.js?cb=googleTranslateElementInit"></script>
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



<%-- 	let csrfHeaderName = "${_csrf.headerName}"; //"X-CSRF-TOKEN"
	let csrfTokenValue = "${_csrf.token}";
	
	/*** 전송 버튼 클릭 시 alert창 띄우기 ***/
	$("#submitBtn").on("click", function(e) {
		e.preventDefault();
		
	});
}); --%>

</script>

</div>

<div id="goog-gt-tt" class="VIpgJd-yAWNEb-L7lbkb skiptranslate" style="border-radius: 12px; margin: 0 0 0 -23px; padding: 0; font-family: 'Google Sans', Arial, sans-serif;" data-id=""><div id="goog-gt-vt" class="VIpgJd-yAWNEb-hvhgNd"><div class=" VIpgJd-yAWNEb-hvhgNd-l4eHX-i3jM8c"><img src="https://fonts.gstatic.com/s/i/productlogos/translate/v14/24px.svg" width="24" height="24" alt=""></div><div class=" VIpgJd-yAWNEb-hvhgNd-k77Iif-i3jM8c"><div class="VIpgJd-yAWNEb-hvhgNd-IuizWc" dir="ltr">원본 텍스트</div><div id="goog-gt-original-text" class="VIpgJd-yAWNEb-nVMfcd-fmcmS VIpgJd-yAWNEb-hvhgNd-axAV1"></div></div><div class="VIpgJd-yAWNEb-hvhgNd-N7Eqid ltr"><div class="VIpgJd-yAWNEb-hvhgNd-N7Eqid-B7I4Od ltr" dir="ltr"><div class="VIpgJd-yAWNEb-hvhgNd-UTujCb">번역 평가</div><div class="VIpgJd-yAWNEb-hvhgNd-eO9mKe">보내주신 의견은 Google 번역을 개선하는 데 사용됩니다.</div></div><div class="VIpgJd-yAWNEb-hvhgNd-xgov5 ltr"><button id="goog-gt-thumbUpButton" type="button" class="VIpgJd-yAWNEb-hvhgNd-bgm6sf" title="번역 품질 좋음" aria-label="번역 품질 좋음" aria-pressed="false"><span id="goog-gt-thumbUpIcon"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M21 7h-6.31l.95-4.57.03-.32c0-.41-.17-.79-.44-1.06L14.17 0S7.08 6.85 7 7H2v13h16c.83 0 1.54-.5 1.84-1.22l3.02-7.05c.09-.23.14-.47.14-.73V9c0-1.1-.9-2-2-2zM7 18H4V9h3v9zm14-7l-3 7H9V8l4.34-4.34L12 9h9v2z"></path></svg></span><span id="goog-gt-thumbUpIconFilled"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M21 7h-6.31l.95-4.57.03-.32c0-.41-.17-.79-.44-1.06L14.17 0S7.08 6.85 7 7v13h11c.83 0 1.54-.5 1.84-1.22l3.02-7.05c.09-.23.14-.47.14-.73V9c0-1.1-.9-2-2-2zM5 7H1v13h4V7z"></path></svg></span></button><button id="goog-gt-thumbDownButton" type="button" class="VIpgJd-yAWNEb-hvhgNd-bgm6sf" title="번역 품질 좋지 않음" aria-label="번역 품질 좋지 않음" aria-pressed="false"><span id="goog-gt-thumbDownIcon"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M3 17h6.31l-.95 4.57-.03.32c0 .41.17.79.44 1.06L9.83 24s7.09-6.85 7.17-7h5V4H6c-.83 0-1.54.5-1.84 1.22l-3.02 7.05c-.09.23-.14.47-.14.73v2c0 1.1.9 2 2 2zM17 6h3v9h-3V6zM3 13l3-7h9v10l-4.34 4.34L12 15H3v-2z"></path></svg></span><span id="goog-gt-thumbDownIconFilled"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M3 17h6.31l-.95 4.57-.03.32c0 .41.17.79.44 1.06L9.83 24s7.09-6.85 7.17-7V4H6c-.83 0-1.54.5-1.84 1.22l-3.02 7.05c-.09.23-.14.47-.14.73v2c0 1.1.9 2 2 2zm16 0h4V4h-4v13z"></path></svg></span></button></div></div><div id="goog-gt-votingHiddenPane" class="VIpgJd-yAWNEb-hvhgNd-aXYTce"><form id="goog-gt-votingForm" action="//translate.googleapis.com/translate_voting?client=te" method="post" target="votingFrame" class="VIpgJd-yAWNEb-hvhgNd-aXYTce"><input type="text" name="sl" id="goog-gt-votingInputSrcLang"><input type="text" name="tl" id="goog-gt-votingInputTrgLang"><input type="text" name="query" id="goog-gt-votingInputSrcText"><input type="text" name="gtrans" id="goog-gt-votingInputTrgText"><input type="text" name="vote" id="goog-gt-votingInputVote"></form><iframe name="votingFrame" frameborder="0"></iframe></div></div></div><span id="transObserver" class="blind" style="position:fixed;top:0px;display:none" data-default-txt="언어 번역">언어 번역</span><div class="VIpgJd-ZVi9od-aZ2wEe-wOHMyf"><div class="VIpgJd-ZVi9od-aZ2wEe-OiiCO"><svg xmlns="http://www.w3.org/2000/svg" class="VIpgJd-ZVi9od-aZ2wEe" width="96px" height="96px" viewBox="0 0 66 66"><circle class="VIpgJd-ZVi9od-aZ2wEe-Jt5cK" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle></svg></div></div></body></html>