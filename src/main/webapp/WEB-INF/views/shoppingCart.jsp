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
                            <tbody >	   							
                            <c:forEach var="element" items="${cartList }">
                            	
                            	  <tr>
                            	  	<td>
                            	  		<input type="checkbox" value="${element.gno }" name="checkElement">
                            	  	</td>
                            	  	<input type="hidden" name="gno" value="${element.gno }">
                            	  	
                                    <td class="shoping__cart__item">
                                        <img src="${element.image }"  style="width: 10rem;">
                                        <input type="hidden" name="image" value="${element.image }">
                                        
                                        <h5 style="font-weight: 800;">${element.gname }</h5>
                                        <input type="hidden" name="gname" value="${element.gname }">
                                    </td>
                                    <td class="quantity"> <!-- 사실은 기종임  -->
                                   		${element.model }
                                    </td>
                                    <input type="hidden" name="model" value="${element.model }">
                                    
                                    <td class="shoping__cart__price" name="price">${element.price }</td>                                   
                                    <input type="hidden" name="price" value="${element.price }">
                                    
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
			<p name='selecetdMsg' style="display: none;"> </p>
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
                    	<form action="/orderGoods" method="post" name="orderForm">
                    		
                    	<!--여기에 폼요소 넘어감  -->
                    	 
                    	
                    	</form>

                    </div>
                </div>
            </div>
        </div>
        
        <form action="/order"></form>
        
        
    </section>
    <!-- Shoping Cart Section End -->


