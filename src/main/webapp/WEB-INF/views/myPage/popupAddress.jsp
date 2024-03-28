<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko" style="height: 100%;"><head>
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge" charset="utf-8"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link rel="stylesheet" type="text/css" href="//sui.ssgcdn.com/ui/ssg/css/common/layout.css?v=20240327">
<link rel="stylesheet" type="text/css" href="//sui.ssgcdn.com/ui/ssg/css/scom.css?v=20240327">
<link rel="stylesheet" type="text/css" href="//sui.ssgcdn.com/ui/ssg/css/popup.css?v=20240327">
<!-- <script type="text/javascript" src="//sui.ssgcdn.com/ui/ssg/js/lib/jquery-1.9.1.min.js"></script> -->
<script type="text/JavaScript" src="https://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/JavaScript" src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<link type="text/css" rel="stylesheet" charset="UTF-8" href="https://www.gstatic.com/_/translate_http/_/ss/k=translate_http.tr.qhDXWpKopYk.L.W.O/am=wA/d=0/rs=AN8SPfq5gedF4FIOWZgYyMCNZA5tU966ig/m=el_main_css"><script type="text/javascript" charset="UTF-8" src="https://translate.googleapis.com/_/translate_http/_/js/k=translate_http.tr.ko.bYiHAOBrOyU.O/am=AAQ/d=1/exm=el_conf/ed=1/rs=AN8SPfrezzaShpT-Mgjb6BvVOzZqP6qC5Q/m=el_main"></script></head>
<body style="position: relative; min-height: 100%; top: 0px;">
<div id="pop_wrap">
    
