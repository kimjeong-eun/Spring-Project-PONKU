<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 정보 입력</title>
								<style>
								.uploadResult {
					    			width: 10rem;
								    height: 120px;
								    background-position-x:1rem;
								    /* background-color: gray; */
								  
								    background-size: 130%;
								    position: relative;
								    border: 2px solid black;
								    
								}
								.uploadResult ul{
									width: 30rem;
								    margin: 0;
								    display: flex;
								    flex-flow: row;
								    justify-content: center;
								    align-items: center;
								}
								.uploadResult ul li {
						   			list-style: none;
								    padding: 10px;
								    margin: 0;
								    align-content: center;
								    text-align: center;
								}
								.uploadResult ul li img{
								  	width: 11rem;
								    position: absolute;
								    left: 1rem;
								}
								.uploadResult ul li span {
								  color:white;
								}
								.sub-header{

									position: absolute;
									width: 100%;
									height:20%;
								/* 	border: 1px solid green;  */
									background-image: url("/resources/img/subheader.png");
									background-size: cover;
								}
								</style>
</head>
<body>

<jsp:include page="./includes/header.jsp"></jsp:include>


<%-- 주문페이지에요 ~
<br/><br/>

모델명: ${dto.model_name } <br/>
커스텀 이미지 저장위치:${dto.custom_image }<br/>
커스텀 입력 문구: ${dto.custom_content }<br/>
 수량 : ${dto.quantity }<br/>
총 가격 : ${dto.totalprice }<br/>
유저아이디 :${dto.userid }<br/>
상품번호: ${dto.gno }<br/>
${imgdto.fileName }
${imgdto.uploadPath }
${dto.caseimgurl}


							<div class="uploadResult">
         						<ul>
         						<!-- 여기에 첨부파일 목록 보임  -->
         						</ul>
         					</div> --%>


<div class="sub-header" id="sub-header"></div>


 <!-- Checkout Section Begin -->
 	<sec:authentication property="principal" var="pinfo"/>
    <section class="checkout spad">
        <div class="container">
