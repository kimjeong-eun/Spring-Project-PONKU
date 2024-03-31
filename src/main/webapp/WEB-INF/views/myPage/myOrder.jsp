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
   		 background-color: white;
    
    }
    
    #orderListTable th{
   		 text-align: center;
    	
    }
    
     #orderListTable tbody tr {
   		
   			width:100%;
   			height:6rem;
   			margin-top: 20px;
   			border-bottom: 1px solid black;
   			text-align: center;
    
    }
   #orderListSet::-webkit-scrollbar {
    width: 10px;
  }
  #orderListSet::-webkit-scrollbar-thumb {
    background-color: #2f3542;
    border-radius: 10px;
  }
  #orderListSet::-webkit-scrollbar-track {
    background-color: grey;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }
  
          .modal_{
            position:absolute;
        	 display:none; 
            
            justify-content: center;
            top:0;
            left:0;
			z-index:100;
            width:100%;
            height:100%;

            

            background-color: rgba(0,0,0,0.4);
        }
        
		.modal_body{
            position:absolute;
            top:10%; /* 모달을 화면가운데 놓기위함.  */
        

            width:70rem;  /* 모달의 가로크기  */
            height:70rem; /* 모달의 세로크기  */

            padding:40px;  

            text-align: center;

            background-color: rgb(255,255,255); 
            border-radius:10px; 
            box-shadow:0 2px 3px 0 rgba(34,36,38,0.15); 

           
            transform:translateX(10%); 
        }
        #order_ul li{
        
        font-size: 13px;
        
    	text-align: left;
        
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
			
			
			
			<table  name="orderListTable" id="orderListTable" >
			 <colgroup>
			 	<col width="10%;">
			 	<col width="10%">
			 	<col width="5%;">
			 	<col width="45%;">
			 	<col width="10%;">
			 	<col width="5%;">
			 	<col width="10%;">
			 	<col width="10%;">
			 </colgroup>
					<thead>	
						<th>주문번호</th>
						<th>주문일</th>
						<th>상태</th>
						<th>상품 정보</th>
						<th>커스텀문구</th>
						<th>수량</th>
						<th>주문액</th>
						<th>취소</th>
					</thead>
		</table>
			
			
			<fieldset class="fieldset medium" id="orderListSet" style="height: 30rem; overflow: auto; overflow-x: hidden;">

					<div name="helpMsg" style="width: 100%; font-size: 20px; margin-left: 5%; text-align: center; margin-top: 10%;"> 조회 기간을 설정해주세요</div>
					<div name="helpMsg2" style="width: 100%; font-size: 20px; margin-left: 5%; text-align: center; margin-top: 10%; display: none;"> 조회된 데이터가 없습니다.</div>
				
				<table  name="orderListTable" id="orderListTable" >
				<colgroup>
			 	<col width="10%;">
			 	<col width="10%">
			 	<col width="5%;">
			 	<col width="45%;">
			 	<col width="10%;">
			 	<col width="5%;">
			 	<col width="10%;">
			 	<col width="10%;">
				 </colgroup>
					<tbody name="orderListBody"  >
					<!-- 이곳에 구매내역 리스트가 보여질 것입니다. (json으로 데이터를 받아옴)  -->
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
	 

	<!--주문서 모달창 (주문번호 클릭시 나타남)  -->
  	<div class="modal_">
        <div class="modal_body">
            <h1 style="font-size: 30px;">주문 정보</h1><br/>
            <span  name="modal_close_btn" style="width: 3rem; height: 3rem; font-size: 30px; float:right ; margin-bottom: 1rem; cursor: pointer;"> X </span>
            <br/>
            
            <div name="madal_body_content" style="width: 100%; height: 90%; margin-top: 1rem;">

	        <div class="container" style="margin-top: 0px;">

				   <!--   <p>주문 상품 이미지(예시)<span style="color: red;">*</span></p> -->
					<%-- <c:forEach  var="element" items="${cartList }" >
	                
						<div class="uploadResult" style="display: inline-block;  background-image: url('${element.image}');">
		         			<ul>
		         					<!-- 여기에 이미지 보임  -->
		         			</ul>
		         		</div> 	
	                </c:forEach> --%>
	                    <div class="row">
	                        <div class="col-lg-8 col-md-6">
	                            <div class="row">
	
	                                <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                        <p>주문자명<span>*</span></p>
	                                        <input type="text" name="username" value="" readonly="readonly">
	                                    </div>
	                                </div>
									 <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                        <p>주문일<span>*</span></p>
	                                        <input type="text" name="order_date" value="" readonly="readonly">
	                                    </div>
	                                </div>
	                            </div>
	                           
	                            <div class="checkout__input">
	                                <p>주소<span>*</span></p>
	                                <input type="text"  class="checkout__input__add" name="address2" value="" readonly="readonly">
	                                <input type="text" name="address3" value="" readonly="readonly">
	                            </div>
	                         
	                            <div class="row">
	                                <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                        <p>휴대폰번호<span>*</span></p>
	                                        <input type="text" name="phone" value="" readonly="readonly">
	                                    </div>
	                                </div>
	                                <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                        <p>이메일<span>(선택)</span></p>
	                                        <input type="text" name="email" value="" readonly="readonly">
	                                    </div>
	                                </div>
	                                 <div class="col-lg-6">
	  									<div class="checkout__input">
	                                		<p>결제 수단<span></span></p>
	                                		<input type="text" name="payment" value="" readonly="readonly">
	                                	</div>				                                
	                            	</div>  
	                                 <div class="col-lg-6">
										  <div class="checkout__input">
	                               			 <p>커스텀 문구<span>(커스텀 제품만 해당)</span></p>
	                                		<input type="text" name="custom_content" value="" readonly="readonly" >
	                                	 </div>		
	                           		 </div>       					                                
	                            </div>
			                 <div class="checkout__input">
	                                <p>주문 요청 사항<span>(선택)</span></p>
	                                <input type="text" name="order_request" value="" readonly="readonly" >
	                            </div>
	                            <div class="checkout__input">
	                                <p>배송 요청 사항<span>(선택)</span></p>
	      
	                                <input type="text" name="delivery_request" value="" readonly="readonly">
	                            </div>       
                  
	                        </div>
	                        <div class="col-lg-4 col-md-6">
	                            <div class="checkout__order" style="padding: 17px;">
	                            
	                                <h4>Your Order</h4>
	                                <div class="checkout__order__products">Products <span>Total</span></div>
									<ul id="order_ul">
											<!-- 이곳에 주문 상품 리스트가 보여집니다.  -->
										
									
									</ul>
								        <div class="checkout__order__total">Total <span> </span></div>
	                            </div>
	                        </div>
	           			 </div>
	            </div>
			</div>            
        </div>
    </div>
  
  <script type="text/javascript">
  
  	$(document).ready(function() {
  		var csrfHeaderName = "${_csrf.headerName}";  //"X-CSRF-TOKEN"
		var csrfTokenValue = "${_csrf.token}";
  		
		var myOrderList;
		var myCustomOrderList;
		var str ="";
		
  		$("button[name='check_btn']").on("click",function(e){
  			//조회기간을 입력했다면 
 			e.preventDefault();
  			str="";
  			

  			var start_date = $("input[name='start_date']").val().toString(); //조회기간 시작
  			var end_date = $("input[name='end_date']").val().toString(); //조회기간 끝
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
  		            	
  		            	myOrderList=result;
  		            }
  		        }
  		    }); 
			//커스텀 주문 내역받아옴
  			$.ajax({
  				url:'/myCustomOrderList',
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

  		            	myCustomOrderList=result;           	
  		            	
  		            }
  		        }
  		    }); 
  			
			//리스트 출력	
				showList(myOrderList,myCustomOrderList);
  					  			
  		});
 	
  	function showList(lists , customLists){
  		
  		
		//주문내역 리스트 출력하는 메서드 
  		if((lists == null || lists.length === 0 ) && (customLists == null || customLists.length === 0)){
  			$("div[name='helpMsg']").hide();
  			$("div[name='helpMsg2']").show();
  			$("tbody[name='orderListBody']").hide();
  			
  			
  		}else{
  			$("div[name='helpMsg']").hide();
  			$("div[name='helpMsg2']").hide();
  			$("tbody[name='orderListBody']").show();
  	
  			for(list of lists){
  				
  				var order_date = new Date(list.order_date);
  				var order_date_str = getFormatDate(order_date);
  				
  				var price = parseInt(list.price)*parseInt(list.quantity);
  				
  			 str+="<tr ><td name='order_no' style='color:blue; cursor:pointer; font-weight:700;'>"+list.orderno+"</td><td name='order_date'>"+order_date_str +"</td> <td name='order_status'>"+"상품 준비중"+"</td> <td name='order_info' ><img src='"+list.caseimgurl +"' style='width: 10rem; margin-top:1rem;'>"+list.casename+"("+list.model_name+")"+"<td> x </td></td><td name='order_quantity'>"+list.quantity+"</td></td> <td name='order_price'>"+ price +"</td><td name='order_cancle' >"+"취소불가" +"</td></tr>";
  			
  			}
  			
  			for(list of customLists){
  				/* 커스텀 제품은 주문번호가 길어서 (임의로) 따로 관리함 -> 사용자에게 보여지는 주문번호는 실제 주문번호의 일부분  */
  				var order_date = new Date(list.order_date);
  				var order_date_str = getFormatDate(order_date);
  				
  				var orderno = list.orderno.substring(16,22);
  				
  			 str+="<tr ><input type='hidden' name='order_no' value='"+ list.orderno +"'><td name='order_no' style='color:blue; cursor:pointer; font-weight:700;'>"+orderno+"</td><td name='order_date'>"+order_date_str +"</td> <td name='order_status'>"+"상품 준비중"+"</td> <td name='order_info' ><img src='"+list.caseimgurl +"' style='width: 10rem; margin-top:1rem;'>"+list.casename+"("+list.model_name+")"+"<td>"+list.custom_content+"</td></td><td name='order_quantity'>"+list.quantity+"</td></td> <td name='order_price'>"+ list.totalprice +"</td><td name='order_cancle' >"+"취소불가" +"</td></tr>";
  			 			 
  			}	
  			$("tbody[name='orderListBody']").html(str);
  		}
  		
  		return lists;
  		
  	};
  		
  	
    //리스트에서 주문번호 클릭시 (주문서 모달창 )
    $(document).on("click", "td[name='order_no']", function() {

    	//커스텀 제품인지 확인함 (아니라면 일반제품)
    	var order_no = $(this).prev("input[name='order_no']").val();
    	var order_list = "";
    	 
    	if(typeof order_no =='undefined'){
    		//일반제품
    		order_no=$(this).text();
    		$(".modal_").show();
    
        	 
    		for(element of myOrderList){
    			
    			if(element.orderno == order_no){
    				
    				var order_date = new Date(element.order_date); //날짜형식으로 바꿈
    				
    				order_list += "<li>"+element.casename +"&nbsp; (" + element.model_name + ")<span>" + element.price +" X "+element.quantity+"</span></li>";
    				$("input[name='order_date']").val(getFormatDate(order_date)); 
    				$("input[name='username']").val(element.username);
    				var address = element.delivery_address.split('/');			
    				$("input[name='address2']").val(address[0]);
    				$("input[name='address3']").val(address[1]); 				
    				$("input[name='phone']").val(element.phone);
    				$("input[name='email']").val(element.email);
    				$("input[name='order_request']").val(element.order_request);
    				$("input[name='delivery_request']").val(element.delivery_request);
    				$("input[name='custom_content']").val("X");
    				$("input[name='payment']").val(element.payment);
    				$(".checkout__order__total span").text(element.totalprice);
    				
    			}
    			$("#order_ul").html(order_list);
    		}

    	}else{
    		//커스텀제품
    		$(".modal_").show();
			for(element of myCustomOrderList){
    			
    			if(element.orderno == order_no){
    				
    				var order_date = new Date(element.order_date); //날짜형식으로 바꿈
    				
    				order_list += "<li>"+element.casename +"&nbsp; (" + element.model_name + ")<span>" + element.price +" X "+element.quantity+"</span></li>";
    				$("input[name='order_date']").val(getFormatDate(order_date)); 
    				$("input[name='username']").val(element.username);
    				var address = element.delivery_address.split('/');			
    				$("input[name='address2']").val(address[0]);
    				$("input[name='address3']").val(address[1]); 				
    				$("input[name='phone']").val(element.phone);
    				$("input[name='email']").val(element.email);
    				$("input[name='order_request']").val(element.order_request);
    				$("input[name='delivery_request']").val(element.delivery_request);
    				$("input[name='custom_content']").val(element.custom_content);
    				$("input[name='payment']").val(element.payment);
    				$(".checkout__order__total span").text(element.totalprice);
    			}
    		}
			$("#order_ul").html(order_list);
    	}	
    });
    
    $(document).on("click","span[name='modal_close_btn']",function(){
    	
    	$(".modal_").hide();
    	
    });
    
    function getFormatDate(origin_date){
    	//날짜 포맷팅 메서드 yyyy-mm-dd 형식으로
    	
     var date_str= origin_date.getFullYear() +
			'-' + ( (origin_date.getMonth()+1) < 9 ? "0" + (origin_date.getMonth()+1) : (origin_date.getMonth()+1) )+
		'-' + ( (origin_date.getDate()) < 9 ? "0" + (origin_date.getDate()) : (origin_date.getDate()) );
    	
    	
    	return date_str;
    }
    

});


 </script>
  
  
  
<jsp:include page="../includes/footer.jsp"></jsp:include>