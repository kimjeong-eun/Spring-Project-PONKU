package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.CustomOrderDTO;
import org.zerock.domain.OrderDTO;
import org.zerock.domain.ShopGoodsVO;
import org.zerock.domain.ShoppingCartVO;

public interface CustomOrderMapper {

	public int insertOrder_cus(CustomOrderDTO dto); //회원용 주문넣기(커스텀)
	public int insertOrderNomember_cus(CustomOrderDTO dto); //비회원용 주문넣기 (커스텀)
	
	
	public int seletOrderNo();//주문번호 생성해서 받아오기
	public int insertOrder(OrderDTO dto); //회원용 주문넣기(일반)
	public int insertOrderNomember(OrderDTO dto);//비회원용 주문 넣기(일반)
	public int insertOrderd_goods(@Param("orderno") String orderno, @Param("vo") ShoppingCartVO vo); //회원용 주문 상품넣기(일반)

	public ShopGoodsVO selectGoods(String gno); //상품코드로 상품정보 가져오기
	
	public int selectShoppingCartCount(long member_seq);// 유저시퀀스로 쇼핑카트 제품수 가져오기
	public int insertShoppingCart( @Param("vo") ShoppingCartVO vo); //쇼핑카드에 상품 넣기
	
	public List<ShoppingCartVO> selectCartList(long member_seq); //유저시퀀스로 쇼핑카트 리스트 가져오기 
	public int deleteCartElement(@Param("member_seq") long member_seq , @Param("cart_no") String cart_no ); //쇼핑카트 리스트 삭제 

	
	
	public List<OrderDTO> selectMyOrderList(@Param("start_date")String start_date ,@Param("end_date")String end_date,@Param("userid")String userid ); // 나의 주문목록 가져오기
	public List<CustomOrderDTO> selectMyCustomOrderList(@Param("start_date")String start_date ,@Param("end_date")String end_date,@Param("userid")String userid ); //나의 커스텀 주문목록 가져오기
	//비회원 주문목록 필요
	
	
}
