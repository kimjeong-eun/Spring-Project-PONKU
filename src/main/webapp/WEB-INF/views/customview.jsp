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
	width: 70%;
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
	width: 20%;
	height: 50%;
	border: 1px solid red;
	left: 900px;
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
	
	
 	<button  class="select-btn" name="pink" ></button>
 	<button  class="select-btn" ></button>
	
	<input type="text" name="input-content" placeholder="내용을 입력하세요" class="inputbox">
</div>

</div>










<script type="text/javascript">
		
		
		/*/resources/img/alphabet/pink_a.png"  */
		
		$(document).ready(function() {

			var canvas1 = $(".customview");
			var ctx = canvas1[0].getContext("2d");
			  ctx.beginPath();
			var myImage = "/resources/img/alphabet/pink_a.png";
			
			var letter ="";
			var customstyle="pink";
			var imgurl="resources/img/alphabet/"+customstyle+"_"+letter+".png";

			
			var x =320; //아이폰 고정
			var y = 470; //아이폰 고정
			
		
			$(".select-btn[name=pink]").on("click",function(){
				
				customstyle="pink";
				
				console.log(imgurl);

			});
			
			
			$("input[name='input-content']").change(function() {
				
			    ctx.clearRect(0,0,canvas1.width, canvas1.height);
			    ctx.beginPath();
				
				
				var inputcontent = $("input[name='input-content']").val().split('');
				
				console.log(inputcontent.length);
				
				
				for(var i = 0 ; i < inputcontent.length ; i++){
					
					console.log(inputcontent[i]);
					
					letter=inputcontent[i];
					
					console.log(imgurl);
					
					imgurl="resources/img/alphabet/"+customstyle+"_"+letter+".png";
					
					addToCanvas(ctx,imgurl,550,550);
					
				}
				
			});
			
			function addToCanvas(ctx, image, w ,h) {
				  var img = new Image();
				  img.src = image;
				  
				  img.onload = function() {
					  
					  if(y<=50){
						  alert("더이상 추가할 수 없습니다!");
						  return;
					  }
					  
				    ctx.drawImage(img, x, y, w,h);
				    console.log(y);
				    y=y-50;
				    
				  };
				};
		});
		
		
		


</script>


</body>
</html>