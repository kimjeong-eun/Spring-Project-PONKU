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
    
    
    <style type="text/css">
    
    #orderListTable{
   		 width: 100%; margin-top: 1rem;
    
    }
    
     #orderListTable tbody tr {
   		
   			width:100%;
   			height:6rem;
   			margin-top: 20px;
    
    }
    
    </style>
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
		<sec:authentication property="principal" var="pinfo"/>
	    <h2 class="stit"><span>구매내역</span></h2>
	     <div class="form_section">
			<div class="content_intro">
				<h3>나의 구매정보</h3>
				<p class="join_txt">
					<img src="//sui.ssgcdn.com/ui/ssg/img/mem/ico_star.gif" alt="필수"> 구매 내역은 최대 1년까지 확인 가능합니다.
				</p>
			</div>
			<p>조회 기간 선택</p>
			<br/>
		
			<form name="dateForm"  action="/myOrderList"  method="post">
				<label style="font-size: 15px;">시작일 &nbsp;&nbsp;&nbsp; </label> <input type="date" name="start_date" > <span style="font-size: 20px;">~</span>
				<label style="font-size: 15px;">종료일 &nbsp;&nbsp;&nbsp; </label> <input type="date" name="end_date" >
			<%-- 	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}" /> <!-- 스프링시큐리티를 위한 토큰  --> --%>
				<input type="hidden" name="userid" value="${pinfo.username }">
				<button type="button" name="check_btn" style="margin-left: 1rem; font-size: 15px; font-weight: 800; width: 2rem;">조회</button>
			</form>		
		
			<fieldset class="fieldset medium"  style="height: 30rem;">

					<div name="helpMsg" style="width: 100%;height: 30rem; font-size: 20px; margin-left: 5%; text-align: center; margin-top: 10%;display: none;"> 조회 기간을 설정해주세요</div>
					<div name="helpMsg2" style="width: 100%;height: 30rem; font-size: 20px; margin-left: 5%; text-align: center; margin-top: 10%; display: none;"> 조회된 데이터가 없습니다.</div>
				
				<table  name="orderListTable" id="orderListTable" >
					<thead>	
						<th>주문번호</th>
						<th>주문일</th>
						<th>주문 상태</th>
						<th>상품 정보</th>
						<th>수량</th>
						<th>주문액</th>
						<th>주문 취소</th>
					</thead>
					<tbody name="orderListBody"  >
					<!--<tr >
							<td name="order_no"></td>
							<td name="order_date"></td>
							<td name="order_status"></td>
							<td name="order_info" ><img src="" style="width: 10rem;"></td>
							<td name="order_quantity></td>
							<td name="order_totalPrice"></td>
							<td name="order_cancle" ></td>
						</tr> -->

					
					
					
					</tbody>
	
				</table>
			
			
			
			
			
			</fieldset>
			
			
			
			
			
			
		</div>
		<div class="form_btn_area">
			<p id="alertArea" class="desc"></p>
		</div>
		<div class="cs_info_box">
			<h3 class="cs_info_subtit">배송정보 안내</h3>
			<ul class="cs_info_lst">
				<li>배송지 정보는 '나의 정보관리 &gt; 배송지 관리' 메뉴에서 추가/수정/삭제하실 수 있습니다.</li>
				<li>주문 정보는 회원 정보에 등록된 휴대폰번호 및 이메일주소로 안내됩니다.</li>
			</ul>
		</div>
	  
	 </div>

  
  
  <script type="text/javascript">
  
  	$(document).ready(function() {
  		var csrfHeaderName = "${_csrf.headerName}";  //"X-CSRF-TOKEN"
		var csrfTokenValue = "${_csrf.token}";
  		
  		$("button[name='check_btn']").on("click",function(e){
  			//조회기간을 입력했다면 
  			
  			e.preventDefault();

  			var start_date = $("input[name='start_date']").val().toString();
  			var end_date = $("input[name='end_date']").val().toString();
			var userid = $("input[name='userid']").val();

  			/* $("form[name='dateForm']").submit(); */
  			
  			//조회기간 동안의 주문내역 받아옴
  			$.ajax({
  				url:'/myOrderList',
  				type:'POST',
  				data:{
  					 start_date:start_date,
  					  end_date:end_date,
  					  userid:userid
  					  },
  				beforeSend: function(xhr){   // 헤더에 csrf 값 추가
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
  				dataType: 'json',
  		        success: function (result) {
  		            if (result){
  		              
  		            	/* console.log(result); */
  		            	
  		            	 showList(result); 
  		            	
  		            }
  		        }
  		    }); 

  			
  			
  			
  			  			
  		});
  		
  		
  	function showList(lists){
  		
  		var str ="";
  		
  		if(lists.length == 0 || lists == null){
  			$("div[name='helpMsg']").hide();
  			$("div[name='helpMsg2']").show();
  			
  			
  		}else{
  			$("div[name='helpMsg']").hide();
  			$("div[name='helpMsg2']").hide();

  			
  			
  			for(list of lists){
  				
  				
  			 str+="<tr ><td name='order_no'>"+list.orderno+"</td><td name='order_date'>"+list.order_date +"</td> <td name='order_status'>"+"상품 준비중"+"</td> <td name='order_info' ><img src='"+list.caseimgurl +"' style='width: 10rem;'>"+list.casename +"</td><td name='order_quantity'>"+list.quantity+"</td></td> <td name='order_totalPrice'>"+ list.totalprice +"</td><td name='order_cancle' >"+"취소불가" +"</td></tr>";
  			
  			}
  			
  			$("tbody[name='orderListBody']").html(str);
  		}
  		
  		
  		
  	};
  		
  		
  		
});
  
  
  </script>
  
  
  
<jsp:include page="../includes/footer.jsp"></jsp:include>