<!-- 회원 유형 -->

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
							<legend class="blind">국내 배송지 입력</legend>
							<div class="pop_data_table tbl_style1">
								<table border="1">
								<caption>국내 배송지 설정</caption>
								<colgroup><col style="width:100px;"><col style="width:448px;"></colgroup>
								<tbody>
								
									<tr>
									<th scope="row"><label for="addressName1">주소별칭</label></th>
									<td>
										<input type="text" id="shpplocAntnmNm" name="shpplocAntnmNm" value="집" class="input_text small" style="width:232px;ime-mode:active;" maxlength="20">
									</td>
									</tr>
								
								
								<tr>
								<th scope="row"><label for="rcptpeNm">받으실 분</label></th>
								<td>
									<input type="text" id="rcptpeNm" name="rcptpeNm" value="김수영" class="input_text small" style="width:232px;ime-mode:active;" maxlength="20"> 10자 이내
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
									<input type="text" id="hpno2" title="휴대폰 중간자리 입력" value="2279" onkeydown="inputNumberKeyDown()" class="input_text small" maxlength="4" style="width:96px;">
									<span class="text">-</span>
									<input type="text" id="hpno3" title="휴대폰 마지막자리 입력" value="6331" onkeydown="inputNumberKeyDown()" class="input_text small last" maxlength="4" style="width:96px;">
								</td>
								</tr>
								<tr>
								<th scope="row">전화번호<br>(선택)</th>
								<td>
									<select id="telno1" title="지역 번호 선택" class="select small" style="width:97px">
										<option value="">선택</option>
										<option value="02" addtoptnval1="" addtoptnval2="">02</option><option value="031" addtoptnval1="" addtoptnval2="">031</option><option value="032" addtoptnval1="" addtoptnval2="">032</option><option value="033" addtoptnval1="" addtoptnval2="">033</option><option value="041" addtoptnval1="" addtoptnval2="">041</option><option value="042" addtoptnval1="" addtoptnval2="">042</option><option value="043" addtoptnval1="" addtoptnval2="">043</option><option value="051" addtoptnval1="" addtoptnval2="">051</option><option value="044" addtoptnval1="" addtoptnval2="">044</option><option value="052" addtoptnval1="" addtoptnval2="">052</option><option value="053" addtoptnval1="" addtoptnval2="">053</option><option value="054" addtoptnval1="" addtoptnval2="">054</option><option value="055" addtoptnval1="" addtoptnval2="">055</option><option value="061" addtoptnval1="" addtoptnval2="">061</option><option value="062" addtoptnval1="" addtoptnval2="">062</option><option value="063" addtoptnval1="" addtoptnval2="">063</option><option value="064" addtoptnval1="" addtoptnval2="">064</option><option value="070" addtoptnval1="" addtoptnval2="">070</option><option value="080" addtoptnval1="" addtoptnval2="">080</option><option value="0505" addtoptnval1="" addtoptnval2="">0505</option><option value="0507" addtoptnval1="" addtoptnval2="">0507</option>
										<option value="010" addtoptnval1="" addtoptnval2="">010</option><option value="011" addtoptnval1="" addtoptnval2="">011</option><option value="016" addtoptnval1="" addtoptnval2="">016</option><option value="017" addtoptnval1="" addtoptnval2="">017</option><option value="018" addtoptnval1="" addtoptnval2="">018</option><option value="019" addtoptnval1="" addtoptnval2="">019</option>
									</select>
									<span class="text">-</span>
									<input type="text" title="전화번호 두번째 자리 입력" id="telno2" value="" onkeydown="inputNumberKeyDown()" class="input_text small" maxlength="4" style="width:96px;">
									<span class="text">-</span>
									<input type="text" title="전화번호 세번째 입력" id="telno3" value="" onkeydown="inputNumberKeyDown()" class="input_text small last" maxlength="4" style="width:96px;">
								</td>
								</tr>
								<tr>
								<th scope="row" class="vt"><span class="full_address">배송주소</span></th>
								<td class="address">
									<input type="hidden" name="shpplocSeq" id="shpplocSeq" value="4234033">
									<input type="hidden" name="bascShpplocYn" id="bascShpplocYn" value="Y">
									<input type="hidden" name="oldZipcd" id="oldZipcd" value="441111">
									<input type="hidden" name="roadNmBascAddr" id="roadNmBascAddr" value="경기도 수원시 권선구 세류로">
									<input type="hidden" name="roadNmDtlAddr" id="roadNmDtlAddr" value="39, 2단지 204동 1205호 (세류동, 수원역센트럴타운)">
									<input type="hidden" name="lotnoBascAddr" id="lotnoBascAddr" value="경기도 수원시 권선구 세류동">
									<input type="hidden" name="lotnoDtlAddr" id="lotnoDtlAddr" value="1270 수원역센트럴타운 2단지 204동 1205호">
									<input type="hidden" name="mbrIptAddrTypeCd" id="mbrIptAddrTypeCd" value="20">
									<input type="hidden" name="mbrIptAddr" id="mbrIptAddr" value="16592 경기도 수원시 권선구 세류로, 39 2단지 204동 1205호">
									<input type="hidden" name="shpplocRegPstCd" id="shpplocRegPstCd" value="08">
									<input type="hidden" name="addrExamRstCd" id="addrExamRstCd" value="YY">
									<input type="hidden" name="rcptpeTelno" id="rcptpeTelno" value="">
									<input type="hidden" name="rcptpeHpno" id="rcptpeHpno" value="010-2279-6331">

									
									
									<input type="text" id="zipcd" name="zipcd" title="우편번호 앞자리 입력" value="" class="input_text small postal" style="width:101px" maxlength="5" readonly="readonly">
									<button type="button" id="btnExecPostCode" class="btn_cs ty3"><span>우편번호 검색</span></button>
									<br/>
									<div id="wrap" style="display:none;border:1px solid #DDDDDD;width:500px;margin-top:5px"></div>
        							<div style="height:10px;"></div>	
									<div class="addr_info">
										<strong class="info_tit">도로명</strong>
										<input type="text" id="roadNmAddr" value="" style="width:300px;" placeholder="도로명주소" readOnly/>
										&nbsp;
										<strong class="info_tit">지번</strong>
										<input type="text" id="lotnoAddr" value="" style="width:300px;" placeholder="지번주소" readOnly/>
										<br/>
										<strong class="info_tit">상세주소</strong>
                                   		<input type="text" id="address_detail" value="" style="width:400px;" placeholder="상세주소"/>
										&nbsp;
										<strong class="info_tit">참고항목</strong>
                                   		<input type="text" id="bname" value="" style="width:200px;" placeholder="참고항목"/>
                                    </div>
								</td>
								</tr>
								</tbody>
								</table>
							</div>
						</fieldset>
					</form>
					
					<ul class="data_list small notranslate">
						<li>배송 주소를 변경하실 경우는 쇼핑 전에 변경해주세요.</li>
						<li>이마트, 트레이더스 상품은 선택한 배송지에 따라 주문하실 상품의 재고가 달라집니다.</li>
						
					</ul>
					
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
                jQuery("#zipcd").val(data.zipcd); //우편번호
                jQuery("#roadNmAddr").val(data.roadNmAddr); //도로명주소
                jQuery("#lotnoAddr").val(data.lotnoAddr); //지번주소
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