<!--             <div class="row">
                <div class="col-lg-12">
                    <h6><span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click here</a> to enter your code
                    </h6>
                </div>
            </div> -->
            <div class="checkout__form" style="margin-top:120px;">
            	<sec:authorize access="isAuthenticated()">	
            		<h4>주문 정보</h4>

            	</sec:authorize>
            	
				<sec:authorize access="isAnonymous()">	
            		<h4>주문 정보(비회원)</h4>
            	</sec:authorize>

               <form action="/orderComplete" name="formObj" method="post">
                
                <p>주문 상품 이미지(예시)<span style="color: red;">*</span></p>
                
                <c:forEach  var="element" items="${cartList }" >
                
					<div class="uploadResult" style="display: inline-block;  background-image: url('${element.image}');     background-size: cover;">
	         			<ul>
	         					<!-- 여기에 이미지 보임  -->
	         			</ul>
	         		</div> 

                </c:forEach>
 

                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                            
                            <sec:authorize access="isAuthenticated()"> <!--로그인 사용자일때  -->
                            <div class="checkout__input__checkbox">
                            
                                <label for="acc">
                                    주문자 정보와 동일
                                    <input type="checkbox" id="acc" name="orderinfo">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            
                            <script type="text/javascript">
	                            $("input:checkbox[name='orderinfo']").change(function() {
	                        		//주문자 정보와 동일 체크박스를 체크했을 시
	                        	     if( $("input:checkbox[name='orderinfo']").is(':checked') === true){
	                        	    	 
	                        	    	 var username ="${pinfo.member.username}";
	                        	    	 var phone = "${pinfo.member.phone}";
	                        	    	 var email = "${pinfo.member.email}";
	              
	                        	    	 $("input[name='username']").val(username);
	                        	    	 $("input[name='phone']").val(phone);
	                        	    	 $("input[name='email']").val(email);

	                        	     }
	                         		if( $("input:checkbox[name='orderinfo']").is(':checked') === false){
	
	                        	    	 $("input[name='username']").val("");
	                        	    	 $("input[name='phone']").val("");
	                        	    	 $("input[name='email']").val("");
	                        	     }
	                        	});
							</script>
                            </sec:authorize>
                            
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>성함<span>*</span></p>
                                        <input type="text" name="username">
                                    </div>
                                </div>
                                
                              <!--   <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Last Name<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div> -->
                            </div>
                            <!-- <div class="checkout__input">
                                <p>Country<span>*</span></p>
                                <input type="text">
                            </div> -->
                            <div class="checkout__input">
                                <p>주소<span>*</span></p>
                                <input type="text" placeholder="도로명 주소" class="checkout__input__add" name="address2">
                                <input type="text" placeholder="상세 주소 " name="address3">
                            </div>
                            <!-- <div class="checkout__input">
                                <p>Town/City<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="checkout__input">
                                <p>Country/State<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="checkout__input">
                                <p>Postcode / ZIP<span>*</span></p>
                                <input type="text">
                            </div> -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>휴대폰번호<span>*</span></p>
                                        <input type="text" name="phone">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>이메일<span>(선택)</span></p>
                                        <input type="text" name="email">
                                    </div>
                                </div>
                            </div>
							<!--<div class="checkout__input__checkbox">
                                <label for="acc">
                                    Create an account?
                                    <input type="checkbox" id="acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div> -->
                            
                            <sec:authorize access="isAnonymous()">
								<p>비회원 주문일경우, 주문 정보 확인을 위한 비밀번호를 입력해주세요.</p>
	                            <div class="checkout__input">
	                                <p>주문 확인 비밀번호<span>*</span></p>
	                                <input type="password" name="orderpw" placeholder="주문 확인을 위한 비밀번호" style="margin-bottom: 1rem;">
	                               <p style="display: none;" name="wrongpw"><span>비밀번호가 일치하지 않습니다.</span></p>
	                               <p style="display: none;" name="correctpw"><span style="color: green;">비밀번호가 일치합니다.</span></p>
	                                <input type="password" name="re-orderpw" placeholder="주문 확인을 위한 비밀번호 재입력">
	                            </div>
										
								<script type="text/javascript">
		
								
									var nomemberpw = $("input[name='orderpw']").val();
									
									$($("input[name='orderpw']")).change(function() {
										
										nomemberpw = $("input[name='orderpw']").val();
									});

									$("input[name='re-orderpw']").blur(function () {
										
										if(!($("input[name='re-orderpw']").val() === "" )||!( $("input[name='re-orderpw']").val() === null)||!( $("input[name='re-orderpw']").val().length == 0)){
											
											if(!(nomemberpw == $(this).val())){
												
												$("p[name='correctpw']").hide();	
												$("p[name='wrongpw']").show();
											}
											if(nomemberpw == $(this).val()){
												
												$("p[name='wrongpw']").hide();
												$("p[name='correctpw']").show();
											}

										}
								
									});
								</script>
	
                            </sec:authorize>
                          <!--   <div class="checkout__input__checkbox">
                                <label for="diff-acc">
                                    Ship to a different address?
                                    <input type="checkbox" id="diff-acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div> -->
                            <div class="checkout__input">
                                <p>주문 요청 사항<span>(선택)</span></p>
                                <input type="text"
                                    placeholder="주문 요청사항을 기입해주세요. (직접입력)" name="order_request">
                            </div>
                            <div class="checkout__input">
                                <p>배송 요청 사항<span>(선택)</span></p>
                                <select name="delivery_request_select" style="margin-bottom: 1rem;">
                                     <optgroup label="배송 요청사항을 선택해주세요">
										<option>부재시 문앞에 놔주세요.</option>
                                		<option>부재시 경비실에 맡겨주세요.</option>
                                		<option>택배 도착후 전화부탁드립니다.</option>
                                		<option>도착후 전화해주세요.</option>
                                     </optgroup>
                                </select>
                                <input type="text" placeholder="배송 요청사항을 기입해주세요. (직접입력)" name="delivery_request" value="">
                            </div>                            
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                            
                                <h4>Your Order</h4>
                                <div class="checkout__order__products">Products <span>Total</span></div>
                                
                                <ul>
                                <c:forEach var="element" items="${cartList }" >
                                
                                
                           
                                    <li>${element.gname } &nbsp;( ${element.model} ) <span> ${element.price } X ${element.quantity }</span></li>
                                

                                </c:forEach>
                                
                
                      			</ul>          
                                
                                
                                <div class="checkout__order__subtotal">담긴상품 <span>  ${ cartElements }</span></div> 
                                <div class="checkout__order__total">Total <span>${totalPrice }</span></div>
						<!--<div class="checkout__input__checkbox">
                                    <label for="acc-or">
                                        Create an account?
                                        <input type="checkbox" id="acc-or">
                                        <span class="checkmark"></span>
                                    </label>
                                </div> -->
                       
                               <!--  <div class="checkout__input__checkbox">
                                    <label for="payment">
                                        Check Payment
                                        <input type="checkbox" id="payment">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="paypal">
                                        Paypal
                                        <input type="checkbox" id="paypal">
                                        <span class="checkmark"></span>
                                    </label>
                                </div> -->
                                
                                <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}" /> <!-- 스프링시큐리티를 위한 토큰  -->
								
								<input type="hidden" name="delivery_address" value=""/>
                               	<input type="hidden" name="payment" value="card" />
                              	<input type="hidden" name="totalprice" value="${totalPrice }">
                              	
                               <sec:authorize access="isAuthenticated()">
	                               	<input type="hidden" name="userid" value="${pinfo.username }" />
	            					<input type="hidden" name="member_seq" value="${pinfo.member.member_seq}" />
                               </sec:authorize>
                               
                               <sec:authorize access="isAnonymous()">
                               	<input type="hidden" name="userid" value="nomember" />
                                </sec:authorize>
                          
                                <div name="goodsInfo">
                                	<c:forEach var="element" items="${cartList }">
	                               	 	<input type="hidden" name="cart_no" value="${element.cart_no }">
                                	 	<input type="hidden" name="gno" value="${element.gno }">
                                	 	<input type="hidden" name="image" value="${element.image }">
                                	 	<input type="hidden" name="quantity" value="${element.quantity }">
                                	 	<input type="hidden" name="modelname" value="${element.model }">
                                	 	<input type="hidden" name="price" value="${element.price }">
                                	 	<input type="hidden" name="gname" value="${element.gname }">
                                	</c:forEach>
                                </div>

                                <button type="button" class="site-btn" name="decideorder" >주문하기</button>
                                
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->


