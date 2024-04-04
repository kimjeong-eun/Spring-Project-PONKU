<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<jsp:include page="../includes/header.jsp"></jsp:include>

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
<div id="container" class="cmmyssg_wrap">

<div class="cmmyssg_header ty_light react-area">
            <div class="cmmyssg_user" data-react-tarea-cd="00034_000000001">
            
                <div class="cmmyssg_user_info">
                    <h2 class="cmmyssg_user_tit" data-react-unit-type="text" data-react-unit-id="" data-react-unit-text="[{&quot;type&quot;:&quot;tarea_addt_val&quot;,&quot;value&quot;:&quot;이름&quot;}]">
                        <a class="cmmyssg_user_tittx clickable" data-react-tarea-dtl-cd="t00060"><span class="cmmyssg_user_titname">${user.username}님</span>의 마이페이지</a>
                    </h2>
                </div>
            </div>
</div>                   

<jsp:include page="../myPage/myPageAsideBar.jsp"></jsp:include>

<div id="content" class="content_myssg myssg_delivery">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<h2 class="stit">
		<span>배송지 관리</span>
	</h2>
	<div class="my_order_info">
		<div class="title">
			<p>기본배송지</p>
		</div>

			<c:if test="${defaultAddr.isDefault eq 'Y'}"> 
			<p class="notranslate">
				(${defaultAddr.address1})
				<br>
				도로명 : ${defaultAddr.address2}
				<br>
				지번 : ${defaultAddr.address3}
				<br>
			</p>
			</c:if>
	</div>

	<div id="del01" class="section data_tbl content active">
		<input type="hidden" value="${defaultAddr.member_seq}" name="member_seq"/>
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
				<c:forEach var="item" items="${addrList}">
				
					<tr>
						<td>
							<input type="radio" value="${item.addr_seq}" name="checkItem" class="radio" title="배송지 선택">
						</td>
						<input type="hidden" name="addr_seq" value="${item.addr_seq}">
						
						<td>
							<c:if test="${item.isDefault eq 'Y'}"> 
								<span class="sub_tit warning">
									[기본배송지]
								</span>
							</c:if>
							<strong class="notranslate">${item.addrName}</strong>
						</td>
						<input type="hidden" name="addrName" value="${item.addrName}">
						<td class="notranslate">${item.name}</td>
						<input type="hidden" name="name" value="${item.name}">
						<td class="subject address">
							<p class="notranslate">(${item.address1})<br>
								도로명 : ${item.address2}<br>
								지번 : ${item.address3}<br>
							</p>
						</td>
						<input type="hidden" name="address1" value="${item.address1}">
						<input type="hidden" name="address2" value="${item.address2}">
						<input type="hidden" name="address3" value="${item.address3}">
						
						<td>${item.phone}</td>
						<input type="hidden" name="phone" value="${item.phone}">
						
						<input type="hidden" name="member_seq" value="${user.member_seq}"/>
						
						<td>
							<a onclick="edit()" class="btn_cs ty4">
								<span>수정</span>
							</a>
							<a onclick="delete()"" class="btn_cs ty2">
								<span>삭제</span>
							</a>
						</td>
					</tr>
					
				</c:forEach>
	
				</tbody>
			
		</table>
	
		<div class="go_cancel">
			<button onclick="window.open('/popupAddress','_blank','width=700, height=600, top=50, left=50, scrollbars=yes')" class="btn_cs ty3"><span>새 배송지 추가</span></button>
		</div>
		
		<c:if test="${defaultAddr.isDefault eq 'Y'}"> 	
		<div class="button_btm">
			
				<button id="defaultAddrBtn" class="btn_cs ty1"><span>기본 배송지 설정</span></button>
			
		</div>
		</c:if>
		
		<form action="/successUpdateDefaultAddr" method="post" name="selectForm">
		
		</form>
		
	</div>
</div>
</div>
</div>

<script type="text/javascript">

