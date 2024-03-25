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

        <div class="container">
        <h4 style="font-weight: 800; margin-bottom: 15px;">쇼핑 카트</h4>
        	
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">상품</th>
                                    <th>모델명</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>총가격</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            
                            <c:forEach var="element" items="${cartList }">
                            	
                            	  <tr>
                                    <td class="shoping__cart__item">
                                        <img src="${element.image }"  style="width: 10rem;">
                                        <h5 style="font-weight: 800;">${element.gname }</h5>
                                    </td>
                                    <td class="quantity">
                                   		${element.model }
                                    </td>
                                    <td class="shoping__cart__price">
                                      ${element.price }
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value=" ${element.quantity }" style="font-weight:800;">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                      
                                      
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
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
                            <li>담긴 상품 <span>0</span></li>
                            <li>총 가격 <span></span></li>
                        </ul>
                        <a href="#" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->


<script type="text/javascript">



</script>







<jsp:include page="./includes/footer.jsp"></jsp:include>
</body>
</html>