<script type="text/javascript">
	
	$(document).ready(function() {
		
		
	     $("select[name='delivery_request_select']").change(function() {
				//배송메세지 셀렉박스에 변화가 있다면 
		    	 	/* console.log($("select[name='delevery_request_select'] option:selected").text()); */
		    	   $("input[name='delivery_request']").val($("select[name='delivery_request_select'] option:selected").text());
		    	 
			});
		     
		
		$("button[name='decideorder']").on("click",function(e){
			e.preventDefault();
			
			if($("input[name='username']").val()==''|| $("input[name='username']").val()==null){
	    		
	    		alert("이름을 입력해주세요");
	    		$("input[name='username']").focus();
	    		return;
	    		
	    	}
	    	if($("input[name='address2']").val()==''|| $("input[name='address2']").val()==null){
	    		alert("주소를 입력해주세요");
	    		$("input[name='address2']").focus();
	    		return;
	    	}
	    	if($("input[name='phone']").val()==''|| $("input[name='phone']").val()==null){
	    		
	    		alert("휴대폰 번호를 입력해주세요");
	    		$("input[name='phone']").focus();
	    		return;
	    		
	    	}
	    	if(!($("input[name='orderpw']").val()==$("input[name='re-orderpw']").val())){
	    		
	    		alert("비밀번호를 확인해주세요");
	    		$("input[name='re-orderpw']").focus();
	    		return;
	    		
	    	}
			
	    	
	    	var address2 = $("input[name='address2']").val();
	    	var address3 = $("input[name='address3']").val();
	    	
	    	$("input[name='delivery_address']").val(address2+"/"+address3);
	    	
	    	$("form[name='formObj']").submit();
	    	
	    	

	    			
		});
		
		
		
		
		

	});
	
</script>

<jsp:include page="./includes/footer.jsp"></jsp:include>
</body>
</html>