<script type="text/javascript">
    try {
        var _dl = {
            "pcid" 				: "17103827614647253105770"
            , "fsid" 			: "sb1ajj372j1q5em6vg05"
            , "siteno"		    : "1001" // #443767 siteno 하드코딩 요청
            , "tarea" 			: ""
            , "log_type_flag" 	: "t"
            , "memberid" 		: "SSG.B25C7E05B9BAD36E06CC46116D261608"
            , "ga"				: "226"
            , "mbrgrdcd"		: "10"
            , "ckwhere"		    : "ssg_ggbr"
            , "bkwhere"		    : ""
        };

        $(window).load( function() {
            var doScript = function() {
                var scriptUrl = "";
                if ("prod" == "prod") {
                    scriptUrl = "//assets.adobedtm.com/c78a04c43d47/dedbe93b08df/launch-febc6f5bcace.min.js";
                } else {
                    scriptUrl = "//assets.adobedtm.com/c78a04c43d47/dedbe93b08df/launch-2754e6c3a1e9-development.min.js";
                }

                $.getScript(scriptUrl, function () {
                    if(typeof _satellite !== "undefined") {
                        if ("prod" == "qa") { // qa 로그
                            console.log("tracking_log : " + JSON.stringify(_dl));
                        }
                        _satellite.track("tracking_log", _dl);
                    }
                });
            };

            var analytics_sp = "N"
            if (analytics_sp === "Y") {
                doScript();
                // 이전 페이지 리액팅 처리
                var _dlSession = sessionStorage.getItem('_dl');
                if(_dlSession != 'undefined' && _dlSession != '' && _dlSession != null) {
                    if(typeof _satellite !== "undefined") {
                        var _dlObj = JSON.parse(_dlSession);
                        if ("prod" == "qa") { // qa 로그
                            console.log("tracking_log : " + _dlSession);
                        }
                        _satellite.track("tracking_log", _dlObj);
                    }
                    sessionStorage.removeItem('_dl');
                }
            } else if (analytics_sp === "") { // 대상 조회
                $.ajax({
                    type : "GET"
                    ,url : "/targeting/idSampling.ssg"
                    ,dataType : "json"
                    ,success : function(data) {
                        if (data.result_code === "200" && data.aa_target_id_yn === "Y") {
                            doScript();
                        }
                    }
                });
            }
        });
    } catch (e) {}
</script>


<script type="text/javaScript" defer="defer">

