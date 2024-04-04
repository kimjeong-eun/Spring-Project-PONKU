<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style type="text/css">

body{
	width:100%;
	height: 110%; 
}

.custombox{

/* 	border: 1px solid blue;  */
	top:200px;
	left: 5%;
	width: 90%;
	height: 65rem;
	position: relative;
}

.customview{

	width: 600px;
	height: 600px;
	border: 1px solid black;  
	background-image: url("/resources/img/iphone.png");
	background-color: gray;
	position:relative;
	left: 2%;
		
}

.canvas-select{
	position:absolute;
	width: 30%;
	height: 60%;
/* 	border: 1px solid red;  */
	left: 56%;
	top:0;
	display: inline-block;
	float: left;
}


.font-select-btn{
	/* 폰트 설정 버튼 */
	margin-top: 10px;
	width: 20%;
	height: 12%;
	background-image: url("/resources/img/logo.png");
	padding: 2px;
	display: inline-block;
	
	background-image: ;
	background-size: 500px 500px;
	right: 0;
}

.font-select-btn:hover{

	cursor: pointer;
}

.sticker-select-btn{

	margin-top: 10px;
	width: 13%;
	height: 9%;
	padding: 2px;
	display: inline-block;
	background-image: ;
	background-size: 500px 500px;
	right: 0;

}

.case-select-btn{

	margin-top: 10px;
	margin-right:10px;
	width: 20%;
	height: 80%;
	background-image: url("/resources/img/iphone.png"); 
	background-size: 170% 170%;
	padding: 2px;
	border: 2px solid black;
	display: inline-block;
	position: relative;
	

}

.case-select-btn:hover{

	cursor: pointer;
}

.case-select-btn div{

	display: inline-block;
	position: absolute;
	left:0;
	width:100px;
	bottom: -40px;
	font-size:13px;
	font-weight: 700;
	padding: 0;
	
}

.rayout-select-btn{

	margin-top: 10px;
	width: 15%;
	height: 10%;
	padding: 2px;
	display: inline-block;
	background-image: ;
	background-size: cover;
	right: 0;

}


.inputbox{
 /* 인풋 텍스트 박스 */
	width: 90%;
	height: 30px;
	display: block;
	margin-top: 5px;

}


p{
	margin-bottom: 0;
}

.casestyle{

	margin-bottom:10%;
	width: 100%;
	height: 30%;
/* 	border: 1px solid red; */
	float: left;

}

#purchase, #cart{
	margin-bottom:30px;
	width: 80%;
	height: 35px;
	color: white;
	background-color: black;
}

#formObj{

	margin-top: 20px;
}
#quantity{

	width:50%;
	height:30px;
	margin-left: 20px;
	margin-bottom: 10px;
	font-size: 21px;
	
}
#totalprice {

	margin-left: 20px;
	margin-bottom: 10px;
	width: 80%;
	height: 30px;
	padding: 0;
	font-size: 21px;
	
}

#modelselect{
	
	margin-top:10px;
	widows: width:50%;
	height:30px;

}

.sticker-select-btn:hover {

	border: 2px solid #FF9100;

}
</style>

<jsp:include page="./includes/header.jsp"></jsp:include>

<div class="custombox" style="margin: 20px auto 280px;">

