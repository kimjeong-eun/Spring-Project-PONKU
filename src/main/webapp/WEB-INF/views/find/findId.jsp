<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>

<style type="text/css">
* { padding: 0; margin: 0; }

html, body {
  height: 100%;
  background: #ffffff;
}

#container {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  height: 60%;
}

#loginBox {
  width: 300px;
  text-align: center;
  background-color: #ffffff;
}
.input-form-box {
  border: 0px solid #ff0000;
  display: flex;
  margin-bottom: 5px;
}
.input-form-box > span {
  display: block;
  text-align: left;
  padding-top: 5px;
  min-width: 65px;
}
.button-login-box {
  margin: 10px 0;
}
#loginBoxTitle {
  color:#000000;
  font-weight: bold;
  font-size: 40px;
  text-transform: uppercase;
  padding: 5px;
  margin-bottom: 20px;
  background: linear-gradient(to right, #270a09, #8ca6ce);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
#inputBox {
  margin: 10px;
}

#inputBox button {
  padding: 3px 5px;
}

#findInfo a:hover{

	color: #2828CD;

}

</style>

 <title>아이디 찾기</title>

 <!-- Bootstrap CSS -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

 <!-- 나의 스타일 추가 -->
 <link rel="stylesheet" href="css/login.css?v=1234">


</head>
  <body class="text-center">
    <jsp:include page="../includes/header.jsp"></jsp:include>
    
    <!--  html 전체 영역을 지정하는 container -->
    <div id="container">
      <!--  login 폼 영역을 : loginBox -->
	
      <form id="loginBox" action="/validId" method="post" name="findForm">
   
        <!-- 로그인 페이지 타이틀 -->
        <div id="loginBoxTitle">아이디 찾기</div>
        <!-- 아이디, 비번, 버튼 박스 -->
        <div id="inputBox">
          <div class="input-form-box"><span>이름 </span><input type="text" name="Inputname" class="form-control"></div>
          <div class="input-form-box"><span>이메일 </span><input type="email" name="Inputemail" class="form-control"></div>
          
          <div class="button-login-box" >
            <button name="findBtn" type="button" class="btn btn-primary btn-xs" style="width:100%">회원 정보 찾기</button>
            
			<div id="findInfo"><a href="/findPw">Pw찾기</a> | <a href="/">회원가입</a></div>    
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
          </div>
        </div>
        
      </div> <!-- end 컨테이너  -->
    </form>
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

	<jsp:include page="../includes/footer.jsp"></jsp:include>
  </body>
  
  	<script>
  		
  		$(document).ready(function(){
  			
  			
  			
  			$("botton[name='findBtn']").on("click",function(e){
  				
  				var name= $("input[name='Inputname']").val();
  				var email =$("input[name='Inputemail']").val();
  				
  				e.preventDefault();
  				
  				$.ajax({
  					
  					url : '/validId/'+name+'/'+email
  					type:'get',
  					dataTtpe:'json'
  					success:function(result){
  						alert("찾았읍니다");
  						showResult(result);
  					}
  					
  				});	
  			});
  			
  			function showResult(findResult){
  				
  				
  				
  				
  				
  			};
  			
  			
  			
  			
  			
  		});
  		
  		
  		

  	</script>
  	 	
</html>