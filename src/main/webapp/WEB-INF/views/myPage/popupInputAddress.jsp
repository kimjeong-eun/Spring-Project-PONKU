<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko" style="height: 100%;"><head>
<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="stylesheet" type="text/css" href="//sui.ssgcdn.com/ui/ssg/css/common/layout.css?v=20240327">
<link rel="stylesheet" type="text/css" href="//sui.ssgcdn.com/ui/ssg/css/scom.css?v=20240327">
<link rel="stylesheet" type="text/css" href="//sui.ssgcdn.com/ui/ssg/css/popup.css?v=20240327">
<script type="text/javascript" src="//sui.ssgcdn.com/ui/ssg/js/lib/jquery-1.9.1.min.js"></script>
<link type="text/css" rel="stylesheet" charset="UTF-8" href="https://www.gstatic.com/_/translate_http/_/ss/k=translate_http.tr.qhDXWpKopYk.L.W.O/am=wA/d=0/rs=AN8SPfq5gedF4FIOWZgYyMCNZA5tU966ig/m=el_main_css"><script type="text/javascript" charset="UTF-8" src="https://translate.googleapis.com/_/translate_http/_/js/k=translate_http.tr.ko.bYiHAOBrOyU.O/am=AAQ/d=1/exm=el_conf/ed=1/rs=AN8SPfrezzaShpT-Mgjb6BvVOzZqP6qC5Q/m=el_main"></script></head>
<body style="position: relative; min-height: 100%; top: 0px;">
<div id="pop_wrap">
    


<script type="text/javascript" src="//sui.ssgcdn.com/ui/ssg/js/jquery.form.js"></script>
<script type="text/javascript" src="//sui.ssgcdn.com/ui/ssg/js/ui/ui.flicking.js?v=20240327"></script>
<script type="text/javascript" src="//sui.ssgcdn.com/ui/ssg/js/ui/ui.flip.js?v=20240327"></script>
<script type="text/javascript" src="//sui.ssgcdn.com/ui/ssg/js/lib/jquery.cookie.js"></script>
<script type="text/javascript" src="//sui.ssgcdn.com/ui/ssg/js/lib/jquery.menu-aim.js"></script>
<script type="text/javascript" src="//sui.ssgcdn.com/ui/ssg/js/ui/ui.ssg.js?v=20240327"></script>
<script type="text/javascript" src="//sui.ssgcdn.com/ui/ssg/js/ui/ui-base.js?v=20240327"></script>
<script type="text/javascript" src="//sui.ssgcdn.com/ui/ssg/js/commonUtil.js?v=20240327"></script>
<script type="text/javascript" src="//sui.ssgcdn.com/ui/member/js/common/ssgGnb.js?v=20240327"></script>
<script type="text/javascript" src="//sui.ssgcdn.com/ui/member/js/common/commJs.js?v=20240327"></script>

<script type="text/javascript" src="/comm/js/memberJs.ssg"></script>
<script type="text/javascript" src="//translate.google.co.kr/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script type="text/javascript" src="//sui.ssgcdn.com/ui/ssg/js/ui/ssg.view.translate.js?v=20240327"></script>

<div id="pop_header">
	<h1>우편번호찾기</h1>