$(document).ready(function() {
	perdc = "";

	
	
	window.resizeTo(640, 720);

	
	setOtherAddr();
	
});
var shpploc = {
	perdc : ""
	, pageDiv : ""
	, callbackUrl : "myssg"
	, campaignYn : ""
	, origin : ""
	, type: ""
	, csbot: ""
	, shpplocRegPstCd: ""
	, result : null
	, save : function() {
		var self = this;
		if (!this.validate()) return;
		setData();

		// 정기배송지 등록은 등록만 되게 설정
		/* if(this.perdc == "Y"){
			$('input[name="saveBasicOnlyType"]').val("");
		}
 */
		$('#submitForm').ajaxSubmit({
			type: "POST"
			, url: "/comm/popup/shpplocForm.ssg"
			, dataType: "json"
			, beforeSubmit: function() {
				loadingIndicator.show();
			}
			, success: function(map) {
				self.result = map;
				if (map.result == "00") {
					if (shpploc.perdc == "Y") self.actionPerdc();
					else self.action();
				} else if (map.result == "97") {
					alert('휴대폰 번호를 정확하게 다시 입력해주세요.');
				} else if (map.result == "96") {
					alert('전화번호를 정확하게 다시 입력해주세요.');
				} else if (map.result == "95") {
					alert('로그인이 필요한 서비스입니다.');
					window.close();
				} else {
					alert('입력값 형식이 유효하지 않습니다.');
				}
				loadingIndicator.hide();
			}
			, error: function(request, status, error) {
				alert('일시적인 장애로 서비스가 일시 중단되었습니다. 잠시 후 다시 시도해주세요.');
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				loadingIndicator.hide();
			}
		});
	}
	, action : function() {
		var self = this;
		// insert
		if (this.result["histTypeCd"] == "I" && this.type === 'nonMember') {
			$.ajax({
				type: 'GET',
				url: "/comm/popup/setBascShpploc.ssg",
				dataType: 'jsonp',
				jsonp : 'callBack',
				data: { 'shpplocSeq' : this.result["shpplocSeq"] }
			})
			.always(function() {
				if(self.origin.indexOf('pay') > -1 ){
					document.location.href = self.origin + '/callback/shpplocPop.ssg';
				} else {
					document.location.href = self.origin + '/comm/popup/shpplocCallBack.ssg';
				}
			});
		} else if (this.result["histTypeCd"] == "I" && confirm('새 배송지가 등록되었습니다. \n지금 등록한 배송지를 기본배송지로 설정하시겠습니까?')) {
			$.ajax({
				type: "GET"
				, url: "/comm/popup/setBascShpploc.ssg"
				, dataType: "jsonp"
				, jsonp : "callBack"
				, data: { "shpplocSeq" : this.result["shpplocSeq"] }
				, success: function(map) {
					if (map["CHNG_SALESTR_NM_YN"] === 'Y' && !(this.pageDiv === 'orderpage' || this.pageDiv === 'orderDetail')) {
						var param = 'type=I&bascShpplocYn=Y';
						param += '&emSaleStrNm=' + map["EM_SALESTR_NM"]
						param += '&trSaleStrNm=' + map["TR_SALESTR_NM"]
						param += '&newEmSaleStrNm=' + map["NEW_EM_SALESTR_NM"]
						param += '&newTrSaleStrNm=' + map["NEW_TR_SALESTR_NM"];
						popupWin('/comm/popup/saleStrChngNotc.ssg?' + encodeURI(param), '', 500, 380, 'no', 'no');
					} else {
						alert(map.resultMsg);
					}
					// 팝업 및 바닥 리프레쉬
					self.refresh();
				}
				, error: function(request, status, error) {
					alert('일시적인 장애로 서비스가 일시 중단되었습니다. 잠시 후 다시 시도해주세요.');
				}
			});
		} else {
			this.refresh();
		}

		// update
		if (this.result["histTypeCd"] == "U") {
			// 배송점포 변경 여부 확인
			if (this.result["CHNG_SALESTR_NM_YN"] === 'Y' && !(this.pageDiv === 'orderpage' || this.pageDiv === 'orderDetail')) {
				var param = 'type=U&bascShpplocYn=' + this.result["BASC_SHPPLOC_YN"];
				param += '&emSaleStrNm=' + this.result["EM_SALESTR_NM"]
				param += '&trSaleStrNm=' + this.result["TR_SALESTR_NM"]
				param += '&newEmSaleStrNm=' + this.result["NEW_EM_SALESTR_NM"]
				param += '&newTrSaleStrNm=' + this.result["NEW_TR_SALESTR_NM"];
				popupWin('/comm/popup/saleStrChngNotc.ssg?' + encodeURI(param), '', 500, 380, 'no', 'no');
			} else {
				alert(this.result["resultMsg"]);
			}
			
	    	if (this.csbot === 'Y') {
				
	    	}
			this.refresh();
		}
	}
	, actionPerdc : function() {
		if (this.result["histTypeCd"] == "I") {
			alert('신규 배송지가 추가되었습니다.' + '정기배송지 설정은 정기배송지 설정 팝업에서 다시한번 확인하시고 설정해 주세요.');
		} else if (this.result["histTypeCd"] == "U") {
			alert('배송지 수정이 완료되었습니다.' + '정기배송지 설정은 정기배송지 설정 팝업에서 다시한번 확인하시고 설정해 주세요.');
		}
		document.location.href = '/comm/popup/shppPerdcList.ssg';
	}
	, cancel : function() {
		if (this.callbackUrl === "myssg") {
			if (confirm('배송지 목록으로 이동하면 작성하던 배송지 목록이 사라집니다. \n이동하시겠습니까?')) {
				window.close();
			}
			return;
		}
		if (this.shpplocRegPstCd === "12") {
			window.close();
			return;
		}
		if (this.campaignYn !== "Y") {
			this.list();
			return;
		}
		window.close();

	}
	, list : function() {
		if(confirm('배송지 목록으로 이동하면 작성하던 배송지 목록이 사라집니다. \n이동하시겠습니까?')) {
			if (this.perdc == "Y") {
				document.location.href = '/comm/popup/shppPerdcList.ssg';
			} else {
				var param = '?callbackUrl=' + this.callbackUrl + '&pageDiv=' + pageDiv;
				document.location.href = '/comm/popup/shpplocList.ssg' + param;
			}
		}
	}
	, refresh : function() {
		var retUrl = '';

		if (this.callbackUrl === 'myssg') {
			opener.document.location.reload();
			window.close();
			return;
		}

		if (this.campaignYn === 'Y') {
			if (this.callbackUrl.indexOf('pay') > -1 || this.origin.indexOf('pay') > -1) {
				retUrl = '/callback/shpplocPop.ssg';
			} else {
				retUrl = this.origin + '/comm/popup/shpplocCallBack.ssg';
			}
			document.location.href = retUrl;
			return;
		}

		retUrl = 'https://member.ssg.com/comm/popup/shpplocList.ssg?pageDiv=' + this.pageDiv + '&callbackUrl=' + this.callbackUrl + '&csbot=' + this.csbot;
		if (this.callbackUrl.indexOf('pay') > -1 && (this.pageDiv === 'orderpage' || this.pageDiv === 'orderDetail')) {
			document.location.href = retUrl;
		} else if (this.callbackUrl.indexOf('pay') > -1 ) {
			document.location.href = this.origin + '/callback/shpplocPop.ssg?retUrl=' + escape(retUrl);
		} else if (this.shpplocRegPstCd === '12'){
			document.location.href = this.origin + '/callback/shpplocPop.ssg';
		} else {
			document.location.href = this.origin + '/comm/popup/shpplocCallBack.ssg?retUrl=' + escape(retUrl);
		}
	}
	, validate : function() {

		
		$("#shpplocAntnmNm, #rcptpeNm").each(function() {
			var val = fnReturnNotSpecialChar($(this).val());
			$(this).val(val.substring(0, 20));
		});
		
		if ($('input[name="shpplocAntnmNm"]').val() !== undefined && $('input[name="shpplocAntnmNm"]').val().isBlank()) {
			alert('주소별칭을 입력해주세요.');
			$('input[name="shpplocAntnmNm"]').focus();
			return false;
		}
		
		if($('input[name="rcptpeNm"]').val().isBlank()) {
			alert('받는 분을 입력해 주세요.');
			$('input[name="rcptpeNm"]').focus();
			return false;
		}
		
		for (var i=1; i <= 3; i++) {
			if($('#hpno' + i).val().isBlank()) {
				alert('휴대폰 번호를 선택해주세요.');
				$('#hpno' + i).focus();
				return false;
			}
		}
		
		if($('#zipcd').val().isBlank()) {
			$(this).siblings('.btn').focus();
			alert('우편번호찾기를 선택해주세요.');
			return false;
		}
		
		if($('input[name="lotnoDtlAddr"]').val().isBlank()){
			alert('배송주소를 입력해주세요.');
			return false;
		}

		return true;
	}
	, init : function() {
		$('input[name="shpplocAntnmNm"]').val("");
		$('input[name="rcptpeNm"]').val("");
		$("[id^='hpno']").val("");
		$("[id^='telno']").val("");
		$("#zipcd").val("");
		$("#oldZipcd").val("");
		$("[id^='roadNm']").val("");
		$("[id^='lotno']").val("");
		$("#mbrIptAddrTypeCd").val("");
		$("#addrExamRstCd").val("");
		$("#mbrIptAddr").val("");
		$("#otherAddrHome").html("");

		$("#lotnoAddr").html("");
		$("#RoadNmAddr").html("");
		$('#submitForm div.addr_info').hide();
	}
};

