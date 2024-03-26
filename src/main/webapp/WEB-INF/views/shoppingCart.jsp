<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑카트</title>

<style type="text/css">

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

<div class="sub-header" id="sub-header"></div>
 
  <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad" style="margin-top:140px; ">

        <div class="container" style="width: 70%;">
        <h4 style="font-weight: 800; margin-bottom: 30px;">쇼핑 카트<i class="fa-solid fa-cart-shopping"></i></h4>
        	
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>선택</th>
                                    <th class="shoping__product">상품</th>
                                    <th>기종</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>가격</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>	   							
                            <c:forEach var="element" items="${cartList }">
                            	  <tr>
                            	  	<td><input type="checkbox" value="${element.gname }" name="checkElement"></td>
                                    <td class="shoping__cart__item">
                                        <img src="${element.image }"  style="width: 10rem;">
                                        <h5 style="font-weight: 800;">${element.gname }</h5>
                                    </td>
                                    <td class="quantity"> <!-- 사실은 기종임  -->
                                   		${element.model }
                                    </td>
                                    <td class="shoping__cart__price" name="price">${element.price }</td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
	                                             <span class="dec qtybtn" name="minus">-</span>
	                                             <input type="text" value="${element.quantity }" style="font-weight:800;" name="quantity">
	                                             <span class="inc qtybtn" name="plus">+</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total" name="totalPerElement">
                                       <fmt:parseNumber var="quantity_" value="${element.quantity }"/> 
                                       <fmt:parseNumber var="price_" value="${element.price }"/>	                                      
                                      	${quantity_ * price_}                      	                       	
                                    </td>
                                    <sec:authentication property="principal" var="pinfo"/>
                                    
                                    <td class="shoping__cart__item__close">
                                    	<input type="hidden" value="${element.cart_no }" name="cart_no">
                                    	<input type="hidden" value="${pinfo.member.member_seq }" name="member_seq">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
			<c:if test="${empty cartList }">
			
				<div style="width: 100%; height: 20rem; font-size: 40px; font-weight: 800; text-align: center; padding-top: 50px;">
							
					 장바구니에 담긴 상품이 없습니다!
					 
				</div>

			</c:if>	

            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="#" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                        <!-- <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            Upadate Cart</a> -->
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                          
                                <button type="submit" class="site-btn">APPLY COUPON</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>담긴 상품 <span name="totalQuantity" >${cartElemets } </span></li>   
                             <c:set var="totalPrice" value="0"></c:set>
                             <c:forEach var="element" items="${cartList }">
                             	 <fmt:parseNumber var="price_" value="${element.price * element.quantity}"/>	
                             	 <fmt:parseNumber var="totalPrice_" value="${totalPrice }"/>
                        	 <c:set var="totalPrice" value= "${totalPrice_ + price_ }" ></c:set> 
                             </c:forEach>
     
                            <li>총 가격 <span  name="totalPrice">${totalPrice }</span></li>
                        </ul>
                         <a href="#" class="primary-btn" name="selectOrder" style="margin-bottom: 1rem; display: none;">선택상품 주문하기</a>
                        <a href="#" class="primary-btn" name="wholeOrder">전체상품 주문하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->


<script type="text/javascript">
		
	$(document).ready(function() {
	
		 $("input:checkbox[name='checkElement']").change(function() {
			// 선택된 상품이 있다면
			
			 if( $("input:checkbox[name='checkElement']").is(':checked') === true){ //체크된것이 있다면 
				 
				 $("a[name='selectOrder']").show();		//선택상품 주문버튼 보여짐	 
			 }
			 if( $("input:checkbox[name='checkElement']").is(':checked') === false){
				 
				 $("a[name='selectOrder']").hide();	 //선택상품 주문버튼 숨김	 
			 }
		 });
		
			
		$(".shoping__cart__item__close").on("click", function() {
				//제외 버튼을 누른다면
				
			var cart_no = $(this).children("input[name='cart_no']").val();
			var member_seq = ""+$(this).children("input[name='member_seq']").val();

			 $.ajax({
				
				url:'/deleteCartElement',
				type:'GET',
				data:{memberSeq:member_seq,cart_no:cart_no},
				contentType:'application/x-www-form-urlencoded; charset=utf-8',
				success: function(result) {

					alert("쇼핑카트에서 제외되었습니다!");
					location.href = "/shoppingcart?member=${pinfo.member.member_seq}"; //페이지 리로드
				}
				
			}); 
			
		});
		
		$("span[name='minus']").on("click", function() {
				//수량 줄이기 버튼을 눌렀을 때
			var quanval = parseInt($(this).siblings("input[name='quantity']").val())-1; //뺀 수량
			
			 var price = parseInt($(this).parent().parent().parent().prev("td[name='price']").text()); //가격
			 
			/* alert(quanval*price); */
			
			if(quanval <= 0){
				
				alert("수량은 0 이상 설정 가능합니다");
				
				return;
				
			}else{
				
			 	$(this).siblings("input[name='quantity']").val(quanval+"");
				$(this).parent().parent().parent().next("td[name='totalPerElement']").text(price*quanval+""); //가격 x 수량 
				
				//전체 가격태그 값을 가져와 더해줌 (총 가격 합)
				var length = $("td[name='totalPerElement']").length;
				var totalPrice=0;
 			 	for(var i=0; i<length; i++){
					
					totalPrice += parseInt($("td[name='totalPerElement']").eq(i).text());
					
	 			 } 
	 			 $("span[name='totalPrice']").text(totalPrice);
			}

		});
		
		
		$("span[name='plus']").on("click", function() {
			//수량 더하기 버튼을 눌렀을 때
			var quanval = parseInt($(this).siblings("input[name='quantity']").val())+1; //더한 수량
			 var price = parseInt($(this).parent().parent().parent().prev("td[name='price']").text()); //가격 
			 
			/* alert(quanval*price); */
			
			if(quanval >= 50){
				
				alert("제품당 50개 이상 구매 불가합니다.");
				
				return;
				
			}else{
				//형제태그
				$(this).siblings("input[name='quantity']").val(quanval+""); //수량 올려줌
				$(this).parent().parent().parent().next("td[name='totalPerElement']").text(price*quanval+""); //변화된 수량에 대한 가격변경
				
				//전체 가격태그 값을 가져와 더해줌 (총 가격 합)
				var length = $("td[name='totalPerElement']").length;
				var totalPrice=0;
 			 	for(var i=0; i<length; i++){
					
					totalPrice += parseInt($("td[name='totalPerElement']").eq(i).text());
					
	 			 } 
	 			 $("span[name='totalPrice']").text(totalPrice);
			}

		});

	});


</script>

<jsp:include page="./includes/footer.jsp"></jsp:include>
</body>
</html>