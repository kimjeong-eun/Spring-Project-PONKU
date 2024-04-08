
<div class="header__top">
	<div class="container" style="width: 1600px; text-align: center;">

		<div class="header__top__right__auth">

			<sec:authentication property="principal" var="pinfo" />

			<sec:authorize access="isAuthenticated()">

				<input type="hidden" value="${pinfo.member.member_seq }" name="memberSeq">

				<div class="hero__cart" style="display: inline-block;">
					<ul>
						<li><a href="#" name="likes"><i class="fa fa-heart"></i>
								<!-- <span></span> --></a></li>
								
						<li><a
							href="/shoppingcart?member=${pinfo.member.member_seq }"><i
								class="fa fa-shopping-bag"></i><span id="cart-elements">
							</span></a></li>
					</ul>
					<!--   <div class="header__cart__price">item: <span>$150.00</span></div> -->
				</div>
				
<%-- 				<form action="/logout" method="post" name="logoutForm">
					<a href="#" name="logoutBtn" style="display: inline-block;"><i
						class="fa fa-user"></i>LogOut ( ${pinfo.username })</a> <input
						type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
 --%>
				<script type="text/javascript">
					// 로그인시 쇼핑카트에 몇개가 담겼는지 정보 받아옴

					var memberSeq = $("input[name='memberSeq']").val() + "";

					console.log(memberSeq);

					$
							.ajax({
								url : '/showCartElements',
								type : 'GET',
								data : {
									member : memberSeq
								},
								contentType : 'application/x-www-form-urlencoded; charset=utf-8',
								dataType : 'text',
								success : function(result) {

									$("#cart-elements").text(result + "");
								}
							});
				</script>
			</sec:authorize>
			<!-- <sec:authorize access="isAnonymous()">
				<a href="/customLogin"><i class="fa fa-user"></i>LogIn</a>
			</sec:authorize> -->
		</div>
	</div>
</div>
<!-- container -->
</div>