var perdc = "N";
var pageDiv = (typeof $.getUrlVar('pageDiv') === 'undefined') ? '' : $.getUrlVar('pageDiv');

function setOtherAddr() {
	$("#otherAddrHome").text('지번주소 : ' + $("#lotnoBascAddr").val() + ' ' + $("#lotnoDtlAddr").val());
}


function searchZipcdCallBack(addrObj) {
	var addrVal = ["zipcd", "oldZipcd", "lotnoBascAddr", "lotnoDtlAddr", "lotnoAddr", "roadNmBascAddr", "roadNmDtlAddr", "roadNmAddr", "mbrIptAddrTypeCd", "mbrIptAddr", "addrExamRstCd"];
	for (var i in addrVal) {
		try {
			if (addrVal[i] === "lotnoAddr")
				$("#" + addrVal[i]).text(decodeURI(addrObj["lotnoBascAddr"]) + ' ' + decodeURI(addrObj["lotnoDtlAddr"]));
			else if (addrVal[i] === "roadNmAddr")
				$("#" + addrVal[i]).text(decodeURI(addrObj["roadNmBascAddr"]) + ' ' + decodeURI(addrObj["roadNmDtlAddr"]));
			else
				$("#" + addrVal[i]).val(decodeURI(addrObj[addrVal[i]]));
		} catch (e) {}
	}
	setOtherAddr();

	$('#submitForm div.addr_info').show();
	if (addrObj.roadNmBascAddr === '' && addrObj.roadNmDtlAddr === '') {
		$('.addr_info .no_addr_layer').show();
	} else {
		$('.addr_info .no_addr_layer').hide();
	}
}


