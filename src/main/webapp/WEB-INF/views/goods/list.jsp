<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html lang="kr">

<!-- Header Section Begin -->

<jsp:include page="../includes/header.jsp"></jsp:include>

<!-- Header Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container" style="max-width: 1550px; margin: 0 auto; padding-top: 100px;">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
<!--                         <div class="sidebar__item">
                            <h4>Department</h4>
                            <ul>
                                <li><a href="#">Fresh Meat</a></li>
                                <li><a href="#">Vegetables</a></li>
                                <li><a href="#">Fruit & Nut Gifts</a></li>
                                <li><a href="#">Fresh Berries</a></li>
                                <li><a href="#">Ocean Foods</a></li>
                                <li><a href="#">Butter & Eggs</a></li>
                                <li><a href="#">Fastfood</a></li>
                                <li><a href="#">Fresh Onion</a></li>
                                <li><a href="#">Papayaya & Crisps</a></li>
                                <li><a href="#">Oatmeal</a></li>
                            </ul>
                        </div> -->
<!--                         <div class="sidebar__item">
                            <h4>Price</h4>
                            <div class="price-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                    data-min="10" data-max="540">
                                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                </div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <input type="text" id="minamount">
                                        <input type="text" id="maxamount">
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        <div class="sidebar__item sidebar__item__color--option">
                            <h4>Colors</h4>
                            <div class="sidebar__item__color sidebar__item__color--white">
                                <label for="white">
                                    White
                                    <input type="radio" id="white">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--gray">
                                <label for="gray">
                                    Gray
                                    <input type="radio" id="gray">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--red">
                                <label for="red">
                                    Red
                                    <input type="radio" id="red">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--black">
                                <label for="black">
                                    Black
                                    <input type="radio" id="black">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--blue">
                                <label for="blue">
                                    Blue
                                    <input type="radio" id="blue">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--green">
                                <label for="green">
                                    Green
                                    <input type="radio" id="green">
                                </label>
                            </div>
                        </div>
                        <div class="sidebar__item">
                            <h4>MODEL</h4>
                            <div class="sidebar__item__size">
                                <label for="large">
                                    Apple
                                    <input type="radio" id="large">
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="medium">
                                    Samsung
                                    <input type="radio" id="medium">
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="small">
                                    Google
                                    <input type="radio" id="small">
                                </label>
                            </div>
<!--                             <div class="sidebar__item__size">
                                <label for="tiny">
                                    Tiny
                                    <input type="radio" id="tiny">
                                </label>
                            </div> -->
                        </div>
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>추천 상품</h4>
                                <div class="latest-product__slider owl-carousel">
                                    <div class="latest-prdouct__slider__item">
                                        <a href="/goods/get?gno=4" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="/resources/img/marsh-cloud.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Marshmallow Cloud</h6>
                                                <span>83,000</span>
                                            </div>
                                        </a>
                                        <a href="/goods/get?gno=2" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="/resources/img/matin-denim.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Matin Kim Destroyed Denim Case</h6>
                                                <span>83,000</span>
                                            </div>
                                        </a>
                                        <a href="/goods/get?gno=5" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="/resources/img/padding.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>The Baffle Case</h6>
                                                <span>77,500</span>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="latest-prdouct__slider__item">
                                        <a href="/goods/get?gno=1" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="/resources/img/matin-black-logo.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Matin Kim Black Logo Case</h6>
                                                <span>83,000</span>
                                            </div>
                                        </a>
                                        <a href="/goods/get?gno=8" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="/resources/img/zanmang-loopy.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>zanmang-loopy</h6>
                                                <span>94,000</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="/resources/img/wonsoju.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>wonsoju</h6>
                                                <span>입고예정</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-9 col-md-7">
                    
                    <div class="row">
                    
                    <c:forEach items="${list}" var="goods">
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="product__item">
                            
                                <div class="product__item__pic set-bg" data-setbg="/resources/img/${goods.title_img}"> <!-- title_img -->
                                
<!--                                     <ul class="product__item__pic__hover">
                                        <li><a href="#"><i style="line-height: 38px;" class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i style="line-height: 38px;" class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i style="line-height: 38px;" class="fa fa-shopping-cart"></i></a></li>
                                    </ul> -->
                                    
                                </div>
                                
                                <div class="product__item__text">
                                    <h6><a href='/goods/get?gno=<c:out value="${goods.gno}"/>' target="_blank"><c:out value="${goods.gname}"/></a></h6> <!-- gname -->
                                    <h5><c:out value="${goods.price}"/> 원</h5> <!-- 가격 -->
                                </div>
                                
                            </div>
                        </div> <!-- col-lg-4 -->
                        </c:forEach>
                        
                    </div> <!-- row -->
                    
                    <div class="product__pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div> <!-- col-lg-9 -->
                
            </div> <!-- container -->
        </div> <!-- product -->
    </section>
    <!-- Product Section End -->
    
    <!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
    
    <!-- 모달창 띄우는 스크립트 -->
    <script type="text/javascript">
    $(document).ready(function() {
    	var result = '<c:out value="${result}"/>'
    	
    		var result = '<c:out value="${result}"/>';

		checkModal(result);

		history.replaceState({}, null, null);

		function checkModal(result) {

			if (result === '' || history.state) {
				return;
			}

			if (parseInt(result) > 0) {
				$(".modal-body").html(
						"게시글 " + parseInt(result)
								+ " 번이 등록되었습니다.");
			}

			$("#myModal").modal("show");
		}

		$("#regBtn").on("click", function() {

			self.location = "/board/register";

		});

		var actionForm = $("#actionForm");

		$(".paginate_button a").on(
				"click",
				function(e) {

					e.preventDefault();

					console.log('click');

					actionForm.find("input[name='pageNum']")
							.val($(this).attr("href"));
					actionForm.submit();
				});

		$(".move")
				.on(
						"click",
						function(e) {

							e.preventDefault();
							actionForm
									.append("<input type='hidden' name='bno' value='"
											+ $(this).attr(
													"href")
											+ "'>");
							actionForm.attr("action",
									"/board/get");
							actionForm.submit();

						});

		var searchForm = $("#searchForm");

		$("#searchForm button").on(
				"click",
				function(e) {

					if (!searchForm.find("option:selected")
							.val()) {
						alert("검색종류를 선택하세요");
						return false;
					}

					if (!searchForm.find(
							"input[name='keyword']").val()) {
						alert("키워드를 입력하세요");
						return false;
					}

					searchForm.find("input[name='pageNum']")
							.val("1");
					e.preventDefault();

					searchForm.submit();

				});
    });
    </script>

<!-- Footer Section Begin -->

<jsp:include page="../includes/footer.jsp"></jsp:include>

<!-- Footer Section End -->