<canvas class="customview" style="touch-action: none; cursor: inherit;" width="600" height="600" ></canvas>

	<div class="canvas-select">
				
		<strong>나만의 커스텀 케이스를 완성하세요.</strong><br/>
		<strong>커스터마이징 포함 가격입니다</strong>
		<p>*기종에 따라 폰트 크기의 차이가 있을 수 있습니다.*</p>
		
		<p>기종 선택</p>
		<select name="modelselect" id="modelselect">
		<optgroup label="아이폰">
			<option name="model" value="iphone13">아이폰13</option>
			<option name="model" value="iphone13Pro">아이폰13Pro</option>
			<option name="model" value="iphone13Mini">아이폰13Mini</option>
			<option name="model" value="iphone14">아이폰14</option>
			<option name="model" value="iphone14Pro">아이폰14Pro</option>
			<option name="model" value="iphone15">아이폰15</option>
			<option name="model" value="iphone15Pro">아이폰15Pro</option>
		</optgroup>
		<optgroup label="갤럭시">
			<option disabled="disabled">준비중입니다.</option>
		</optgroup>
		</select>

		<p>케이스 스타일</p>
		<div class="casestyle">
			<div class="case-select-btn" style="background-image:url('/resources/img/iphone.png');" data-url ="/resources/img/iphone.png" data-maxsize="90" data-price="16000" data-code="ip0327" data-casename="글라스 범퍼"><div>글라스 범퍼<br/>(16,000)</div></div>
			<div class="case-select-btn" style="background-image:url('/resources/img/iphonemacsafe.png');" data-url ="/resources/img/iphonemacsafe.png" data-maxsize="120" data-price="20000" data-code="ip0328" data-casename="맥세이프 투명젤"><div>맥세이프 투명젤<br/>(20,000)</div></div>
			<div class="case-select-btn" style="background-image:url('/resources/img/iphonesoap.png');" data-url ="/resources/img/iphonesoap.png" data-maxsize="90" data-price="15000" data-code="ip0329" data-casename="비누 젤"><div>비누 젤<br/>(15,000)</div></div>
		</div>
		
		<p>글꼴 스타일</p>
	 	<button  class="font-select-btn" name="pinkstyle" id="pinkstyle" style="background-image:url('/resources/img/alphabet/pink_a.png');"></button>
	 	<button  class="font-select-btn" name="blackstyle" id="blackstyle" style="background-image:url('/resources/img/alphabet/black_a.png');"></button>
		
		<p name="msg" style="color: red ; font-size: 12px; margin-bottom: 0; display: none">커스텀 문구는 한글 및 특수기호를 지원하지 않습니다.</p>
		<input type="text" name="input-content" placeholder="내용을 입력하세요(영문만 가능)" class="inputbox">
		
		<p>스티커</p>
		<button  class="sticker-select-btn" name="blackheart" id="blackheart" style="background-image:url('/resources/img/black_heartimg.png');" data-url="/resources/img/black_heart.png"></button>
		
		<sec:authentication property="principal" var="pinfo"/>
		
		<form action="/orderCustom" method="post" name="formObj" id="formObj" >
		
		<sec:authorize access="isAnonymous()">
			<input type="hidden" name="userid" value="nomember">
		</sec:authorize> 
		<sec:authorize access="isAuthenticated()">
			<input type="hidden" name="userid" value="${pinfo.username }">
		</sec:authorize> 
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}" /> <!-- 스프링시큐리티를 위한 토큰  -->
			
			<input type="hidden" name="fileName" value="" /> <!--이미지 파일 이름  -->
			<input type="hidden" name="uploadPath" value=""/> <!-- 이미지 저장위치  -->
			<input type="hidden" name="uuid" value=""/> <!--이미지 uuid  -->
			<input type="hidden" name="image" value=""/> <!--이미지파일여부 -->
			<input type="hidden" name="caseimgurl" value="" /> <!--선택한 케이스 이미지   -->
			<input type="hidden" name="casename" value=""> <!-- 케이스 이름  -->
			<input type="hidden" name="modelinput" value=""/> <!--선택한 기종  -->
			<input type="hidden" name="price" value=""/>
			<input type="hidden" name="customimginput" value=""/> <!-- 커스터마이징한 이미지 위치-->
			<input type="hidden" name="codeinput" value=""/> <!--상품코드  -->
			<input type="hidden" name="customcontent" value=""/> <!--입력 문구  -->
			<strong  style="font-size: 20px; text-align: center;">수량</strong><input type="number" max="50" min="1" name="quantity" id="quantity" value="1"/><br/>
			<strong style="font-size: 20px; text-align: center;">가격</strong><input type="text" value="" readonly="readonly" name="totalprice" id="totalprice"/>
			<button type="button" name="purchase" id="purchase">구매하기</button>
		</form>
			
			<sec:authorize access="isAuthenticated()">
			<button type="button" name="cart" id="cart">쇼핑 카트 담기</button>
			</sec:authorize>
		<sec:authorize access="isAuthenticated()">
				<form action="/putShoppingCart" name="cartForm" id="cartForm" method="post">
	
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}" /> <!-- 스프링시큐리티를 위한 토큰  -->	
					
					<input type="hidden" name="member_seq" value="${pinfo.member.member_seq }" /> <!--선택한 케이스 이미지 url  -->
					<input type="hidden" name="caseimgurl" value="" /> <!--선택한 케이스 이미지 url  -->
			 			<input type="hidden" name="cquantity" value=""> <!--수량  -->
					<input type="hidden" name="modelinput" value=""/> <!--선택기종  -->
					<input type="hidden" name="codeinput" value=""/> <!--상품코드  -->				
			
				</form>
		</sec:authorize>	
	</div>
