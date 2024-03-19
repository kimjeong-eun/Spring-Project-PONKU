<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커스텀 페이지 </title>
<style type="text/css">

body{
	width:100%;
	height: 100vh; 
}

.sub-header{

	position: absolute;
	width: 100%;
	height:20%;
	border: 1px solid green; 
	background-image: url("/resources/img/subheader.png");
	background-size: cover;
}

.custombox{

	border: 1px solid blue; 
	top:200px;
	left: 15%;
	width: 72%;
	height: 80%;
	position: relative;
}

.customview{

	width: 600px;
	height: 600px;
	border: 1px solid red; 
	background-image: url("/resources/img/iphone.png");
	position:relative;
	left: 15%;
		
}

.canvas-select{

	position:absolute;
	width: 30%;
	height: 85%;
	border: 1px solid red; 
	left: 60%;
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
	margin-top: 20px;

}


p{
	margin-bottom: 0;
}


.casestyle{

	margin-bottom:10%;
	width: 100%;
	height: 30%;
	border: 1px solid red;
	float: left;

}

#purchase{
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
	font-size: 30px;
	
}
#totalprice {

	margin-left: 20px;
	margin-bottom: 10px;
	width: 80%;
	height: 30px;
	padding: 0;
	font-size: 30px;
	
}

</style>

 <script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>


</head>
<body>

<div class="sub-header" id="sub-header"></div>


<div class="custombox">

<canvas class="customview" style="touch-action: none; cursor: inherit;" width="600" height="600" ></canvas>

	<div class="canvas-select">
			
			
			
		<strong>나만의 커스텀 케이스를 완성하세요.</strong><br/>
		<strong>커스터마이징 포함 가격입니다</strong>
		
		<p>케이스 스타일</p>
		<div class="casestyle">
			
			<div class="case-select-btn" style="background-image:url('/resources/img/iphone.png');" data-url ="/resources/img/iphone.png" data-maxsize="90" data-price="16000"><div>글라스 범퍼<br/>(16,000)</div></div>
			<div class="case-select-btn" style="background-image:url('/resources/img/iphonemacsafe.png');" data-url ="/resources/img/iphonemacsafe.png" data-maxsize="120" data-price="20000"><div>맥세이프 투명젤<br/>(20,000)</div></div>
			<div class="case-select-btn" style="background-image:url('/resources/img/iphonesoap.png');" data-url ="/resources/img/iphonesoap.png" data-maxsize="90" data-price="15000"><div>비누 젤<br/>(15,000)</div></div>
			
		</div>
		
		<p>글꼴 스타일</p>
	 	<button  class="font-select-btn" name="pinkstyle" id="pinkstyle" style="background-image:url('/resources/img/alphabet/pink_a.png');"></button>
	 	<button  class="font-select-btn" name="blackstyle" id="blackstyle" style="background-image:url('/resources/img/alphabet/black_a.png');"></button>
		
		<p>레이아웃</p>
		<button  class="rayout-select-btn" name="heightstyle" id="heightstyle" style="background-image:url('/resources/img/heightstyle.png');" data-x="320" data-y="470"></button>
	 	<button  class="rayout-select-btn" name="widthstyle" id="widthstyle" style="background-image:url('/resources/img/widthstyle.png');" data-x="320" data-y="300" ></button>
		
		<input type="text" name="input-content" placeholder="내용을 입력하세요(영문만 가능)" class="inputbox">
		
		
		<form action="/" method="post" name="formObj" id="formObj">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}" /> <!-- 스프링시큐리티를 위한 토큰  -->
			<strong  style="font-size: 20px; text-align: center;">수량</strong><input type="number" max="50" min="1" name="quantity" id="quantity"><br/>
			<strong style="font-size: 20px; text-align: center;">가격</strong><input type="text" value="" readonly="readonly" name="totalprice" id="totalprice"/>
			<button type="button" name="purchase" id="purchase">구매하기</button>
		
		</form>
		
		
	</div>

</div>

<script type="text/javascript">
		
		
		/*/resources/img/alphabet/pink_a.png"  */
		
		$(document).ready(function() {

			var canvas = $(".customview"); //캔버스객체
			var ctx = canvas[0].getContext("2d");
			
			var letter ="";
			var customstyle="";
			var imgurl="resources/img/alphabet/"+customstyle+"_"+letter+".png";
			
	
			
			var x =320; //아이폰 x고정
			var y = 470; //아이폰 y고정
			
			var maxsize=90; //기본값
			
			var price = "16000"; //기본가격
			
			//기본가격
			$("input[name='totalprice']").val(price);
		
			
			//케이스 종류 선택 버튼
			$(".case-select-btn").on("click", function() {
				$(".case-select-btn").css("border","2px solid black");
				$(this).css("border","2px solid #FF9100");
				
				ctx.clearRect(0,0,canvas[0].width,canvas[0].height); //케이스 종류 변경시 커스텀정보 지우기
				$("input[name='input-content']").val(""); //초기화
				$("input[name='quantity']").val("");
				y = 470; //초기화

				
				price = $(this).data("price");	
				$("input[name='totalprice']").val(price);
				
				if(!($(this).data("url")==null | $(this).data("url")=="")){
					
					var canvasurl=$(this).data("url");
					
					$(".customview").css("background-image","url('"+canvasurl+"')");
						 maxsize= parseInt($(this).data("maxsize"));
						 console.log(maxsize);
				}
			});
			
			
			//수량항목이 변화가 있을때
			$("input[name='quantity']").change(function() {
				
				
				if($(this).val() === '0' || $(this).val() === null){
					
					return;

				}else{
					
					var quantity = parseInt($(this).val()); //수량 정보를 가져옴
					
					$("input[name='totalprice']").val(price*quantity);		
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
			

			$("input[name='input-content']").keydown(function(e) { //키보드가 눌렸을 때
				
				if(customstyle == "" || customstyle == null){
					
					$("input[name='input-content']").val("");
					alert("글꼴 스타일을 먼저 선택해주시길 바랍니다"); //초기화
					$("input[name='input-content']").val("");
					
					return;
				}

				var cur_inputcontent = e.key; //눌린 키값을 찾음
				letter = cur_inputcontent; //눌린 키값에대한 문자를 할당
				imgurl="resources/img/alphabet/"+customstyle+"_"+letter+".png";
				addToCanvas(ctx,imgurl,550,550);
				letter="";
				
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
				    y=y-50;
				    
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

		});
		
		
		


</script>


</body>
</html>