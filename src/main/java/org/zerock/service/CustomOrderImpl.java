package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.CustomOrderDTO;
import org.zerock.domain.OrderDTO;
import org.zerock.domain.ShopGoodsVO;
import org.zerock.domain.ShoppingCartVO;
import org.zerock.mapper.CustomOrderMapper;

import lombok.Setter;

@Service
public class CustomOrderImpl implements CustomOrderService {

	@Setter(onMethod_=@Autowired )
   CustomOrderMapper mapper;

	@Override
	public String memberCustomOrder(CustomOrderDTO dto) {
		// 회원주문 (커스텀)
		
		int insertResult = mapper.insertOrder_cus(dto);
		String resultStr;
		
		if(insertResult<=0) {
			
			resultStr ="fail";
			
		}else {
			
			resultStr="success";
			
		}

		return resultStr;
	}

	@Override
	public String noMemberCustomOrder(CustomOrderDTO dto) {
		// 비회원주문 (커스텀)
		
		int insertResult = mapper.insertOrderNomember_cus(dto);
		String resultStr;
		
		if(insertResult<=0) {
			
			resultStr ="fail";
			
		}else {
			
			resultStr="success";
			
		}

		return resultStr;
		

	}

	@Override
	public ShopGoodsVO getGoddsInfo(String dno) {
		// 상품코드로 상품객체 가져오기
	
		return mapper.selectGoods(dno);
	}

	@Override
	public int CountCartElements(long member_seq) {
		// 쇼핑카트 제품 수 반환
		return mapper.selectShoppingCartCount(member_seq);
	}

	@Override
	public String putShoppingCart(ShoppingCartVO vo) {
		// 쇼핑카트에 넣기
	String resultStr ="";	
	int result = mapper.insertShoppingCart(vo);
	
	if(result>0) {
		
		resultStr="success";
		
	}else {
		resultStr = "fail";
	}
		
		return resultStr;
	}

	@Override
	public List<ShoppingCartVO> getCartList(long member_seq) {
		// 멤버시퀀스로 쇼핑카트리스트 가져옴
		
		return mapper.selectCartList(member_seq);
	}

	@Override
	public int removeCartElement(long member_seq, String cart_no) {
		// 멤버시퀀스와 카트넘버로 쇼핑카트 객체 삭제
		
		
		return mapper.deleteCartElement(member_seq, cart_no);
		
	}

	@Transactional
	@Override
	public String memberOrder(OrderDTO dto, List<ShoppingCartVO> cartList) {
		// 회원주문 (일반)
		
		
		int orderno = mapper.seletOrderNo(); //주문번호 세팅
		
		if (orderno>0) {
			
			dto.setOrderno(""+orderno);
			int insertResult = mapper.insertOrder(dto);
			
			if(insertResult>0) {
				
				for(ShoppingCartVO element : cartList) {

					int result = mapper.insertOrderd_goods(""+orderno, element);
					mapper.deleteCartElement(element.getMember_seq(), element.getCart_no()); //장바구니 항목없애기
					
						
				}	
			}	
		}
		return "success";
	}

	@Transactional
	@Override
	public String noMemberOrder(OrderDTO dto, List<ShoppingCartVO> cartList) {
		// 회원주문(비회원)
		
		int orderno = mapper.seletOrderNo(); //주문번호 세팅
		
		if (orderno>0) {
			
			dto.setOrderno(""+orderno);
			int insertResult = mapper.insertOrderNomember(null);
			
			if(insertResult>0) {
				
				for(ShoppingCartVO element : cartList) {

					int result = mapper.insertOrderd_goods(""+orderno, element);
									
				}	
			}	
		}
		return "success";

	}



}