<script type="text/javascript">
		
	$(document).ready(function() {
		var csrfHeaderName = "${_csrf.headerName}";  //"X-CSRF-TOKEN"
		var csrfTokenValue = "${_csrf.token}";
		
	
		 $("input:checkbox[name='checkElement']").change(function() {
			// 선택된 상품이 있다면
			
			 if( $("input:checkbox[name='checkElement']").is(':checked') === true){ //체크된것이 있다면 
				 
				 $("a[name='selectOrder']").show();		//선택상품 주문버튼 보여짐
		 
			 }
			 if( $("input:checkbox[name='checkElement']").is(':checked') === false){
				 
				 $("a[name='selectOrder']").hide();	 //선택상품 주문버튼 숨김	 
			 }
		 });
		
		 $("a[name='selectOrder']").on("click",function(e){
			 
			 e.preventDefault();
			 
			 //체크된 항목 수
			 var length = $("input:checkbox[name='checkElement']:checked").length;
			 
			 var cart_nos = new Array(length);
			 var images = new Array(length);
			 var gnos = new Array(length);
			 var gnames=  new Array(length);
			 var models=  new Array(length);
			 var prices=  new Array(length);
			 var quantities=  new Array(length);
			 var member_seq = $("input[name='member_seq']").val();
			 var cartElements = length+"";
			 var totalprice=0;
			 var member_seq = $("input[name='member_seq']").val();
			 
			 var str="<input type='hidden' name='${_csrf.parameterName }' value='${_csrf.token}' />";
			 
			 
			 for(var i=0;i<length;i++){

				 	
				 cart_nos[i]=$("input:checkbox[name='checkElement']:checked").eq(i).parent().next().next().next().next().next()
				 						.next().next().next().next().children("input[name='cart_no']").val();

				 images[i]=$("input:checkbox[name='checkElement']:checked").eq(i).parent().next().next().children("input[name='image']").val();
				 gnos[i]=$("input:checkbox[name='checkElement']:checked").eq(i).val();
				 gnames[i]=$("input:checkbox[name='checkElement']:checked").eq(i).parent().next().next().children("input[name='gname']").val();
				 models[i]=$("input:checkbox[name='checkElement']:checked").eq(i).parent().next().next().next().next("input[name='model']").val();
				 prices[i]=$("input:checkbox[name='checkElement']:checked").eq(i).parent().next().next().next().next().next().next("input[name='price']").val();
				 quantities[i]=$("input:checkbox[name='checkElement']:checked").eq(i).parent().next().next().next().next().next().next().next().children().children().children("input[name='quantity']").val();
				 

				str+="<input type='hidden' name='cart_no' value='"+cart_nos[i]+"'>";
				str+="<input type='hidden' name='image' value='"+images[i]+"'>";
				str+="<input type='hidden' name='gno' value='"+gnos[i]+"'>";
				str+="<input type='hidden' name='gname' value='"+gnames[i]+"'>";
				str+="<input type='hidden' name='modelname' value='"+models[i]+"'>";
				str+="<input type='hidden' name='price' value='"+prices[i]+"'>";
				str+="<input type='hidden' name='quantity' value='"+quantities[i]+"'>";

				 
				 totalprice += parseInt(prices[i])*parseInt(quantities[i]) ; 
			 }
			 
			 str +="<input type='hidden' name='member_seq' value='"+member_seq+"'>";
			 str +="<input type='hidden' name='totalPrice' value='"+totalprice+"'>";
			 str+="<input type='hidden' name='cartElments' value='"+cartElements+"'>";
			 
 			 alert(length+"개의 상품을 선택하셨습니다. 구매페이지로 이동합니다.");
			 var orderForm = $("form[name='orderForm']");
			  
			 orderForm.html(str);
			  
			 orderForm.submit();


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
			
			 var price = parseInt($(this).parent().parent().parent().prev().prev("td[name='price']").text()); //가격
			 
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
			 var price = parseInt($(this).parent().parent().parent().prev().prev("td[name='price']").text()); //가격 
			 
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
		
		
		$("a[name='wholeOrder'").on("click",function(e){
 			//전체주문
			e.preventDefault(); 
			
			var length = $("input[name='image']").length;
			var cart_nos = new Array(length);
			var images = new Array(length);
			var gnos = new Array(length);
			var gnames=  new Array(length);
			var models=  new Array(length);
			var prices=  new Array(length);
			var quantities=  new Array(length);
		
			var member_seq = $("input[name='member_seq']").val();
			var totalprice = $("span[name='totalPrice']").text();
			var cartElements = '${cartElemets }';
			
			
			var str="<input type='hidden' name='${_csrf.parameterName }' value='${_csrf.token}' />";

			for(var i=0;i<length;i++){
				
			
				cart_nos[i]=$("input[name='cart_no']").eq(i).val();
				images[i]=$("input[name='image']").eq(i).val();
				gnos[i]=$("input[name='gno']").eq(i).val();
				gnames[i]=$("input[name='gname']").eq(i).val();
				models[i]=$("input[name='model']").eq(i).val();
				prices[i]=$("input[name='price']").eq(i).val();
				quantities[i]=$("input[name='quantity']").eq(i).val();
				
				str+="<input type='hidden' name='cart_no' value='"+cart_nos[i]+"'>";
				str+="<input type='hidden' name='image' value='"+images[i]+"'>";
				str+="<input type='hidden' name='gno' value='"+gnos[i]+"'>";
				str+="<input type='hidden' name='gname' value='"+gnames[i]+"'>";
				str+="<input type='hidden' name='modelname' value='"+models[i]+"'>";
				str+="<input type='hidden' name='price' value='"+prices[i]+"'>";
				str+="<input type='hidden' name='quantity' value='"+quantities[i]+"'>";

			}
			
			str +="<input type='hidden' name='member_seq' value='"+member_seq+"'>";
			str +="<input type='hidden' name='totalPrice' value='"+totalprice+"'>";
			str+="<input type='hidden' name='cartElments' value='${cartElemets }'>";
			
			
			  alert(cartElements+"개의 상품을 선택하셨습니다. 구매페이지로 이동합니다.");   

			  
			  var orderForm = $("form[name='orderForm']");
			  
			  orderForm.html(str);
			  
			  orderForm.submit();
			  
			/* var orderForm =  new FormData(); */
			
			/* member_seqs.forEach((member_seq)=>orderForm.append("member_seq",member_seq)); */
/* 			
			cart_nos.forEach((cart_no)=>orderForm.append("cart_no",cart_no));
			images.forEach((image)=>orderForm.append("image",image));
			gnos.forEach((gno)=>orderForm.append("gno",gno));
			gnames.forEach((gname)=>orderForm.append("gname",gname));
			models.forEach((model)=>orderForm.append("model",model));
			prices.forEach((price)=>orderForm.append("price",price));
			quantities.forEach((quantity)=>orderForm.append("quantity",quantity));
			
			orderForm.append("totalPrice",totalprice);
			orderForm.append("member_seq",member_seq); */
			
/* 			$.ajax({
				
				url:'/orderGoods',
				type:'POST',
				data : {
						cart_no:cart_nos,
						image:images,
						gno:gnos,
						gname:gnames,
						model:models,
						price:prices,
						quantity:quantities,
						totalPrice:totalprice,
						member_seq,member_seq
						},
		        beforeSend: function(xhr){   // 헤더에 csrf 값 추가
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				dataType:'json',
				success:function(result){
					
					alert(result[0].gno);
					alert(result.length);

				}
				
			}); */

		});
		
	});


</script>

<jsp:include page="./includes/footer.jsp"></jsp:include>
</body>
</html>