</div>
<hr>
<div id="pop_container">
	<div id="pop_content" class="content_popup search_address">
		<!-- [D] 검색어 입력시 .srchaddr_form에 .srchaddr_form_focus 추가 -->
		<div class="srchaddr_form">
			<form action="javascript:void(0)">
				<fieldset>
					<legend>검색어 입력</legend>
					<div class="srchaddr_search">
						<input name="searchKeyword" type="text" title="검색어 입력" class="search_txt translated" autocomplete="off" placeholder="도로명 또는 지번 주소를 입력해주세요."><span class="trans_placeholder blind" data-default-txt="도로명 또는 지번 주소를 입력해주세요.">도로명 또는 지번 주소를 입력해주세요.</span>
						<button type="button" class="search_clear" onclick="Zipcd.closeSuggest()"><span class="blind">검색어 지우기</span></button>
						<button type="button" class="search_btn"><span class="blind">검색</span></button>
					</div>
				</fieldset>
			</form>
			<div class="srchaddr_suggest" style="display:none">
				<strong class="blind">제안 검색어</strong>
				<ul class="suggest_list"></ul>
			</div>
		</div>

		<!-- 검색 초기화면 -->
		<div class="srchaddr_sec srchaddr_sec_init">
			<div class="srchaddr_tip">
				<strong class="tip_tit">TIP_이렇게 검색하세요!</strong>
				<div class="tip_search">
					<dl>
						<dt>도로명 + 건물번호</dt>
						<dd class="notranslate"><span>향교로 2</span></dd>
					</dl>
					<dl>
						<dt>지역명 + 번지</dt>
						<dd class="notranslate"><span>매산로1가 60-3</span></dd>
					</dl>
					<dl>
						<dt>지역명 + 건물명</dt>
						<dd class="notranslate">매산로 1가 이젠아카데미<span></span></dd>
					</dl>
				</div>
			</div>
		</div>

		<!-- 검색결과 없음 -->
		<div class="srchaddr_sec srchaddr_sec_noresult" style="display:none">
			<h2 class="blind">주소 검색결과</h2>
			<div class="srchaddr_noresult">
				<p class="noresult_txt"><span class="point">검색결과가 없습니다.</span></p>
			</div>
			<div class="srchaddr_tip">
				<strong class="tip_tit">TIP_찾으시는 주소가 없나요?</strong>
				<ul class="tip_desc">
					<li>행정안전부 도로명주소 시스템에 주소 등록 후 익일부터 주소 검색이 가능합니다.</li>
					<li>도로명주소 홈페이지에서 주소 등록 여부를 확인해주세요.<br>
						· 도로명주소 안내 홈페이지 : https://www.juso.go.kr<br>
						· 도로명주소 도움센터 : 1588-0061
					</li>
				</ul>
			</div>
		</div>

		<!-- 검색결과 -->
		<div class="srchaddr_sec srchaddr_sec_result" style="display:none">
			<h2 class="blind">주소 검색결과</h2>
			<div class="srchaddr_notice">
				<p class="notice_txt">
					<em>검색한 결과 총 0건 입니다.</em>
				</p>
			</div>
			
			<div class="srchaddr_result">
				<ul class="result_list">
				</ul>
				<div class="cdtl_paginate notranslate">
				</div>
			</div>
		</div>

		<!-- 상세주소 입력 -->
		<div class="srchaddr_sec srchaddr_sec_detail" style="display:none">
			<h2 class="blind">상세주소 입력</h2>
			<div class="srchaddr_final">
				<dl class="srchaddr_info">
					<dt class="info_tit notranslate">
						<span class="tx_ko">우편번호</span>
						<span class="tx_gl">Zip Code</span>
					</dt>
					<dd name="zipcd" class="info_cont notranslate"><span class="num"></span></dd>
					<dt class="info_tit notranslate">
						<span class="tx_ko">도로명 주소</span>
						<span class="tx_gl">Road Name</span>
					</dt>
					<dd name="roadNmAddr" class="info_cont notranslate"></dd>
					<dt class="info_tit notranslate">
						<span class="tx_ko">지번 주소</span>
						<span class="tx_gl">Land-Lot</span>
					</dt>
					<dd name="lotnoAddr" class="info_cont notranslate"></dd>
				</dl>
			</div>
			<div class="srchaddr_detail">
				<span class="srchaddr_input"><input name="dtlAddr" type="text" title="상세주소 입력" class="input_txt translated" placeholder="상세주소를 입력해주세요." maxlength="40"><span class="trans_placeholder blind" data-default-txt="상세주소를 입력해주세요.">상세주소를 입력해주세요.</span></span>
				<div class="pop_btn_area">
					<a href="javascript:void(0);" onclick="Zipcd.inputDtlAddr()" class="color3" style="min-width:128px">확인</a>
				</div>
			</div>
		</div>
	</div>
	<button class="button_close" type="button" onclick="self.close()">팝업닫기<span class="ir"></span></button>
</div>
<form id="searchZipcd" method="post" action="">
	<input type="hidden" name="zipcd" value="">
	<input type="hidden" name="oldZipcd" value="">
	<input type="hidden" name="lotnoBascAddr" value="">
	<input type="hidden" name="lotnoDtlAddr" value="">
	<input type="hidden" name="roadNmBascAddr" value="">
	<input type="hidden" name="roadNmDtlAddr" value="">
	<input type="hidden" name="mbrIptAddrTypeCd" value="">
	<input type="hidden" name="mbrIptAddr" value="">
	<input type="hidden" name="addrExamRstCd" value="">
	<input type="hidden" name="param1" value="">
	<input type="hidden" name="param2" value="">
	<input type="hidden" name="param3" value="">
	<input type="hidden" name="result" value="FAIL">
</form>
<script type="text/javascript" src="/comm/js/memberJs.ssg"></script>
<script src="//sui.ssgcdn.com/ui/member/js/addr/zipcdSrch.js?v=20240327"></script>

<script type="text/javascript" defer="defer">
var locale = "ko-KR";

$(document).ready(function() {
	try {
	    Zipcd.initialize();
	    
	  } catch(e) {
	    alert('시스템 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.'+e);
	    window.close();
	  }
});


$(".srchaddr_form .srchaddr_search").keyup(function(e) {
	if (e.which != 13) {
		Zipcd.getZipcdSuggest();
	}
});


$(".srchaddr_form .srchaddr_search").keypress(function(e) {
	if (e.which == 13) {
		e.preventDefault();
		Zipcd.getZipcdSearch();
	}
});

$(".srchaddr_sec_detail .srchaddr_detail input[name='dtlAddr']").keypress(function(e) {
  if (e.which == 13) {
    e.preventDefault();
    Zipcd.inputDtlAddr();
  }
});

$(".search_btn").click(function() {
	Zipcd.getZipcdSearch();
});
</script>
</div>