$(document).ready(function() {
    let csrfHeaderName = "${_csrf.headerName}"; //"X-CSRF-TOKEN"
    let csrfTokenValue = "${_csrf.token}";

    $("#defaultAddrBtn").on("click", function(e) {
        e.preventDefault();

        if($("input:radio[name='checkItem']:checked").length === 0) {
            alert("배송지를 선택하여 주시기 바랍니다.");
            return;
        } 

        var checkItem = $("input[name='checkItem']:checked").eq(0);

        var addr_seq = checkItem.closest("tr").find("input[name='addr_seq']").val();
        var addrName = checkItem.closest("tr").find("input[name='addrName']").val();
        var name = checkItem.closest("tr").find("input[name='name']").val();
        var address1 = checkItem.closest("tr").find("input[name='address1']").val();
        var address2 = checkItem.closest("tr").find("input[name='address2']").val();
        var address3 = checkItem.closest("tr").find("input[name='address3']").val();
        var phone = checkItem.closest("tr").find("input[name='phone']").val();
        var member_seq = $("input[name='member_seq']").val();

        var formData = "<input type='hidden' name='${_csrf.parameterName }' value='${_csrf.token}' />";
        formData += "<input type='hidden' name='addr_seq' value='" + addr_seq + "'>";
        formData += "<input type='hidden' name='addrName' value='" + addrName + "'>";
        formData += "<input type='hidden' name='name' value='" + name + "'>";
        formData += "<input type='hidden' name='address1' value='" + address1 + "'>";
        formData += "<input type='hidden' name='address2' value='" + address2 + "'>";
        formData += "<input type='hidden' name='address3' value='" + address3 + "'>";
        formData += "<input type='hidden' name='phone' value='" + phone + "'>";
        formData += "<input type='hidden' name='member_seq' value='" + member_seq + "'>";

        var selectForm = $("form[name='selectForm']");
        selectForm.html(formData);

        $.ajax({ //선택된 값만 전송
                url: '/successUpdateDefaultAddr', // 성공여부를 처리하는 스크립트의 경로
                type: 'POST',
                data: selectForm.serialize(), // Serialize the form data
                dataType: 'text', //리턴타입 , 성공여부를 text로 추출함
                beforeSend: function(xhr){   // 헤더에 csrf 값 추가
                    xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
                },
                success: function(result) {
                    if (result == "true") {
                        alert("기본배송지 설정을 완료하였습니다.");
                        location.href = "/updateAddress";//성공 시 이동할 페이지
                    } else {
                        alert("기본배송지 설정 실패");
                    }
                },
                error: function(xhr, status, error) {
                    // 서버 요청 실패 시 실행할 코드
                    alert("기본배송지 설정 실패(서버요청실패)");
                }
        });
    });
	
	
	function openWindow () {
		const options = 'width=700, height=600, top=50, left=50, scrollbars=yes'
		window.open('/myPages','_blank',options)
	}
	
});

jQuery(document).ready(function() { // Load jQuery library

    jQuery("#btnExecPostCode").on("click", function(event) { //Called when the Find Zip Code button is clicked!
        openDaumZipAddress(); //Open the zip code search layer using the daum zip code API
    });
});

function openDaumZipAddress() { //daum zip code api

    // If the wrap layer is off (none), open the next zip code layer.
    if(jQuery("#wrap").css("display") == "none") {
        new daum.Postcode({
            oncomplete: function(data) { //oncomplete: When clicking on the address after searching in the callback function search box
                jQuery("#zonecode").val(data.zonecode); //Zip code
                jQuery("#roadAddress").val(data.roadAddress); //Street name address
                jQuery("#jibunAddress").val(data.jibunAddress); //Local address
                jQuery("#bname").val(data.bname); //Reference items
                jQuery("#address_detail").focus(); //Detailed Address
                console.log(data);
            },

            // When the user selects the value address and closes the layer
            // Completely terminate the next address book layer.
            onclose: function(state) { //onclose: callback function
                if(state === "COMPLETE_CLOSE") {
                    // Execute the callback function and proceed with the work after the slide up function completes execution.
                    offDaumZipAddress(); //Close search layer
                }
            },
            width: "100%" // Set the horizontal size to the wrap layer.
        }).embed(document.getElementById("wrap"));

        // Open the layer window using the slide down function.
        jQuery("#wrap").slideDown();
    }

    // If the warp layer is open, change the next zip code layer to off.
    else {

        // Execute the callback function and proceed with the work after the slide up function completes execution.
        offDaumZipAddress(); //Close search layer
    }
}


function offDaumZipAddress() {

    // Close the layer window using the slide up function.
    jQuery("#wrap").slideUp();
}
</script>

	
<jsp:include page="../includes/footer.jsp"></jsp:include>