</div>
<script type="text/javascript">
		
		
		/*/resources/img/alphabet/pink_a.png"  */
		
		$(document).ready(function() {

			var canvas = $(".customview"); //캔버스객체
			var ctx = canvas[0].getContext("2d");
			
			var letter =""; //글꼴 
			var customstyle=""; //케이스트타일
			var imgurl="resources/img/alphabet/"+customstyle+"_"+letter+".png";
		
			var x =320; //아이폰 x고정 (커스텀 스티커의 시작 위치)
			var y = 470; //아이폰 y고정(커스텀 스티커의 시작 위치)
			var maxsize=90; //기본값 (최대 입력 글자위치)
			var price = "16000"; //기본가격
			var model = $("#modelselect option:selected").val(); //기본모델
			var code = "ip0327"; //기본 상품코드
			
			/*  console.log(model);  */
			
			//기본값 설정 
			$("input[name='totalprice']").val(price);
			$("input[name='caseimgurl']").val("/resources/img/iphone.png");
			
			// 기종선택박스에 변화가 있다면
			$("#modelselect").change(function() {
				
				model = $("#modelselect option:selected").val();
				console.log(model);
			});

			//케이스 종류 선택 버튼
			$(".case-select-btn").on("click", function() {
				$(".case-select-btn").css("border","2px solid black");
				$(this).css("border","2px solid #FF9100");
				
				ctx.clearRect(0,0,canvas[0].width,canvas[0].height); //케이스 종류 변경시 커스텀정보 지우기
				$("input[name='input-content']").val(""); //초기화
				$("input[name='quantity']").val("1");
				y = 470; //초기화

				code = $(this).data("code");
				price = $(this).data("price");	
				console.log(code); 

				$("input[name='totalprice']").val(price);

				if(!($(this).data("url")==null | $(this).data("url")=="")){
					
					var canvasurl=$(this).data("url"); //케이스 이미지 url
					var casename=$(this).data("casename"); //케이스 이름
					var price = $(this).data("price"); //케이스 가격 
					
					$("input[name='casename']").val(casename);
					$("input[name='caseimgurl']").val(canvasurl);
					$("input[name='price']").val(price);
					$(".customview").css("background-image","url('"+canvasurl+"')");
					maxsize= parseInt($(this).data("maxsize"));
						 
				}
			});

			$(".font-select-btn[name=pinkstyle]").on("click",function(){
				//핑크 글꼴을 선택했을 시
				
				$(".font-select-btn").css("border","2px solid black");
				$(this).css("border","2px solid #FF9100");
				
				ctx.clearRect(0,0,canvas[0].width,canvas[0].height); //케이스 종류 변경시 커스텀정보 지우기
				$("input[name='input-content']").val(""); //초기화
				y = 470; //초기화
				
				customstyle="pink";
				console.log(imgurl);

			});
			
			$(".font-select-btn[name=blackstyle]").on("click",function(){
				//블랙 글꼴을 선택했을 시
				$(".font-select-btn").css("border","2px solid black");
				$(this).css("border","2px solid #FF9100");
				
				ctx.clearRect(0,0,canvas[0].width,canvas[0].height); //케이스 종류 변경시 커스텀정보 지우기
				$("input[name='input-content']").val(""); //초기화
				y = 470; //초기화
				
				customstyle="black";
				console.log(imgurl);
				
			});
			
			//커스텀 문구 쓰기
			$("input[name='input-content']").keydown(function(e) { //키보드가 눌렸을 때
				
				if(customstyle == "" || customstyle == null){
					
					$("input[name='input-content']").val("");
					alert("글꼴 스타일을 먼저 선택해주시길 바랍니다"); //초기화
					$("input[name='input-content']").val("");
					
					return;
				}
			
				if(e.keyCode>90){
					
					$("p[name='msg']").show(); //한글 미지원 메세지 출력
					
				}else{
					
					$("p[name='msg']").hide();
				}

				var cur_inputcontent = e.key; //눌린 키값을 찾음
				letter = cur_inputcontent; //눌린 키값에대한 문자를 할당
				imgurl="resources/img/alphabet/"+customstyle+"_"+letter+".png";
				addToCanvas(ctx,imgurl,550,550);
				letter="";
				
			});

			$(".sticker-select-btn[name='blackheart']").on("click",function(){
				//스티커 버튼 눌렸다면
				
					var stickerurl = $(this).data("url");
				
					console.log(stickerurl);
					
					addToCanvas(ctx,stickerurl,490,490);
					var inputval = $("input[name='input-content']").val();
					$("input[name='input-content']").val(inputval+"♥");

					/* canvas[0].onclick = function(event) {
					const sticker_x = event.clientX - ctx.canvas.offsetLeft;
				    const sticker_y = event.clientY - ctx.canvas.offsetTop;
					
					//x-320 y-100
					//스티커 붙이기
					var img = new Image();
				  	img.src = stickerurl;
				
					img.onload = function(){
						
					    ctx.drawImage(img, sticker_x-320, sticker_y-100, 500 , 500);
					   	e.preventDefauilt();
					  };

				    //ctx.fillRect(sticker_x-320, sticker_y-100, 30, 30);
					 
					}; */
			});

			function addToCanvas(ctx, image, w ,h) {
				//캔버스에 이미지를 추가하는 메서드
				  var img = new Image();
				  img.src = image;
				  
				  img.onload = function(){
					  
					  if(y<=maxsize){
						 
						  //최대 추가 사이즈 넘으면 return
						  return;
					  }
					  
				    ctx.drawImage(img, x, y, w , h);
				    console.log(y);
				    y=y-52;
				    
				  };
			};

			$("input[name='input-content']").keydown(function(event) {
				//백스페이스가 눌렸을 때 동작
				//백스페이스 키의 keyCode 는 8 입니다

				if ( event.keyCode === 8 ) {

					ctx.clearRect(0,0,canvas[0].width,canvas[0].height); //전체지우기
					
					y=470;
					
					$(this).val("");

				}
			});

			//수량항목이 변화가 있을때 수량만큼 전체가격 더해짐
			$("input[name='quantity']").change(function() {
				
				
				if($(this).val() === '0' || !$(this).val()){
					console.log($(this).val());
					$("input[name='quantity']").val("1");

				}else{
					
					var quantity = parseInt($(this).val()); //수량 정보를 가져옴
					
					$("input[name='quantity']").val(quantity+"");
					$("input[name='totalprice']").val(price*quantity+"");		
				}				
			});
			
			var csrfHeaderName = "${_csrf.headerName}";  //"X-CSRF-TOKEN"
			var csrfTokenValue = "${_csrf.token}";
			
			//구매동작
			$("button[name='purchase']").on("click",function(e){
				var userid = $("input[name=userid]").val();
				
				e.preventDefault();
				
				if($("input[name='casename']").val()=="" || $("input[name='casename']")== null){
					alert("케이스 종류를 선택해주세요!");
					
					return;
				}
				
				$("input[name='modelinput']").val(model); //모델
				$("input[name='codeinput']").val(code); // 상품코드
				$("input[name='customcontent']").val($("input[name='input-content']").val()); //입력 문구
				//수량 (460줄에서 따로 입력됨)	
				//최종가격(460줄에서 따로 입력됨)
				//이미지 저장위치는 ajax를 통해 처리

				//이미지 파일 변환
				var imgDataUrl = canvas[0].toDataURL('image/png');
				/*  console.log(imgDataUrl);  */
				
				var blobBin = atob(imgDataUrl.split(',')[1]); //base64 데이터 디코딩
			    var array = [];
			    for (var i = 0; i < blobBin.length; i++) {
			        array.push(blobBin.charCodeAt(i));
			    }
			    var file = new Blob([new Uint8Array(array)], {type: 'image/png'});	// Blob 생성
			    var formdata = new FormData();	// formData 생성
			    formdata.append("file", file);	// file data 추가
			    
				/* formdata.append("modelinput",$("input[name='modelinput']").val());
				formdata.append("codeinput",$("input[name='codeinput']").val());
				formdata.append("customcontent",$("input[name='customcontent']").val());
				formdata.append("quantity",$("input[name='quantity']").val());
				formdata.append("totalprice",$("input[name='totalprice']").val()); */
				
				//폼데이터를 컨트롤러로 전송~
				 $.ajax({
					 
				        type : 'POST',
				        url : '/customOrder',
				        data : formdata,
				        processData : false,	// data 파라미터 강제 string 변환 방지!!
				        contentType : false,	// application/x-www-form-urlencoded; 방지!!
				        dataType:'json',
				        beforeSend: function(xhr){   // 헤더에 csrf 값 추가
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
				        success : function(customImg){ //이미지파일객체
				        	console.log("성공");
				        	console.log(customImg);
				        	
				        	$("input[name='fileName']").val(customImg.fileName);
				        	$("input[name='uploadPath']").val(customImg.uploadPath);
				        	$("input[name='uuid']").val(customImg.uuid);
				        	$("input[name='image']").val(customImg.image);
				        	
				        	$("form[name='formObj']").submit(); //폼 전송 (일반 컨트롤러) */

				        },
				        error : function(e){
	  					    console.log(e);
	  					 }
				 
				    });

			});
			
			//쇼핑카트 동작
			$("button[name='cart']").on("click",function(e){
				
				e.preventDefault();
				
				if($("input[name='casename']").val()=="" || $("input[name='casename']")== null){
					alert("케이스 종류를 선택해주세요!");
					
					return;
				}
				
				
				if(confirm("쇼핑카트 추가시 커스텀 문구는 사라집니다. 쇼핑카트에 담으시겠습니까?")){
					
					$("input[name='cquantity']").val($("input[name='quantity']").val());
					
					$("input[name='modelinput']").val(model); //모델
					$("input[name='codeinput']").val(code); // 상품코드
					
					var cartForm = $("form[name='cartForm']");
					
					cartForm.submit();				
					
				}
				
			});
			
		});
		
</script>


<jsp:include page="./includes/footer.jsp"></jsp:include>

</body>
</html>