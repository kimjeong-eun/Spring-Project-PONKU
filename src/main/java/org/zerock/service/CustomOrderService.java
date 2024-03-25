package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.CustomOrderDTO;
import org.zerock.domain.ShopGoodsVO;
import org.zerock.domain.ShoppingCartVO;


public interface CustomOrderService {

	public String memberCustomOrder(CustomOrderDTO dto); //회원주문
	public String noMemberCustomOrder(CustomOrderDTO dto); //비회원주문
	
	public ShopGoodsVO getGoddsInfo(String dno); //상품코드로 정보가져오기
	
	public int CountCartElements (long member_seq); //멤버 시퀀스로 쇼핑카트 제품수 가져오기
	public String putShoppingCart (ShoppingCartVO vo,String cart_no) ; //쇼핑카트 넣기

	public List<ShoppingCartVO> getCartList(long member_seq); //멤버시퀀스로 쇼핑카트리스트 가져오기
	
}
