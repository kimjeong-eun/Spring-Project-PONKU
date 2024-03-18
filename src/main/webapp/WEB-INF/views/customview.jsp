<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커스텀 페이지 </title>
<style type="text/css">

.custombox{

	border: 1px solid blue;
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
	height: 50%;
	border: 1px solid red;
	left: 70%;
	top:40%;
	display: inline-block;
	float: left;

}


.select-btn{
	
	margin-top: 30px;
	width: 20%;
	height: 20%;
	/* background-image: url("/resources/img/logo.png"); */
	padding: 2px;
	display: inline-block;
}

.inputbox{

	width: 90%;
	height: 30px;
	display: block;
	margin-top: 50px;

}

#pinkstyle{

	background-image: url("/resources/img/alphabet/pink_a.png");
	background-size: 400px 410px;
	right: 0;
}

#pinkstyle:hover{

	cursor: pointer;a
}


</style>

 <script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>


</head>
<body>


<div class="custombox">

<canvas class="customview" style="touch-action: none; cursor: inherit;" width="600" height="600" >
</canvas>

<div class="canvas-select">
		
	<strong>나만의 커스텀 케이스를 완성하세요.</strong>
	
	<p>글꼴 스타일</p>
 	<button  class="select-btn" name="pinkstyle" id="pinkstyle"></button>
 	<button  class="select-btn" ></button>
	
	<input type="text" name="input-content" placeholder="내용을 입력하세요(영문만 가능)" class="inputbox">
</div>

</div>








<script type="text/javascript">
		
		
		/*/resources/img/alphabet/pink_a.png"  */
		
		$(document).ready(function() {

			var canvas = $(".customview");
			var ctx = canvas[0].getContext("2d");
			
			var letter ="";
			var customstyle="";
			var imgurl="resources/img/alphabet/"+customstyle+"_"+letter+".png";

			
			var x =320; //아이폰 x고정
			var y = 470; //아이폰 y고정
			
		
			$(".select-btn[name=pinkstyle]").on("click",function(){
				//핑크 글꼴을 선택했을 시
				
				customstyle="pink";
				
				console.log(imgurl);

			});
			
			
			$("input[name='input-content']").keydown(function(e) { //키보드가 눌렸을 때
				
				if(customstyle == "" || customstyle == null){
					$("input[name='input-content']").val("");
					
					alert("글꼴 스타일을 먼저 선택해주시길 바랍니다");
					
					return;
				}
				
				
				var cur_inputcontent = e.key;
				letter = cur_inputcontent;
				imgurl="resources/img/alphabet/"+customstyle+"_"+letter+".png";
				addToCanvas(ctx,imgurl,550,550);
				letter="";
				
			});
			

			/* var pre_inputcontent =""; //이전에 입력했던 값
			$("input[name='input-content']").on("propertychange change paste input", function() {
							//실시간으로 입력탐지
							
				var cur_inputcontent = $(this).val();
							
				if()			
							
				//새로 입력된 문자열(현재문자열)에서 이전 문자열을 치환함 (이전 문자열은 새로 추가되지않음)				
				letter = cur_inputcontent;
				
				imgurl="resources/img/alphabet/"+customstyle+"_"+letter+".png";
				
				addToCanvas(ctx,imgurl,550,550);
				
				pre_inputcontent += cur_inputcontent;

			}); */
			
			
			function addToCanvas(ctx, image, w ,h) {
				//캔버스에 이미지를 추가하는 메서드
				  var img = new Image();
				  img.src = image;
				  
				  img.onload = function(){
					  
					  if(y<=50){
						  alert("더이상 추가할 수 없습니다!");
						  return;
					  }
					  
				    ctx.drawImage(img, x, y, w , h);
				    console.log(y);
				    y=y-50;
				    
				  };
				  
			};
			
			
			$("input[name='input-content']").keydown(function(event) {

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