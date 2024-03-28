package org.zerock.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDTO {
	//일반 주문서

	private String orderno; //주문번호
	private String userid; //유저아이디
	private String username; //주문이름
	
	private String email; //이메일
	private String phone; //핸드폰 번호
	private String totalprice; //총가격
	
	private String payment; //결제수단
	private String order_request; //요청사항
	private String delivery_request; //배송요청사항
	private String delivery_address; //배송주소 
	
	private String orderpw; //주문 비밀번호 (비회원에 해당)
	
}