<div id="goog-gt-tt" class="VIpgJd-yAWNEb-L7lbkb skiptranslate" style="border-radius: 12px; margin: 0 0 0 -23px; padding: 0; font-family: 'Google Sans', Arial, sans-serif;" data-id=""><div id="goog-gt-vt" class="VIpgJd-yAWNEb-hvhgNd"><div class=" VIpgJd-yAWNEb-hvhgNd-l4eHX-i3jM8c"><img src="https://fonts.gstatic.com/s/i/productlogos/translate/v14/24px.svg" width="24" height="24" alt=""></div><div class=" VIpgJd-yAWNEb-hvhgNd-k77Iif-i3jM8c"><div class="VIpgJd-yAWNEb-hvhgNd-IuizWc" dir="ltr">원본 텍스트</div><div id="goog-gt-original-text" class="VIpgJd-yAWNEb-nVMfcd-fmcmS VIpgJd-yAWNEb-hvhgNd-axAV1"></div></div><div class="VIpgJd-yAWNEb-hvhgNd-N7Eqid ltr"><div class="VIpgJd-yAWNEb-hvhgNd-N7Eqid-B7I4Od ltr" dir="ltr"><div class="VIpgJd-yAWNEb-hvhgNd-UTujCb">번역 평가</div><div class="VIpgJd-yAWNEb-hvhgNd-eO9mKe">보내주신 의견은 Google 번역을 개선하는 데 사용됩니다.</div></div><div class="VIpgJd-yAWNEb-hvhgNd-xgov5 ltr"><button id="goog-gt-thumbUpButton" type="button" class="VIpgJd-yAWNEb-hvhgNd-bgm6sf" title="번역 품질 좋음" aria-label="번역 품질 좋음" aria-pressed="false"><span id="goog-gt-thumbUpIcon"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M21 7h-6.31l.95-4.57.03-.32c0-.41-.17-.79-.44-1.06L14.17 0S7.08 6.85 7 7H2v13h16c.83 0 1.54-.5 1.84-1.22l3.02-7.05c.09-.23.14-.47.14-.73V9c0-1.1-.9-2-2-2zM7 18H4V9h3v9zm14-7l-3 7H9V8l4.34-4.34L12 9h9v2z"></path></svg></span><span id="goog-gt-thumbUpIconFilled"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M21 7h-6.31l.95-4.57.03-.32c0-.41-.17-.79-.44-1.06L14.17 0S7.08 6.85 7 7v13h11c.83 0 1.54-.5 1.84-1.22l3.02-7.05c.09-.23.14-.47.14-.73V9c0-1.1-.9-2-2-2zM5 7H1v13h4V7z"></path></svg></span></button><button id="goog-gt-thumbDownButton" type="button" class="VIpgJd-yAWNEb-hvhgNd-bgm6sf" title="번역 품질 좋지 않음" aria-label="번역 품질 좋지 않음" aria-pressed="false"><span id="goog-gt-thumbDownIcon"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M3 17h6.31l-.95 4.57-.03.32c0 .41.17.79.44 1.06L9.83 24s7.09-6.85 7.17-7h5V4H6c-.83 0-1.54.5-1.84 1.22l-3.02 7.05c-.09.23-.14.47-.14.73v2c0 1.1.9 2 2 2zM17 6h3v9h-3V6zM3 13l3-7h9v10l-4.34 4.34L12 15H3v-2z"></path></svg></span><span id="goog-gt-thumbDownIconFilled"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M3 17h6.31l-.95 4.57-.03.32c0 .41.17.79.44 1.06L9.83 24s7.09-6.85 7.17-7V4H6c-.83 0-1.54.5-1.84 1.22l-3.02 7.05c-.09.23-.14.47-.14.73v2c0 1.1.9 2 2 2zm16 0h4V4h-4v13z"></path></svg></span></button></div></div><div id="goog-gt-votingHiddenPane" class="VIpgJd-yAWNEb-hvhgNd-aXYTce"><form id="goog-gt-votingForm" action="//translate.googleapis.com/translate_voting?client=te" method="post" target="votingFrame" class="VIpgJd-yAWNEb-hvhgNd-aXYTce"><input type="text" name="sl" id="goog-gt-votingInputSrcLang"><input type="text" name="tl" id="goog-gt-votingInputTrgLang"><input type="text" name="query" id="goog-gt-votingInputSrcText"><input type="text" name="gtrans" id="goog-gt-votingInputTrgText"><input type="text" name="vote" id="goog-gt-votingInputVote"></form><iframe name="votingFrame" frameborder="0"></iframe></div></div></div><span id="transObserver" class="blind" style="position:fixed;top:0px;display:none" data-default-txt="언어 번역">언어 번역</span><div class="VIpgJd-ZVi9od-aZ2wEe-wOHMyf"><div class="VIpgJd-ZVi9od-aZ2wEe-OiiCO"><svg xmlns="http://www.w3.org/2000/svg" class="VIpgJd-ZVi9od-aZ2wEe" width="96px" height="96px" viewBox="0 0 66 66"><circle class="VIpgJd-ZVi9od-aZ2wEe-Jt5cK" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle></svg></div></div></body></html>