function setData() {
	$('input[name="rcptpeHpno"], input[name="rcptpeTelno"]').val("");
	var phone = [];
	$("[id^='hpno']").each(function() {
		if ($(this).val() !="") phone.push($(this).val()); }
	);
	if (phone.length == 3) $('input[name="rcptpeHpno"]').val(phone.join("-"));
	phone = [];
	$("[id^='telno']").each(function() {
		if ($(this).val() !="") phone.push($(this).val()); }
	);
	if (phone.length == 3) $('input[name="rcptpeTelno"]').val(phone.join("-"));
}

function openAddrZip() {
	popupWin('/addr/popup/zipcd.ssg', '우편번호찾기', 500, 745, 'yes', 'no');
}


$('#rcptpeNm').on('keypress keyup keydown', function(e) {
	if($(this).val().length > 10) {
		$(this).val($(this).val().substring(0, 10));
		e.preventDefault();
	};
});
</script>
</div>

<div id="goog-gt-tt" class="VIpgJd-yAWNEb-L7lbkb skiptranslate" style="border-radius: 12px; margin: 0 0 0 -23px; padding: 0; font-family: 'Google Sans', Arial, sans-serif;" data-id=""><div id="goog-gt-vt" class="VIpgJd-yAWNEb-hvhgNd"><div class=" VIpgJd-yAWNEb-hvhgNd-l4eHX-i3jM8c"><img src="https://fonts.gstatic.com/s/i/productlogos/translate/v14/24px.svg" width="24" height="24" alt=""></div><div class=" VIpgJd-yAWNEb-hvhgNd-k77Iif-i3jM8c"><div class="VIpgJd-yAWNEb-hvhgNd-IuizWc" dir="ltr">원본 텍스트</div><div id="goog-gt-original-text" class="VIpgJd-yAWNEb-nVMfcd-fmcmS VIpgJd-yAWNEb-hvhgNd-axAV1"></div></div><div class="VIpgJd-yAWNEb-hvhgNd-N7Eqid ltr"><div class="VIpgJd-yAWNEb-hvhgNd-N7Eqid-B7I4Od ltr" dir="ltr"><div class="VIpgJd-yAWNEb-hvhgNd-UTujCb">번역 평가</div><div class="VIpgJd-yAWNEb-hvhgNd-eO9mKe">보내주신 의견은 Google 번역을 개선하는 데 사용됩니다.</div></div><div class="VIpgJd-yAWNEb-hvhgNd-xgov5 ltr"><button id="goog-gt-thumbUpButton" type="button" class="VIpgJd-yAWNEb-hvhgNd-bgm6sf" title="번역 품질 좋음" aria-label="번역 품질 좋음" aria-pressed="false"><span id="goog-gt-thumbUpIcon"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M21 7h-6.31l.95-4.57.03-.32c0-.41-.17-.79-.44-1.06L14.17 0S7.08 6.85 7 7H2v13h16c.83 0 1.54-.5 1.84-1.22l3.02-7.05c.09-.23.14-.47.14-.73V9c0-1.1-.9-2-2-2zM7 18H4V9h3v9zm14-7l-3 7H9V8l4.34-4.34L12 9h9v2z"></path></svg></span><span id="goog-gt-thumbUpIconFilled"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M21 7h-6.31l.95-4.57.03-.32c0-.41-.17-.79-.44-1.06L14.17 0S7.08 6.85 7 7v13h11c.83 0 1.54-.5 1.84-1.22l3.02-7.05c.09-.23.14-.47.14-.73V9c0-1.1-.9-2-2-2zM5 7H1v13h4V7z"></path></svg></span></button><button id="goog-gt-thumbDownButton" type="button" class="VIpgJd-yAWNEb-hvhgNd-bgm6sf" title="번역 품질 좋지 않음" aria-label="번역 품질 좋지 않음" aria-pressed="false"><span id="goog-gt-thumbDownIcon"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M3 17h6.31l-.95 4.57-.03.32c0 .41.17.79.44 1.06L9.83 24s7.09-6.85 7.17-7h5V4H6c-.83 0-1.54.5-1.84 1.22l-3.02 7.05c-.09.23-.14.47-.14.73v2c0 1.1.9 2 2 2zM17 6h3v9h-3V6zM3 13l3-7h9v10l-4.34 4.34L12 15H3v-2z"></path></svg></span><span id="goog-gt-thumbDownIconFilled"><svg width="24" height="24" viewBox="0 0 24 24" focusable="false" class="VIpgJd-yAWNEb-hvhgNd-THI6Vb NMm5M"><path d="M3 17h6.31l-.95 4.57-.03.32c0 .41.17.79.44 1.06L9.83 24s7.09-6.85 7.17-7V4H6c-.83 0-1.54.5-1.84 1.22l-3.02 7.05c-.09.23-.14.47-.14.73v2c0 1.1.9 2 2 2zm16 0h4V4h-4v13z"></path></svg></span></button></div></div><div id="goog-gt-votingHiddenPane" class="VIpgJd-yAWNEb-hvhgNd-aXYTce"><form id="goog-gt-votingForm" action="//translate.googleapis.com/translate_voting?client=te" method="post" target="votingFrame" class="VIpgJd-yAWNEb-hvhgNd-aXYTce"><input type="text" name="sl" id="goog-gt-votingInputSrcLang"><input type="text" name="tl" id="goog-gt-votingInputTrgLang"><input type="text" name="query" id="goog-gt-votingInputSrcText"><input type="text" name="gtrans" id="goog-gt-votingInputTrgText"><input type="text" name="vote" id="goog-gt-votingInputVote"></form><iframe name="votingFrame" frameborder="0"></iframe></div></div></div><span id="transObserver" class="blind" style="position:fixed;top:0px;display:none" data-default-txt="언어 번역">언어 번역</span><div class="VIpgJd-ZVi9od-aZ2wEe-wOHMyf"><div class="VIpgJd-ZVi9od-aZ2wEe-OiiCO"><svg xmlns="http://www.w3.org/2000/svg" class="VIpgJd-ZVi9od-aZ2wEe" width="96px" height="96px" viewBox="0 0 66 66"><circle class="VIpgJd-ZVi9od-aZ2wEe-Jt5cK" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle></svg></div></div></body></html>